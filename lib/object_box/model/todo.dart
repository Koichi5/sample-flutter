import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  Todo(
      {required this.title, required this.description, required this.priority});
  @Id()
  int id = 0;
  String title;
  String description;
  String priority;
}
