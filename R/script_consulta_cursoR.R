library(dplyr)

load("df_arrec.rda")

converter <- function(moeda, valor, x = 1000, y= 2.75, z=1.0641){
  if(moeda == "UFIR"){
    new_valor <- valor * z # Valor da ufir em 12/2020
  } else if (moeda == "OTN"){
    (( new_valor <-valor * 6.17 * 126.8621)/597.06) * z
  } else if (moeda == "BTN"){
    ((new_valor <- valor * 126.8621)/597.06) * z
  } else if (moeda == "MVR"){
    new_valor <- valor * 63.49 # Valor da MVR em reais
  } else if(moeda == "Cruzeiro (70 a 86)"){
    new_valor <- valor / y * x^4
  } else if (moeda == "Cruzado"){
    new_valor <- valor / y * x^3
  } else if (moeda == "Cruzado Novo"){
    new_valor <- valor / y * x^2
  } else if (moeda == "Cruzeiro (90 a 93)"){
    new_valor <- valor / y * x^2
  } else if(moeda == "Cruzeiro Real"){
    new_valor <- valor / y * x
  } else if (moeda == "Real"){
    new_valor <- valor
  }
  df <- tibble(df_arrec$valorAuto, valor, moeda, new_valor)
  return(df)
}

# atribuindo objeto para conferir resultado
teste <- converter(moeda = df_arrec$moeda, df_arrec$valorAuto)

# conferindo resultado da funcao
teste %>% View()
