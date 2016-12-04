package assignment.sofeware.bjfu.edu;
public class Sale{

	private Date date;
	private boolean isComplete;

	public Sale(){
		this.date = new Date();// initial with current date
		this.isComplete = false;
	}

	public void becomeComplete(){
		this.isComplete = true;
	}

	public void makeLineItem(){

	}

}