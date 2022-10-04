import 'dart:ffi';

import 'graph.dart';
import 'graph_vertix.dart';
import 'graph_edge.dart';

class AdjacencyListGraph<E> implements Graph<E> {
  Map<GraphVertix<E>, List<GraphEdge<E>>> _graph = {};
  int _nextIndex = 0;
  @override
  void addEdge(
      {required GraphVertix<E> source,
      required GraphVertix<E> destination,
      EdgeType edgeType = EdgeType.undirected,
      double? graphWeight}) {
    _graph[source]?.add(GraphEdge(
        source: source, destination: destination, graphWeight: graphWeight));
    if (edgeType == EdgeType.undirected) {
      _graph[destination]?.add((GraphEdge(
          source: destination, destination: source, graphWeight: graphWeight)));
    }
  }

  @override
  GraphVertix<E> createVertex(E value) {
    final vertix = GraphVertix(data: value, index: _nextIndex);
    _graph[vertix] = [];
    _nextIndex++;
    return vertix;
  }

  @override
  List<GraphEdge<E>> edges({required GraphVertix<E> vertix}) {
    if (_graph[vertix] != null) {
      return _graph[vertix]!;
    } else {
      return [];
    }
    // return _graph[vertix] ?? [];
  }

  @override
  Iterable<GraphVertix<E>> get vertices => _graph.keys;

  @override
  double? weight(
      {required GraphVertix<E> source, required GraphVertix<E> destination}) {
    final compare = edges(vertix: source)
        .where((element) => element.destination == destination);
    if (compare.isEmpty)
      return null;
    else {
      return compare.first.graphWeight;
    }
  }

  @override
  String toString() {
    final toString = StringBuffer();
    _graph.forEach((key, values) {
      final destinations = values.map((e) => e.destination).join(',  ');
      toString.writeln("$key ---> $destinations");
    });
    return '$toString';
  }
}
