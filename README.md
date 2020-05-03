# Projeto base

## Configurar diferentes environments no VSCode:

 - Substituir o conteúdo de `.vscode/launch.json` por:
``` json
{
    "version": "0.2.0",
    "configurations": [{
        "name": "quality",
        "program": "lib/main_qa.dart",
        "request": "launch",
        "type": "dart"
    }, {
        "name": "production",
        "program": "lib/main_prod.dart",
        "request": "launch",
        "type": "dart"
    }, {
        "name": "homolog",
        "program": "lib/main_homolog.dart",
        "request": "launch",
        "type": "dart"
    }, {
        "name": "dev",
        "program": "lib/main.dart",
        "request": "launch",
        "type": "dart"
    }]
}
```
 - Para atualizar a `splash_screen` de acordo com a logo `flutter pub pub run flutter_native_splash:create`
 - Para atualizar o `launcher_icon` `flutter pub run flutter_launcher_icons:main`
 - Para rodar um *flavor* utilizar: `flutter build -t lib/main_${FLAVOR}.dart`;
 - Para gerar *builds* utilizar: `flutter build -t lib/main_${FLAVOR}.dart`;
 - Os *flavores* disponíveis são: `homolog`, `prod`, `qa`;
 - Caso seja necessária a alteração da URL base do âmbiente alterar no arquivo `main` respectivo a URL.
