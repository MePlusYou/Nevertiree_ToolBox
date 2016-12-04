package assignment.sofeware.bjfu.edu;

public class ProductCatalog{
	// move all information description to disc instead of using ArrayList<ProductDescription>
	public static ProductDescription getDescription(int itemId){
		return DescriptionDao.queryDescriptionById(itemId);
	}
}