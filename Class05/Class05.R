#' ---
#' title: "Class05"
#' author: "Brooke Clements (PID:A17532793)"
#' date: "January 24h, 2026"
#' ---


# Class 5 Data Visualization Lab

# Install the package ggplot2
# install.packages("ggplot2")

# Any time I want to use this package I need to load it
library(ggplot2)

View(cars)

# a quick base R plot - this is not ggplot
plot(cars)

# Our first ggplot
# We need data + aes + geoms
ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point()

p <- ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point()

# Add a line geom with geom_line()
p + geom_line()

# Add a trendline close to the data
p + geom_smooth()

p + geom_smooth(method="lm")

#____________________________#

# Read in our drug expression data

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Let's make our first plot attempt
g <- ggplot(data=genes) +
  aes(x=Condition1, y=Condition2,
      col=State) +
  geom_point()

# Q. How many genes are in this dataset?
nrow(genes)
# Q. How many columns did you find?
ncol(genes)
# Q. How many ‘up’ regulated genes there are.
table(genes$State)
# Q. What fraction of total genes is up-regulated in this dataset?
round((table(genes$State) /nrow(genes))*100, 2)
# Add some color
g + scale_color_manual(values=c("blue", "gray","purple")) +
  labs(title="Gene expression changes upon drug treatment",
    x="Control(no drug)",
    y="Drug Treatment") +
  theme_bw()

