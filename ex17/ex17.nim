import strutils

#Ler números e printar de trás pra frente

stdout.write("Quantos números serão digitados?: ")
var texto = stdin.readLine()
var quantidade = texto.parseInt()

var lista = newSeqOfCap[int32](quantidade)

for contador in 1..quantidade:
    texto = stdin.readLine()
    var numero: int = texto.parseInt()

    lista.add(int32(numero))

echo "Os números digitados são: "

for indice in 1..quantidade:
    var novoIndice = quantidade - indice

    echo lista[novoIndice]
