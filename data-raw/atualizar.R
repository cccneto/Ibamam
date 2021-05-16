# df %>%
#   dplyr::mutate(deflated_reais = deflateBR::deflate(reais, dates, reference, "ipca"))
  # reais = vetor de valores
  # dates = vetor de datas
  # reference = "mm/aaaa"

# Realizando o download dos dados
# multas_arrecadadas <- obter_arquivos_arrecadacao()

# multas_arrecadadas %>%
#    dplyr::mutate(
#     valorAutoAtualizado = deflateBR::deflate(valorAuto, dataAuto, "01/2020", "ipc")
#   )

 # merge e renomear coluna com valores convertidos para reais

# df_arrec_reais <- dplyr::bind_cols(df_arrec, df_teste) %>%
#   dplyr::rename(valorReais = value)
