#' @title Limpeza das bases
#'
#' @param base Base de dados que deverá ser limpa
#'
#' @keywords internal
#' @return a data frame
clean_dataset <- function(base) {
  base_limpa <- base %>%
    # dates
    dplyr::mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
    dplyr::mutate(
      ultimaAtualizacaoRelatorio =
        readr::parse_datetime(
          ultimaAtualizacaoRelatorio,
          format = "%d/%m/%Y %H:%M",
          locale = readr::locale(date_names = "pt")
        )
    ) %>%
    dplyr::mutate(dplyr::across(dplyr::matches(c("dataPagamento")), lubridate::dmy)) %>%
    # factors
    dplyr::mutate(dplyr::across(
      .cols = c(tipoInfracao, tipoAuto, moeda, enquadramentoLegal),
      .fns = as.factor
    )) %>%
    dplyr::mutate(enquadramentoJuridico = as.factor(dplyr::if_else(nchar(cpfCnpj) <= 14, "CPF", "CNPJ"))) %>%
    # name of municipality
    dplyr::mutate(nomeMunicipio = municipio) %>%
    dplyr::mutate(
      municipio = stringr::str_to_lower(municipio),
      # ajustando letras para maiuscula
      municipio = abjutils::rm_accent(municipio),
      # retirando acentos
      municipio = stringr::str_replace_all(municipio, "-", " "),
      municipio = dplyr::case_when(
        municipio == "governador edson lobao" &
          uf == "MA" ~ "governador edison lobao",
        municipio == "justinopolis" &
          uf == "MG"  ~ "ribeirao das neves",
        municipio == "parati" & uf == "RJ"  ~ "paraty" ,
        municipio == "trajano de morais" &
          uf == "RJ" ~ "trajano de moraes",
        municipio == "sao valerio da natividade" &
          uf == "TO" ~ "sao valerio",
        municipio == "pau d arco" &
          uf == "TO" ~ "pau d'arco",
        municipio == "couto de magalhaes" &
          uf == "TO" ~ "couto magalhaes",
        municipio == "passos de torres" &
          uf == "SC" ~ "passo de torres",
        municipio == "presidente castelo branco" &
          uf == "SC" ~ "presidente castello branco",
        municipio == "picarras" &
          uf == "SC" ~ "balneario picarras",
        municipio == "sao luiz do anuaa" &
          uf == "RR" ~ "sao luiz",
        municipio == "belem de sao francisco" &
          uf == "PE" ~ "belem do sao francisco",
        municipio == "assu" &
          uf == "RN" ~ "acu",
        municipio == "santana do livramento" &
          uf == "RS" ~ "sant'ana do livramento",
        municipio == "lagoa do itaenga" &
          uf == "PE" ~ "lagoa de itaenga",

        municipio == "campo de santana" &
          uf == "PB" ~ "tacima",

        municipio == "sao domingos de pombal" &
          uf == "PB" ~ "sao domingos",

        TRUE ~ municipio
      )
    )


  base_limpa
}
