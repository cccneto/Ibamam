### Início da Função para retirar os Acentos


# Rotinas e funções úteis V 1.0
# rm.accent - REMOVE ACENTOS DE PALAVRAS
# Função que tira todos os acentos e pontuações de um vetor de strings.
# Parâmetros:
# str - vetor de strings que terão seus acentos retirados.
# patterns - vetor de strings com um ou mais elementos indicando quais acentos deverão ser retirados.
#            Para indicar quais acentos deverão ser retirados, um vetor com os símbolos deverão ser passados.
#            Exemplo: pattern = c("´", "^") retirará os acentos agudos e circunflexos apenas.
#            Outras palavras aceitas: "all" (retira todos os acentos, que são "´", "`", "^", "~", "¨", "ç")

rm_accent <- function(str,pattern="all") {
  if(!is.character(str))
    str <- as.character(str)

  pattern <- unique(pattern)

  if(any(pattern=="Ç"))
    pattern[pattern=="Ç"] <- "ç"

  symbols <- c(
    acute = "áéíóúÁÉÍÓÚýÝ",
    grave = "àèìòùÀÈÌÒÙ",
    circunflex = "âêîôûÂÊÎÔÛ",
    tilde = "ãõÃÕñÑ",
    umlaut = "äëïöüÄËÏÖÜÿ",
    cedil = "çÇ"
  )

  nudeSymbols <- c(
    acute = "aeiouAEIOUyY",
    grave = "aeiouAEIOU",
    circunflex = "aeiouAEIOU",
    tilde = "aoAOnN",
    umlaut = "aeiouAEIOUy",
    cedil = "cC"
  )

  accentTypes <- c("´","`","^","~","¨","ç")

  if(any(c("all","al","a","todos","t","to","tod","todo")%in%pattern)) # opcao retirar todos
    return(chartr(paste(symbols, collapse=""), paste(nudeSymbols, collapse=""), str))

  for(i in which(accentTypes%in%pattern))
    str <- chartr(symbols[i],nudeSymbols[i], str)

  return(str)
}



#### Início da Função para retirar os Acentos ####


## Coluna "Assunto" do Data Frame "acentos.csv"


# Carregando o dataset
df_teste <- read.csv2("D:/001_TEMP/acentos.csv", sep = "|", header = T)


# Verificando a Classe do objeto
class(ibgecode)

# [1] "data.frame"


# Visualizando os Dados
df_teste



# > df_teste
#      Pais Codigo                   Assunto Agosto Setembro Outubro Novembro Dezembro
# 1  Brasil      0              Índice geral   0.19     0.05    0.29     0.37     0.35
# 2  Brasil      1     Alimentação e bebidas   0.18    -0.06    0.47     1.35     0.48
# 3  Brasil      2                 Habitação  -0.02     0.32    0.33     0.03     0.01
# 4  Brasil      3     Artigos de residência   0.05    -0.14   -0.34    -0.23    -0.02
# 5  Brasil      4                 Vestuário  -0.27     0.12     0.8     0.45     1.02
# 6  Brasil      5               Transportes   0.23    -0.28   -0.06     -0.1     0.46
# 7  Brasil      6 Saúde e cuidados pessoais    0.4      0.1    0.35     0.26     0.25
# 8  Brasil      7         Despesas pessoais   0.98     0.74    0.86     0.59     0.71
# 9  Brasil      8                  Educação    0.0     01.0      14     0.07     0.03
# 10 Brasil      9               Comunicação  -0.24    -0.11   -0.02     0.02    -0.14



# Utilizando a Função "rm_accent" para retirar os acentos da coluna Assunto
ibgecode_sacento <- rm_accent(ibgecode$name_muni)

# Subistituindo a coluna sem os acentos no Data Frame
ibgecode[2] <- ibgecode_sacento



# Visualizando os Dados
df_teste


# > df_teste
#      Pais Codigo                   Assunto Agosto Setembro Outubro Novembro Dezembro
# 1  Brasil      0              Indice geral   0.19     0.05    0.29     0.37     0.35
# 2  Brasil      1     Alimentacao e bebidas   0.18    -0.06    0.47     1.35     0.48
# 3  Brasil      2                 Habitacao  -0.02     0.32    0.33     0.03     0.01
# 4  Brasil      3     Artigos de residencia   0.05    -0.14   -0.34    -0.23    -0.02
# 5  Brasil      4                 Vestuario  -0.27     0.12     0.8     0.45     1.02
# 6  Brasil      5               Transportes   0.23    -0.28   -0.06     -0.1     0.46
# 7  Brasil      6 Saude e cuidados pessoais    0.4      0.1    0.35     0.26     0.25
# 8  Brasil      7         Despesas pessoais   0.98     0.74    0.86     0.59     0.71
# 9  Brasil      8                  Educacao    0.0     01.0      14     0.07     0.03
# 10 Brasil      9               Comunicacao  -0.24    -0.11   -0.02     0.02    -0.14
