
<!-- README.md is generated from README.Rmd. Please edit that file -->
cde <img src="docs/logo/logo.png" align="right" height=140/>
============================================================

[![Travis-CI Build Status](https://travis-ci.org/robbriers/cde.svg?branch=master)](https://travis-ci.org/robbriers/cde) [![Coverage Status](https://coveralls.io/repos/github/robbriers/cde/badge.svg?branch=master)](https://coveralls.io/github/robbriers/cde?branch=master) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

Introduction
------------

`cde` is a package for R which facilitates searching and download of the Water Framework Directive (WFD) reporting data for all waterbodies within the Environment Agency area.

The types of data that can be downloaded are: WFD status classification data (which can also be plotted), Reasons for Not Achieving Good (RNAG) status, objectives set for waterbodies, measures put in place to improve water quality and details of associated protected areas.

The site accessed is <https://environment.data.gov.uk/catchment-planning/>. The data that are downloaded are made available under the Open Government Licence v3.0 (<https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/>) and use of this package implies acceptance of these licence conditions.

Installation
------------

You can install cde from github with:

``` r
# install.packages("devtools")
devtools::install_github("robbriers/cde")
```

Basic usage
-----------

Details of how to use the package can be found at <https://robbriers.github.io/cde>.
