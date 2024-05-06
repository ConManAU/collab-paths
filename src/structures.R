library(igraph)

# We are going to start by using the igraph library to store our collaboration networks as a graph object.
# To begin with, we will create a small test example. Consider 8 people who participate in 3 collaborations.
# The people are defined in the following vector:

testpeople <- c(
  "Morgan",
  "Chris",
  "Ava",
  "Tristan",
  "Ricky",
  "Francis",
  "Helena",
  "Kimberley"
)

# The collaborations, and the people in them, are as follows:

testcollabs <- list(
  UnControllable = c("Chris", "Helena", "Kimberley"),
  ToyBox = c("Morgan", "Chris", "Ava", "Francis", "Kimberley"),
  MYOB = c("Ava", "Ricky", "Helena", "Kimberley")
)

# We can now make a graph holding all of this info.

testgraph <- make_empty_graph(n = 8, directed = FALSE)
V(testgraph)$name <- testpeople
testgraph <- testgraph %>%
  add_edges(edges = combn(testcollabs$UnControllable, 2)) %>%
  add_edges(edges = combn(testcollabs$ToyBox, 2)) %>%
  add_edges(edges = combn(testcollabs$MYOB, 2))
E(testgraph) <- unique(E(testgraph))
