
# (a) Dependencies ----

if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, magrittr, comtradr)

# (b) Extraction functions ----

## Comtrade search parameters
search <-
  function(partner, year) {
    data <- ct_search(
      reporters = "Guatemala",
      partners = partner,
      trade_direction = "exports",
      start_date = year,
      end_date = year,
      commod_codes = "AG4"
    )
  }

## Extraction loop
get <-
  function(partners, years) {
    data <- data.frame()
    for (year in years) {
      query <- search(partners, year)
      data <- rbind(data, query)
    }
    data %>%
      as_tibble()
  }

## Export as .rds
write <-
  function(data) {
    name <- deparse(substitute(data))
    write_rds(data, file = paste0("../Gravity model/Data/Exports raw/", name, ".rds"))
  }

# (c) Data extraction ----

## Central America and Mexico
ca_exports_fst <-
  get(partners = c("Belize", "Costa Rica", "Panama", "Honduras"),
      years = c(1995:2020))
write(ca_exports_fst)

ca_exports_snd <-
  get(partners = c("Nicaragua", "El Salvador", "Mexico"),
      years = c(1995:2020))
write(ca_exports_snd)




















