# EnvioAlertas
Biblioteca para envio de alertas em chat do google, utilizada em servidores baseados em linux.


Script utilizará o arquivo mapasetores.csv para identificar para onde o alerta deverá ser encaminhado. Neste arquivo, será informado o local de envio e o link do webhhook do chat na mesma linha, separados por vírgula.

Biblioteca deve ser carregada no script desejado com _source caminho_script/alertaChat.sh_ e, para utilização, chamar a função enviaAlerta da seguinte maneira: _enviaAlerta equipe mensagem_, sendo _equipe_ o primeiro argumento antes da vírgula no documento mapasetores.csv
