library(dplyr)
library(methods)

#load("df_arrec.rda")
file_url <- "https://github.com/cccneto/Ibamam/blob/master/inst/dados/df_arrec.rda?raw=true"
load(url(file_url))


# Baixando base do ibge para obtencao dos codigos municipais

ibgecode <-
  geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
  dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
  dplyr::mutate(
    name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
    name_muni = abjutils::rm_accent(name_muni), # retirando acentos
    name_muni = stringr::str_replace_all(name_muni, "-", " "),
  )

# Left join das bases considerando nome de cidades e uf's.

df_arrec_leftjoin <-
  dplyr::left_join(df_arrec, ibgecode,
                   by = c("municipio" = "name_muni", "uf" = "abrev_state"))

# salvando como RDa
# save(df_arrec_leftjoin, file = "df_arrec_leftjoin.rda")

# salvando em formato csv
# write_csv(df_arrec_leftjoin, "data-raw/df_arrec_leftjoin.csv")

#usethis::use_data(df_arrec_leftjoin, overwrite = TRUE)


# conferindo as datas dos autos e pagamentos
# df_arrec_leftjoin %>%
#   dplyr::select(dataAuto, dataPagamento) %>%
#   dplyr::arrange(desc(dataPagamento))

# Para saber quais municipios estão sem code_muni

#  df_arrec_leftjoin %>%
#   select(municipio, uf, code_muni) %>%
#   arrange(desc(code_muni)) %>%
#   filter(is.na(code_muni)) %>%
#   distinct() %>%
#   View()


