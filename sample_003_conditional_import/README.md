# training-dart-flutter

## sample conditional import

L'objectif est de rapidement comprendre l'utilisation de `dart` pour construire des packages comment fonctionne l'`import conditionel` 


### Fonctionnalité : 

- la libraire `my_conditional_lib` qui fait juste l'extraction des mots dans un markup html
- le programme `example_io` qui est un projet **cli** qui utilise `my_conditional_lib`
- le programme `example_html` qui est une **web app** qui utilise `my_conditional_lib` 
- On essaie de comprendre l'utilisation de l'import conditionel 
    
        import "something.dart" if (condition) "other.dart";

### Manipulation 

Ci-dessous, des actions possibles pour tester le code implémenté : 

        $ dart pub global activate webdev
        
        $ cd example_io && dart bin/main.dart 

        $ cd example_html && webdev serve

NOTE: pour le web, on doit activer **[webdev](https://pub.dev/packages/webdev)** via la commande `pub global activate webdev`
