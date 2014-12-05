### Name: mfdb_import
### Title: MareFrame Import functions
### Aliases: mfdb_import_survey mfdb_import_area mfdb_import_division
###   mfdb_import_temperature mfdb_import_sampling_type

### ** Examples
## Not run: 
##D # data/cod-1998.csv contains:-
##D # year,month,areacell,species,age,sex,length
##D # 1998,1,35F1,COD,3,M,140
##D # 1998,1,35F1,COD,3,M,150
##D # 1998,1,35F1,COD,3,F,150
##D 
##D mfdb_import_survey(mdb,
##D     data_source = 'cod-1998',
##D     case_study = 'Iceland',
##D     institute = 'MRI',
##D     gear = 'GIL',
##D     vessel = '2.RSH',
##D     sampling_type = 'HAR',
##D     read.csv("data/cod-1998.csv"))
## End(Not run)


