// A constant-time algorithm has the same running time regardless of the size of the input.
// ignore_for_file: unused_local_variable

void constantTimeAlgorithm(List<String> names) {
  String? name;
  if (names.isNotEmpty) {
    // print(names.first);
    name = names.first;
  } else {
    // print('no names');
    name = null;
  }
}

// As the input list increases in size, the number of iterations that the loop
// makes increases by the name amount.
void linearTimeAlgorithm(List<String> names) {
  String? name;
  for (final n in names) {
    // print(name);
    name = n;
  }
}

// As the input list increases in size, the total number of iterations grows
// proportionally to the square of the input size (n²).
void quadraticTimeAlgorithm(List<String> names) {
  String? name;
  for (final _ in names) {
    for (final n in names) {
      // print(name);
      name = n;
    }
  }
}
