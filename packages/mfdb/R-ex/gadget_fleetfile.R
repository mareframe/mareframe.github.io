### Name: gadget_fleetfile
### Title: Gadget fleet files
### Aliases: gadget_fleet_component

### ** Examples
## Not run: 
##D     # Write a 'totalfleet' component
##D     gadget_dir_write(gd, gadget_fleet_component(
##D         'totalfleet',
##D         name = 'igfs',
##D         data = mfdb_sample_count(mdb, c('vessel'), list(
##D             year = 1998,
##D             vessel = mfdb_unaggregated(),
##D             step = mfdb_timestep_yearly))[[1]]))
##D 
##D     gadget_dir_write(gd, gadget_fleet_component(
##D         'effortfleet',
##D         name = 'barry',
##D         suitability = "function constant 4;",
##D         catchability = list(stockA=4, stockB=5),
##D         quotafunction = 'simple',
##D         biomasslevel = c(1000, 2000),
##D         quotalevel = c(0.1, 0.4, 0.9),
##D         data = mfdb_sample_count(mdb, c('vessel'), list(
##D             year = 1998,
##D             vessel = mfdb_unaggregated(),
##D             step = mfdb_timestep_yearly))[[1]]))
##D 
##D     gadget_dir_write(gd, gadget_fleet_component(
##D         'quotafleet',
##D         name = 'barry',
##D         suitability = "function constant 4;",
##D         catchability = list(stockA=4, stockB=5),
##D         quotafunction = 'simple',
##D         biomasslevel = c(1000, 2000),
##D         quotalevel = c(0.1, 0.4, 0.9),
##D         data = mfdb_sample_count(mdb, c('vessel'), list(
##D             year = 1998,
##D             vessel = mfdb_unaggregated(),
##D             step = mfdb_timestep_yearly))[[1]]))
## End(Not run)


