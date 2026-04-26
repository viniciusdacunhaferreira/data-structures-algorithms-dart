import 'package:dsad/linked_list.dart';

void main() {
  final list = LinkedList<int>()
    ..push(3)
    ..push(2)
    ..push(1);

  print('Before: $list');

  Node<int> middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);

  print('After: $list');
}
