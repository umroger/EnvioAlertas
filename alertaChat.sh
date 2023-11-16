#!/bin/bash

#Variaveis utilitarias
__mapa=mapasetores.csv

enviaAlerta() {
  __equipe="$1"
  __mensagem="$2"

  __verificacao=($(grep ${__equipe} ${__mapa}))

  if [ ${#__verificacao[@]} -eq 1 ]; then

    local IFS=,
    __linha=($__verificacao)
    __setor=${__linha[0]}
    __webhook=${__linha[1]}

    if [ ${#__linha[@]} -ne 2 ]; then

      echo "Quantidade invalida de informacoes no mapa ${__equipes}. Deve ser informado somente equipe e link do webhook, separados por virgula"

    else

      __response=$(curl -s -X POST -H "Content-Type: application/json" --data "{\"text\":\"$__mensagem\"}" "$__webhook")
      __curl_exit_code=$?

      if [ $__curl_exit_code -ne 0 ]; then

        __alerta="Erro ao enviar a mensagem $__mensagem para o grupo $__equipe, favor verificar"
        echo "$__alerta"

      elif echo "$__response" | grep -q "Missing or malformed token"; then

        alerta="Erro ao enviar a mensagem $__mensagem para o grupo $__equipe: Token ausente ou malformado"
        echo "$__alerta"

      else

        echo "Alerta encaminhado com sucesso para a equipe $__equipe!"

      fi

    fi

  else

    echo "Equipe informada nao possui mapa cadastrado ou esta cadastrado de forma duplicada"

  fi
}
