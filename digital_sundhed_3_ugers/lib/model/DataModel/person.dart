part of '../../main.dart';

class Person {
  String name;
  String phoneNumber;

  Person(this.name, this.phoneNumber);
}

class Caretaker extends Person {
  Caretaker(super.name, super.phoneNumber);
}

class Individual extends Person {
  String id;
  String diagnose;

  Individual(super.name, super.phoneNumber, this.id, this.diagnose);
}
