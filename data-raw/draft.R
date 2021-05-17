
#
env_fines_distributed <- get_data_of_brazil(estados = "all", tipo_multa = "distribuidas")
fines_collected <- get_data_of_brazil(estados = "all", tipo_multa = "arrecadadas")

env_fines_distributed_clear <- clean_dataset(env_fines_distributed)
fines_collected_clear <- clean_dataset(env_fines_collected)

id_codes <- Ibamam::ibge_code

fines <- juntar_bases(base_ibama = fines_collected_clear, base_ibgecode = id_codes)

fines_autos <- juntar_bases(base_ibama = env_fines_distributed_clear, base_ibgecode = id_codes)


id_codes <- Ibamam::ibge_code

# fines
fines_collected <- obter_arrecadacao_brasil() %>%
  clean_dataset() %>%
  juntar_bases(base_ibgecode = id_codes)

# env_fines
env_fines_distributed <- get_data_of_brazil(estados = "all", tipo_multa = "distribuidas") %>%
  clean_dataset() %>%
  juntar_bases(base_ibgecode = id_codes)
