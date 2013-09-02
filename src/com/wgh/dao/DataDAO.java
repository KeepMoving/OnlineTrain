package com.wgh.dao;

import com.wgh.core.ConnDB;
import java.sql.*;
import java.util.*;
import com.wgh.actionForm.DataForm;
public class DataDAO {
	private ConnDB conn=new ConnDB();
	 //添加数据
    public int insert(DataForm q) {
        String sql1="SELECT * FROM datas WHERE name='"+q.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        System.out.println("添加时的查询"+sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg = 2;
                } else {                	
                    sql = "INSERT INTO datas (name,link) values('" +q.getName()+"','"+q.getLink()+"')";
                    falg = conn.executeUpdate(sql);                    
                    System.out.println("添加ACM资料时的SQL：" + sql);
                    conn.close();
                }
            } catch (Exception ex) {
                falg=0;
            }finally{
            	conn.close();
            }
        return falg;
    }
    //查询资料
	public List query(int id,int srow) {
    	List datasList = new ArrayList();
    	DataForm datasForm = null;
        String sql="";       
        if(id==0){
            sql = "SELECT * FROM datas ORDER BY id DESC LIMIT "+srow+", 10 ";
        }else{
        	sql = "SELECT * FROM datas WHERE id=" +id+ "";
        	System.out.println(sql);
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
            	datasForm = new DataForm();
            	datasForm.setID(rs.getInt(1));                
            	datasForm.setName(rs.getString(2));
            	datasForm.setLink(rs.getString(3));
            	datasList.add(datasForm);
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        	
        }
        return datasList;
    }
//  修改数据acm资料的提交状况
    public int update(DataForm q){    	
       String sql="UPDATE datas SET name='"+q.getName()+"',link='"+q.getLink()+"' where id ='"+q.getID()+"'";
       int ret=conn.executeUpdate(sql);
       System.out.println("修改acm试题提交状况时的SQL："+sql);
       conn.close();
       return ret;
   }
//   删除数据
       public int delete(DataForm q) {
       	int flag=0;
       	String[] delId=q.getDelIdArray();
       	if (delId.length>0){
       		String id="";
       		for(int i=0;i<delId.length;i++){
       			id=id+delId[i]+",";
       		}
       		id=id.substring(0,id.length()-1);
               String sql = "DELETE FROM datas where id in (" + id +")";
               flag = conn.executeUpdate(sql);
               conn.close();
       	}else{
       		flag=0;
       	}
           return flag;      
       }
       
    public int findAllrow(){    	
    	int allrow = 0 ; 
    	String sql = "SELECT count(id) as allrow FROM datas ";
    	try {
    		ResultSet rs = conn.executeQuery(sql); 
    		while(rs.next()){
            allrow = rs.getInt(1); 
            System.out.println("总记录为"+allrow); 
    		}
    		rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }    	
    	return allrow;
    }
}
