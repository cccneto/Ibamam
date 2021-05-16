testthat::test_that("obter_arrecadacao_estado() works", {

  # Executar a funcao uma vez
  dados <- obter_arrecadacao_estado("SP")

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
  # nome do estado em minúsculo
  testthat::expect_error(raspar_arquivos_arrecadacao("sp"))

  # abreviacao que nao existe
  testthat::expect_error(raspar_arquivos_arrecadacao("xx"))

})

testthat::test_that("raspar_arquivos_arrecadacao() works", {

  # Executar a funcao uma vez
  dados <- raspar_arquivos_arrecadacao("SP")

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
  # nome do estado em minúsculo
  testthat::expect_error(obter_arrecadacao_estado("sp"))

  # abreviacao que nao existe
  testthat::expect_error(obter_arrecadacao_estado("xx"))

})


# É muito demorado executar a funcao obter_arquivos_arrecadacao,
# entao ainda nao fiz teste
