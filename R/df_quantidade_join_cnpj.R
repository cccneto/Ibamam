library(tidyverse)

# setwd("D:/qsa_cnpj")

# Base de dados liberada pela RFB no dia 05/09/2020 e Processada e disponibilizada
# com a versão 0.2.1 do pacote qsacnpj:

#
cnpj_dados_cadastrais_pj <- read.csv("cnpj_dados_cadastrais_pj.csv",
                                     sep = "#",
                                     fileEncoding = "UTF-8")

#  Tabela de Classificação da Natureza Jurídica 2018
tab_natureza_juridica <- read.csv("tab_natureza_juridica.csv",
                                  sep = "#",
                                  fileEncoding = "UTF-8")

# Tabela de Classificação Nacional de Atividades Econômicas (CNAE) - Subclasses 2.3
tab_cnae <- read.csv("tab_cnae.csv",
                     sep = "#",
                     fileEncoding = "UTF-8")

# Tabela de Classificação secundaria do CNAE
cnpj_dados_cnae_secundario <- read.csv("cnpj_dados_cnae_secundario.csv",
                                       sep = "#",
                                       fileEncoding = "UTF-8") %>% plyr::create_progress_bar()


# Salvando arquivos
# save(tab_natureza_juridica, file =  "tab_natureza_juridica.rda")
# save(tab_cnae, file = "tab_cnae.rda")
# save(cnpj_dados_cnae_secundario, file = "cnpj_dados_cnae_secundario.rda")
# save(cnpj_dados_cadastrais_pj, file = "cnpj_dados_cadastrais_pj.rda")

##############  JUNTANDO AS BASES

# carregar dados
load("C:/Users/User/Documents/Ibamam/df_multa_limpo_leftjoin.rda")

# APENAS NATUREZA JURIDICA - CNPJ
df_quantidade_cnpj <-
  df_multa_limpo_leftjoin  %>%
  filter(enquadramentoJuridico == "CNPJ") %>%
  dplyr::mutate(num_cnpj = as.double((stringr::str_replace_all(cpfCnpj,
                                                               "[^[:alnum:]]", ""))))

# base do ibama multas arrecadacao somada ao dados cadastrais cnpj
df_quantidade_cnpj_join <-
dplyr::left_join(df_quantidade_cnpj, cnpj_dados_cadastrais_pj,
                   by = c("num_cnpj" = "cnpj"))


# Adicionando dados da natureza juridica
df_quantidade_cnpj_join_nat_jur <-
  dplyr::left_join(df_quantidade_cnpj_join, tab_natureza_juridica,
                   by = c("codigo_natureza_juridica" = "cod_subclass_natureza_juridica"))


# Adicionando dados da natureza juridica
df_quantidade_cnpj_join_nat_jur_cnae <-
  dplyr::left_join(df_quantidade_cnpj_join_nat_jur, tab_cnae,
                   by = c("cnae_fiscal" = "cod_cnae"))

#salvando base
# save(df_quantidade_cnpj_join_nat_jur_cnae, file = "base_quantidade_full.rda")


# Base final Arrec
base_quantidade_final <-
df_quantidade_cnpj_join_nat_jur_cnae %>%
  select(-c('indicador', 'tipo_de_registro', 'tipo_atualizacao',
            'identificador_matriz_filial', 'municipio.y', 'uf.y', 'ddd_telefone_1', 'ddd_telefone_2',
            'situacao_cadastral', 'data_situacao_cadastral', 'motivo_situacao_cadastral', 'nm_cidade_exterior',
            'cod_pais', 'nm_pais', 'codigo_municipio', 'ddd_fax', 'correio_eletronico', 'situacao_especial',
            'data_situacao_especial', 'filler', 'fim_registro', 'cod_natureza_juridica', 'ddd_fax', 'complemento',
            'nome_fantasia', 'ultimaAtualizacaoRelatorio'
            ))

# Salvando base
save(base_quantidade_final, file = "base_quantidade_final.rda")

