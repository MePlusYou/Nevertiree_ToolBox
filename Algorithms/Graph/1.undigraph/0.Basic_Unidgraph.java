public class Graph{

	// number of vertex.
	private final int vertex;
	// number of edge.
	private int edge;
	// adjacent table
	private Bag<Integer>[] adjacent;

	// create a non-edge graph with V vertex.
	public Graph(int V){
		this.vertex = V;
		this.edge = 0;
		adjacent = (Bag<Integer>[]) new Bag<Integer>[V];
		for (int v=0;v<V ;v++) {
			adjacent[v] = new Bag<Integer>();
		}
	}

	// load a graph from stdin.
	public Graph(In in){
		// load vertex number, initial Graph using Graph(int V)
		this(in.readInt());
		// load edge number
		int edge = in.readInt();
		//add edges
		for (int i=0;i<edge;i++) {
			int v = in.readInt();
			int w = in.readInt();
			// connect two vertexs
			addEdge(v,w);
		}
	}

	public int getVertexNum(){
		return vertex;
	}

	public int getEdgeNum(){
		return edge;
	}

	// add edge from v to w
	public void addEdge(int v,int w){
		adjacent[v].add(w);
		adjacent[w].add(v);
		edge++;
	}

	// get all vertexs adjacent to vertex V.
	public Iterable<Integer> adj(int v){
		return adjacent[v];
	}

	public String toString(){
		int vertex_num = getVertexNum();

		String s = getVertexNum() + "vertice(s)" + getEdgeNum() + "edges\n";

		for (int v=0 ; v<vertex_num ;v++ ) {
			s += v + ": ";

			for (int w : this.adj(v))
				s += w + " ";

			s += "\n";
		}

		return s;
	}

	// get the degree of vertex V.
	public static int getDegree(Graph g,int v){
		int degree = 0;
		for(int w : g.adj(v))
			degree++;
		return degree;
	}

	// get the max degree of all vertex
	public static int getMaxDegree(Graph g){
		int max = 0;
		int vertex_num = g.getVertexNum();
		// find max degree
		for(int v=0; v < vertex_num ; v++)
			max = (getDegree(g,v) > max)?getDegree(g,v):max;

		return max;
	}

	// calculate the average degree of graph
	public static double getAvgDegree(Graph g){
		return 2.0*g.getEdgeNum()/getVertexNum();
	}

	// calculate number of self loops
	public static int getSelfLoopNum(Graph g){
		int count = 0;
		int vertex_num = g.getVertexNum();
		// find self loops
		for (int v = 0; v<vertex_num; v++)
			for (int w : g.adj(v))
				if (v == w)
					count++;

		return count/2;
	}

}