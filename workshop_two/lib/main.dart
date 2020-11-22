import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Two',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Workshop Two'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //RESOLUTION : Créer une scène avec des champs et une checkbox
              TextField(decoration: InputDecoration(hintText: 'Username')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 16),
              Row(
                children: [
                  // Ce container nous permet de construire une checkbox from scratch
                  // sans utiliser le composant natif
                  // RESOLUTION: Transformer ce container en un StatefulWidget nommé MyCheckBox
                  MyCheckbox(
                    checked: _checked,
                    onCheckBoxChanged: (checked) {
                      setState(() {
                        _checked = checked;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  Text('Remember Me'),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Nothing To Do for the moment'),
        child: Icon(Icons.check),
      ),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  final bool checked;
  final void Function(bool checked) onCheckBoxChanged;
  final Duration transitionDuration;
  final Color activeColor;
  final Color inactiveColor;
  final double activeBorderRadius;
  final double inactiveBorderRadius;
  // Ajout des éléments suivants dans la construction de la checkbox:
  // - durée de transition
  // - color si active
  // - color si inactive
  // - bordure radius si active
  // - bordure radius si inactive
  const MyCheckbox({
    Key key,
    @required this.checked,
    @required this.onCheckBoxChanged,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.activeColor = Colors.red,
    this.inactiveColor = Colors.grey,
    this.activeBorderRadius = 10.0,
    this.inactiveBorderRadius = 4.0,
  }) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

//TODO: Controllons notre propre animation avec un SingleTickerProviderStateMixin
class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    //RESOLUTION: Interagir avec la checkbox via l'API GestureDetector
    return GestureDetector(
      onTap: () {
        //RESOLUTION: le bool checked est maintenant géré par le noeud parent, comment gérer le OnTap ?
        widget.onCheckBoxChanged(!widget.checked);
      },
      //RESOLUTION: Animer la checkbox avec la durée de transition fournie
      child: AnimatedContainer(
        duration: widget.transitionDuration,
        decoration: BoxDecoration(
          //RESOLUTION: Mettre à jour la couleur de la bordure en fonction de son état
          border: Border.all(
            color: widget.checked ? widget.activeColor : widget.inactiveColor,
          ),
          //RESOLUTION: Mettre à jour le radius en fonction de son état
          borderRadius: BorderRadius.circular(widget.checked
              ? widget.activeBorderRadius
              : widget.inactiveBorderRadius),
        ),
        //TODO: Utilisons l'objet ScaleTransition pour animer la scale de la checkbox
        child: widget.checked
            ? Icon(Icons.check)
            : SizedBox(width: 24, height: 24),
      ),
    );
  }
}
