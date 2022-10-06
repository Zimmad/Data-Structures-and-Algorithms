import '../graphs/adjacency-list-raph.dart';
import 'adjacency_matrix_graph.dart';

void main(List<String> args) {
  final graph = AdjacencyMatrixgraph<String>();
  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');
  graph.addEdge(
    source: singapore,
    destination: hongKong,
    graphWeight: 300.0,
  );
  graph.addEdge(source: singapore, destination: tokyo, graphWeight: 500);
  graph.addEdge(source: hongKong, destination: tokyo, graphWeight: 250);
  graph.addEdge(source: tokyo, destination: detroit, graphWeight: 450);
  graph.addEdge(source: tokyo, destination: washingtonDC, graphWeight: 300);
  graph.addEdge(source: hongKong, destination: sanFrancisco, graphWeight: 600);
  graph.addEdge(source: detroit, destination: austinTexas, graphWeight: 50);
  graph.addEdge(
      source: austinTexas, destination: washingtonDC, graphWeight: 292);
  graph.addEdge(
      source: sanFrancisco, destination: washingtonDC, graphWeight: 337);
  graph.addEdge(source: washingtonDC, destination: seattle, graphWeight: 277);
  graph.addEdge(source: sanFrancisco, destination: seattle, graphWeight: 218);
  graph.addEdge(
      source: austinTexas, destination: sanFrancisco, graphWeight: 297);
  print(graph);
}
