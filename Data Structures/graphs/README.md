# Graph Data-Structure
### A graph data structure is a non linear data structure that consists of vertices and edges.
## Vertices :
### Vertices are also known as nodes. It is the fundamental unit of graph and it contains the actual data.
## edges:
### Edge is the connection between two vertices(nodes).

#### Graphs are used to present many real world scenarions like the Graph of internet. It is use for solving real world problems.

## Types: 
### Weighted, Unweighted, directed and undirected are the four maain types of graphs. In Weighted graphs every edge have a weidge attached and in directed graphs vertices points to other vertices(directed graphs can only be treversed in the direction of the vertice). Vertices in Undirected graphs can be traversed in bi directios , also weight is applieed to both directions(if the graph is weighted).

## complexity of graphs 
### we can implement graphs through adjacency lists or through matrices adjacent to the vertices.

## Time and Space Complexity of Graphs implemented through adjacency Lists.
### Space complexity is O(n)
### Adding Vertex is O(1) (constant) time operations.
### Adding Edge is O(1) time.
### Searching for Edge or Vertex is O(n) times operations. 
##  Time and Space Complexity of Graphs implemented through adjacency Matrices
### Space complexity is O(n^2)
### Adding Vertex is O(n^2) (constant) time operations.
### Adding Edge is O(1) time.
### Searching for Edge or Vertex is O(1) (constant) times operations. 

## Note : For Dense grapghs Graphs Through Adjacency matrix are preferred due to its fast searching and for sparse graphs , Implementing graphs through lists are preffered.