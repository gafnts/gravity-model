
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
      trade_direction = "imports",
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
    write_rds(data, file = paste0(getwd(), "/Data/Imports raw/", name, ".rds"))
  }

# (c) Data extraction ----

## Central America and Mexico
ca_imports_fst <-
  get(partners = c("Belize", "Costa Rica", "Panama", "Honduras"),
      years = c(1995:2020))
write(ca_imports_fst)

ca_imports_snd <-
  get(partners = c("Nicaragua", "El Salvador", "Mexico"),
      years = c(1995:2020))
write(ca_imports_snd)

## South America
sa_imports_fst <-
  get(partners = c("Argentina", "Bolivia (Plurinational State of)",  "Brazil", "Chile"),
      years = c(1995:2020))
write(sa_imports_fst)

sa_imports_snd <-
  get(partners = c("Colombia", "Ecuador", "Venezuela", "Guyana"),
      years = c(1995:2020))
write(sa_imports_snd)

sa_imports_trd <-
  get(partners = c("Paraguay", "Peru", "Uruguay", "Suriname"),
      years = c(1995:2020))
write(sa_imports_trd)

## Caribbean
car_imports_fst <-
  get(partners = c("Dominican Rep.", "Cuba", "Haiti", "Trinidad and Tobago"),
      years = c(1995:2020))
write(car_imports_fst)

car_imports_snd <-
  get(partners = c("Dominica", "Grenada", "Jamaica", "Barbados"),
      years = c(1995:2020))
write(car_imports_snd)

car_imports_trd <-
  get(partners = c("Bahamas", "Saint Vincent and the Grenadines", "Saint Lucia"),
      years = c(1995:2020))
write(car_imports_trd)
