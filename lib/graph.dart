/// Defines the directionality of an edge in a graph.
enum EdgeType {
  /// An edge that goes in one direction from source to destination.
  direct,

  /// An edge that goes in both directions between vertices.
  undirected,
}

/// Represents a vertex (node) in a graph.
///
/// A vertex contains generic data and an index to identify it within the graph.
class Vertex<T> {
  /// Creates a vertex with the given [index] and [data].
  Vertex({required this.index, required this.data});

  /// The unique index of this vertex in the graph.
  final int index;

  /// The data stored in this vertex.
  final T data;

  @override
  String toString() => data.toString();
}

/// Represents an edge (connection) between two vertices in a graph.
///
/// An edge connects a [source] vertex to a [destination] vertex
/// and can have an optional [weight].
class Edge<T> {
  /// Creates an edge from [source] to [destination] with an optional [weight].
  Edge({required this.source, required this.destination, this.weight});

  /// The vertex where this edge starts.
  final Vertex<T> source;

  /// The vertex where this edge ends.
  final Vertex<T> destination;

  /// The weight of this edge, if any.
  /// This is typically used to represent costs or distances.
  final double? weight;
}

/// Abstract base class for a graph data structure.
///
/// A graph consists of vertices (nodes) connected by edges.
/// This class defines the interface for creating and manipulating graphs.
abstract class Graph<E> {
  /// Returns an iterable of all vertices in the graph.
  Iterable<Vertex<E>> get vertices;

  /// Creates and adds a new vertex with the given [data] to the graph.
  ///
  /// Returns the newly created vertex.
  Vertex<E> createVertex(E data);

  /// Adds an edge from [source] to [destination].
  ///
  /// The edge type can be specified with [edgeType]:
  /// - [EdgeType.direct]: creates a bidirectional edge (default)
  /// - [EdgeType.undirected]: creates a unidirectional edge
  ///
  /// An optional [weight] can be provided for weighted graphs.
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = .direct,
    double? weight,
  });

  /// Returns all edges originating from the given [source] vertex.
  List<Edge<E>> edges(Vertex<E> source);

  /// Returns the weight of the edge from [source] to [destination].
  ///
  /// Returns null if no edge exists or if the edge is unweighted.
  double? weight(Vertex<E> source, Vertex<E> destination);
}

/// A graph implementation using an adjacency list representation.
///
/// This implementation stores each vertex and its outgoing edges in a map,
/// making it efficient for sparse graphs with relatively few edges.
class AdjacencyList<E> implements Graph<E> {
  /// Maps each vertex to its list of outgoing edges.
  /// Used internally to store adjacency information.
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};

  /// Counter for generating unique vertex indices.
  /// Used internally to assign unique indices to vertices.
  var _newIndex = 0;

  @override
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = .undirected,
    double? weight,
  }) {
    _connections[source]?.add(
      Edge(source: source, destination: destination, weight: weight),
    );

    if (edgeType == .undirected) {
      _connections[destination]?.add(
        Edge(source: destination, destination: source, weight: weight),
      );
    }
  }

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(index: _newIndex, data: data);

    _newIndex++;

    _connections[vertex] = [];

    return vertex;
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    final Iterable<Edge<E>> match = edges(source).where((edge) {
      return edge.destination == destination;
    });

    if (match.isEmpty) return null;

    return match.first.weight;
  }

  @override
  String toString() {
    final result = StringBuffer();

    _connections.forEach((Vertex<E> vertex, List<Edge<E>> edges) {
      final destinations = edges.map((edge) => edge.destination).join(', ');
      result.writeln('$vertex --> $destinations');
    });

    return result.toString();
  }
}
