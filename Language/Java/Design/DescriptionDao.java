package assignment.sofeware.bjfu.edu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DescriptionDao extends BaseDao{

    public DescriptionDao(){}

    public static ProductDescription queryDescriptionById(int itemId){

		ProductDescription description = new ProductDescription();

        try {
        	//try to connect mysql with the connectMysql method
            //prepare and execute SQL query
            String selectQuery = "select * from ProductDescription where itemId = ? ";
            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setString(1,itemId);

			preparedStatement.addBatch();
            preparedStatement.executeBatch();
            connection.commit();

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                description.setDescription(resultSet.getString("description"));
                description.setitemID(resultSet.getInt("itemId"));
                description.setPrice(new BigDecimal(resultSet.getInt("price")));
            }
            //closeMysql(connection);
            return description;

        }catch (SQLException e){e.printStackTrace();}
        finally {
        	closeMysql(connection);
		}
        return null;
    }

}
