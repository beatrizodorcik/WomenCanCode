import nico
import strutils
import random

type 
  Helicoptero = object 
      posHorizontal: float32
      posVertical: float32

  Paredes = object
      alturaDasColunas: array[16, uint8]
      delta: float32
    #representa o tamanho de uma coluna a partir do teto

var larguraDaTela = 128
var alturaDaTela = 128
var distanciaEntreChaoETeto = 70
var rodando = true

proc criarParedes(): Paredes =
    for indice in 0..15:
        result.alturaDasColunas[indice]= uint8(rand(10..40))

    result.delta = 0.0

proc atualizar(paredes: var Paredes, tempoDesdeUltimaAtualizacao: float32) =
    paredes.delta = paredes.delta + 8.0 * tempoDesdeUltimaAtualizacao 
    
    if paredes.delta >= 1.0:
        paredes.delta = 0.0


        for indice in 0..14:
            paredes.alturaDasColunas[indice] = paredes.alturaDasColunas[indice + 1]
        
        paredes.alturaDasColunas[15] = uint8(rand(10..40))
            

proc desenhar(paredes: Paredes) =
    var larguraDaColuna = larguraDaTela / 16
    
    setColor 6

    for indice in 0..15:
        var x1 = indice * larguraDaColuna
        var x2 = (indice + 1) * larguraDaColuna - 1
        
        var y1 = alturaDaTela - paredes.alturaDasColunas[indice]
        var y2 = alturaDaTela

        rectFill(x1, y1, x2, y2)

        #Teto
        y1 = 0
        y2 = alturaDaTela - paredes.alturaDasColunas[indice] - distanciaEntreChaoETeto

        rectFill(x1, y1, x2, y2)

proc verificarColisao(paredes: Paredes, x: float32, y: float32): bool =
    var larguraDaColuna = larguraDaTela / 16
    
    for indice in 0..15:
        var comecoDaColuna = indice * larguraDaColuna
        var fimDaColuna = comecoDaColuna + larguraDaColuna - 1

        if comecoDaColuna <= x and x <= fimDaColuna:
            var alturaDoChao = paredes.alturaDasColunas[indice]
            var posicaoDoChao = alturaDaTela - alturaDoChao
            var posicaoDoTeto = posicaoDoChao - distanciaEntreChaoETeto

            if posicaoDoTeto < y and y < posicaoDoChao:
                result = false
                
            else:
                result = true

            break

proc criarHelicoptero(): Helicoptero =
    result.posHorizontal = 32
    result.posVertical = 50

proc tamanho(helicoptero: Helicoptero): int =
    result = 10

proc atualizar(helicoptero: var Helicoptero, tempo: float32) =
    if mousebtn(0):
        helicoptero.posVertical = helicoptero.posVertical - 30.0 * tempo
    
    else:
        helicoptero.posVertical = helicoptero.posVertical + 30.0 * tempo

proc desenhar(helicoptero: Helicoptero) =
    var tamanho: int = helicoptero.tamanho()

    var esquerda = helicoptero.posHorizontal - tamanho / 2
    var direita = helicoptero.posHorizontal + tamanho / 2
    var cima = helicoptero.posVertical - tamanho / 2
    var baixo = helicoptero.posVertical + tamanho / 2
    
    setColor 2
    rectfill(esquerda, cima, direita, baixo)


proc verificarColisao(helicoptero: Helicoptero, paredes: Paredes): bool =
    var tamanho = helicoptero.tamanho()

    var esquerda = helicoptero.posHorizontal - tamanho / 2
    var direita = helicoptero.posHorizontal + tamanho / 2
    var cima = helicoptero.posVertical - tamanho / 2
    var baixo = helicoptero.posVertical + tamanho / 2

    if paredes.verificarColisao(esquerda, cima):
        result = true
    elif paredes.verificarColisao(direita, cima):
        result = true
    elif paredes.verificarColisao(esquerda, baixo):
        result = true
    elif paredes.verificarColisao(direita, baixo):
        result = true
    else:
        result = false

randomize()

var helicoptero = criarHelicoptero()
var paredes = criarParedes()

proc gameInit() =
    loadFont(0, "font.png")

proc gameUpdate(dt: float32) =
    if rodando:
        helicoptero.atualizar(dt)
        paredes.atualizar(dt)

    if mousebtn(2):
        rodando = true
        helicoptero = criarHelicoptero()
        paredes = criarParedes()

    if helicoptero.verificarColisao(paredes):
        rodando = false

proc gameDraw() =
    cls()
    #for cor in 0..15:
        #setColor cor
        #rectfill(cor * 8, 0, cor * 8 + 8, 8)
        #setColor 7
        #printc(intToStr(cor), cor * 8 + 4, 12)

    helicoptero.desenhar()
    paredes.desenhar()

    if not rodando:
        setColor 10
        printc("MORREU!", larguraDaTela / 2, alturaDaTela / 2 )

nico.init("myOrg", "BeaOdorcik")
nico.createWindow("BeaOdorcik", larguraDaTela, alturaDaTela, 5, false)
nico.run(gameInit, gameUpdate, gameDraw)


