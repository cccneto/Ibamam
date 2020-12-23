library(tidyverse)
library(dplyr)

# ajustando variaveis de Data para o formato correto

# carregando dataframe
load("df_arrecadacao.rda")

# corrigindo classes das variaveis
df_arrec <- df_arrecadacao %>%
  mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
  mutate(dataPagamento = lubridate::dmy(dataPagamento)) %>%
  mutate(tipoInfracao = as.factor(tipoInfracao)) %>%
  mutate(uf = uf) %>%
  mutate(tipoAuto = as.factor(tipoAuto)) %>%
  mutate(moeda = as.factor(moeda)) %>%
  mutate(statusDebito = as.factor(statusDebito)) %>%
  mutate(enquadramentoLegal = as.factor(enquadramentoLegal)) %>%
  mutate(across(where(is.character), str_remove_all, pattern = fixed("  "))) %>%
  mutate(enquadramentoJuridico = as.factor(if_else(nchar(cpfCnpj) <= 14,"CPF","CNPJ")))

df_arrec %>% glimpse()
df_arrecadacao %>% glimpse()

# Sobrescrevendo o novo arquivo na pasta
save(df_arrec, file = "df_arrec.rda")
