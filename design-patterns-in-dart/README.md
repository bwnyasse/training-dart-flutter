# Implémentation des Design Patterns en Dart

Ce projet contient des snippets de code pour comprendre comment implémenter
les [23 design patterns du Gang of Four](https://en.wikipedia.org/wiki/Design_Patterns)

[inspiration](https://www.academiepro.com/uploads/livres/Les_design_patterns_en_Java_%7B9782744040979%7D.pdf)

## Contenu 

### Les patterns de comportement

- [x] Chain of Responsibility - voir la [Demo](https://dartpad.dev/abd395795b3daf89594410ae7a51e66f)

Le pattern **Chain of Responsability** permet d'éviter de coupler l'émetteur d'une requête à son récepteur en permettant à plus d'un object d'y répondre.

Les développeurs s’efforcent d’associer les objets de manière souple avec une
responsabilité minimale et spécifique entre objets. Cette pratique permet de procéder plus facilement à des changements et avec moins de risques d’introduire des
défauts. 

Ce pattern prône le couplage faible.

- [x] Command - voir la [demo](https://dartpad.dev/6a3994da1e85d0ea5d40031894fdc59b)

L'objectif du pattern **Command**  est d'encapsuler une requête dans un objet. 

Le moyen classique de déclencher l’exécution d’une méthode est de l’appeler.
Il arrive souvent néanmoins que vous ne puissiez pas contrôler le moment précis ou
le contexte de son exécution. Dans de telles situations, vous pouvez l’encapsuler
dans un objet. En stockant les informations nécessaires à l’invocation d’une méthode
dans un objet, vous pouvez la passer en tant que paramètre, permettant ainsi à un
client ou un service de déterminer quand l’invoquer.

- [ ] Interpreter
- [ ] Iterator
- [ ] Mediator
- [ ] Memento
- [ ] Observer
- [ ] State
- [ ] Strategy
- [ ] Template Method
- [ ] Visitor

### Les patterns de construction 

- [ ] Abstract Factory
- [ ] Builder
- [ ] Factory Method
- [ ] Prototype
- [ ] Singleton

### Les patterns de structuration

- [ ] Adapter
- [ ] Bridge
- [ ] Composite
- [ ] Decorator
- [ ] Facade
- [ ] Flyweight
- [ ] Proxy