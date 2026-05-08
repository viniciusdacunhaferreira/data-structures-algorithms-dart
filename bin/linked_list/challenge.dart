import 'package:dsad/linked_list.dart';

void main() {
  final list = LinkedList<int>()
    ..append(1)
    ..append(2)
    ..append(3)
  //
  ;

  print(list);
  printInReverse(list);
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
