type 
    Posicao = object 
        linha: uint8
        coluna: uint8


    Matriz3x3 = object 
        dados: array[9, int32]


proc indice(posicao: Posicao): int =
    result = int(posicao.coluna + 3 * posicao.linha)

proc exibir(matriz: Matriz3x3) =
    for linha in 0..2:
        for coluna in 0..2:
            stdout.write(matriz.dados[linha * 3 + coluna], " ")

        echo (" ")


    #echo matriz.dados[0], " ", matriz.dados[1], " ", matriz.dados[2]
    #echo matriz.dados[3], " ", matriz.dados[4], " ", matriz.dados[5]
    #echo matriz.dados[6], " ", matriz.dados[7], " ", matriz.dados[8]


proc ler(matriz: Matriz3x3, posicao: Posicao): int32 =
    var indice = posicao.indice()

    result = matriz.dados[indice]

proc escrever(matriz: var Matriz3x3, posicao: Posicao, valor: int32) =
    matriz.dados[posicao.indice()] = valor

var matriz: Matriz3x3

matriz.exibir()

echo (" ")

for linha in 0'u8..2:
    for coluna in 0'u8..2:
        var posicao = Posicao(linha: linha, coluna: coluna)

        matriz.escrever(posicao, int32(posicao.indice()))

matriz.exibir()


