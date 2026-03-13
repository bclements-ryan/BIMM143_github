# Class05
Brooke Clement (PID:A17532793)

# Class 5 Data Visualization Lab

\#Install the package ggplot2 \#install.packages(“ggplot2”)

# Any time I want to use this package I need to load it

``` r
library(ggplot2)
```

``` r
View(cars)
```

# a quick base R plot - this is not ggplot

``` r
plot(cars)
```

![](class05_files/figure-commonmark/unnamed-chunk-3-1.png)

# Our first ggplot

# We need data + aes + geoms

``` r
ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point()
```

![](class05_files/figure-commonmark/unnamed-chunk-4-1.png)

``` r
p <- ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point()
```

# Add a line geom with geom_line()

``` r
p + geom_line()
```

![](class05_files/figure-commonmark/unnamed-chunk-5-1.png)

# Add a trendline close to the data

``` r
p + geom_smooth(method="lm")
```

    `geom_smooth()` using formula = 'y ~ x'

![](class05_files/figure-commonmark/unnamed-chunk-6-1.png)

p + geom_smooth()

\#\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_#

# Read in our drug expression data

``` r
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
```

            Gene Condition1 Condition2      State
    1      A4GNT -3.6808610 -3.4401355 unchanging
    2       AAAS  4.5479580  4.3864126 unchanging
    3      AASDH  3.7190695  3.4787276 unchanging
    4       AATF  5.0784720  5.0151916 unchanging
    5       AATK  0.4711421  0.5598642 unchanging
    6 AB015752.4 -3.6808610 -3.5921390 unchanging

# Let’s make our first plot attempt

``` r
g <- ggplot(data=genes) +
  aes(x=Condition1, y=Condition2,
      col=State) +
  geom_point()
```

# Q. How many genes are in this dataset?

``` r
nrow(genes)
```

    [1] 5196

# Q. How many columns did you find?

``` r
ncol(genes)
```

    [1] 4

# Q. How many ‘up’ regulated genes there are.

``` r
table(genes$State)
```


          down unchanging         up 
            72       4997        127 

# Q. What fraction of total genes is up-regulated in this dataset?

``` r
round((table(genes$State) /nrow(genes))*100, 2)
```


          down unchanging         up 
          1.39      96.17       2.44 

# Add some color

``` r
g + scale_color_manual(values=c("blue", "gray","purple")) +
  labs(title="Gene expression changes upon drug treatment",
    x="Control(no drug)",
    y="Drug Treatment") +
  theme_bw()
```

![](class05_files/figure-commonmark/unnamed-chunk-13-1.png)
