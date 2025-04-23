#!/bin/bash

# Definindo a data atual
data_atual=$(date "+%Y-%m-%d")
mes_atual=$(date "+%m")

# Caminho para os clientes
clientes_base_dir="/home/bkpClientes"

# Função para processar o diretório de cada cliente
processar_cliente() {
    cliente=$1
    echo "-----------------------------------------------------"
    echo "Data atual: $data_atual"
    echo "Mês atual: $mes_atual"
    echo

    # Diretórios do cliente, listando dinamicamente os subdiretórios
    diretorios=($(find "$clientes_base_dir/$cliente" -mindepth 1 -type d))

    # Verificar cada diretório
    for dir in "${diretorios[@]}"; do
        echo "Verificando diretório: $dir"
        arquivos_ok=0
        arquivos_nao_ok=0

        # Verificar arquivos do diretório
        arquivos=$(ls "$dir" | grep "$mes_atual")
        if [ -z "$arquivos" ]; then
            echo "MÊS ATUAL NÃO GEROU!"
        else
            for arquivo in $arquivos; do
                # Verificar o status do arquivo
                arquivo_path="$dir/$arquivo"
                tamanho=$(stat --format=%s "$arquivo_path")
                status="OK"  # Aqui pode colocar a lógica para validar o status do arquivo

                # Ajustando para pegar apenas hora e minuto do último acesso
                ultimo_acesso=$(stat --format=%x "$arquivo_path")

                echo "$arquivo_path | $(numfmt --to=iec $tamanho) | Último Acesso: $ultimo_acesso"

                if [[ "$status" == "OK" ]]; then
                    arquivos_ok=$((arquivos_ok + 1))
                else
                    arquivos_nao_ok=$((arquivos_nao_ok + 1))
                fi
            done
            # Resumo do diretório
            echo "Resumo do diretório $dir:"
            echo "Arquivos OK: $arquivos_ok"
            echo "Arquivos NÃO OK: $arquivos_nao_ok"
        fi
    done
}

# Função para listar os clientes e permitir que o usuário escolha
listar_clientes() {
    clientes=($(ls "$clientes_base_dir"))
    echo "Relatório dos backups periódicos"
    echo "Selecione o cliente:"

    # Exibe os clientes numerados
    for i in "${!clientes[@]}"; do
        echo "$((i + 1)). ${clientes[$i]}"
    done

    # Lê a escolha do usuário
    read -p "Digite o número do cliente: " escolha

    # Valida a escolha
    if [ "$escolha" -ge 1 ] && [ "$escolha" -le "${#clientes[@]}" ]; then
        cliente_selecionado="${clientes[$((escolha - 1))]}"
        echo "Cliente selecionado: $cliente_selecionado"
        processar_cliente "$cliente_selecionado"
    else
        echo "Escolha inválida. Tente novamente."
    fi
}

# Função principal para manter o script em loop
executar_consultas() {
    while true; do
        listar_clientes

        # Pergunta ao usuário se deseja realizar outra consulta
        read -p "Deseja realizar outra consulta? (s/n): " resposta
        if [[ "$resposta" != "s" && "$resposta" != "S" ]]; then
            echo "Saindo do script."
            break
        fi
    done
}

# Executa as consultas
executar_consultas
