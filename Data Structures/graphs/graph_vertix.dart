class GraphVertix<E> {
  final int index;
  final E data;
  GraphVertix({required this.data, required this.index});
  @override
  String toString() => '$data';
}
