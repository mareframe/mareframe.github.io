### Name: mfdb_aggregate_step_interval
### Title: MareFrame DB intervals
### Aliases: mfdb_step_interval

### ** Examples

## Make groups of len0 (0--5), len5 (5--10), ... len45(45--50)
g1 <- mfdb_step_interval("len", 5, to = 50)

## Make groups of len0 (0--5), len5 (5--10), ... len45(45--50), len50(50--inf)
g2 <- mfdb_step_interval("len", 5, to = 50, open_ended = TRUE)



