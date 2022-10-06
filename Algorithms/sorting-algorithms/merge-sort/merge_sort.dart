List<E> _mergeLists<E extends Comparable<dynamic>>(
    List<E> list1, List<E> list2) {
  int index1 = 0;
  int index2 = 0;
  final List<E> combinedList = <E>[];
  while (index1 < list1.length && index2 < list2.length) {
    if (list1[index1].compareTo(list2[index2]) < 0) {
      combinedList.add(list1[index1]);
      index1++;
    }
    if ((list1[index1].compareTo(list2[index2])) > 0) {
      combinedList.add(list2[index2]);
      index2++;
    } else {
      combinedList.add(list1[index1]);
      combinedList.add(list2[index2]);

      index1++;
      index2++;
    }
  }
  // if any of the values are remaning then it means that one the list is added in order and now just add it to the combined list the remaing elements.
  if (index1 < list1.length) {
    combinedList.addAll(list1.getRange(index1, list1.length));
  }
  if (index2 < list2.length) {
    combinedList.addAll(list2.getRange(index2, list2.length));
  }
  return combinedList;
}

List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  final middle = list.length ~/ 2;
  final leftList = mergeSort(list.sublist(0, middle));
  final rightList = mergeSort(list.sublist(middle, list.length));

  return _mergeLists(leftList, rightList);
}
