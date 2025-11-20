# ___________________________________________________________
#/               __           _                              \
#|              / _|         (_)                             |
#|             | |_ _   _ ___ _  ___  _ __                   |
#|             |  _| | | / __| |/ _ \| '_ \                  |
#|             | | | |_| \__ \ | (_) | | | |                 |
#|             |_|  \__,_|___/_|\___/|_| |_| *               |
#|                                                           |
#|               The MSX C Library for SDCC                  |
#|                     V1.2 - August 2019                    |
#|                                                           |
#|          Makefile para compilar repete.c                  |
#|                 com FUSION-C / SDCC                       |
#|                                                           |
#\___________________________________________________________/

.PHONY: all clean emulator run test

# Arquivo fonte para compilar
SOURCE = repete.c
DEST = dsk/
HEX2BIN = /usr/local/bin/hex2bin

# Target padrão: compila e executa no emulador
all: emulator

# Apenas compila o programa
compile: $(SOURCE)
	@echo "Compilando $(SOURCE) com FUSION-C..."
	@cp $(SOURCE) fusion-c/
	@cd fusion-c && bash build.sh $(SOURCE) 2>&1 | grep -E "(Processing|Error|warning)" || true
	@if [ -f fusion-c/repete.com ]; then \
		cp fusion-c/repete.com $(DEST); \
		echo "✓ Compilação concluída! Executável em $(DEST)repete.com"; \
	else \
		echo "✗ Erro na compilação!"; \
		exit 1; \
	fi

clean:
	@rm -f fusion-c/repete.* $(DEST)repete.com
	@echo "Arquivos temporários removidos!"

# Compila e inicia o emulador openMSX
emulator: compile
	@echo "Iniciando emulador openMSX (Gradiente Expert GPC-1 + DDX_3.0)..."
	@openmsx -machine Gradiente_Expert_GPC-1 -ext DDX_3.0 -diska $(DEST) > /dev/null 2>&1 &
	@sleep 2
	@echo "✓ openMSX iniciado com Gradiente Expert GPC-1!"
	@echo "  Para executar o programa, digite: REPETE"

run: emulator

test: emulator
