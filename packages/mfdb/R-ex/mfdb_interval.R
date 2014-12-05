### Name: mfdb_interval
### Title: MareFrame DB intervals
### Aliases: mfdb_interval as.list.mfdb_interval

### ** Examples

## Make groups of len40 (40--60), len60 (60--80)
g1 <- mfdb_interval("len", c(40, 60, 80))

## Use seq to make life easier
g2 <- mfdb_interval("len", seq(40, 80, by = 20))

## Convert to list representation
as.list(g2)
## Not run: 
##D $len40
##D [1] 40 60
##D 
##D $len60
##D [1] 60 80
## End(Not run)


