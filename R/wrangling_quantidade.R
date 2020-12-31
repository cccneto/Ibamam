library(tidyverse)
library(dplyr)

# carregando dataframe
load("df_multas.rda")
class(df_multas$uf)

# ajustando variaveis de Data para o formato correto

df_multa <- df_multas %>%
  mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
  mutate(tipoInfracao = as.factor(tipoInfracao)) %>%
  mutate(uf = uf) %>%
  mutate(tipoAuto = as.factor(tipoAuto)) %>%
  mutate(moeda = as.factor(moeda)) %>%
  mutate(situacaoDebito = as.factor(situacaoDebito)) %>%
  mutate(enquadramentoLegal = as.factor(enquadramentoLegal)) %>%
  mutate(across(where(is.character), str_remove_all, pattern = fixed("  "))) %>%
  mutate(enquadramentoJuridico = as.factor(if_else(nchar(cpfCnpj) <= 14,"CPF","CNPJ")))

df_multa %>% glimpse()

# Sobrescrevendo o novo arquivo na pasta
save(df_multa, file = "df_multa.rda")
