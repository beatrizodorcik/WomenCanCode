type 
    NumeroComplexo = object 
        real: float32
        imaginario: float

proc exibir(numero: NumeroComplexo) =
    stdout.write numero.real, " + ", numero.imaginario, " i "

proc soma(primeiro: NumeroComplexo, segundo: NumeroComplexo): NumeroComplexo =
    var a = primeiro.real
    var b = primeiro.imaginario
    var c = segundo.real
    var d = segundo.imaginario

    result.real = a + c
    result.imaginario = b + d


proc multiplicacao(primeiro: NumeroComplexo, segundo: NumeroComplexo): NumeroComplexo =
    var a = primeiro.real
    var b = primeiro.imaginario
    var c = segundo.real
    var d = segundo.imaginario

    result.real = a*c - b*d
    result.imaginario = a*d + b*c   

var primeiro = NumeroComplexo(real: -1.0, imaginario: 5.0)
var segundo = NumeroComplexo(real: 0.5, imaginario: 4.0)

var resultado = multiplicacao(primeiro, segundo)

primeiro.exibir()
stdout.write " + "
exibir(segundo)
stdout.write " = "
resultado.exibir()
echo()




