import 'package:dsad/stack.dart';

void main() {
  printReverseList([1, 2, 3, 4]);

  print(isBalancedWithoutStack('h((e))llo(world)()'));
  print(isBalancedWithoutStack('()())('));
  print(isBalancedWithoutStack('(()'));

  print(isBalancedWithStack('h((e))llo(world)()'));
  print(isBalancedWithStack('()())('));
  print(isBalancedWithStack('(()'));
}

// Challenge 1: Reverse a List
// Create a function that prints the contents of a list in reverse order.
void printReverseList(List list) {
  final stack = Stack.of(list);

  while (stack.size != 0) {
    print(stack.pop());
  }
}

/*
Challenge 2: Balance the Parentheses
Check for balanced parentheses. Given a string, check if there are ( and ) characters,
and return true if the parentheses in the string are balanced. For example:
// 1
h((e))llo(world)() // balanced parentheses
// 2
(hello world // unbalanced parentheses
*/
bool isBalancedWithoutStack(String text) {
  int sum = 0;

  for (String char in text.split('')) {
    if (char == '(') sum++;
    if (char == ')') sum--;

    if (sum.isNegative) return false;
  }

  return sum == 0;
}

bool isBalancedWithStack(String text) {
  final openingParentheses = Stack<String>();

  for (final char in text.split('')) {
    if (char == '(') openingParentheses.push(char);
    if (char == ')') {
      if (openingParentheses.isEmpty) return false;
      openingParentheses.pop();
    }
  }

  return openingParentheses.isEmpty;
}
