import '../../../Data Structures/heaps/heap.dart';

List<E> heapSort<E extends Comparable<dynamic>>(List<E> list) {
  final sortedList = <E>[];
  final heap = Heap(elements: list, priority: Priority.min);
  while (!heap.isEmpty) {
    final topOfheap = heap.remove();
    sortedList.add(topOfheap!);
  }
  return sortedList;
}
