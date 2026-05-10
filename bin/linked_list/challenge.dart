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

  print('\nReverse a Linked List');
  print('Linked list: $list');
  print('Reversed linked list: ${reverseList(list)}');
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
  Node<E>? fast = list.head;
  Node<E>? slow = list.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}

LinkedList<E> reverseList<E>(LinkedList<E> list) {
  Node<E>? prev = list.head;
  Node<E>? curr = list.head?.next;
  Node<E>? next = list.head?.next?.next;

  list.head = list.tail;
  list.tail = prev?..next=null;

  while (curr != null) {
    curr.next = prev;

    prev = curr;
    curr = next;
    next = next?.next;
  }

  return list;
}
