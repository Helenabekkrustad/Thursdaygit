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
iris_subset <- iris_data[iris_data$Species %in% selected_species, ]

# Create an output filename using species_a and species_b
output_file <- paste0(
  "iris_",
  species_a,
  "_vs_",
  species_b,
  ".png"
)

# Open plot
png(
  filename = output_file,
  width = image_size,
  height = image_size
)

plot(
  Petal.Length ~ Petal.Width,
  data = iris_subset,
  col = species_colours[as.character(iris_subset$Species)],
  pch = 19,
  xlab = "Petal width",
  ylab = "Petal length",
  main = paste(species_a, "and", species_b)
)

legend(
  "topleft",
  legend = selected_species,
  col = species_colours[selected_species],
  pch = 19,
  bty = "n"
)

dev.off() # Close plot


