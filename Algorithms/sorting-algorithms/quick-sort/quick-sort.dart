/*List<E> quickSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) {
    return list;
  }
  final pivot = list[0];

  final smallerVales = list.where(
    (element) => element.compareTo(pivot) < 0,
  );
  final greaterValues = list.where(
    (element) => element.compareTo(pivot) > 0,
  );
  final equalValues = list.where(
    (element) => element.compareTo(pivot) == 0,
  );
  return [...smallerVales, ...equalValues, ...greaterValues];
}
// The above algorithm only works if the pivot is at its sorted order
// in The above Implementation the list.where is called three times(the list is treversed three times) and second we are not sorting in time (we are creating three list and then we add them in a single list by using sprread operator)
*/

//In the lomuto's implementation we get the right answer even for unsorted lists
int _lomutoPivotFinder<E extends Comparable<dynamic>>(
  List<E> list, {
  required int low, //These are  low and high of the range.
  required int high,
}) {
  void _swap({required int indexA, required int indexB}) {
    if (indexA == indexB) return;
    final temp = list[indexA];
    list[indexA] = list[indexB];
    list[indexB] = temp;
  }

  final pivotValue = list[high];
  var pivotINdex = low;
  for (int i = low; i < high; i++) {
    if (list[i].compareTo(pivotValue) <= 0) {
      _swap(indexA: i, indexB: pivotINdex);
      pivotINdex++;
    }
  }
  _swap(indexA: pivotINdex, indexB: high);
  return pivotINdex;
}

void quickSort<E extends Comparable<dynamic>>(
    List<E> list, rangeLow, rangeHigh) {
  if (rangeLow >= rangeHigh) return; // the range is not correct

  final pivotIndex = _lomutoPivotFinder(list, low: rangeLow, high: rangeHigh);
  quickSort(list, rangeLow, pivotIndex - 1);
  quickSort(list, pivotIndex, rangeHigh);
}
