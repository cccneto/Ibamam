# Criar a funcionalidade para atualizacao dos valores
library(dplyr)

load("df_arrec.rda")
dplyr::glimpse(df_arrec)


# Função de conversão para a moeda do Plano Real (divir por), extraido de  http://idealsoftwares.com.br/tabelas/tabela.php?id=351

converter <- function(moeda, valor, x = 1000, y = 2.75){
  if(moeda == "UFIR"){
    new_valor <- valor * 1.0641
  } else if (moeda == "OTN"){
    new_valor <- valor * 6.57
  } else if (moeda == "BTN"){
    new_valor <- valor * 40.53
  } else if (moeda == "MVR"){
    new_valor <- valor * 19.00
  } else if(moeda == "Cruzeiro (70 a 86)"){
    new_valor <- valor / (x^4 * y)
  } else if (moeda == "Cruzado"){
    new_valor <- valor / (x^3 * y)
  } else if (moeda == "Cruzado Novo"){
    new_valor <- valor / (x^2 * y)
  } else if (moeda == "Cruzeiro (90 a 93)"){
    new_valor <- valor / (x^2 * y)
  } else if(moeda == "Cruzeiro Real"){
    new_valor <- valor / (x * y)
  } else if (moeda == "Real"){
    new_valor <- valor
  }
  return(new_valor)
}

# Obtendo os resultados via purrr
convertido <- purrr::map2_dbl(df_arrec$moeda, df_arrec$valorAuto, converter)

# Se quiser adicionar como coluna da sua tibble, você pode fazer
df_arrec_convertido <- df_arrec %>%
  dplyr::mutate(convertido = purrr::map2_dbl(moeda, valorAuto, converter))


