load("df_arrec.rda")

# VERSAO 1
converter <- function(moeda, valor, x = 1000, y= 2.75, z=1.0641){
    mutate(
     new_valor = dplyr::case_when(moeda == "UFIR" ~ valor * z)
     new_valor = dplyr::case_when(moeda == "OTN" ~ ((valor * 6.17*126.8621)/597.06)*z)
     new_valor = dplyr::case_when(moeda == "BTN" ~ new_valor <- ((valor * 126.8621)/597.06) * z, valor)
     new_valor = dplyr::case_when(moeda == "MVR" ~ new_valor <- valor * 63.49, valor)
     new_valor = dplyr::case_when(moeda == "Cruzeiro (70 a 86)" ~, new_valor <- valor / y * x^4, valor)
     new_valor = dplyr::case_when(moeda == "Cruzado" ~ new_valor <-  valor / y * x^3, valor)
     new_valor = dplyr::case_when(moeda == "Cruzado Novo" ~ new_valor <- valor / y * x^2, valor)
     new_valor = dplyr::case_when(moeda == "Cruzeiro (90 a 93)" ~ new_valor <- valor / y * x^2, valor)
     new_valor = dplyr::case_when(moeda == "Cruzeiro Real" ~ new_valor <-  valor / y * x, valor)
     new_valor = dplyr::case_when(moeda == "Real" ~ new_valor <- valor)
    )
    return(new_valor)
}



#VERSAO 2
converter <- function(moeda, valor, x = 1000, y= 2.75, z=1.0641){
  mutate(
    new_valor = dplyr::case_when(moeda == "UFIR" ~ valor * z,
                                 moeda == "OTN" ~ ((valor * 6.17*126.8621)/597.06)*z,
                                 moeda == "BTN" ~ new_valor <- ((valor * 126.8621)/597.06)* z,
                                 moeda == "MVR" ~ new_valor <- valor * 63.49,
                                 moeda == "Cruzeiro (70 a 86)" ~, new_valor <- valor / y * x^4,
                                 moeda == "Cruzado" ~ new_valor <-  valor / y * x^3,
                                 moeda == "Cruzado Novo" ~ new_valor <- valor / y * x^2,
                                 moeda == "Cruzeiro (90 a 93)" ~ new_valor <- valor / y * x^2,
                                 moeda == "Cruzeiro Real" ~ new_valor <-  valor / y * x,
                                 moeda == "Real" ~ new_valor <- valor))
  return(new_valor)
}
