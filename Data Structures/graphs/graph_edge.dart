import 'dart:ffi';

import 'graph_vertix.dart';

class GraphEdge<E> {
  final GraphVertix<E> source;
  final GraphVertix<E> destination;
  final double? graphWeight;

  GraphEdge(
      {required this.source, required this.destination, this.graphWeight});
}
