```{r}
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, here, data.table)
```

# General data wrangling

```{r}
exports_raw <- 
  here("Data", "Exports raw") %>% 
  dir(pattern = "*.rds") %>% 
  map(read_rds) %>% 
  reduce(rbind)
```

```{r}
list.files(path = here("Data", "Imports raw"),
           pattern = "*.rds") %>% 
  map(read_rds) %>% 
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
