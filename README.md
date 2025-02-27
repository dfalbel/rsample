
# rsample <a href='https://rsample.tidymodels.org/'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![R build
status](https://github.com/tidymodels/rsample/workflows/R-CMD-check/badge.svg)](https://github.com/tidymodels/rsample/actions)
[![Codecov test
coverage](https://codecov.io/gh/tidymodels/rsample/branch/master/graph/badge.svg)](https://codecov.io/gh/tidymodels/rsample?branch=master)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/rsample)](https://cran.r-project.org/package=rsample)
[![Downloads](https://cranlogs.r-pkg.org/badges/rsample)](https://cran.r-project.org/package=rsample)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- badges: end -->

## Overview

`rsample` contains a set of functions to create different types of
resamples and corresponding classes for their analysis. The goal is to
have a modular set of methods that can be used across different R
packages for:

-   traditional resampling techniques for estimating the sampling
    distribution of a statistic and
-   estimating model performance using a holdout set

The scope of `rsample` is to provide the basic building blocks for
creating and analyzing resamples of a data set but does not include code
for modeling or calculating statistics. The “Working with Resample Sets”
vignette gives demonstrations of how `rsample` tools can be used.

Note that resampled data sets created by `rsample` are directly
accessible in a resampling object but do not contain much overhead in
memory. Since the original data is not modified, R does not make an
automatic copy.

For example, creating 50 bootstraps of a data set does not create an
object that is 50-fold larger in memory:

``` r
library(rsample)
library(mlbench)

data(LetterRecognition)
lobstr::obj_size(LetterRecognition)
#> 2,644,640 B

set.seed(35222)
boots <- bootstraps(LetterRecognition, times = 50)
lobstr::obj_size(boots)
#> 6,686,512 B

# Object size per resample
lobstr::obj_size(boots)/nrow(boots)
#> 133,730.2 B

# Fold increase is <<< 50
as.numeric(lobstr::obj_size(boots)/lobstr::obj_size(LetterRecognition))
#> [1] 2.528326
```

<sup>Created on 2020-05-07 by the [reprex
package](https://reprex.tidyverse.org) (v0.3.0)</sup>

The memory usage for 50 bootstrap samples is less than 3-fold more than
the original data set.

## Installation

To install it, use:

``` r
install.packages("rsample")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
install_dev("rsample")
```

## Contributing

This project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

-   For questions and discussions about tidymodels packages, modeling,
    and machine learning, please [post on RStudio
    Community](https://community.rstudio.com/new-topic?category_id=15&tags=tidymodels,question).

-   If you think you have encountered a bug, please [submit an
    issue](https://github.com/tidymodels/rsample/issues).

-   Either way, learn how to create and share a
    [reprex](https://reprex.tidyverse.org/articles/articles/learn-reprex.html)
    (a minimal, reproducible example), to clearly communicate about your
    code.

-   We welcome contributions, including typo corrections, bug fixes, and
    feature requests! If you have never made a pull request to an R
    package before, `rsample` is an excellent place to start. Find an
    [issue](https://github.com/tidymodels/rsample/issues/) with the
    **help wanted ❤️** tag, comment that you’d like to take it on, and
    we’ll help you get started.

-   Check out further details on [contributing guidelines for tidymodels
    packages](https://www.tidymodels.org/contribute/) and [how to get
    help](https://www.tidymodels.org/help/).
