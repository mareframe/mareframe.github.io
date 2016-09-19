### Name: mfdb_bulk
### Title: MareFrame DB Dump / Restore
### Aliases: mfdb_cs_dump mfdb_cs_restore

### ** Examples
## Not run: 
##D # Copy case study data from one case study to another
##D mdb_out <- mfdb('Iceland')
##D mdb_in <- mfdb('Test')
##D 
##D mfdb_cs_dump(mdb_out, '/tmp/cs_dump')
##D mfdb_cs_restore(mdb_in, '/tmp/cs_dump')
##D 
##D mfdb_cs_dump(mdb_out, '/tmp/cs_dump.tar.gz')
##D mfdb_cs_restore(mdb_in, '/tmp/cs_dump.tar.gz')
## End(Not run)


