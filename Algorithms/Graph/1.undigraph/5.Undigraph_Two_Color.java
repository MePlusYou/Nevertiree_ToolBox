public class TwoColor{
	private boolean[] isMarked;
	private boolean[] color;
	private boolean isTwoColorable = true;

	public TwoColor(Graph g){
		isMarked = new boolean[g.getVertexNum()];
		color = new boolean[g.getVertexNum()];
		int vertexNum = g.getVertexNum();
		for (int v=0;v<vertexNum;v++)
			if (!isMarked[v])
				dfs(g.v);

	}

	private void dfs(Graph g,int v){
		isMarked[v] = true;
		for (int w:g.adj(v)) {
			if (!isMarked[w]) {
				color[w] = !color[v];
				dfs(g,w);
			}else if (color[w] == color[v]) {
				isTwoColorable = false;
				return;
			}
		}
	}

	public boolean isBipartite(){
		return isTwoColorable;
	}
}