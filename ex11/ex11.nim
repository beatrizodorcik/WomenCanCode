# Faça um programa que leia um número N e um número T,
# e imprima a tabuada de N do número 1 até o número T

import strutils

echo "De qual número você quer a tabuada? "

var texto = stdin.readLine()
var numero = parseInt(texto)

echo "Digite quantas linhas da tabuada mostrar: "

texto = readLine(stdin)
var quantos = parseInt(texto)

for contador in 1..quantos:
    var resultado = numero * contador
    echo numero, "x", contador, " = ",resultado
