# Desafio de Programação Mobile

A ideia deste desafio é avaliar as habilidades do candidato no desenvolvimento de aplicações mobile, considerando organização de código, consumo de API, navegação, persistência local, tratamento de estados e experiência de uso.

A vaga tem foco em **React Native**, porém o candidato pode utilizar as tecnologias, bibliotecas e ferramentas com as quais tiver mais familiaridade. O mais importante é que a solução demonstre conhecimento técnico, clareza na implementação e boas decisões de desenvolvimento mobile. O visual da aplicação não será avaliado como critério principal, desde que a interface seja simples, clara e utilizável.

---

# Descrição do projeto

Você deve criar um aplicativo mobile chamado **GitHub User Explorer**.

O aplicativo deve permitir pesquisar usuários do GitHub, visualizar detalhes do perfil, listar seus repositórios públicos e manter um histórico local dos perfis visualizados.

A aplicação deve consumir a **API pública do GitHub**.

Documentação da API:
`https://docs.github.com/pt/rest`

Não é necessário implementar login com GitHub.

---

# Funcionalidades obrigatórias

## 1. Pesquisa de usuários

O aplicativo deve ter uma tela inicial onde o usuário consiga pesquisar um perfil do GitHub pelo `username`.

Ao realizar a busca, o aplicativo deve exibir os dados do perfil encontrado.

A aplicação deve tratar corretamente os seguintes casos:

* Usuário encontrado;
* Usuário não encontrado;
* Campo de busca vazio;
* Carregamento enquanto a busca está sendo feita.

---

## 2. Tela de detalhes do perfil

Ao encontrar um usuário, o aplicativo deve exibir uma tela com os detalhes do perfil.

A tela deve mostrar, no mínimo:

* Foto/avatar do usuário;
* Nome;
* Username;
* Bio, quando existir;
* Quantidade de seguidores;
* Quantidade de pessoas seguindo;
* Quantidade de repositórios públicos;
* Link para o perfil no GitHub.

---

## 3. Listagem de repositórios do usuário

Na tela de detalhes do perfil, o aplicativo deve exibir a lista de repositórios públicos do usuário.

Cada repositório deve exibir, no mínimo:

* Nome do repositório;
* Descrição, quando existir;
* Linguagem principal, quando existir;
* Quantidade de stars;
* Data da última atualização.

A lista de repositórios deve permitir algum tipo de ordenação ou filtro simples, por exemplo:

* Ordenar por mais recentes;
* Ordenar por mais stars;
* Filtrar por linguagem;
* Buscar repositório pelo nome.

Não é necessário implementar todas essas opções. Escolha pelo menos uma.

---

## 4. Detalhes do repositório

Ao tocar em um repositório, o aplicativo deve abrir uma tela de detalhes do repositório.

A tela deve exibir, no mínimo:

* Nome;
* Descrição;
* Linguagem principal;
* Stars;
* Issues abertas;
* Data de criação;
* Data da última atualização;
* Link do repositório no GitHub.

Ao tocar no link do repositório, o aplicativo deve abrir a página no navegador.

---

## 5. Histórico de perfis visualizados

O aplicativo deve salvar localmente os perfis visualizados pelo usuário.

Esse histórico deve permanecer salvo mesmo após fechar e abrir o app novamente.

O histórico deve exibir, no mínimo:

* Avatar do usuário;
* Nome ou username;
* Data/hora em que o perfil foi visualizado.

O usuário deve conseguir tocar em um item do histórico para abrir novamente o perfil.

---

# Requisitos técnicos

A aplicação deve:

* Rodar em ambiente mobile iOS e/ou Android;
* Consumir dados reais da API do GitHub;
* Ter navegação entre telas;
* Persistir localmente o histórico de perfis visualizados;
* Ter uma estrutura de projeto clara;
* Separar minimamente responsabilidades, como tela, componentes, serviços de API e persistência local;
* Ter tratamento básico de erros;
* Ter uma interface simples, mas utilizável;
* Evitar chamadas desnecessárias para a API;
* Utilizar nomes claros para arquivos, componentes, funções e variáveis.

---

# Bônus

Você ganhará pontos extras se:

* Implementar testes unitários;
* Manter commits organizados e descritivos.

---

# Instruções de entrega do desafio

1. Crie um repositório **público** no GitHub.
2. Implemente o projeto conforme descrito acima.
3. Envie o link do repositório para avaliação.

O projeto deve conter um arquivo `README.md` explicando:

* Como configurar o ambiente;
* Como instalar as dependências;
* Como rodar o projeto;
* Quais tecnologias foram utilizadas;
* Como a arquitetura do projeto foi organizada;
* Prints das principais telas do aplicativo;

A aplicação também deve conter um arquivo `.gitignore` adequado para o projeto.
