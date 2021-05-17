testthat::test_that("get_data_of_state() works", {

  # multas arrecadadas --------------------------
  # Executar a funcao uma vez
  dados <- get_data_of_state("SP", "arrecadadas")

  # Testar a classe
  expect_s3_class(dados, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(dados), 18)

  # Testar numero de linhas
  expect_gt(nrow(dados), 52000)

  # Testar classe das variaveis
  expect_equal(class(dados$dataAuto), "character")
  expect_equal(class(dados$dataPagamento), "character")
  expect_equal(class(dados$municipio), "character")
  expect_equal(class(dados$valorPago), "numeric")
  expect_equal(class(dados$numAI), "character")
  expect_equal(class(dados$tipoInfracao), "character")
  expect_equal(class(dados$ultimaAtualizacaoRelatorio), "character")
  expect_equal(class(dados$parcela), "integer")
  expect_equal(class(dados$quantidadeParcela), "integer")
  expect_equal(class(dados$uf), "character")
  expect_equal(class(dados$tipoAuto), "character")
  expect_equal(class(dados$moeda), "character")
  expect_equal(class(dados$statusDebito), "character")
  expect_equal(class(dados$enquadramentoLegal), "character")
  expect_equal(class(dados$nomeRazaoSocial), "character")
  expect_equal(class(dados$cpfCnpj), "character")
  expect_equal(class(dados$valorbaseParcela), "numeric")
  expect_equal(class(dados$valorAuto), "numeric")


  # erro!
  # nome do estado em minusculo
  testthat::expect_error(get_data_of_state("sp", "arrecadadas"))


  # abreviacao que nao existe
  testthat::expect_error(get_data_of_state("xx", "arrecadadas"))

  # testar sem usar o segundo argumento
  testthat::expect_error(get_data_of_state("SP"))



  # escreve teste para gerar erro quando usar algum valor nao
  # aceito no segundo argumento
  testthat::expect_error(get_data_of_state("SP", "MULTA"))




  # multas distribuidas ------------------------
  # Executar a funcao uma vez
  dados <- get_data_of_state("SP", "distribuidas")

  # Testar a classe
  expect_s3_class(dados, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(dados), 13)

  # Testar numero de linhas
  expect_gt(nrow(dados), 34000)



  # Testar classe das variaveis
  expect_equal(class(dados$dataAuto), "character")
  expect_equal(class(dados$municipio), "character")
  expect_equal(class(dados$numAI), "character")
  expect_equal(class(dados$tipoInfracao), "character")
  expect_equal(class(dados$ultimaAtualizacaoRelatorio), "character")
  expect_equal(class(dados$uf), "character")
  expect_equal(class(dados$situacaoDebito), "character")
  expect_equal(class(dados$tipoAuto), "character")
  expect_equal(class(dados$moeda), "character")
  expect_equal(class(dados$enquadramentoLegal), "character")
  expect_equal(class(dados$nomeRazaoSocial), "character")
  expect_equal(class(dados$cpfCnpj), "character")
  expect_equal(class(dados$valorAuto), "numeric")


  # erro!
  # nome do estado em minusculo
  testthat::expect_error(get_data_of_state("sp", "distribuidas"))

  # abreviacao que nao existe
  testthat::expect_error(get_data_of_state("xx", "distribuidas"))

  # escreve teste para gerar erro quando usar algum valor nao
  # aceito no segundo argumento
  testthat::expect_error(get_data_of_state("SP", "MULTA"))
})
