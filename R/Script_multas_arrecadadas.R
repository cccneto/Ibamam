# #################################################
# ### Wrangling data ####
#
# library(dplyr)
# library(stringr)
#
# # Realizando o download dos dados
# multas_arrecadadas <- obter_arquivos_arrecadacao()
#
# # limpando base
# multas_arrecadadas_limpo <- limpar_dados(multas_arrecadadas)
#
#
# ##############################################################
# ### Merging data with geographical informations by geoBR ####
#
# # Baixando base do ibge para obtencao dos codigos municipais
#
# ibgecode <-
#   geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
#   dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
#   dplyr::mutate(
#     name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
#     name_muni = abjutils::rm_accent(name_muni), # retirando acentos
#     name_muni = stringr::str_replace_all(name_muni, "-", " "),
#   )
#
# # Left join das bases considerando nome de cidades e uf's.
#
# multas <-
#   dplyr::left_join(multas_arrecadadas_limpo, ibgecode,
#                    by = c("municipio" = "name_muni", "uf" = "abrev_state"))
#
# # salvando csv para realizar testes
# multas_teste <- multas %>% head(1000)
#
# # salvando em formato csv
# # write_csv(multas_teste, "data/multas_teste.csv")
#
