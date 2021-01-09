//import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class Employee {
  final String name;
  final String firstname;

  Employee({
    @required this.name,
    @required this.firstname,
  });
}


main(){
  Employee empl = Employee(name:null,firstname:null,);
  print(empl);
}

//  NAMED PARAMETERS