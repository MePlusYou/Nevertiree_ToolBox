import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SpecialDAO extends BaseDAO {

    public SpecialDAO(){}

    public boolean insertNewUser(UserVO vo){
        String insertQuery= "replace into user (no,name,pwd) values(?,?,?)";

        boolean flag= false;

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(insertQuery);
            //set the ? as the specific value with getMethod of VO
            preparedStatement.setString(1,vo.getNo());
            preparedStatement.setString(2,vo.getName());
            preparedStatement.setString(3,vo.getPwd());

            int affectedCount=preparedStatement.executeUpdate();

            if (affectedCount>0)
                flag=true;

        }catch (Exception e){e.printStackTrace();}
        finally {
            closeMysql(connection);
        }
        return flag;
    }

    public String queryUserByName(String name){
        ResultSet resultSet=null;
        String majorid = null;
        String queryMajorByDetail="SELECT no AS userNo FROM user WHERE name=?";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(queryMajorByDetail);
            preparedStatement.setString(1,name);
            resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                userNo = resultSet.getString("userNo");
            }

        }catch (SQLException e){e.printStackTrace();}
        finally {
            closeMysql(connection);
            return userNo;
        }

    }




}