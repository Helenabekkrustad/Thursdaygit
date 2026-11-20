library(dplyr)
library(ggplot2)


# Read command-line arguments
args <- commandArgs(trailingOnly = TRUE)
species_a <- args[1] # The first argument is the name of the first species

# Store the second argument
species_b <- args[2]

# Convert the third argument to an integer
image_size <- as.integer(args[3])

# Put species_a and species_b into one vector
selected_species <- c(species_a, species_b)

iris_data <- datasets::iris

species_colours <- c(
  setosa = "tomato",
  versicolor = "steelblue",
  virginica = "gold"
)

# Keep only data from the selected species
data <- iris_data |> 
  filter(Species %in% selected_species)

# Create an output filename using species_a and species_b
output_file <- paste0(
  "iris_",
  species_a,
  "_vs_",
  species_b,
  ".png"
)



p <- ggplot(data, aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point() +
  labs(x = "Petal width (cm)", y = "Petal length (cm)",
       title = "comparison statistics")



ggsave(filename = output_file, plot = p)


