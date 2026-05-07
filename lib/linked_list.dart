/// A linked list data structure implementation for Dart.
///
/// This library provides a generic, mutable linked list that supports
/// efficient insertion and removal operations at known positions.
///
/// The [LinkedList] class extends [Iterable], allowing it to be used
/// with standard iteration patterns and collection methods.
///
/// ## Usage
///
/// ```dart
/// final list = LinkedList<int>();
/// list.push(1);
/// list.append(2);
/// list.append(3);
/// print(list); // 1 -> 2 -> 3
///
/// list.pop(); // Returns 1
/// print(list); // 2 -> 3
/// ```
///
/// ## Key Classes
///
/// * [Node] - A single element in the linked list.
/// * [LinkedList] - The main linked list container.
/// * [_LinkedListIterator] - Iterator for traversing the list.
library;

/// A single node in a linked list.
///
/// Each node holds a value and a reference to the next node in the sequence.
/// The [next] property is `null` for the last node in the list.
class Node<T> {
  /// Creates a new node with the given [value].
  ///
  /// The [next] parameter can be used to chain this node directly to
  /// another node; it defaults to `null`.
  Node({required this.value, this.next});

  /// The value stored in this node.
  T value;

  /// The next node in the sequence, or `null` if this is the last node.
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

/// A generic linked list that extends [Iterable].
///
/// Provides efficient insertion and removal operations at the front, back,
/// and after a known node. Maintains references to both [head] and [tail]
/// for optimized operations.
class LinkedList<E> extends Iterable<E> {
  /// The first node in the linked list, or `null` if the list is empty.
  Node<E>? head;

  /// The last node in the linked list, or `null` if the list is empty.
  Node<E>? tail;

  /// Whether this linked list contains no elements.
  @override
  bool get isEmpty => head == null;

  /// Adds a new element to the front of the linked list.
  ///
  /// This operation runs in constant time O(1).
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// Adds a new element to the back of the linked list.
  ///
  /// This operation runs in constant time O(1) because the list maintains
  /// a reference to the [tail].
  ///
  /// If the list is empty, this behaves the same as [push].
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail!.next = Node(value: value);

    tail = tail!.next;
  }

  /// Returns the node at the given [index], or `null` if the index is out of bounds.
  ///
  /// The indexing starts at 0 for the head. This operation runs in O(n) time.
  ///
  /// Example:
  /// ```dart
  /// final list = LinkedList<int>();
  /// list.append(10);
  /// list.append(20);
  /// final node = list.nodeAt(1);
  /// print(node?.value); // 20
  /// ```
  Node<E>? nodeAt(int index) {
    Node<E>? currentNode = head;
    int currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }

    return currentNode;
  }

  /// Inserts a new element after the given [node].
  ///
  /// Returns the newly created node. If [node] is the [tail], appends
  /// the value instead to maintain list integrity.
  ///
  /// This operation runs in constant time O(1).
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  /// Removes and returns the first element of the linked list.
  ///
  /// Returns `null` if the list is empty. Updates the [tail] to `null`
  /// if the list becomes empty after removal.
  ///
  /// This operation runs in constant time O(1).
  E? pop() {
    final value = head?.value;

    head = head?.next;
    if (isEmpty) tail = null;

    return value;
  }

  /// Removes and returns the last element of the linked list.
  ///
  /// Returns `null` if the list is empty.
  ///
  /// This operation runs in O(n) time because the list must traverse
  /// to the second-to-last node.
  ///
  /// If there is only one element, this behaves the same as [pop].
  E? removeLast() {
    if (head?.next == null) return pop();

    Node<E> currentNode = head!;

    while (currentNode.next != tail) {
      currentNode = currentNode.next!;
    }

    final value = tail!.value;
    tail = currentNode;
    tail!.next = null;

    return value;
  }

  /// Removes and returns the element after the given [node].
  ///
  /// Returns `null` if there is no element after [node].
  ///
  /// This operation runs in constant time O(1).
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;

    if (node.next == tail) {
      tail = node;
    }

    node.next = node.next?.next;

    return value;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

/// An iterator for traversing a [LinkedList].
///
/// Implements the [Iterator] interface to allow standard iteration patterns
/// such as `for` loops and `forEach` calls.
class _LinkedListIterator<E> implements Iterator<E> {
  /// Creates an iterator for the given [list].
  _LinkedListIterator(LinkedList<E> list) : _list = list;

  final LinkedList<E> _list;

  // The node corresponding to [current], or `null` before the first move.
  Node<E>? _currentNode;

  // Whether [moveNext] has been called at least once.
  bool _firstPass = true;

  /// The current element in the iteration.
  ///
  /// Throws a [StateError] if [moveNext] has not been called or
  /// has returned `false`.
  @override
  E get current => _currentNode!.value;

  /// Moves to the next element in the linked list.
  ///
  /// Returns `true` if there is a next element, or `false` if the
  /// end of the list has been reached. Returns `false` immediately
  /// if the list is empty.
  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;
  }
}
