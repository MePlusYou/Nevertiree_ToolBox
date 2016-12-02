public class Graph{

	private int vertex;
	private int edge
	private Bag<Integer>[] adjacent;

	// create a non-edge graph with V vertex
	public Graph(int V){
		this.vertex = V;
		this.edge = 0;
		adjacent = (Bag<Integer>[]) new Bag<Integer>[V];
		for (int v=0;v<V;v++) {
			adjacent[v] = new Bag<Integer>();
		}
	}

	public Graph(In in){
		// load vertex number, initial Graph using Graph(int V)
		this(in.readInt());
		int edge = in.readInt();
		// add edges
		for (int i=0;i<edge;i++) {
			int v = in.readInt();
			int w = in.readInt();
			addEdge(v,w);
		}

	}

	public int getVertexNum(){return vertex;}

	public int getEdgeNum(){return edge;}

	// add edge from v to w
	public void addEdge(int v,int w){
		adjacent[v].add(w);
		edge++;
	}

	// get all vertexs adjacent to vertex V.
	public Iterable<Integer> adj(int v){
		return adjacent[v];
	}

	public Graph reverse(){
		Graph reverseGraph = new Graph(vertex);
		for (int v=0;v<vertex;v++)
			for (int w : adj(v))
				reverseGraph.addEdge(w,v);
		return reverseGraph;
	}

}