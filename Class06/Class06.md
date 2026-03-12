# Class 6: R Functions
Brooke Clements (PID: A17532793)

- [Background](#background)
- [Our first function](#our-first-function)
- [A Protien generating function](#a-protien-generating-function)

## Background

All functions in R have at least 3 things:

- A **Name** that we use to call the function.
- Has one or more input **Arguments**
- The **Body** the lines of R code that do the work

## Our first function

Let’s write a silly wee function called `add()` to add some numbers (the
input arguments)

``` r
add <- function(x,y) {x+y}
```

``` r
add(100,1)
```

    [1] 101

``` r
add(x=c(100,1,100),y=1)
```

    [1] 101   2 101

> Q. What if I give a multiple element vector to `x` amd `y`?

``` r
add(x=c(100,1),y=c(100,1))
```

    [1] 200   2

> Q. What if I give three inputs to the function?

``` r
#add(x=c(100,1),y=1,z=1)
```

> Q. What if I give only one input to the add function?

``` r
addnew <- function(x,y=1) {x+y}
```

``` r
addnew(x=100)
```

    [1] 101

``` r
addnew(c(100,1),100)
```

    [1] 200 101

If we write our function with input arguments having no default value
then the user will be required to set them when they use the function.
We can give our input arguments “default” values by setting them equal
to some sensible value -e.g.x=1, y=1

Let’s try something more interesting: Make a sequence generating tool..

The `sample()` function can be a useful starting point here:

``` r
sample(1:10, size=4)
```

    [1] 6 8 7 1

> Q. Generate 9 random numbers taken from the input vector x=1:10?

``` r
sample(1:10, size=9)
```

    [1]  7  1  3  6  9  2  8  4 10

> Q. Generate 12 random numbers taken from the input vector x=1:10?

``` r
sample(1:10, size=12, replace=TRUE)
```

     [1]  8 10  4  8  9  5  6  2  1  2  4  2

> Q. Write code for the `sample()` function that generates nucleotide
> sequences of length 6?

``` r
sample(x=c("A","G","C","T"), size=6, replace=TRUE)
```

    [1] "T" "C" "T" "T" "A" "A"

> Q. Wrire a first function `generate_dna()` that returns a *user
> specified length* DNA sequence:

``` r
generate_dna <- function(len=6){sample(x=c("A","G","C","T"), size=len, replace=TRUE)}
```

``` r
generate_dna(len=100)
```

      [1] "A" "C" "G" "T" "T" "G" "C" "G" "C" "T" "G" "A" "G" "T" "C" "T" "A" "C"
     [19] "C" "G" "A" "G" "C" "T" "A" "C" "A" "G" "A" "C" "T" "T" "A" "G" "A" "G"
     [37] "C" "G" "G" "G" "C" "T" "C" "C" "C" "T" "C" "G" "A" "G" "C" "T" "A" "T"
     [55] "G" "C" "G" "T" "C" "G" "C" "G" "C" "T" "G" "T" "A" "T" "C" "A" "T" "T"
     [73] "C" "G" "G" "T" "T" "C" "T" "G" "C" "C" "G" "T" "G" "G" "T" "C" "G" "T"
     [91] "G" "T" "G" "G" "G" "G" "C" "G" "C" "A"

> **Key-Points** Every function in R looks fundamentally the same in
> terms of its structure. Basically 3 things: name, input, and body.

    name <- function(input) {body}

> Functions can have multiple inputs. These can be **required**
> arguments or **optional** arguments. With optional arguments having a
> set default value.

> Q. Modify and improve our `generate_dna()` function to return it’s
> generated sequence in a more standard format like “AGTAGTA” rather
> than vector “A”, “C”, “G”,“A”

``` r
generate_dna <- function(len=6, fasta=TRUE){
  ans <- sample(x=c("A","G","C","T"), 
                size=len, replace=TRUE)
  if(fasta){
    cat("Single-element vector output")
  ans <- paste(ans, collapse="")
  }else{
    cat("Multi-element vector output")
  }
  return(ans) 
}

generate_dna (fasta=FALSE)
```

    Multi-element vector output

    [1] "T" "C" "C" "A" "C" "C"

``` r
generate_dna (fasta=TRUE)
```

    Single-element vector output

    [1] "GGCCTT"

The `paste` function - it’s job is to join up or stick together (a.k.a
paste) input strings together

``` r
paste("alice","loves R",sep="***")
```

    [1] "alice***loves R"

Flow control means where the R brain goes in your code

``` r
good_mood <- TRUE

if(good_mood){
  cat("Great!")
} else { 
  cat("Bummer!")
  }
```

    Great!

## A Protien generating function

> Q. Write a function, called `generate_protien()`, that generates a
> user specifed length protein sequence.

> Q. Use that function to generate random protein sequences between
> length 6 and 12

> Q. Are any of your sequences unique i.e not found anywhere in nature?

There are 20 natural amino-acids

``` r
aa <- c("A","R","N","D","C","Q","E","G","H","I","L","K","M","F","P","S","T","W","Y","V")
```

``` r
generate_protien <- function(len){
  #The amino-acids to sample from
  aa <- c("A","R","N","D","C","Q","E","G","H","I","L","K","M","F","P","S","T","W","Y","V")
  #Draw n=len amino acids to make our sequence
  ans <- sample(aa,size=len,replace=T)
  ans <-  paste(ans, collapse="")
return(ans)
}
```

``` r
generate_protien(20)
```

    [1] "FRDGDVHAEHKAQQLQIFQC"

> Q. Use that function to generate random protein sequences between
> length 6 and 12

``` r
generate_protien(6)
```

    [1] "IRIRMR"

``` r
generate_protien(7)
```

    [1] "IMIGAKR"

``` r
generate_protien(8)
```

    [1] "IGPMMGCL"

``` r
generate_protien(9)
```

    [1] "FHDGCKLDQ"

``` r
generate_protien(10)
```

    [1] "NHGEEARIHA"

``` r
generate_protien(11)
```

    [1] "QYDTAWWVPSQ"

``` r
generate_protien(12)
```

    [1] "FYVWMEPKFGCN"

``` r
for(i in 6:12){
  #FASTA ID line">id"
  cat(">",i, sep="", "\n")
  #Protein sequence line
  cat(generate_protien(i),"\n")
}
```

    >6
    LSIHME 
    >7
    HIRGVDP 
    >8
    CQMDMFHL 
    >9
    QVGMVDALC 
    >10
    AYMQPFNSFH 
    >11
    WVGQYRKFFQF 
    >12
    RHFTRLVHLNIG 

> Q. Are any of your sequences unique i.e not found anywhere in nature?

Sequences 6 -8 were found in nature but 9-12 were not found in nature.
