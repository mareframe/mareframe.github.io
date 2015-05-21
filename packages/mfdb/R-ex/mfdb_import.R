### Name: mfdb_import
### Title: MareFrame Import functions
### Aliases: mfdb_import_survey mfdb_import_survey_index mfdb_import_area
###   mfdb_import_division mfdb_import_temperature
###   mfdb_import_sampling_type mfdb_import_cs_taxonomy mfdb_import_stomach

### ** Examples
## Not run: 
##D # data/cod-1998.csv contains:-
##D # year,month,areacell,species,age,sex,length
##D # 1998,1,35F1,COD,3,M,140
##D # 1998,1,35F1,COD,3,M,150
##D # 1998,1,35F1,COD,3,F,150
##D data_in <- read.csv("data/cod-1998.csv")
##D 
##D data_in$institute <- 'MRI'
##D data_in$gear <- 'GIL'
##D data_in$vessel <- '2.RSH'
##D data_in$sampling_type <- 'HAR'
##D mfdb_import_survey(mdb, data_in, data_source = 'cod-1998')
## End(Not run)


