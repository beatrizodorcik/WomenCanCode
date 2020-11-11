import strutils

type Celsius = distinct float32
type Fahrenheit = distinct float32

proc celsiusParaFahrenheit(temperatura: Celsius): Fahrenheit =
    var valorEmCelsius: float32 = float32(temperatura)
    var valorEmFahrenheit = 9.0 * valorEmCelsius / 5.0 + 32.0
    result = Fahrenheit(valorEmFahrenheit)

proc fahrenheitParaCelsius(temperatura: Fahrenheit): Celsius =
    var valorEmFahrenheit: float32 = float32(temperatura)
    var valorEmCelsius = 5.0 * (valorEmFahrenheit - 32.0) / 9.0
    result = Celsius(valorEmCelsius)

echo "Digite a temperatura sem a unidade: "

var texto = readLine(stdin)
var valorDaTemperatura: float32 = parseFloat(texto)

echo "Digite a unidade (F/C):"

var unidade = readLine(stdin)

if unidade == "F":
    var temperaturaEmF: Fahrenheit = Fahrenheit(valorDaTemperatura)
    var temperaturaEmC: Celsius = fahrenheitParaCelsius(temperaturaEmF)

    echo float32(temperaturaEmF), " F = ", float32(temperaturaEmC), " C"
elif unidade == "C":
    var temperaturaEmC = Celsius(valorDaTemperatura)
    var temperaturaEmF = celsiusParaFahrenheit(temperaturaEmC)

    echo float32(temperaturaEmC), " C = ", float32(temperaturaEmF), " F"
