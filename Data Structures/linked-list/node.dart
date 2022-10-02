import 'dart:mirrors';

class Node<E> {
  E value;
  Node<E>? next;
  Node({required this.value, this.next});
  @override
  String toString() {
    if (next == null) return "value : $value";
    return "value : $value --> Points to  $next ";
  }
}
