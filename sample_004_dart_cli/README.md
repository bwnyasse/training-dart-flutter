# training-dart-flutter

## sample dart cli : https://dart.dev/tools/dart-compile 

L'objectif est de rapidement comprendre l'utilisation de `dart` pour construire une application `cli` : 

- entrypoint dans le `bin/`
- le code dans le `lib/`
- éventuellement des tests dans `test/`

### Fonctionnalité : 

- On utilise l'api [openweathermap](https://openweathermap.org/api) pour récupérer le climat.
- On essaie de comprendre l'utilisation de 
    
        $ dart compile


- Manipulation de `part` , `part of`, sérialisation/désérialisation avec `json_annotation`

### Manipulation 

Ci-dessous , des actions possibles pour tester le code implémenté : 

- `dart` : 

        $ dart bin/main.dart 

        $ dart bin/main.dart -z 75000

- `dart --enable-asserts` : 

        $ dart --enable-asserts bin/main.dart -z 312

- `dart2native`, `dartaotruntime`  : 

        $ dart compile exe bin/main.dart -o weathercli

        $ ./weathercli 

        $ ./weathercli -z 75000

        $ dart compile aot-snapshot bin/main.dart 

        $ dartaotruntime bin/main.aot

        $ dartaotruntime bin/main.aot -z 75000
