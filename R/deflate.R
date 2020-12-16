# Criar a funcionalidade para atualizacao dos valores

library(deflateBR)
library(dplyr)

# Atualizando a variavel "valorAuto" para 01/2020


df_arrec %>%
  select(valorAuto, dataPagamento, dataAuto, moeda, parcela) %>%
  dplyr::mutate(valorAutoAtualizado =
                  deflateBR::deflate(valorAuto, dataAuto, "01/2020", "ipc")) %>% View()


# Fator de conversão para a moeda do Plano Real (divir por), extraido de  http://idealsoftwares.com.br/tabelas/tabela.php?id=351

# function

converter <- function(moeda, valor){
  if(moeda == "UFIR"){
    valor*3.5550 # Valor da ufir em 12/2020
  }
  if(moeda == "MVR"){
    valor*63.49 # Valor da MVR em reais
  }
  if(moeda == "Cruzeiro (70 a 86)"){
     valor / 2.75 * 1000^4
  }
  if(moeda == "Cruzado"){
    valor / 2.75 * 1000^3
  }
  if(moeda == "Cruzado Novo"){
    valor / 2.75 * 1000^2
  }
  if(moeda == "Cruzeiro (90 a 93)"){
    valor / 2.75 * 1000^2
  }
  if(moeda == "Cruzeiro Real"){
    valor / 2.75 * 1000
  }
  if (moeda == "Real"){
    valor
  }
valor
}


teste <- converter(moeda = df_arrec$moeda, valor = df_arrec$valorAuto)

df_teste <- as_tibble(teste)

# merge e renomear coluna com valores convertidos para reais

df_arrec_reais <- bind_cols(df_arrec, df_teste) %>%
  rename(valorReais = value)


