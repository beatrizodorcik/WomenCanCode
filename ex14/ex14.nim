import strutils

#Exercício da contagem dos 1s

echo ("Digite um número: ")

proc abordagem1(parametro: int): int =
    var numero = parametro
    var quantosSao1 = 0


    while numero > 0:
        var digito = numero mod 2 #entrai o digito ( 0 ou 1)

    #OU: if digito ==1:
            #quantosSao1 = quantosSao1 + 1

        quantosSao1 = quantosSao1 + digito

        numero = numero div 2 #remove o digito binario

    result = quantosSao1

proc abordagem2(parametro: int): int =
    var numero = parametro
    var quantosSao1 = 0

    while numero > 0:
        var digito = numero and 1

        if digito == 1:
            quantosSao1 = quantosSao1 + 1

        numero = numero shr 1

    result = quantosSao1

var texto = readLine(stdin)
var numero = parseInt(texto)

echo abordagem1 (numero)
echo abordagem2 (numero)   