# training-dart-flutter

🇫🇷 
Ce repo regroupe les sources codes utilisées dans mes formations, mes démos ou le blog [bwnyasse.net](https://bwnyasse.net/)

# Tips à retenir 

- Supprime les fichiers en conflit lors de la génération de code : 

      flutter pub run build_runner build --delete-conflicting-outputs
 
- Nettoie son projet ( suppression .dart_tools, .flutter*)

      flutter clean 
  
- On veut supprimer les binaires liés à la génération de code : 

      flutter pub run build_runner clean 
