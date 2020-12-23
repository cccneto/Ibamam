# Criar a funcionalidade para atualizacao dos valores

library(deflateBR)
library(dplyr)

load("df_arrec.rda")

# Função de conversão para a moeda do Plano Real (divir por), extraido de  http://idealsoftwares.com.br/tabelas/tabela.php?id=351

converter <- function(moeda, valor, x = 1000, y= 2.75, z=1.0641){
  if(moeda == "UFIR"){
valor * z # Valor da ufir em 12/2020
  } else if (moeda == "OTN"){
  ((valor * 6.17 * 126.8621)/597.06) * z
  } else if (moeda == "BTN"){
    ((valor * 126.8621)/597.06) * z
  } else if (moeda == "MVR"){
     valor * 63.49 # Valor da MVR em reais
  } else if(moeda == "Cruzeiro (70 a 86)"){
     valor / y * x^4
  } else if (moeda == "Cruzado"){
     valor / y * x^3
  } else if (moeda == "Cruzado Novo"){
     valor / y * x^2
  } else if (moeda == "Cruzeiro (90 a 93)"){
   valor / y * x^2
  } else if(moeda == "Cruzeiro Real"){
     valor / y * x
  } else if (moeda == "Real"){
    valor
  }
  df <- tibble(df_arrec$valorAuto, valor)
  return(df)
}

# PRECISA CONFERIR ESSA FUNÇÃO ACIMA
teste <- converter(moeda = df_arrec$moeda, df_arrec$valorAuto)


teste %>%
  mutate(soma = df_arrec$valorAuto - valor) %>%
  View()
