# for CRAN checker
vkToken <- NULL

vkLoadToken <-
function() {
  load(file = "vkauth")
  return(vkToken)
}
