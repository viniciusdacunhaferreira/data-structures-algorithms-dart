import 'package:dsad/linked_list.dart';

void main() {
  final list = LinkedList<int>()
    ..append(1)
    ..append(2)
    ..append(3);

  print('\nPrint in reverse');
  print(list);
  printInReverse(list);

  print('\nFind the middle node');
  print('Middle node value: ${middleNode(list)?.value}');
}

void printInReverse(LinkedList<int> list) {
  list.head?.runRecursive((int value) => print(value));
}

extension RecursiveNode<E> on Node<E> {
  void runRecursive(void Function(E value) action) {
    next?.runRecursive(action);
    action(value);
  }
}

Node<E>? middleNode<E>(LinkedList<E> list) {
  return list.nodeAt((list.length / 2).floor());
}
