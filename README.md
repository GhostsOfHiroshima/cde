
<!-- README.md is generated from README.Rmd. Please edit that file -->
cde package
===========

[![Travis-CI Build Status](https://travis-ci.org/robbriers/cde.svg?branch=dev)](https://travis-ci.org/robbriers/cde) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/robbriers/cde?branch=dev&svg=true)](https://ci.appveyor.com/project/robbriers/cde/branch/dev) [![Coverage Status](https://coveralls.io/repos/github/robbriers/cde/badge.svg?branch=dev)](https://coveralls.io/github/robbriers/cde?branch=dev)

Repo for R package to extract and plot WFD waterbody status data from the [EA Catchment Data Explorer](http://environment.data.gov.uk/catchment-planning/) (CDE) site. The data that are downloaded and summarised using this package are made available under the [Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

Installation
------------

You can install cde from github with:

``` r
# install.packages("devtools")
devtools::install_github("robbriers/cde")
```

Basic usage
-----------

There are three main functions in the package:

`search_sites`

This allows you to search the listing of sites, catchments or river basin districts on the CDE site to locate those that match the string specified. The output of this can then be used to define inputs for the following functions.

Searching can be performed by name (`name`), Management Catchment (`MC`), Operational Catchment (`OC`) or River Basin District (`RBD`). It returns a dataframe containing all rows that match (or partial match) the input string.

``` r
# search for Management Catchments containing the string 'Avon'
search_sites("Avon", "MC")

# search for waterbodies containing the string 'Till'
search_sites("Till", "name")
```

`wfd_status`

This retrieves status data from the CDE site. The data can be retrieved by specifying waterbody id (`WBID`), Management Catchment (`MC`), Operational Catchment (`OC`) or River Basin District (`RBD`). Start year (`startyr`) and end year (`endyr`) allow specific timeranges to be downloaded. For Management Catchment (`MC`), Operational Catchment (`OC`) or River Basin District (`RBD`) level downloads, waterbody type (`type`) can also be specified to allow extraction of specific waterbody types (River, Lake, GroundWaterBody, TransitionalWater or CoastalWater. Quality element (`element`) can also be specified. This defaults to "Overall Water Body". A listing of possible elements is still being compiled.

It returns a dataframe containing the status (and other details) for the specified combination of column, value, element and dates.

Note that during 2013 and 2014 waterbodies were classified under both Cycle 1 and Cycle 2 methodologies. The status information extracted for these years is just for the Cycle 2 classification, to avoid double counting.

``` r
# get status information for Lakes in the Avon Hampshire Management 
# Catchment in 2012
wfd_status("Avon Hampshire", "MC", startyr=2012, type="Lake")

# get status information for all waterbodies within the Solway Tweed
# River Basin District in all years (2009-2015)
wfd_status("Solway Tweed", "RBD")

# get status information for all waterbodies within the Humber
# River Basin District between 2012 and 2014 (BIG - 2985 rows!)
wfd_status("Humber", "RBD", startyr=2012, endyr=2014)

# get status information for WBID  GB102021073050 between 2009 and 2012
wfd_status("GB102021073050", "WBID", startyr=2009, endyr=2012)
```

`status_plot`

This produces summary barplots of percentage of waterbodies at different status. As for `wfd_status` the year range, element and type can be specified. Only works for Management/Operational Catchments or River Basin District level searches.

When a single year is specified, the bars represent the percentage of waterbodies in each status class. When multiple years are specified, the output is a stacked barplot of status percentages for each year.

``` r
# plot status information for Lakes in the Avon Hampshire Management 
# Catchment in 2012
status_plot("Avon Hampshire", "MC", startyr=2012, type="Lake")

# get status information for all waterbodies within the Solway Tweed
# River Basin District in all years (2009-2015)
status_plot("Solway Tweed", "RBD")

# get status information for all waterbodies within the Humber
# River Basin District between 2012 and 2014
status_plot("Humber", "RBD", startyr=2012, endyr=2014)
```

### Things to do (2019-02-01)

Need to revise tests - fails on size of returned df - change in source data- DONE

Revise max year (2016 data now available) - can this be set from actual data?

Change colour scheme to allow viridis option (hard code to avoid dependencies?) - set as default? DONE

Set up list of classification levels:

**Have taken this to levels 1, 2 and 4 but causes an issue for plotting as supporting elements like Hydromorph have a status class of 'supporting good', rather than expected values**

e.g.

``` r
# single year and type
test_mc_avon<-wfd_status("Avon Warwickshire", "MC", level="Hydromorphological Supporting Elements", startyr = 2011, type = "River")


status_plot("Avon Warwickshire", "MC", level="Hydromorphological Supporting Elements", startyr = 2011, type = "River")
# results in blank plot
```
