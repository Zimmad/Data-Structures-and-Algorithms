import '../heap-sort/heap_sort.dart';
import 'quick-sort.dart';

void main(List<String> args) {
  final list = [
    -300,
    34,
    34,
    3453456,
    90,
    1,
    00,
    -1,
    -100,
    23,
    1,
    3,
    3,
    3,
    4,
    67,
    8,
    4,
    2,
    5,
    7,
    90,
    6,
    323,
    43,
    46,
    7676676
  ];
  final sorted = heapSort([
    1,
    3,
    5,
    3,
    7,
    5,
    -56,
    5756,
    -4,
    5,
    68,
    567,
  ]);
  print(sorted);
}
