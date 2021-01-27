library(dplyr)
library(methods)

load("df_multa_limpo.rda")

# Baixando base do ibge para obtencao dos codigos municipais

ibgecode <-
  geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
  dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
  dplyr::mutate(
    name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
    name_muni = abjutils::rm_accent(name_muni), # retirando acentos
    name_muni = stringr::str_replace_all(name_muni, "-", " "),
  )

# Fazendo Leftjoin das bases considerando nome de cidades e uf's.

df_multa_limpo_leftjoin <-
  dplyr::left_join(df_multa_limpo, ibgecode,
                   by = c("municipio" = "name_muni", "uf" = "abrev_state"))

# salvando como arquivo rda
save(df_multa_limpo_leftjoin, file = "df_multa_limpo_leftjoin.rda")

# salvando em formato csv
# write_csv(df_multa_limpo_leftjoin, "data-raw/df_multa_limpo_leftjoin.csv")

# usethis::use_data(df_multa_limpo_leftjoin, overwrite = TRUE)
