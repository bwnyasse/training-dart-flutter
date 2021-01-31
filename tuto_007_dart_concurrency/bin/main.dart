import 'dart:isolate';

void sayHello(var msg) {
  print("Hello From Dart & Flutter Training :${msg}");
}

void main() {
  // the spawn method of the Isolate class facilitates running function in parallel
  // with the rest of the our code
  Isolate.spawn(sayHello, 'John!!');
  Isolate.spawn(sayHello, 'Steve!!');
  Isolate.spawn(sayHello, 'Brad!!');

  print('Hello from main1');
  print('Hello from main2');
  print('Hello from main3');
}
