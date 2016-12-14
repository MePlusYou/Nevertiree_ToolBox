public class BreadthFirstSearch{
	// whether the vertex is called dfs.
	private boolean[] isMarked;
	private int count;
	private int[] edgeTo;
	private final int start;

	public BreadthFirstSearch(Graph g,int start){
		isMarked = new boolean[g.getVertexNum()];
		edgeTo = new int[g.getEdgeNum()];
		this.start = start;
		bfs(g,start);
	}

	public int getCount(){
		return count++;
	}

	// Breadth First Search Core Code
	public void bfs(Graph g,int v){
		Queue<Integer> queue = new Queue<Integer>();
		isMarked[v] = true;
		queue.enqueue(v);
		// queue
		while(!queue.isEmpty()){
			int v = queue.dequeue();
			for (int w : g.adj(v))
				if(!isMarked[w]){
					edgeTo[w] = v;
					isMarked[w] = true;
					queue.enqueue(w);
				}
		}
	}

	public boolean hasPathTo(int v){
		return isMarked[v];
	}

	public Iterable<Integer> pathTo(int v){
		if (!hasPathTo(v)) return null;

		Stack<Integer> path = new Stack<Integer>();
		for (int x=v;x!=start;x=pathTo[x])
			path.push(x);
		path.push(start);

		return path;

	}

}