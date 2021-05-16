testthat::test_that("obter_multas_distribuidas_estado() works", {

  # Executar a funcao uma vez
  dados <- obter_multas_distribuidas_estado("SP")

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
  testthat::expect_error(obter_multas_distribuidas_estado("sp"))

  # abreviacao que nao existe
  testthat::expect_error(obter_multas_distribuidas_estado("xx"))

})

