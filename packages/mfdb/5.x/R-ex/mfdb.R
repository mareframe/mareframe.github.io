### Name: mfdb
### Title: MareFrame DB class
### Aliases: mfdb mfdb_disconnect

### ** Examples
## Not run: 
##D     # Connect to local DB, as the Iceland case study
##D     mdb <- mfdb('iceland')
##D 
##D     # Connect to "mf2014" on remote DB server
##D     mdb <- mfdb('Iceland', db_params = list(host = "db.mareframe-fp7.org", dbname = "mf2014")
##D 
##D     # Stop it and tidy up
##D     mfdb_disconnect(mdb)
##D 
##D     # Destroy everything, since schema was out of date.
##D     mfdb('iceland', destroy_schema = TRUE)
## End(Not run)


