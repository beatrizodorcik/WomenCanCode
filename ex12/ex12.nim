# Faça um programa que leia um número N e escreva a soma
# dos digitos decimais do número. 
# Ex: 15072-> 1 + 5 + 0 + 7 +2

import strutils

echo "Qual o número? "

var texto = stdin.readLine()
var numero = parseInt(texto)
var soma = 0

while numero > 0:
    var digito = numero mod 10

    soma = soma + digito

    numero = numero div 10 

echo "A soma dos dígitos é ", soma
