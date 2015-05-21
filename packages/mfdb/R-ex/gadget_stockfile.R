### Name: gadget_stockfile
### Title: Gadget stock files
### Aliases: gadget_stockfile_extremes gadget_stockfile_refweight
###   gadget_stockfile_initialconditions gadget_stockfile_recruitment

### ** Examples

# Write min/max values and refweight file 
## Not run: 
##D gd <- gadget_directory('./out')
##D imm_data <- mfdb_sample_meanweight(mdb, c('age', 'length'), list(
##D     age = NULL, # The age column will say 'all', but will know the min/max
##D     length = mfdb_step_interval('', 10, to = 100),
##D     species = 'COD',
##D     maturity_stage = '1',
##D     null = NULL))
##D 
##D # Write both min/max and refweighfile into our gadget directory
##D gadget_dir_write(gd, gadget_stockfile_extremes('cod.imm', imm_data[[1]]))
##D gadget_dir_write(gd, gadget_stockfile_refweight('cod.imm', imm_data[[1]]))
## End(Not run)



