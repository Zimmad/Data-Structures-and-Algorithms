import 'queue.dart';

class ListQueue<E> implements Queue<E> {
  final _data = <E>[];

//? dequeue .. this is O(n) time operations and O(1) space complexity.
  @override
  E? dequeue() {
    final removedItem = isEmpty ? null : _data.removeAt(0);
    return removedItem;
  }

//? enqueue method .. this is O(1) time and space operations
  @override
  bool enqueue(E element) {
    _data.add(element);
    return true;
  }

//? isEmpty .. this is O(1) operation
  @override
  bool get isEmpty => _data.isEmpty;

//? get peek .. this is O(1) time and space operations
  @override
  E? get peek => isEmpty ? null : _data.first;

  @override
  String toString() {
    return _data.toString();
  }
}
