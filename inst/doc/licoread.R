## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----import-------------------------------------------------------------------
library(licoread)
# this step is not needed if you know where your data are
path <- system.file("extdata/82z", package = "licoread")
# provide the location of your raw files to licoread
data <- licoread(path)

# if your location containes more than one file type, you will have to specify
# which files licoread should read
path <- system.file("extdata/mixed_files", package = "licoread")
gas_df_82z <- licoread(path, file_type = "82z")

## ----fluxible-81x-------------------------------------------------------------
path_81x <- system.file("extdata/81x", package = "licoread")
gas_df_81x <- licoread(path_81x)

co2_df <- licoread_to_fluxible(
  gas_df_81x,
  "CO2",
  datetime_col = "Date"
)

## ----fluxible-82z-------------------------------------------------------------

list_gases(gas_df_82z)

ch4_dry <- licoread_to_fluxible(
  gas_df_82z,
  "LI-7810_CH4_DRY",
  datetime_col = c("LI-8250_DATE", "LI-8250_TIME")
)

