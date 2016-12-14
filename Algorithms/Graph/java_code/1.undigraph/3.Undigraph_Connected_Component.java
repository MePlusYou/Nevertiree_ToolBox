public class ConnectedComponent{

	private boolean[] isMarked;

	private int[] componentId;

	private int count;

	public ConnectedComponent(Graph g){
		isMarked = new boolean[g.getVertexNum()];
		componentId = new componentId[g.getVertexNum()];

		int vertexNum = g.getVertexNum();
		for (int v=0;v<vertexNum;v++) {
			if (!isMarked[v]) {
				dfs(g,v);
				count++;// every connected component has same id;
			}
		}
	}

	public void dfs(Graph g,int v){
		isMarked[v] = true;
		componentId[v] = count; // tirck
		for (int w : g.adj(v)) {
			if(!isMarked[w]){
				dfs(g,w);
			}
		}
	}

	public boolean connected(int v,int w){
		return componentId[v] == componentId[w];
	}

	public int getComponentId(int v){
		return componentId[v];
	}

	public int getCount(){
		return count;
	}
}