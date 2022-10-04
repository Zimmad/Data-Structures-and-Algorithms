import '../../Data Structures/graphs/graph.dart';
import '../../Data Structures/graphs/graph_vertix.dart';
import '../../Data Structures/queues/list_queue.dart';

extension BFS<E> on Graph<E> {
  List<GraphVertix<E>> breadthFirstSearch(GraphVertix<E> startVertex) {
    final queue = ListQueue<GraphVertix<E>>();
    Set<GraphVertix<E>> enqueued = {};
    List<GraphVertix<E>> visited = [];
    queue.enqueue(startVertex);
    enqueued.add(startVertex);

    while (true) {
      final vertex = queue.dequeue();
      if (vertex == null) break;
      visited.add(vertex);
      final neighbourEdges = edges(vertix: vertex);
    }
    return visited;
  }
}
