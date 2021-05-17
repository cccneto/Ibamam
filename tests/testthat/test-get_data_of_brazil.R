testthat::test_that("get_data_of_brazil () works", {

  # multas arrecadadas --------------------------
  # Executar a funcao uma vez
  dados <- get_data_of_brazil(estados = c("SP", "RJ"), tipo_multa = "arrecadadas")

  # Testar a classe
  expect_s3_class(dados, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(dados), 18)

  # Testar numero de linhas
  expect_gt(nrow(dados), 80000)

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
  # nome do estado em minúsculo
  testthat::expect_error(get_data_of_brazil("sp", "arrecadadas"))

  # abreviacao que nao existe
  testthat::expect_error(get_data_of_brazil("xx", "arrecadadas"))

  # testar sem usar o segundo argumento
  testthat::expect_error(get_data_of_brazil("sp"))

  # multas distribuidas ------------------------
  # Executar a funcao uma vez
  dados <- get_data_of_brazil(estados = c("CE", "PR"), "distribuidas")

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
  # nome do estado em minúsculo
  testthat::expect_error(get_data_of_brazil("sp"))

  # abreviacao que nao existe
  testthat::expect_error(get_data_of_brazil("xx"))


})
