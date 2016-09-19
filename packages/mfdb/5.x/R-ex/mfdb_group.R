### Name: mfdb_group
### Title: MareFrame DB groups
### Aliases: mfdb_group mfdb_timestep_yearly mfdb_timestep_biannually
###   mfdb_timestep_quarterly mfdb_group_numbered mfdb_bootstrap_group

### ** Examples

## Aggregate age into 2 groups. "young" (for ages 1--3) and
## "old" (for ages 4--6)
g1 <- mfdb_group(young = c(1,2,3), old = c(4,5,6))
## Not run: 
##D $young
##D [1] 1 2 3
##D 
##D $old
##D [1] 4 5 6
##D 
##D attr(,"class")
##D [1] "mfdb_group"
## End(Not run)

## Aggregate areas into "area1" and "area2".
g2 <- mfdb_group_numbered("area", c(1011,1012,1013), c(1021,1022))
## Not run: 
##D $area1
##D [1] 1011 1012 1013
##D 
##D $area2
##D [1] 1021 1022
##D 
##D attr(,"class")
##D [1] "mfdb_group"
## End(Not run)

## Take 3 samples with replacement from each group in area
g3 <- mfdb_bootstrap_group(3, g2)
## Not run: 
##D [[1]]
##D [[1]]$area1
##D [1] 1011 1013 1012
##D 
##D [[1]]$area2
##D [1] 1021 1021
##D 
##D 
##D [[2]]
##D [[2]]$area1
##D [1] 1011 1013 1012
##D 
##D [[2]]$area2
##D [1] 1021 1021
##D 
##D 
##D [[3]]
##D [[3]]$area1
##D [1] 1012 1013 1013
##D 
##D [[3]]$area2
##D [1] 1022 1022
##D 
##D 
##D attr(,"class")
##D [1] "mfdb_bootstrap_group"
## End(Not run)


