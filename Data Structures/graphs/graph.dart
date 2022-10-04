import 'dart:ffi';

import 'graph_edge.dart';
import 'graph_vertix.dart';

enum EdgeType { directed, undirected }

abstract class Graph<E> {
  Iterable<GraphVertix<E>> get vertices;

  GraphVertix<E> createVertex(E value);

  void addEdge({
    required GraphVertix<E> source,
    required GraphVertix<E> destination,
    required EdgeType edgeType,
    double? graphWeight,
  });

  List<GraphEdge<E>> edges({required GraphVertix<E> vertix});
  double? weight(
      {required GraphVertix<E> source, required GraphVertix<E> destination});
}
