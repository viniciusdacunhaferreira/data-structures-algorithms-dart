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

  print('\nRemove All Occurrences');
  print('Original list: $list');
  print(
    'List after removing all occurrences of 2: ${removeOccurrence(2, list)}',
  );
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
  Node<E>? prev;
  Node<E>? curr = list.head;

  list.tail = curr;

  while (curr != null) {
    final Node<E>? next = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  }

  list.head = prev;

  return list;
}

LinkedList<E> removeOccurrence<E>(E value, LinkedList<E> list) {
  Node<E>? prev;
  Node<E>? curr = list.head;

  while (curr != null) {
    final Node<E>? next = curr.next;

    if (curr.value == value) {
      if (curr == list.head) list.head = next;
      if (curr == list.tail) list.tail = prev;
      prev?.next = next;
    } else {
      prev = curr;
    }
    curr = next;
  }

  return list;
}
