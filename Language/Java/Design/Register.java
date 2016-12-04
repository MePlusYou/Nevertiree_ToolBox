package assignment.sofeware.bjfu.edu;

public class Register{

	public void endSale();

	public void enterItem(int id,int quantity){
		// get description of item from ProductCalalog
		ProductDescription desc = ProductCatalog.getDescription(id);
		// make new sale item
		Sale currentSale = new Sale();
		SalesLineItem slt = currentSale.makeLineItem(desc,quantity);
	}

	public void makeNewSale();

	public void makePayment();

}