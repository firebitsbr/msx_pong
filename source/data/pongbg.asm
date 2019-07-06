;************************************************************
;*    Imagen convertida para MSX - SCREEN 2
;*    Archivo de origen: pongbg.bmp
;*    Tama�o: 256x192 pixeles
;*    Compresion RLE habilitada
;*    Total de datos: 218 bytes
;************************************************************


PONGBG_IMAGE:

; Datos CHR
; Banco 0: 004 bloques de CHR
;          Tama�o descomprimido: 32 bytes [$0020 bytes]
;          Tama�o RLE: 6 bytes [$0006 bytes]
; Banco 1: 003 bloques de CHR
;          Tama�o descomprimido: 24 bytes [$0018 bytes]
;          Tama�o RLE: 6 bytes [$0006 bytes]
; Banco 2: 004 bloques de CHR
;          Tama�o descomprimido: 32 bytes [$0020 bytes]
;          Tama�o RLE: 8 bytes [$0008 bytes]

PONGBG_CHR_0:
; Tama�o descomprimido:
db $00, $20
; Tama�o comprimido (RLE):
db $00, $06
; Datos:
db $d0, $00, $c8, $03, $c8, $3f

PONGBG_CHR_1:
; Tama�o descomprimido:
db $00, $18
; Tama�o comprimido (RLE):
db $00, $06
; Datos:
db $c8, $00, $c8, $03, $c8, $3f

PONGBG_CHR_2:
; Tama�o descomprimido:
db $00, $20
; Tama�o comprimido (RLE):
db $00, $08
; Datos:
db $c8, $00, $c8, $03, $c8, $3f, $c8, $00


; Datos CLR
; Banco 0: 004 bloques de CLR
;          Tama�o descomprimido: 32 bytes [$0020 bytes]
;          Tama�o RLE: 48 bytes [$0030 bytes]
; Banco 1: 003 bloques de CLR
;          Tama�o descomprimido: 24 bytes [$0018 bytes]
;          Tama�o RLE: 32 bytes [$0020 bytes]
; Banco 2: 004 bloques de CLR
;          Tama�o descomprimido: 32 bytes [$0020 bytes]
;          Tama�o RLE: 48 bytes [$0030 bytes]

PONGBG_CLR_0:
; Tama�o descomprimido:
db $00, $20
; Tama�o comprimido (RLE):
db $00, $30
; Datos:
db $c1, $ee, $c1, $ff, $c1, $ee, $c1, $ff
db $c1, $ee, $c1, $ff, $c1, $ee, $c1, $ff
db $44, $55, $44, $55, $44, $55, $44, $55
db $c1, $e4, $c1, $f5, $c1, $e4, $c1, $f5
db $c1, $e4, $c1, $f5, $c1, $e4, $c1, $f5
db $4e, $5f, $4e, $5f, $4e, $5f, $4e, $5f

PONGBG_CLR_1:
; Tama�o descomprimido:
db $00, $18
; Tama�o comprimido (RLE):
db $00, $20
; Datos:
db $44, $55, $44, $55, $44, $55, $44, $55
db $c1, $e4, $c1, $f5, $c1, $e4, $c1, $f5
db $c1, $e4, $c1, $f5, $c1, $e4, $c1, $f5
db $4e, $5f, $4e, $5f, $4e, $5f, $4e, $5f

PONGBG_CLR_2:
; Tama�o descomprimido:
db $00, $20
; Tama�o comprimido (RLE):
db $00, $30
; Datos:
db $44, $55, $44, $55, $44, $55, $44, $55
db $c1, $e4, $c1, $f5, $c1, $e4, $c1, $f5
db $c1, $e4, $c1, $f5, $c1, $e4, $c1, $f5
db $4e, $5f, $4e, $5f, $4e, $5f, $4e, $5f
db $c1, $ee, $c1, $ff, $c1, $ee, $c1, $ff
db $c1, $ee, $c1, $ff, $c1, $ee, $c1, $ff


; Datos NAME
; Banco 0: 256 bloques de NAME
;          Tama�o descomprimido: 256 bytes [$0100 bytes]
;          Tama�o RLE: 20 bytes [$0014 bytes]
; Banco 1: 256 bloques de NAME
;          Tama�o descomprimido: 256 bytes [$0100 bytes]
;          Tama�o RLE: 26 bytes [$001a bytes]
; Banco 2: 256 bloques de NAME
;          Tama�o descomprimido: 256 bytes [$0100 bytes]
;          Tama�o RLE: 20 bytes [$0014 bytes]

PONGBG_NAM_0:
; Tama�o descomprimido:
db $01, $00
; Tama�o comprimido (RLE):
db $00, $14
; Datos:
db $e0, $00, $ef, $01, $02, $03, $de, $01
db $02, $03, $fe, $01, $02, $03, $de, $01
db $02, $03, $ef, $01

PONGBG_NAM_1:
; Tama�o descomprimido:
db $01, $00
; Tama�o comprimido (RLE):
db $00, $1a
; Datos:
db $cf, $00, $01, $02, $de, $00, $01, $02
db $fe, $00, $01, $02, $de, $00, $01, $02
db $fe, $00, $01, $02, $de, $00, $01, $02
db $cf, $00

PONGBG_NAM_2:
; Tama�o descomprimido:
db $01, $00
; Tama�o comprimido (RLE):
db $00, $14
; Datos:
db $ef, $00, $01, $02, $de, $00, $01, $02
db $fe, $00, $01, $02, $de, $00, $01, $02
db $ef, $00, $e0, $03
