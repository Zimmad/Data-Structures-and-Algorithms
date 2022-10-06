enum Priority {
  max,
  min,
}

class Heap<E extends Comparable<dynamic>> {
  late final List<E> elements;
  final Priority priority;

  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = elements == null ? [] : elements;
    _buidHeap();
  }

  bool get isEmpty => elements.isEmpty;
  int get size => elements.length;
  E? get peek => isEmpty ? null : elements.first;

// some helper methods
  void _buidHeap() {
    if (isEmpty) return;
    final startingIndex = elements.length ~/ 2 - 1;

    for (int i = startingIndex; i >= 0; i--) {
      _siftDown(
          valueIndex:
              i); // O(log n )  operations. This can be done by using siftUp but that is O (n log n)
      //  for further details read this stacOverflow article "stackoverflow.com/a/18742428"
    }
  }

  int _leftChildIndex({required int parentIndex}) => 2 * parentIndex + 1;
  int _rightChildIndex({required int parentIndex}) => 2 * parentIndex + 2;
  int _parentIndex({required int childIndex}) => (childIndex - 1) ~/ 2;

  bool _isFirstHigherPriority({required E valueA, required E vlaueB}) {
    if (priority == Priority.max) {
      return valueA.compareTo(vlaueB) > 0;
    }
    return vlaueB.compareTo(valueA) > 0;
  }

  int _higherPriority({required int indexA, required indexB}) {
    if (indexA > indexB) return indexB;
    E valueA = elements[indexA];
    E valueB = elements[indexB];
    bool _isValueAHigherPriority =
        _isFirstHigherPriority(valueA: valueA, vlaueB: valueB);

    return _isValueAHigherPriority ? indexA : indexB;
  }

  void _swapValues({required int indexA, required int indexB}) {
    E temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  void _siftUp({required int valueIndex}) {
    var childIndex = valueIndex;
    var parentIndex = _parentIndex(childIndex: childIndex);
    while (childIndex > 0 &&
        childIndex ==
            _higherPriority(indexA: childIndex, indexB: parentIndex)) {
      _swapValues(indexA: childIndex, indexB: parentIndex);
      childIndex = parentIndex;
      parentIndex = _parentIndex(childIndex: childIndex);
    }
  }

  void _siftDown({required int valueIndex}) {
    var parentIndex = valueIndex;
    while (true) {
      final leftChildIndex = _leftChildIndex(parentIndex: parentIndex);
      final rightChildIndex = _rightChildIndex(parentIndex: parentIndex);

      var selectedValueIndex =
          _higherPriority(indexA: leftChildIndex, indexB: parentIndex);
      selectedValueIndex =
          _higherPriority(indexA: selectedValueIndex, indexB: rightChildIndex);
      if (selectedValueIndex == parentIndex) return;

      _swapValues(indexA: selectedValueIndex, indexB: parentIndex);
      parentIndex = selectedValueIndex;
    }
  }

  // * --------------------------------------------***********------------------------------------------------

//? Insertion ....   It is of O(log n ) time operations and O(1) memory (space).

  void insert(E value) {
    elements.add(value);
    _siftUp(valueIndex: elements.length - 1);
  }

  //? Deletion ....  It is of O(log n ) time operations and O(1) memory (space).

  E? remove() {
    if (isEmpty) return null;
    _swapValues(indexA: 0, indexB: elements.length - 1);
    final value = elements.removeLast();
    _siftDown(valueIndex: 0);
    return value;
  }

  //? Removing at certain Index ....  It is of O(log n ) time operations and O(1) memory (space).
  E? removeAtIndex({required int index}) {
    final lastIndex = elements.length - 1;
    if (index < 0 || index > lastIndex) return null;
    if (index == lastIndex) return elements.removeLast();
    _swapValues(indexA: index, indexB: lastIndex);
    final value = elements.removeLast();
    _siftDown(valueIndex: index);
    _siftUp(valueIndex: index);
    return value;
  }

  //? finding element in a Heap  ....

  int indexOf({required E value, int startingIndex = 0}) {
    if (startingIndex >= elements.length - 1) return -1;
    if (_isFirstHigherPriority(valueA: value, vlaueB: elements[startingIndex]))
      return -1;
    if (value == elements[startingIndex]) return startingIndex;

    // recursively search values from left child
    final leftIndex = indexOf(
        value: value,
        startingIndex: _leftChildIndex(parentIndex: startingIndex));
    if (leftIndex != -1) return leftIndex;
// recursively search values from the right child
    return indexOf(
        value: value,
        startingIndex: _rightChildIndex(parentIndex: startingIndex));
  }

  @override
  String toString() {
    return elements.toString();
  }
}
