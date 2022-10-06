import '../../Data Structures/graphs/graph.dart';
import '../../Data Structures/graphs/graph_vertix.dart';
import '../../Data Structures/stacks/stacks.dart';

extension DFS<E> on Graph<E> {
  List<GraphVertix<E>> depthFirstSearch(GraphVertix<E> root) {
    var stack = Stack<GraphVertix<E>>();
    var pushed = <GraphVertix<E>>{};
    var visited = <GraphVertix<E>>[];
    stack.push(root);
    pushed.add(root);
    visited.add(root);
    loopOver:
    while (!stack.isEmpty) {
      final vertex = stack.peek;
      final neighbour = edges(vertix: vertex);
      for (final edge in neighbour) {
        if (!pushed.contains(edge.destination)) {
          stack.push(edge.destination);
          pushed.add(edge.destination);
          visited.add(edge.destination);

          continue loopOver;
        }
      }
      stack.pop();
    }
    return visited;
  }
}
