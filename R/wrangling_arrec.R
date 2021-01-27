library(tidyverse)
library(dplyr)
library(stringr)
library(methods)

# ajustando variaveis de Data para o formato correto

# carregando dataframe
#load("df_arrecadacao.rda")

file_url <- "https://github.com/cccneto/database/blob/main/df_arrecadacao.rda?raw=true"
load(url(file_url))

# AJustando e limpando base
df_arrec <- df_arrecadacao %>%
  dplyr::mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
  dplyr::mutate(dataPagamento = lubridate::dmy(dataPagamento)) %>%
  dplyr::mutate(tipoInfracao = as.factor(tipoInfracao)) %>%
  dplyr::mutate(uf = uf) %>%
  dplyr::mutate(tipoAuto = as.factor(tipoAuto)) %>%
  dplyr::mutate(moeda = as.factor(moeda)) %>%
  dplyr::mutate(statusDebito = as.factor(statusDebito)) %>%
  dplyr::mutate(enquadramentoLegal = as.factor(enquadramentoLegal)) %>%
  dplyr::mutate(across(where(is.character), str_remove_all, pattern = fixed("  "))) %>%
  dplyr::mutate(enquadramentoJuridico = as.factor(if_else(nchar(cpfCnpj) <= 14,"CPF","CNPJ"))) %>%
  dplyr::mutate(
    municipio = stringr::str_to_lower(municipio), # ajustando letras para maiuscula
    municipio = abjutils::rm_accent(municipio), # retirando acentos
    municipio = stringr::str_replace_all(municipio, "-", " "),
    municipio = dplyr::case_when(
      municipio == "ponte alta do norte" ~ "ponte alta do tocantins",
      TRUE ~ municipio)
  ) %>%
  dplyr::mutate(
    uf = dplyr::case_when(
      municipio == "ponte alta do tocantins" ~ "TO",
      TRUE ~ uf)
  ) %>%
  dplyr::mutate(
    municipio = dplyr::case_when(
      municipio == "presidente castelo branco" & uf == "SC" ~
        "presidente castello branco", TRUE ~ municipio)
  ) %>%
  dplyr::mutate(
    municipio = dplyr::case_when(
      municipio == "colinas de goiais" ~ "colinas do tocantins",
      TRUE ~ municipio)
  ) %>%
  dplyr::mutate(
    uf = dplyr::case_when(
      municipio == "colinas do tocantins" ~ "TO",
      TRUE ~ uf)
  ) %>%
  dplyr::mutate(municipio = dplyr::case_when(
    municipio == "governador edson lobao" ~ "governador edison lobao",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "campo de santana" ~ "tacima",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "sao domingos de pombal" ~ "sao domingos",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "lagoa do itaenga" ~ "lagoa de itaenga",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "belem de sao francisco" ~ "belem do sao francisco",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "parati" ~ "paraty",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "trajano de morais" ~ "trajano de moraes",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "assu" ~ "acu",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "santana do livramento" ~ "sant'ana do livramento",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "sao luiz do anuaa" ~ "sao luiz",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "picarras" ~ "balneario picarras",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "passos de torres" ~ "passo de torres",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "couto de magalhaes" ~ "couto magalhaes",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "pau d arco" ~ "pau d'arco",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "sao valerio da natividade" ~ "sao valerio",
    TRUE ~ municipio)
  )

# Sobrescrevendo o novo arquivo na pasta
# save(df_arrec, file = "df_arrec.rda")
