```{r}
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, here, data.table)
```

# General data wrangling

```{r}
process <- function(file) {
  data <- read_rds(file)
  return(data)
}

files <-
  dir(
    here("Data", "Exports raw"),
    recursive = TRUE,
    full.names = TRUE,
    pattern = "\\.rds$"
  )

result <- sapply(files, process)
```

```{r}
exports_raw <- 
  here("Data", "Exports raw") %>% 
  dir(pattern = "*.rds") %>% 
  map(read_rds) %>% 
  reduce(rbind)
```

```{r}
dir(path = here("Data", "Imports raw"), recursive = TRUE) %>%
  map(read_rds()) %>%
  reduce(rbind)
```

```{r}
read_rds(here("Data", "Imports raw", "sa_imports_trd.rds"))
```

```{r}
imports_raw <- 
  getwd() %>% 
  dir(pattern = "*.rds") %>% 
  map(read_rds) %>% 
  reduce(rbind)
```
