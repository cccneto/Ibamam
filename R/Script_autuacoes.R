# #################################################
# ### Wrangling data ####
#
# library(dplyr)
# library(stringr)
# library(lubridate)
#
# # Realizando o download dos dados
# multas_distribuidas <- obter_arquivos_multas_distribuidas()
#
# # limpando base
# multas_distribuidas_limpo <- limpar_dados(multas_distribuidas)
#
#
# ### Merging data with geographical informations by geoBR ####
# # Baixando base do ibge para obtencao dos codigos municipais
#
# ibgecode <-
#   geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
#   dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
#   dplyr::mutate(
#     name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
#     name_muni = abjutils::rm_accent(name_muni), # retirando acentos
#     name_muni = stringr::str_replace_all(name_muni, "-", " "))
#
# # Fazendo Leftjoin das bases considerando nome de cidades e uf's.
#
# autuacoes <- dplyr::left_join(
#   multas_distribuidas_limpo, ibgecode, by = c("municipio" = "name_muni", "uf" = "abrev_state"))
#
# # salvando csv para realizar testes
# autuacoes_teste <- autuacoes %>% head(1000)
#
# # salvando em formato csv
# # write.csv(autuacoes_teste, "data/autuacoes_teste.csv")
# # write_csv(autuacoes, "data/autuacoes.csv")
#
#
#
#
#
#
#
