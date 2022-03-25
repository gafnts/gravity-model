
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

## South America
sa_exports_fst <-
  get(partners = c("Argentina", "Bolivia (Plurinational State of)"),
      years = c(1995:2020))
write(sa_exports_fst)

sa_exports_snd <-
  get(partners = c("Colombia", "Ecuador", "Guyana"),
      years = c(1995:2020))
write(sa_exports_snd)

sa_exports_trd <-
  get(partners = c("Paraguay", "Peru", "Uruguay", "Suriname"),
      years = c(1995:2020))
write(sa_exports_trd)

sa_exports_fth <-
  get(partners = c("Brazil", "Chile"),
      years = c(1995:2020))
write(sa_exports_fth)

## Caribbean
car_exports_fst <-
  get(partners = c("Dominican Rep.", "Cuba", "Haiti", "Trinidad and Tobago"),
      years = c(1995:2020))
write(car_exports_fst)

car_exports_snd <-
  get(partners = c("Dominica", "Grenada", "Jamaica", "Barbados"),
      years = c(1995:2020))
write(car_exports_snd)

car_exports_trd <-
  get(partners = c("Bahamas", "Saint Vincent and the Grenadines", "Saint Lucia"),
      years = c(1995:2020))
write(car_exports_trd)

## Safety checks
chl <-
  get(partners = "Chile",
      years = c(1995:2020))
write(chl)

