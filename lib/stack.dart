/// A Last-In-First-Out (LIFO) data structure that stores elements of type [E].
///
/// The [Stack] class provides basic stack operations:
/// - [push]: adds an element to the top of the stack
/// - [pop]: removes and returns the element from the top of the stack
///
/// Example:
/// ```dart
/// final stack = Stack<int>();
/// stack.push(1);
/// stack.push(2);
/// stack.push(3);
/// print(stack.pop()); // Output: 3
/// ```
class Stack<E> {
  /// Creates an empty [Stack].
  Stack() : _storage = <E>[];

  /// Creates a new [Stack] containing all elements from the given [Iterable].
  ///
  /// The [elements] are added to the stack in the order they appear in the iterable.
  /// The first element of the iterable becomes the bottom of the stack.
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.of([1, 2, 3]);
  /// ```
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  /// Internal storage for stack elements.
  final List<E> _storage;

  /// Adds [element] to the top of the stack.
  void push(E element) => _storage.add(element);

  /// Removes and returns the element from the top of the stack.
  ///
  /// Throws [RangeError] if the stack is empty.
  E pop() => _storage.removeLast();

  /// Returns the top element of the stack without removing it.
  ///
  /// Throws [StateError] if the stack is empty.
  E get top => _storage.last;

  /// Returns the current number of elements in the stack.
  int get size => _storage.length;

  /// Returns whether the stack is empty.
  ///
  /// Returns `true` if the stack contains no elements, `false` otherwise.
  bool get isEmpty => _storage.isEmpty;

  /// Returns a string representation of the stack.
  @override
  String toString() => _storage.toString();
}
