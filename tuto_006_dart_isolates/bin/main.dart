import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Isolate? isolate;

Future<void> start() async {
  ReceivePort receivePort= ReceivePort(); //port for isolate to receive messages.
  isolate = await Isolate.spawn<SendPort>(runTimer, receivePort.sendPort);
  receivePort.listen((data) {
    print('Receiving: $data  ✓');
  });
}

void runTimer(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(new Duration(seconds: 1), (Timer t) {
    counter++;
    String msg = 'notification ${counter.toString()}';  
    print('-> Sending: $msg');
    sendPort.send(msg);
  });
}

void stop() {  
  if (isolate != null) {
      print('Stopping Isolate...');
      isolate?.kill(priority: Isolate.immediate);
      isolate = null;        
  }  
}

void main() async {
  print('Starting Isolate...');
  await start();
  print('Press enter key to quit');
  await stdin.first;
  stop();
  print('Bye!');
  exit(0);
}