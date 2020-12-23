
df %>%
  mutate(deflated_reais = deflateBR::deflate(reais, dates, reference, "ipca"))
  # reais = vetor de valores
  # dates = vetor de datas
  # reference = "mm/aaaa"



df_arrec %>%
   dplyr::mutate(
    valorAutoAtualizado = deflateBR::deflate(valorAuto, dataAuto, "01/2020", "ipc")
  ) %>%
  View()

# merge e renomear coluna com valores convertidos para reais

df_arrec_reais <- bind_cols(df_arrec, df_teste) %>%
  rename(valorReais = value)
