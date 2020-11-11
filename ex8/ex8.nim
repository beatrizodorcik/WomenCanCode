type 
    Data = object 
        dia: uint8
        mes: uint8
        ano: uint16

proc exibir(data: Data) =
    echo data.dia, "-", data.mes, "-", data.ano

proc anoBissexto(data: Data): bool =
    var divisivelPor4 = (data.ano mod 4) == 0
    var divisivelPor100 = (data.ano mod 100) == 0
    var divisivelPor400 = (data.ano mod 400) == 0

    if divisivelPor4:
        if divisivelPor100:
            if divisivelPor400:
                result= true
            else:
                result = false
        else:
            result = true
    else:
        result = false

proc diasNoMes(data: Data): uint8 =
    if data.mes == 2:
        if data.anoBissexto():
            result = 29
        else:
            result = 28
    elif data.mes == 4 or data.mes == 6 or data.mes == 9 or data.mes == 11:
        result = 30
    else:
        result = 31


proc proxima(data: var Data) =
    data.dia = data.dia + 1

    if data.dia > data.diasNoMes():
        data.dia = 1
        data.mes = data.mes + 1

        if data.mes > 12:
            data.mes = 1
            data.ano = data.ano + 1


    elif data.mes == 2:


var data: Data
data.dia = 1
data.mes = 1
data.ano = 2020

exibir(data)

for contador in 1..400:
    proxima(data)
    exibir(data)



