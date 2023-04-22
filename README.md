# README

Este aplicativo é um modelo de aprendizado e tem como objetivo conectar pessoas que precisam descartar itens recicláveis com locais que os aceitam. O aplicativo inclui um sistema de cadastro de materiais recicláveis, pontos de coleta, usuários e controle de sessão.

A tela inicial do aplicativo (index ou localhost) exibe um mapa carregado via https, usando a biblioteca Leaflet, que permite aos usuários buscar por pontos de coleta por nome do material ou nome do ponto. Os dados são carregados dinamicamente à medida que o mapa é movido, com um raio de busca inicial de 10 km que se expande com cada movimento do mapa.

## Versão do Ruby

Este aplicativo foi testado na versão 3.2.2 do Ruby.

## Versão do Rails

Este aplicativo foi testado na versão 7.0.4.3 do Rails.

## Dependências do sistema

Este aplicativo depende do PostgreSQL, que pode ser instalado usando o gerenciador de pacotes do seu sistema.

## Configuração

Não é necessária nenhuma configuração adicional para executar este aplicativo.

## Criação do banco de dados

Para criar o banco de dados, execute o seguinte comando:

rails db:create

## Inicialização do banco de dados

Para inicializar o banco de dados com os dados iniciais, execute o seguinte comando:

rails db:seed

## Como executar os testes

Para executar os testes, use o seguinte comando:

rails test

## Serviços

Este aplicativo não requer serviços adicionais, mas pode se beneficiar do uso de uma fila de trabalhos, servidor de cache ou mecanismo de busca.

## Instruções de implantação

Este aplicativo pode ser implantado em qualquer provedor de hospedagem que suporte aplicativos Ruby on Rails. Certifique-se de seguir as instruções do provedor para implantar aplicativos Ruby on Rails.

## Observações adicionais

- O seed já cria um usuário inicial com o login "1" e senha "1".
- Para utilizar o aplicativo, é necessário descomentar a linha 3 ("#before_action :authenticate_user!, unless: :authentication_exempt?) no arquivo application_controller.rb depois de criar um novo usuário ou para utilizar os dados de login mencionados acima.
- Verifique as dependências no Gemfile.
- Após baixar o código-fonte do aplicativo, execute o comando "bundle install" dentro da pasta do aplicativo.