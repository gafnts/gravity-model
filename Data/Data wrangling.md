```{r}
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, here, data.table)
```

# General data wrangling

```{r}
exports <- 
  getwd() %>% 
  dir(pattern = "*.rds") %>% 
  map(read_rds) %>% 
  reduce(rbind)
```
