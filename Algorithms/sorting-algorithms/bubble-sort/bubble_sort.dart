void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  void swap(int indexA, int indexB) {
    final temp = list[indexA];
    list[indexA] = list[indexB];
    list[indexB] = temp;
  }

  var swaped = false;

  for (var listLength = list.length - 1; listLength > 0; listLength) {
    for (var current = 0; current < listLength; current++) {
      if (list[current].compareTo(list[current + 1]) > 0) {
        swap(current, current + 1);
        swaped = true;
      }
    }
    if (!swaped)
      return; // If now swapping occurs in first pass , it means that the list is sorted and we can return
  }
}
