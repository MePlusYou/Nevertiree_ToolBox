public class DepthFirstSearch extends Graph{
	// whether the vertex is called dfs.
	private boolean[] isMarked;
	// start point.
	private final int start;
	// the last point in the path from start to end.
	private int[] edgeTo;

	private int count;

	public DepthFirstSearch(Graph g,int start){
		isMarked = new boolean[g.getVertexNum()];
		edgeTo = new int[g.getEdgeNum()];
		this.start = start;
		dfs(g,start);
	}

	public int getCount(){
		return count++;
	}

	// Depth First Search Core Code
	public void	dfs(Graph g,int v){
		isMarked[v] = true;
		count++;
		for(int w : g.adj(v))
			if (!isMarked[w]){
				// Recursive DFS
				dfs(g,w);
				edgeTo[w] = v;
			}
	}

	public boolean hasPathTo(int v){
		return isMarked[v];
	}

	public Iterable<Integer> pathTo(int v){

		if (!hasPathTo(v)) return null;

		Stack<Integer> path = new Stack<Integer>();
		for (int x=v;x!=start;x=edgeTo[x])
			path.push(x);
		path.push(start);

		return path;
	}

}