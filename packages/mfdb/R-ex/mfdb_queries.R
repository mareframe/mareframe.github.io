### Name: mfdb_queries
### Title: MareFrame DB queries
### Aliases: mfdb_area_size mfdb_temperature mfdb_survey_index_mean
###   mfdb_survey_index_total mfdb_sample_count
###   mfdb_sample_meanlength_stddev mfdb_sample_meanlength
###   mfdb_sample_totalweight mfdb_sample_meanweight
###   mfdb_sample_meanweight_stddev mfdb_stomach_presenceratio

### ** Examples
## Not run: 
##D agg_data <- mfdb_sample_count(mdb, c('age', 'length'),
##D         params = c(list(
##D             year = c(1990, 1991),
##D             length = mfdb_interval("len", seq(0, 500, by = 30)),
##D             age = mfdb_group('young' = c(1,2,3)),
##D             null = NULL), opt_catch))
##D gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
##D         name = "cdist",
##D         weight = 0.9,
##D         data = agg_data[[1]],
##D         area = attr(agg_data[[1]], "area"),
##D         age = attr(agg_data[[1]], "age")))
## End(Not run)


