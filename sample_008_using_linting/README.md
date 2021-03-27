## Example for Dart & Flutter training by bwnyasse.net

A sample command-line application to learn how to setup linting in your `dart` application.

## Documentation 

The official documentation can be found [here](https://dart.dev/guides/language/analysis-options#enabling-linter-rules)

- Linter rules are listed [here](https://dart-lang.github.io/linter/lints/)
 
## Demo

- Add **pedantic** in the `pubspec.yaml`

- Play the following rule in your `analysis_options.yaml` :

```
linter:
  rules:
    empty_constructor_bodies: true
```