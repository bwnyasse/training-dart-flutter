import 'dart:core';
import 'dart:mirrors';
import 'data.dart';

main() {
  Symbol lib = new Symbol("data_lib");
  //library name stored as Symbol

  Symbol clsToSearch = new Symbol("Data");
  // class name stored as Symbol

  reflectInstanceMethods(lib, clsToSearch);
}

void reflectInstanceMethods(Symbol libraryName, Symbol className) {
  MirrorSystem mirrorSystem = currentMirrorSystem();
  LibraryMirror libMirror = mirrorSystem.findLibrary(libraryName);

  print("Found Library");
  print("check...class details..");
  print("No of classes found is : ${libMirror.declarations.length}");
  libMirror.declarations.forEach((s, d) => print(s));

  if (libMirror.declarations.containsKey(className)) print("found class");
  ClassMirror classMirror = libMirror.declarations[className] as ClassMirror;

  print(
      "No of instance methods found is ${classMirror.instanceMembers.length}");
  classMirror.instanceMembers.forEach((s, v) => print(s));
}
