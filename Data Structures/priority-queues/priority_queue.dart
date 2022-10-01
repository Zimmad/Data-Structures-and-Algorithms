import '../heaps/heap.dart';

class PriorityQueue<E extends Comparable<dynamic>> {
  late Heap<E> _heap;
  PriorityQueue({List<E>? elements, Priority priority = Priority.max}) {
    _heap = Heap(elements: elements, priority: priority);
  }

// checking if the priority queue is empty is O(1) operations
  bool get isEmpty => _heap.isEmpty;

  // getting peek is O(1) operations
  E? get peek => _heap.peek;

  // enjqueuing is O (log n) operations
  bool enqueue(E element) {
    _heap.insert(element);
    return true;
  }

// dequqing is O(log n) operations
  E? dequeue() {
    return _heap.remove();
  }
}
