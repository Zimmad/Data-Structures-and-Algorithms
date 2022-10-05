void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  void swap(int indexA, int indexB) {
    final temp = list[indexA];
    list[indexA] = list[indexB];
    list[indexB] = temp;
  }

  for (var start = 0; start < list.length; start++) {
    var lowest = start;
    for (var next = start + 1; next < list.length; start++) {
      if (list[next].compareTo(list[lowest]) < 0) {
        lowest = next;
      }
    }
    if (lowest != start) {
      swap(lowest, start);
    }
  }
}
