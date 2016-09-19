### Name: mfdb_helpers
### Title: MareFrame tools & helpers
### Aliases: mfdb_find_species

### ** Examples

mfdb_find_species(c("gad mor", "tube worms"))
#             gad mor              tube worms              
# id          8791030402           1e+10                   
# name        "COD"                "TBX"                   
# description "Cod (Gadus Morhua)" "Tube Worms (Tubeworms)"

# Can also generate a map to help insert a data.frame of foreign data
## Not run: 
##D # Work out a map from all Prey_Species_Name values to MFDB species codes
##D species_map <- mfdb_find_species(levels(stomachs$Prey_Species_Name))['name',]
##D # Only include data where there is one possible solution
##D species_map <- vapply(
##D     species_map,
##D     function (names) if(length(names) == 1) names else as.character(NA),
##D     "")
##D 
##D # Can then remap the species column with:
##D plyr::revalue(stomachs$Prey_Species_Name, species_map)
## End(Not run)


