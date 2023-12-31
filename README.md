# deltaR2 ⚠️SEE 'FYI'⚠️

Evaluating delta R squared

## Description

You can statistically evaluate whether the inclusions or exclusion of some parameters in your model significantly explain more variance. This is essentially conducting a statistical test on a set of $\beta$'s.

$\Delta R^2$ is the difference between the variance explained by the two models. These two models include a _full_ model in which all variables of interest are included and a _restricted_ model in which only a subset of variables are included. Below is the formula for computings this statistical test.

$$
F(D, N - K - 1) = \frac{R_{full}^2 - R_{restricted}^2}{MS}
$$

Where

$$
MS = \frac{D \times (1 - R_{full}^2)}{N - K - 1}
$$

$D$ is the difference in number of parameters included. $N$ is the total number of observations. $K$ is the total number of parameters in the _full_ model, including $\beta_0$.

## Implementing this with R

In this repo, I have provided a simulated dataset to which the function `deltaR2()` can be applied to.

## Requirements

To use `deltaR2()` you need not install additional dependencies. However, in [main.R](/main.R), [`MASS`](https://cran.r-project.org/web/packages/MASS/MASS.pdf) is used to simulate data. To install this package, type the following in the R console or consult the package documentation.

```R
install.packages("MASS")
```

## FYI
>The following code has been added to [mrc](https://github.com/w-decker/mrc). Please consult that for more updated versions of `deltaR2()`.
