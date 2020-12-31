library(dplyr)

load("df_arrec.rda")

# Baixando base do ibge para obtencao dos codigos municipais

ibgecode <-
  geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
  select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
  mutate(
    name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
    name_muni = abjutils::rm_accent(name_muni), # retirando acentos
    name_muni = stringr::str_replace_all(name_muni, "-", " "),
  )

# limpeza na base df_arrec

df_arrec_limpo <- df_arrec %>%
  mutate(
    municipio = stringr::str_to_lower(municipio), # ajustando letras para maiuscula
    municipio = abjutils::rm_accent(municipio), # retirando acentos
    municipio = stringr::str_replace_all(municipio, "-", " "),
    municipio = dplyr::case_when(
      municipio == "ponte alta do norte" ~ "ponte alta do tocantins",
      TRUE ~ municipio)
  ) %>%
  mutate(
    uf = dplyr::case_when(
      municipio == "ponte alta do tocantins" ~ "TO",
      TRUE ~ uf)
  ) %>%
  mutate(
    municipio = dplyr::case_when(
      municipio == "presidente castelo branco" & uf == "SC" ~
        "presidente castello branco", TRUE ~ municipio)
  ) %>%
  mutate(
    municipio = dplyr::case_when(
      municipio == "colinas de goiais" ~ "colinas do tocantins",
      TRUE ~ municipio)
  ) %>%
  mutate(
    uf = dplyr::case_when(
      municipio == "colinas do tocantins" ~ "TO",
      TRUE ~ uf)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "governador edson lobao" ~ "governador edison lobao",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "campo de santana" ~ "tacima",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "sao domingos de pombal" ~ "sao domingos",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "lagoa do itaenga" ~ "lagoa de itaenga",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "belem de sao francisco" ~ "belem do sao francisco",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "parati" ~ "paraty",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "trajano de morais" ~ "trajano de moraes",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "assu" ~ "acu",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "santana do livramento" ~ "sant'ana do livramento",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "sao luiz do anuaa" ~ "sao luiz",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "picarras" ~ "balneario picarras",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "passos de torres" ~ "passo de torres",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "couto de magalhaes" ~ "couto magalhaes",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "pau d arco" ~ "pau d'arco",
    TRUE ~ municipio)
  ) %>%
  mutate( municipio = dplyr::case_when(
    municipio == "sao valerio da natividade" ~ "sao valerio",
    TRUE ~ municipio)
  )


# Left join das bases considerando nome de cidades e uf's.

df_arrec_leftjoin <-
  dplyr::left_join(df_arrec_limpo, ibgecode,
                   by = c("municipio" = "name_muni", "uf" = "abrev_state"))

# conferindo as datas dos autos e pagamentos
df_arrec_leftjoin %>% select(dataAuto, dataPagamento) %>%  arrange(desc(dataPagamento))

# Para saber quais municipios estão sem code_muni

#  df_arrec_leftjoin %>%
#   select(municipio, uf, code_muni) %>%
#   arrange(desc(code_muni)) %>%
#   filter(is.na(code_muni)) %>%
#   distinct() %>%
#   View()


