# Escreva um programa que calcule a média de um
# conjunto de números digitados.

import strutils

echo "Quantos números serão digitados?"

var texto = readLine(stdin)
var quantosNumeros = parseInt(texto)
var soma: float32 = 0.0

echo "Digite os números, um em cada linha"

for contador in 1..quantosNumeros:
    texto = readLine(stdin)
    var numero = parseFloat(texto)

    soma = soma + numero

var media = soma / float32(quantosNumeros)

echo "A média é ", media
