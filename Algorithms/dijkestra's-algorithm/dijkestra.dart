import '../../Data Structures/graphs/graph.dart';
import '../../Data Structures/graphs/graph_vertix.dart';
import '../../Data Structures/heaps/heap.dart';
import '../../Data Structures/priority-queues/priority_queue.dart';

class Pair<E> extends Comparable<Pair<E>> {
  double distance;
  GraphVertix<E>? vertex;
  Pair({required this.distance, this.vertex});

  @override
  int compareTo(Pair<E> other) {
    if (distance == other.distance) return 0;
    if (distance > other.distance)
      return 1;
    else {
      return -1;
    }
  }

  @override
  String toString() {
    return '$distance,  $vertex';
  }
}

class Dijkestra<E> {
  final Graph<E> graph;

  Dijkestra({required this.graph});

  Map<GraphVertix<E>, Pair<E>?> shortestfPaths(GraphVertix<E> source) {
    final queue = PriorityQueue<Pair<E>>(priority: Priority.min);
    final visited = <GraphVertix<E>>{};
    final paths = <GraphVertix<E>, Pair<E>?>{};
    for (final vertex in graph.vertices) {
      paths[vertex] = null;
    }
    queue.enqueue(Pair(distance: 0, vertex: source));
    paths[source] = Pair(distance: 0);
    visited.add(source);
    while (!queue.isEmpty) {
      final current = queue.dequeue();
      final savedDistance = paths[current!.vertex]!.distance;
      if (current!.distance > savedDistance) {
        continue;
      }
      visited.add(current.vertex!);
      for (final edge in graph.edges(vertix: current.vertex!)) {
        final neighbour = edge.destination;
        if (visited.contains(neighbour)) continue;
        final weight = edge.graphWeight ?? double.infinity;
        final totalDistance = current.distance + weight;
        final knownDistance = paths[neighbour]?.distance ?? double.infinity;
        if (totalDistance < knownDistance) {
          paths[neighbour] =
              Pair(distance: totalDistance, vertex: current.vertex);
          queue.enqueue(Pair(distance: totalDistance, vertex: neighbour));
        }
      }
    }

    return paths;
  }
}
