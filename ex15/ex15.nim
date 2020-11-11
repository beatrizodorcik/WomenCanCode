import strutils

#Exercício da contagem dos 1s
while true: 
    echo ("Digite um número: ")

    var texto = readLine(stdin)
    var numero = parseInt(texto)

    var ehPrimo = true

    for fator in 2..(numero - 1):
        var resto = numero mod fator

        if resto == 0:
            ehPrimo = false
            break

    if ehPrimo:
        echo "O número ", numero, " é primo"
    else:
        echo "O número ", numero, " não é primo"


