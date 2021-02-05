#' @title Função de conversão para a moeda do Plano Real
#'
#' @name converter function's name
#' @description Given the currency that was used, the function returns the values converted to Real (R$).
#'
#' @param moeda Moeda de base que será convertida
#' @param valor Quantia monetária.
#'
#' @importFrom dplyr %>%
#' @return Retorna um valor único ou vetor convertido para Reais
#'
#' @export
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
#' A função funciona para valores de comprimento 1.
#' @example
#' converter("UFIR", 10)
