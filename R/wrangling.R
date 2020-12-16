library(tidyverse)

# Fazer um vetor com todas as siglas de UF
ufs <- unique(geobr::grid_state_correspondence_table$code_state)

# Usando a fun??o purrr, aplicar a fun??o criada (obter_arquivos_multas()) em todas as UFs
df_multas <- purrr::map_dfr(ufs, obter_arquivos_multas, path = "out.multa/")


df_multas_arrumar <- df_multas$data %>% tibble::as_tibble()

# Precisa limpar essa base a?!

dplyr::glimpse(df_multas_arrumar)

# Alterar a classe de "dataAuto", "dataPagamento"

df <- load("~/Ibamam/data/da_arrec_ibama.rda")
df <- da_arrec_ibama


# ajustando variaveis de Data para o formato correto
library(tidyverse)
library(dplyr)



