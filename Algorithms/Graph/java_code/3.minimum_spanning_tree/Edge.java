public class Edge implements Comparable<Edge>{
	private final int v;
	private final int w;
	private final double weight;

	public Edge(int v,int w;double weight){
		this.v = v;
		this.w = w;
		this.weight = weight;
	}

	public double getWeight(){
		return weight;
	}

	public int either(){
		return v;
	}

	public int other(int vertex){
		if (vertex == this.v) {
			return w;
		}else if (vertex == this.w) {
			return v;
		}else throw new RuntimeException("Inconsistent edge");
	}

	public int comparaTo(Edge that){
		if (this.getWeight() < that.getWeight()) {
			return -1;
		}else if (this.getWeight() > that.getWeight()) {
			return 1;
		}else
			return 0;
	}

	public String toString(){
		return String.format("%d-%d %.2f",v,w,getWeight());
	}

}