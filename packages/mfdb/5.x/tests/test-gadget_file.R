library(mfdb)
library(unittest, quietly = TRUE)
source('utils/helpers.R')

cmp_gadget_file <- function(gf, ...) {
    cmp(strsplit(as.character(gf), "\n"), list(c(...)))
}

# Write a string to a temporary file, reread it into a gadget_file
gadget_file_string <- function (..., file_type = c()) {
    temp_file <- tempfile()
    fh <- file(temp_file, "w")
    on.exit(file.remove(temp_file))
    writeLines(c(...), con = fh)
    close(fh)
    gf <- read.gadget_file(temp_file, file_type = file_type)
    ok(gf$filename == basename(temp_file))
    return(gf)
}

# Test we can go from string to object and back again
test_loopback <- function(..., file_type = c()) {
    gf <- gadget_file_string(c(...), file_type = file_type)
    ok(cmp(
        strsplit(as.character(gf), "\n")[[1]],
        c(...)))
}

ok_group("Can generate gadgetfile objects", {
    ok(cmp_error(gadget_file(), "file_name"), "Can't make a gadget_file without filename")

    ok("gadget_file" %in% class(gadget_file("wibble")))
})

ok_group("Can get a string representation", {
    ok(cmp_gadget_file(
        gadget_file("wobble", components = list(list(
            cabbage = "yes",
            potatoes = c("1 potato", "2 potato", "3 potato", "4!"),
            sprouts = 'Like, "Eeeew!"'))),
        ver_string,
        "cabbage\tyes",
        "potatoes\t1 potato\t2 potato\t3 potato\t4!",
        'sprouts\tLike, "Eeeew!"'), "Generated string of gadget file")
})

ok_group("Can add components and preambles", {
    ok(cmp_gadget_file(
        gadget_file("wobble",
            components = list(
                structure(list(sprouts = 'Like, "Eeeew!"'), preamble = "Carrots"),
                component = structure(list(name = "component1"), preamble = list("The first component", "I like it")),
                component = structure(list(name = "component2"), preamble = "The second component (with the same name)"),
                tea = structure(list(milk = 1, sugars = 2), preamble = "Tea, please"))
            ),
        ver_string,
        "; Carrots",
        'sprouts\tLike, "Eeeew!"',
        '; The first component',
        '; I like it',
        '[component]',
        'name\tcomponent1',
        '; The second component (with the same name)',
        '[component]',
        'name\tcomponent2',
        '; Tea, please',
        '[tea]',
        'milk\t1',
        'sugars\t2'), "Multiple components with preambles")
})

ok_group("Can include tabular data", {
    ok(cmp_gadget_file(
        gadget_file("wobble",
            data = data.frame(a = c(1,3), b = c(2,5))),
        ver_string,
        "; -- data --",
        "; a\tb",
        "1\t2",
        "3\t5"), "Tabular data")
})

ok_group("Can read gadget files", {
    ok(cmp_error(read.gadget_file('/non/exist/ant'), "exist/ant"),
        "Complain about missing file")

    # Basic structure
    gf <- gadget_file_string(c(
        ver_string,
        "a\t2",
        "b\t4",
        ""))
    ok(cmp(
        gf$components,
        list(list(a = 2, b = 4))), "Components read")

    ok(is.null(gf$data), "gadget_file has no data")

    # Strings / numbers
    gf <- gadget_file_string(c(
        ver_string,
        "allnumber\t2\t4\t6\t8",
        "allstring\twho\tdo\twe\tappreciate?",
        "mix\t1\tpotato\t2\tpotato\t3\tpotato\t4!",
        ""))
    expect_equal(
        gf$components,
        list(list(
            allnumber = c(2,4,6,8),
            allstring = c("who", "do", "we", "appreciate?"),
            mix = c("1", "potato", "2", "potato", "3", "potato", "4!"))))
    ok(is.null(gf$data), "gadget_file has no data")

    # Comments and components
    gf <- gadget_file_string(c(
        ver_string,
        "; This is a comment that should be preserved",
        "a\t6",
        "b\t8",
        "; This is a comment associated with the component below",
        "; So is this",
        "[carrots]",
        "; And this",
        "like\tYes I do",
        "; Not this",
        "[carrots]",
        "like\tNo thanks",
        ""))
    expect_equal(
        gf$components,
        list(
            structure(list(a = 6, b = 8), preamble = list("This is a comment that should be preserved")),
            carrots = structure(
                list(like = "Yes I do"),
                preamble = list("This is a comment associated with the component below", "So is this", "And this")),
            carrots = structure(
                list(like = "No thanks"),
                preamble = list("Not this"))))
    ok(is.null(gf$data), "gadget_file has no data")

    # Data
    gf <- gadget_file_string(c(
        ver_string,
        "a\t99",
        "; Preamble for data",
        "; -- data --",
        "; col\tcolm\tcolt\tcoal",
        "3\t5\t9\t3",
        "7\t5\t33\t3",
        "3\t2\t9\t4",
        ""))
    expect_equal(
        gf$components,
        list(list(a = 99)))
    expect_equal(
        gf$data,
        structure(
            data.frame(col = c(3,7,3), colm = c(5,5,2), colt = c(9,33,9), coal = c(3,3,4)),
            preamble = list("Preamble for data")))

    # Blank preamble lines get preserved
    test_loopback(
        ver_string,
        "a\t45",
        "; ",
        "[component]",
        "fish\tbattered")

    # Can have multiple lines with the same key
    test_loopback(
        ver_string,
        "a\t45",
        "a\t46",
        "a\t47")

    # Can have empty initial components
    test_loopback(
        ver_string,
        "[component]",
        "a\t46",
        "[component]",
        "a\t47")

    # Can have comments at the end of lines too
    test_loopback(
        ver_string,
        "; This is a preamble comment",
        "[component]",
        "a\t46\t\t; This is a comment at the end of a line",
        "a\t46\t47\t48\t49\t\t; This is a comment at the end of multiple values",
        "a\t; This is a comment at the end of an empty line")
})

ok_group("Bare component labels", {
    gf <- gadget_file_string(
        ver_string,
        "farmer\tgiles",
        "cows",
        "fresian\tdaisy",
        "highland\tbessie",
        "pigs",
        "oldspot\tgeorge",
        "pigs\thenry\tfreddie",
        file_type = c())
    ok(cmp(gf$components, list(list(
        farmer = "giles",
        fresian = "daisy",
        highland = "bessie",
        oldspot = "george",
        pigs = c("henry", "freddie")
        ))), "By default, lines are just extra key/value fields")

    gf <- gadget_file_string(
        ver_string,
        "farmer\tgiles",
        "cows",
        "fresian\tdaisy",
        "highland\tbessie",
        "pigs",
        "oldspot\tgeorge",
        "pigs\thenry\tfreddie",
        file_type = c('bare_component'))
    ok(cmp(gf$components, list(
        list(farmer = "giles"),
        cows = list(fresian = "daisy", highland = "bessie"),
        pigs = list(oldspot = "george", pigs = c("henry", "freddie"))
        )), "By default, lines are just extra key/value fields")

    test_loopback(
        ver_string,
        "farmer\tgiles",
        "cows",
        "fresian\tdaisy",
        "highland\tbessie",
        "pigs",
        "oldspot\tgeorge",
        "pigs\thenry\tfreddie",
        file_type = c('bare_component'))
})

ok_group("Implicit component labels", {
    gf <- gadget_file_string(
        ver_string,
        "farmer\tgiles",
        "cows\t2",
        "fresian\tdaisy",
        "highland\tbessie",
        "pigs\t4",
        "oldspot\tgeorge",
        "gloucester\thenry\tfreddie",
        file_type = c())
    ok(cmp(gf$components, list(list(
        farmer = "giles",
        cows = 2,
        fresian = "daisy",
        highland = "bessie",
        pigs = 4,
        oldspot = "george",
        gloucester = c("henry", "freddie")
        ))), "By default, lines are just extra key/value fields")

    gf <- gadget_file_string(
        ver_string,
        "farmer\tgiles",
        "cows\t2",
        "fresian\tdaisy",
        "highland\tbessie",
        "pigs\t4",
        "oldspot\tgeorge",
        "gloucester\thenry\tfreddie",
        file_type = c(implicit_component = "^(cows|pigs)$"))
    ok(cmp(gf$components, list(
        list(farmer = "giles"),
        cows = list(cows = 2, fresian = "daisy", highland = "bessie"),
        pigs = list(pigs = 4, oldspot = "george", gloucester = c("henry", "freddie"))
        )), "Turn on implicit components, and they get divided")

    test_loopback(
        ver_string,
        "farmer\tgiles",
        "cows\t2",
        "fresian\tdaisy",
        "highland\tbessie",
        "pigs\t4",
        "oldspot\tgeorge",
        "gloucester\thenry\tfreddie",
        file_type = c(implicit_component = "^(cows|pigs)$"))
})
