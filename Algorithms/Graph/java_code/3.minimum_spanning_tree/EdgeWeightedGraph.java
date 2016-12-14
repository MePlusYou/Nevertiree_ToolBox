import Edge;

public class EdgeWeightedGraph{
	// number of all vertexs
	private final int vertex;
	// number of all edges
	private final int edge;

	private Bag<Edge>[] adjacent;

	public EdgeWeightedGraph(int vertex){
		this.vertex = vertex;
		this.edge = 0;
		adjacent = (Bag<Edge>[]) new Bag[vertex];
		int vertexNum = getVertexNum();
		for (int v=0;v<vertexNum;v++)
			adjacent[v] = new Bag<Edge>();
	}

	public EdgeWeightedGraph(In in){
		this(in.readInt());
		this.edge = in.readInt();
		for (int i=0;i<edge;i++) {
			int v = in.readInt();
			int w = in.readInt();
			// connect two vertex
			addEdge(v,w);
		}
	}

	public int getVertexNum(){return vertex;}

	public int getEdgeNum(){return edge;}

	public void addEdge(Edge e){
		int v = e.either();
		int w = e.other(v);
		adjacent[v].add(e);
		adjacent[w].add(e);
		edge++;
	}

	// get all adjacent vertex(s) of one vertex
	public Iterable<Edge> adj(int vertex){
		return adjacent[vertex];
	}

	// get all edges of this edge weighted graph
	public Iterable<Edge> getAllEdges(){
		Bag<Edge> b = new Bag<Edge>();
		for (int v=0;v<vertex;v++) {
			for (Edge e: adj[v]) {
				if (e.other(v) > v) {
					b.add(e);
				}
			}
		}
		return b;
	}




}