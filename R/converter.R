# Criar a funcionalidade para atualizacao dos valores

library(dplyr)
li

load("df_arrec.rda")

# Função de conversão para a moeda do Plano Real (divir por), extraido de  http://idealsoftwares.com.br/tabelas/tabela.php?id=351

converter <- function(moeda, valor, x = 1000, y= 2.75, z=1.0641){
  if(moeda == "UFIR"){
    new_valor <- valor * z # Valor da ufir em 12/2020
  } dplyr::if_else(moeda == "OTN"){
  new_valor <- ((valor * 6.17 * 126.8621)/597.06) * z
  } dplyr::if_else(moeda == "BTN"){
    new_valor <- ((valor * 126.8621)/597.06) * z
  } dplyr::if_else(moeda == "MVR"){
    new_valor <- valor * 63.49 # Valor da MVR em reais
  }dplyr::if_else(moeda == "Cruzeiro (70 a 86)"){
    new_valor <- valor / y * x^4
  } dplyr::if_else(moeda == "Cruzado"){
    new_valor <-  valor / y * x^3
  }dplyr::if_else(moeda == "Cruzado Novo"){
    new_valor <- valor / y * x^2
  }dplyr::if_else(moeda == "Cruzeiro (90 a 93)"){
    new_valor <- valor / y * x^2
  } dplyr::if_else(moeda == "Cruzeiro Real"){
    new_valor <-  valor / y * x
  } dplyr::if_else(moeda == "Real"){
    new_valor <- valor
  }
  }
  # df <- tibble(df_arrec$valorAuto, valor, moeda)
  # return(df)


# PRECISA CONFERIR ESSA FUNÇÃO ACIMA
teste <- converter(moeda = df_arrec$moeda, df_arrec$valorAuto)

# dplyr::if_else
# new_valor <- valor ...elt()

converter <-
  function(moeda, valor, x = 1000, y= 2.75, z=1.0641){
    dplyr::if_else(moeda == "UFIR", new_valor <- valor * z, valor)
    dplyr::if_else(moeda == "OTN", new_valor <- ((valor * 6.17 * 126.8621)/597.06) * z, valor)
    dplyr::if_else(moeda == "BTN", new_valor <- ((valor * 126.8621)/597.06) * z, valor)
    dplyr::if_else(moeda == "MVR", new_valor <- valor * 63.49, valor) # Valor da MVR em reais
    dplyr::if_else(moeda == "Cruzeiro (70 a 86)", new_valor <- valor / y * x^4, valor)
    dplyr::if_else(moeda == "Cruzado", new_valor <-  valor / y * x^3, valor)
    dplyr::if_else(moeda == "Cruzado Novo", new_valor <- valor / y * x^2, valor)
    dplyr::if_else(moeda == "Cruzeiro (90 a 93)", new_valor <- valor / y * x^2, valor)
    dplyr::if_else(moeda == "Cruzeiro Real", new_valor <-  valor / y * x, valor)
    dplyr::if_else(moeda == "Real", new_valor <- valor)
  }

testar <- converter(moeda = df_arrec$moeda, valor = df_arrec$valorAuto)
