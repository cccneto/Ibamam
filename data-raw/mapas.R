# library(Ibamam)
# library(dplyr)
#
# # baixando dados
# multas_distribuidas <- obter_arquivos_multas_distribuidas()
# multas_arrecadadas <- obter_arquivos_arrecadacao()
#
# # limpando base "multas_distribuidas"
# multas_arrecadadas_limpo <- limpar_dados(multas_arrecadadas)
# multas_distribuidas_limpo <- limpar_dados(multas_distribuidas)
#
# # codigos
# aux_muni <- abjData::muni %>%
#   dplyr::select(
#     muni_id,
#     uf_nm,
#     uf_sigla,
#     regiao_nm,
#     lon,
#     lat
#   )
#
# # pegando codigos municipais
# id_codigos <- Ibamam::ibge_code
#
# # Join base ambiental e os codigos municipais
# arrecadadas <- juntar_bases(base_ibama = multas_arrecadadas_limpo, base_ibgecode = id_codigos)
# distribuidas <- juntar_bases(base_ibama = multas_distribuidas_limpo, base_ibgecode = id_codigos)
#
# # salvando as bases
# # usethis::use_data(arrecadadas, overwrite = T, compress = "xz")
# # usethis::use_data(distribuidas, overwrite = T, compress = "xz")
#
# # conferindo
# dplyr::glimpse(arrecadadas)
#
# # funcao me permite saber a quantidade de "unique levels" de cada coluna
# sapply(arrecadadas_muni, function(x) length(unique(x)))
#
# # arrecadadas_muni %>% sapply(.,function(x) length(unique(x)))
#
#
# dplyr::glimpse(arrecadadas_muni)
#
#
# # da_vacinacao_municipio = arrecadadas_muni
# distribuidas_muni <- distribuidas %>%
#   dplyr::group_by(
#     infracao = tipoInfracao,
#     status = situacaoDebito,
#     penalidade = tipoAuto,
#     EnqJur = enquadramentoJuridico,
#     data = dataAuto,
#     muni_id = code_muni,
#     muni_nm = municipio
#   ) %>%
#   dplyr::summarise(
#     n = dplyr::n(),
#     n_80 = sum(valorAuto),
#     p_regiao = (n/sum(group_by(regiao_nm))),
#     .groups = "drop"
#   ) %>%
#   dplyr::mutate(muni_id = as.character(muni_id)) %>%
#   dplyr::inner_join(
#     aux_muni, "muni_id"
#   ) %>%
#   dplyr::mutate(
#     dplyr::across(
#       c(muni_nm, regiao_nm, uf_nm),
#       abjutils::rm_accent
#     )
#   )
#
#
# library(leaflet)
#
# mapa <- function(da, var, tipo = "circle") {
#   m <- da %>%
#     dplyr::group_by(muni_id, muni_nm) %>%
#     dplyr::summarise(
#       dplyr::across(c(lat, lon), dplyr::first),
#       n = sum(.data[[var]]),
#       .groups = "drop"
#     ) %>%
#     dplyr::mutate(
#       lab = paste0(muni_nm, ": ", n)
#     ) %>%
#     leaflet::leaflet() %>%
#     leaflet::addTiles()
#
#   if (tipo == "circle") {
#     m_final <- m %>%
#       leaflet::addCircles(
#         lat = ~lat,
#         lng = ~lon,
#         radius = ~n,
#         weight = 1,
#         color = "purple",
#         popup = ~lab
#       )
#   } else {
#     m_final <- m %>%
#       leaflet.extras::addHeatmap(
#         lat = ~lat,
#         lng = ~lon,
#         intensity = ~n,
#         radius = 10
#       )
#   }
#   m_final
# }
#
# # descobrir
# unique(distribuidas_muni$infracao)
#
# # filtrando base por...
# distribuidas_flora <-
#   distribuidas_muni %>%
#   filter(infracao == "Flora" & regiao_nm == "Norte")
#
#
#
#
#   # plotando mapa
#   mapa(distribuidas_muni, "n")
#
#   mapa(distribuidas_flora, "n")
#
#
# # Grafico barras
# barras <- function(da, var) {
#   da %>%
#     dplyr::group_by(data) %>%
#     dplyr::summarise(total = sum(.data[[var]])) %>%
#     ggplot2::ggplot() +
#     ggplot2::aes(data, total) +
#     ggplot2::geom_col() +
#     ggplot2::theme_minimal(12)
# }
#
# barras(arrecadadas_muni, n)
#
#
#
#
# # plots
# distribuidas_muni %>%
#   group_by(regiao_nm, infracao, penalidade, EnqJur) %>%
#   count() %>%
#   DT::datatable()
#
