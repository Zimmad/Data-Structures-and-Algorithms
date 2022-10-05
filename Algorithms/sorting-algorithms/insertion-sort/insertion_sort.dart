void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  void swap(int indexA, int indexB) {
    final temp = list[indexA];
    list[indexA] = list[indexB];
    list[indexB] = temp;
  }

  for (var current = 0; current < list.length; current++) {
    for (var shift = current; shift > 0; shift--) {
      if (list[shift].compareTo(list[shift - 1]) < 0) {
        swap(shift, shift - 1);
      } else {
        break; // it means the current item is at its right position .
      }
    }
  }
}
