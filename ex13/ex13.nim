import strutils

echo ("Digite o expoente: ")
var texto = readLine(stdin)
var expoente = parseInt(texto)

echo ("Digite o número base: ")
var texto1 = readLine(stdin)
var base = parseInt(texto1)
var elevado: int = 1


for contador in 1..expoente:
    elevado = elevado * base

echo("O valor de ", base , " elevado ao número ", expoente , " resulta no valor: ", elevado) 

