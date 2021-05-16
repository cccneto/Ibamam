
#
env_fines_distributed <- obter_arquivos_multas_distribuidas()
fines_collected <- obter_arrecadacao_brasil()

env_fines_distributed_clear <- limpar_dados(env_fines_distributed)
fines_collected_clear <- limpar_dados(env_fines_collected)

id_codes <- Ibamam::ibge_code

fines <- juntar_bases(base_ibama = fines_collected_clear, base_ibgecode = id_codes)

fines_autos <- juntar_bases(base_ibama = env_fines_distributed_clear, base_ibgecode = id_codes)


id_codes <- Ibamam::ibge_code

# fines
fines_collected <- obter_arrecadacao_brasil() %>%
  limpar_dados() %>%
  juntar_bases(base_ibgecode = id_codes)

# env_fines
env_fines_distributed <- obter_arquivos_multas_distribuidas() %>%
  limpar_dados() %>%
  juntar_bases(base_ibgecode = id_codes)
