library(tidyverse)

# Base de dados liberada pela RFB no dia 05/09/2020 e Processada e disponibilizada
# com a versão 0.2.1 do pacote qsacnpj:

# opção de carregar pelo arquivo .csv
cnpj_dados_cadastrais_pj <- read.csv("cnpj_dados_cadastrais_pj.csv",
                                     sep = "#",
                                     fileEncoding = "UTF-8")
# opção de carregar pelo arquivo .rda
# load("cnpj_dados_cadastrais_pj.rda")


#  Tabela de Classificação da Natureza Jurídica 2018
tab_natureza_juridica <- read.csv("tab_natureza_juridica.csv",
                                  sep = "#",
                                  fileEncoding = "UTF-8")

# opção de carregar pelo arquivo .rda
# load("tab_natureza_juridica.rda")

# Tabela de Classificação Nacional de Atividades Econômicas (CNAE) - Subclasses 2.3
tab_cnae <- read.csv("tab_cnae.csv",
                     sep = "#",
                     fileEncoding = "UTF-8")

# opcao de carregar pelo arquivo .rda
# load("tab_cnae.rda")

# Tabela de Classificação secundaria do CNAE
cnpj_dados_cnae_secundario <- read.csv("cnpj_dados_cnae_secundario.csv",
                                       sep = "#",
                                       fileEncoding = "UTF-8") %>% plyr::create_progress_bar()

# opcao de carregar pelo arquivo .rda
# load("cnpj_dados_cnae_secundario.rda")

##############  JUNTANDO AS BASES


# carregar dados da arrecadação
load("C:/Users/User/Documents/Ibamam/df_arrec_leftjoin.rda")


# Criar DF filtrando por CNPJ
df_arrec_cnpj <-
  df_arrec_leftjoin  %>%
   filter(enquadramentoJuridico == "CNPJ") %>%
  dplyr::mutate(num_cnpj = as.double((stringr::str_replace_all(cpfCnpj,
                                                               "[^[:alnum:]]", ""))))

# base do ibama multas arrecadacao somada ao dados cadastrais cnpj
df_arrec_cnpj_join <-
dplyr::left_join(df_arrec_cnpj, cnpj_dados_cadastrais_pj,
                   by = c("num_cnpj" = "cnpj"))


# Adicionando dados da natureza juridica
df_arrec_cnpj_join_nat_jur <-
  dplyr::left_join(df_arrec_cnpj_join, tab_natureza_juridica,
                   by = c("codigo_natureza_juridica" = "cod_subclass_natureza_juridica"))


# Adicionando dados da natureza juridica
df_arrec_cnpj_join_nat_jur_cnae <-
  dplyr::left_join(df_arrec_cnpj_join_nat_jur, tab_cnae,
                   by = c("cnae_fiscal" = "cod_cnae"))

#salvando base
# save(df_arrec_cnpj_join_nat_jur_cnae, file = "base_arrec_full.rda")


# Base final Arrec
base_arrec_final <-
df_arrec_cnpj_join_nat_jur_cnae %>%
  select(-c('indicador', 'tipo_de_registro', 'tipo_atualizacao',
            'identificador_matriz_filial', 'municipio.y', 'uf.y', 'ddd_telefone_1', 'ddd_telefone_2',
            'situacao_cadastral', 'data_situacao_cadastral', 'motivo_situacao_cadastral', 'nm_cidade_exterior',
            'cod_pais', 'nm_pais', 'codigo_municipio', 'ddd_fax', 'correio_eletronico', 'situacao_especial',
            'data_situacao_especial', 'filler', 'fim_registro', 'cod_natureza_juridica', 'ddd_fax', 'complemento',
            'nome_fantasia', 'ultimaAtualizacaoRelatorio'
            ))

# Salvando base
save(base_arrec_final, file = "base_arrec_final.rda")

write_csv(base_arrec_final, "data-raw/base_arrec_final.csv")

# usethis::use_data(base_arrec_final, overwrite = TRUE)

# g <- df_arrec_leftjoin %>%
#   filter(!is.na(enquadramentoJuridico)) %>%
#   group_by(enquadramentoJuridico)

