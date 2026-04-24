import 'package:dsad/stack.dart';

void main() {
  final stack = Stack<int>()
    ..push(1)
    ..push(2)
    ..push(3)
    ..push(4);

  print(stack);

  final element = stack.pop();
  print(element);
}
