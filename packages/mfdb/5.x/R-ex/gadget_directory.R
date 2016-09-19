### Name: gadget_directory
### Title: Gadget directory objects
### Aliases: gadget_directory gadget_dir_write gadget_dir_read

### ** Examples
## Not run: 
##D # Create a gadget directory
##D gd <- gadget_directory('./out')
##D 
##D # Read in the likelihood file
##D likelihood <- gadget_dir_read(gd, 'likelihood')
##D 
##D # Write out an area file to "./out/areas", replacing any existing file
##D gadget_dir_write(gd, gadget_file("areas", components = list(list(north = 1:3, south = 4:7))))
##D 
##D # Replace a likelihood component if one already exists with
##D # the same name/type or append it to the bottom
##D gadget_dir_write(gd, gadget_likelihood_component("understocking", name = "frank"))
## End(Not run)


