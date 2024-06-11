// import 'package:flutter/material.dart';
// import 'package:sample_flutter/data_class/models/person.dart';

// class DataClassView extends StatelessWidget {
//   const DataClassView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var person = DataClassPerson(
//       name: 'John',
//       email: 'john1234@gmail.com',
//     );
//     final hashCode = person.hashCode;
//     // person = person.copyWith()
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data Class Test'),
//       ),
//       body: Center(
//         child: Column(
//           children: [],
//         ),
//       ),
//     );
//   }
// }

// // ignore_for_file: avoid_unused_constructor_parameters

// import 'package:dataclass/dataclass.dart';

// // The usual syntax, based on constructors.
// // We no-longer use "factory" constructors.
// @Data()
// class Person {
//   Person(
//     String name, {
//     required int age,
//   });
// }

// // Alternatively, you can define classes using fields:

// void main() {
//   var person = Person('John', age: 30);
//   person = person.copyWith(age: 31);

//   print(person.name); // John
//   print(person.age); // 31

//   // Person2 works the same!
//   var person2 = Person2(name: 'John', age: 30);
//   person2 = person2.copyWith(age: 31);
// }

// // ---- Advanced usage: Unions ----

// class Engine {}

// @Data()
// sealed class Vehicle {
//   final Engine engine;
// }

// @Data()
// class Plane implements Vehicle {
//   final Wing wing;

//   // Currently necessary due to augmentation libraries not being fully implemented.
//   // This won't be needed in the future.
//   @override
//   final Engine engine;
// }

// class Wing {}

// @Data()
// class Car implements Vehicle {
//   final Wheel wheel;

//   @override
//   final Engine engine;
// }

// class Wheel {}