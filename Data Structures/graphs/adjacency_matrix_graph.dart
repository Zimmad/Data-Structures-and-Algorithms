import 'graph.dart';
import 'graph_vertix.dart';
import 'graph_edge.dart';

class AdjacencyMatrixgraph<E> implements Graph {
  final List<GraphVertix<E>> _vertices = [];
  final List<List<double?>?> _weights = [];
  var _nextIndex = 0;
  @override
  void addEdge(
      {required GraphVertix source,
      required GraphVertix destination,
      EdgeType edgeType = EdgeType.undirected,
      double? graphWeight}) {
    _weights[source.index]?[destination.index] = graphWeight;

    if (edgeType == EdgeType.undirected) {
      _weights[destination.index]?[source.index] = graphWeight;
    }
  }

  @override
  GraphVertix createVertex(value) {
    final vertix = GraphVertix<E>(data: value, index: _nextIndex);
    _nextIndex++;
    _vertices.add(vertix);

    // adding column in the last
    for (var i = 0; i < _weights.length; i++) {
      _weights[i]?.add(null);
    }
    // crearing a row for the newly created vertex in the weights matrix. Initialy all the elements in the matrix are null.
    final row = List<double?>.filled(_vertices.length, null);
    _weights.add(row);
    return vertix;
  }

  @override
  List<GraphEdge> edges({required GraphVertix vertix}) {
    List<GraphEdge<E>> edges = [];
    for (var i = 0; i < _weights.length; i++) {
      final weight = _weights[vertix.index]?[i];
      if (weight == null) continue;
      final destination = _vertices[i];
      edges.add(GraphEdge(
          source: vertix as GraphVertix<E>,
          destination: destination,
          graphWeight: weight));
    }
    return edges;
  }

  @override
  Iterable<GraphVertix> get vertices => _vertices;

  @override
  double? weight(
      {required GraphVertix source, required GraphVertix destination}) {
    return _weights[source.index]?[destination.index];
  }

  @override
  String toString() {
    final output = StringBuffer();
    for (final vertex in _vertices) {
      output.writeln('${vertex.index} : ${vertex.data}');
    }
    for (var i = 0; i < _weights.length; i++) {
      for (var j = 0; j < _weights.length; i++) {
        final vlaue = (_weights[i]?[j] ?? '.').toString();
        output.write(vlaue.padRight(5));
      }
      output.writeln();
    }
    return output.toString();
  }
}
