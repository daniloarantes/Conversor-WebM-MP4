#!/bin/bash

# Criado por: Danilo Arantes
# Objetivo: Converter todos os arquivos .webm do diretório em .mp4

mkdir Originais

for arq in *; do
	if [[ `echo $arq | cut -d '.' -f2` == "webm" ]]; then
		nome=`echo $arq| cut -d '.' -f1`
		echo ""
		echo "---------------------------------------------"
		echo "          INICIANDO CONVERSÃO                "
		echo Convertendo o arquivo - $nome
		echo ""
		pv "$nome".webm | ffmpeg -i pipe:0 "$nome".mp4 -v quiet  
		echo ""
		echo "          FINALIZADA A CONVERSÃO             "
		echo "---------------------------------------------"

		mv "$arq" Originais/
	fi


done
