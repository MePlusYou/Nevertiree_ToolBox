public class LazyPrimMST{
	private boolean[] isMarked;
	private Queue<Edge> mst;
	private MinPQ<Edge> pq;

	public LazyPrimMST(EdgeWeightedGraph g){
		pq = new MinPQ<Edge>();
		isMarked = new boolean[g.getVertexNum()];
		mst = new Queue<Edge>();

		visit(g,0);
		while(!pq.isEmpty()){
			Edge e = pq.delMin();

			int v = e.either();
			int w = e.other(v);

			if (isMarked[v] && isMarked[w] ) continue;// skip the failure edge

			mst.enqueue(e);

			if (!isMarked[v]) visit(g,v);
			if (!isMarked[w]) visit(g,w);
		}
	}

	private void visit(EdgeWeightedGraph g, int v){
		isMarked[v] = true;
		for (Edge e :g.adj(v)) {
			if (!isMarked[e.other(v)]) {
				pq.insert(e);
			}
		}
	}

	public Iterable<Edge> getAllEdges(){
		return mst;
	}

}