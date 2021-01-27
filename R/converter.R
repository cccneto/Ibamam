#' Currency converter
#
#' @description Given the currency that was used, the function returns the values converted to Real (R$).
#' Function was developed from the equations proposed at http://idealsoftwares.com.br/tabelas/tabela.php?id=351
#
#' @param moeda The .....  of currency.
#' @param valor The... monetary values.

#' @importFrom dplyr %>%
#' @return Retorna um valor único ou vetor convertido para Reais

#' Carregar dados
load("df_arrec.rda")
library(dplyr)
library(methods)
#' Função de conversão para a moeda do Plano Real

converter <- function(moeda, valor){
  if(moeda == "UFIR"){
    new_valor <- valor * 1.0641
  } else if (moeda == "OTN"){
    new_valor <- valor * 6.57
  } else if (moeda == "BTN"){
    new_valor <- valor * 40.53
  } else if (moeda == "MVR"){
    new_valor <- valor * 19.00
  } else if(moeda == "Cruzeiro (70 a 86)"){
    new_valor <- valor / (1000^4 * 2.75)
  } else if (moeda == "Cruzado"){
    new_valor <- valor / (1000^3 * 2.75)
  } else if (moeda == "Cruzado Novo"){
    new_valor <- valor / (1000^2 * 2.75)
  } else if (moeda == "Cruzeiro (90 a 93)"){
    new_valor <- valor / (1000^2 * 2.75)
  } else if(moeda == "Cruzeiro Real"){
    new_valor <- valor / (1000 * 2.75)
  } else if (moeda == "Real"){
    new_valor <- valor
  }
  return(new_valor)
}

#' @example # A função funciona para valores de comprimento 1.
converter("UFIR", 10)
#'
#'
#' Pode ainda obter os resultados via purrr. Obs.: essa etapa demora pode demorar 5 minutos
convertido <- purrr::map2_dbl(df_arrec$moeda, df_arrec$valorAuto, converter)

#' E se quiser adicionar como coluna da sua tibble, você pode fazer. Obs.: essa etapa demora pode demorar 5 minutos
df_arrec_convertido <- df_arrec %>%
  dplyr::mutate(convertido = purrr::map2_dbl(moeda, valorAuto, converter))


#' É possivel converter multiplos valores simultaneamente?

df_arrec_convertido <- df_arrec %>%
  dplyr::mutate(
                valorAutoConvertido = purrr::map2_dbl(moeda, valorAuto, converter),
                valorbaseParcelaConvertido = purrr::map2_dbl(moeda, valorbaseParcela,
                converter)
                )


