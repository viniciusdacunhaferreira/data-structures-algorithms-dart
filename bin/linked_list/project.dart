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

  print('\nPopping from the front of a list');
  final list2 = LinkedList<String>()
    ..append('a')
    ..append('b')
    ..append('c');

  print('Before: $list2');

  final poppedValue = list2.pop();

  print('Popped value: $poppedValue');
  print('After: $list2');

  print('\nRemoving from the end of a list');
  final list3 = LinkedList<String>()
    ..append('a')
    ..append('b')
    ..append('c');

  print('Before: $list3');

  final removedValue = list3.removeLast();

  print('Removed value: $removedValue');
  print('After: $list3');

  print('\nRemoving from the middle of a list');
  final list4 = LinkedList<String>()
    ..append('a')
    ..append('b')
    ..append('c');

  print('Before: $list4');

  final removedValue4 = list4.removeAfter(list4.nodeAt(0)!);

  print('Removed value: $removedValue4');
  print('After: $list4');

  print('\nMaking a List Iterable');
  final list5 = LinkedList<String>()
    ..append('a')
    ..append('b')
    ..append('c');

  for (final e in list5) {
    print(e);
  }
}
