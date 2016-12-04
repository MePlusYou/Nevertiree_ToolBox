package assignment.sofeware.bjfu.edu;

public class ProductDescription{

	private String description;
	private int itemID;
	private BigDeciaml price;

	//description
	public void setDescription(String description){
		this.description = description;
	}
	public String getDescription(){
		return description;
	}
	//itemID
	public void setitemID(int itemID){
		this.itemID = itemID;
	}
	public int getItemID(){
		return itemID;
	}
	//price
	public void setPrice(BigDeciaml price){
		this.price = price;
	}

	public BigDeciaml getPrice(){
		return price;
	}

}