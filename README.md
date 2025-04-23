*StatusBackup.sh

StatusBackup.sh é um script em Bash criado para facilitar a conferência e verificação de backups realizados em diferentes diretórios em servidores de backup.
Ele automatiza o processo, permitindo a seleção de um cliente e a verificação dos backups gerados no mês atual. 
Além disso, ele fornece informações detalhadas sobre os arquivos verificados, como tamanho, status e último acesso.

*Funcionalidades

- Verifica os diretórios de backups de clientes.
- Exibe um relatório com o status de cada arquivo: OK ou não OK.
- Exibe o tamanho dos arquivos no formato legível.
- Permite escolher o cliente a ser verificado de maneira interativa.
- Mostra um resumo de cada diretório com o número de arquivos OK e não OK.

*Pré-requisitos

- Sistema Linux com Bash instalado.
- Acesso aos diretórios de backups dos clientes.
- Permissões para leitura nos diretórios dos backups.

*Como usar

1. **Clone o repositório:**

   Caso queira usar o script em seu próprio ambiente, clone o repositório com o comando abaixo:

   ```bash
   git clone https://github.com/joao-luiz-code/StatusBackup.git

-------------------------------------------------------------------------------------------------


EXEMPLO DE SAÍDA: 

Data atual: 2025-04-23
Mês atual: 04

Verificando diretório: /home/bkpClientes/clientexx/sip
/home/bkpClientes/clientexx/sip/bkp_clientexx_CFG_2024-12-04.tar.gz | 51M | OK | Último Acesso: 16:53
/home/bkpClientes/clientexx/sip/clientexx_CFG_2024-12-04.tar.gz | 51M | OK | Último Acesso: 16:53
Resumo do diretório /home/bkpClientes/clientexx/sip:
Arquivos OK: 2
Arquivos NÃO OK: 0

Verificando diretório: /home/bkpClientes/clientexx/ura
/home/bkpClientes/clientexx/ura/bkp_clientexx_CFG_2024-12-04.tar.gz | 95M | OK | Último Acesso: 16:54
/home/bkpClientes/clientexx/ura/bkp_clientexx_CFG_2024-12-04.tar.gz | 95M | OK | Último Acesso: 16:54
/home/bkpClientes/clientexx/ura/bkp_clientexx_CFG_2024-12-04.tar.gz | 53M | OK | Último Acesso: 16:54
/home/bkpClientes/clientexx/ura/bkp_clientexx_REDE_ROTA_2024-12-04.tar.gz | 1.6K | OK | Último Acesso: 16:54
Resumo do diretório /home/bkpClientes/clientexx/ura:
Arquivos OK: 4
Arquivos NÃO OK: 0

Verificando diretório: /home/bkpClientes/clientexx/share
/home/bkpClientes/clientexx/share/bkp_clientexx_EXTPHONE_2024-12-04.tar.gz | 7.4M | OK | Último Acesso: 16:53
/home/bkpClientes/clientexx/share/bkp_clientexxSHARE00_SHARE_2024-12-04.tar.gz | 176K | OK | Último Acesso: 16:53
Resumo do diretório /home/bkpClientes/clientexx/share:
Arquivos OK: 2
Arquivos NÃO OK: 0

Verificando diretório: /home/bkpClientes/clientexx/banco
/home/bkpClientes/clientexx/banco/bkp_clientexxDB00_DB_2024-12-04.tar | 20M | OK | Último Acesso: 16:53
Resumo do diretório /home/bkpClientes/clientexx/banco:
Arquivos OK: 1
Arquivos NÃO OK: 0

Verificando diretório: /home/bkpClientes/clientexx/web
MÊS ATUAL NÃO GEROU!
Arquivos OK: 0
Arquivos NÃO OK: 1
