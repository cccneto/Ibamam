testthat::test_that("ibge_code is working", {
  # Executar a funcao uma vez
  dados <- Ibamam::ibge_code

  # Testar a classe
  expect_s3_class(dados, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(dados), 3)

  # Testar numero de linhas
  expect_gt(nrow(dados), 5500)

  # Testar classe das variaveis
  expect_equal(class(dados$code_muni), "numeric")
  expect_equal(class(dados$name_muni), "character")
  expect_equal(class(dados$abrev_state), "character")


})
