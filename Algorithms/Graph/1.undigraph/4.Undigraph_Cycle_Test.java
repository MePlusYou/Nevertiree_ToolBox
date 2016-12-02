public class Cycle{
	private boolean[] isMarked;
	private boolean hasCycle;

	public Cycle(Graph g){
		isMarked = new boolean[g.getVertexNum()];
		int vertexNum;
		for (int v=0;v<vertexNum;v++) {
			if (!isMarked[v])
				dfs(g,s,s);
		}
	}

	private void dfs(Graph g,int v,int u){
		isMarked[v] = true;
		for (int w : g.adj(v)) {
			if (!isMarked[w])
				dfs(g,w,v);
			else if (w != u){
				hasCycle = true;
				return;
			}
		}
	}

	public boolean hasCycle(){
		return hasCycle;
	}
}