# POC Arquitetura

## Contexto

A ideia desse projeto é a criação de uma proposta arquitetural de melhoria para um app simples.
O projeto é divido em módulos, sendo desacoplados entre si, somente o módulo principal conhece os filhos.

## Arquitetura
O projeto ele segue a seguinte estrutura dentro dos módulos(packages):

```bash
- modulo
    - lib
        - data
            - models
            - repository
        - domain
            - usecase
        - view
            - views
        - view_model
            - view_state
            - view_model
        - module
```

Com essa arquitetura, a ideia é conseguir abstrair algumas lógicas para as camadas correspondentes e a tela ficar agnostica de lógica.

## Rotas
No app, é utilizado rotas nativas do Flutter, sendo o `Navigator`. Com ela, foi criada no módulo de `foundation` o path das possíveis rotas que o app pode ir, sendo em `modules` -> `foundation` -> `lib` -> `app_router.dart`.

Além disso, no app pai é criado um arquivo responsável pela geração dessas rotas dentro do app e gerenciamento de parâmentros. Ficando em `lib` -> `core` -> `routes`.

### Criação de um novo módulo
Para a criação de um novo módulo é necessário criar um package pelo flutter, rodando dentro da pasta `modules` o seguinte comando:

```bash
flutter create -t package <module_name> 
```
Após isso, é necessário no VSCode ter a extensão [BluePrint](https://marketplace.visualstudio.com/items?itemName=teamchilla.blueprint). 

Com ela instalada é só clicar com o botão direito na pasta `lib` dentro do novo módulo, selecionar
`New File From Template`, escolher `package` e depois colocar o nome do package em letras minúsculas.
Isso vai gerar os arquivos default de um módulo no padrão do projeto.

## Geração de i18n

Para gerar arquivos de texto você deve entrar em `modules` -> `foundation` -> `lib` -> `l10n`

Nessa pasta existem os arquivos que devem ser alterados para geração de texto e utilização no app.
- O arquivo `app_en.arb` ele serve para geração de textos em inglês
- O arquivo `app_pt.arb` ele serve para geração de textos em português

Ao finalizar a ateração desses arquivos, é necessário rodar o seguinte comando estando dentro do package `foundation`:

```bash
flutter pub get && flutter gen-l10n   
```