class Stack<E> {
  final List<E> _data;
  Stack() : _data = <E>[];
// To convert an Iterable into a stack
  Stack.of(Iterable<E> elements)
      : _data = List<E>.of(
          elements,
          growable: true,
        );

// --------**********----------

//? Push
  void push(E item) {
    _data.add(item);
  }

  //?
  E? pop() {
    if (_data.isEmpty) return null;

    return _data.removeLast();
  }

  //? getting peek item(element)
  E get peek => _data.last;
  bool get isEmpty => _data.isEmpty;
}
