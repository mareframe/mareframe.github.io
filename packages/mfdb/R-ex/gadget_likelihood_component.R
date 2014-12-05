### Name: gadget_likelihood_component
### Title: Gadget likelihood components
### Aliases: gadget_likelihood_component

### ** Examples

# Any example could be added to a file with the following:-
## Not run: 
##D gd <- gadget_directory('./out')
##D gadget_dir_write(gd, component)
## End(Not run)

# Create a penalty component
gadget_likelihood_component("penalty",
        name = "bounds",
        weight = "0.5",
        data = data.frame(
            switch = c("default"),
            power = c(2),
            stringsAsFactors = FALSE))

# Create an understocking component
gadget_likelihood_component("understocking", name ="understock")



