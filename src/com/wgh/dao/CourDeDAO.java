package com.wgh.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wgh.actionForm.CourDeForm;
import com.wgh.core.ConnDB;

public class CourDeDAO {
	private ConnDB conn=new ConnDB();

	public int add(CourDeForm cd){
		int falg = 0;
        try {                    	
            String sql = "INSERT INTO coursedetail (cid,tname,fname,ftime,url) values("+cd.getCid()+",'"
            	+cd.getTname()+"','"+cd.getFname()+"','"+cd.getFtime()+"','"+cd.getUrl()+"')";
            falg = conn.executeUpdate(sql);                    
            System.out.println("添加课程文档时的SQL：" + sql);
            conn.close();      
        } catch (Exception ex) {
            falg=0;
        }finally{
        	conn.close();
        }
    return falg;
	}
	
	public List Query(int id,int cid,int srow){
		List list = new ArrayList();
    	CourDeForm code = null;
        String sql="";       
        if(id==0){
            sql = "SELECT * FROM coursedetail WHERE cid = "+cid+" ORDER BY id DESC LIMIT "+srow+", 10 ";
        }else{
        	sql = "SELECT * FROM coursedetail WHERE id=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);          
        try {
            while (rs.next()) {
            	code = new CourDeForm();
            	code.setId(rs.getInt(1));
            	code.setCid(rs.getInt(2));
            	code.setTname(rs.getString("tname"));
            	code.setFname(rs.getString("fname"));
            	code.setFtime(rs.getString("ftime"));
            	code.setUrl(rs.getString("url"));
            	list.add(code);              
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();        	
        }
        return list;		
	}

	public int fandAll(int cid){
		int allrow = 0 ; 
    	String sql = "SELECT count(id) as allrow FROM coursedetail WHERE cid ="+cid+" ";    	
    	try {
    		ResultSet rs = conn.executeQuery(sql); 
    		while(rs.next()){
    			allrow = rs.getInt(1); 
           	}
    		rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }    	
    	return allrow;	
	}
	//添加文档时的查询
	public int fandbyname(String fname){
		int flag = 0;
		String sql = "SELECT count(id) as allrow FROM coursedetail WHERE fname='"+fname+"'";
    	try {
	    		ResultSet rs = conn.executeQuery(sql); 
	    		while(rs.next()){
	            flag = rs.getInt(1); 
	            System.out.println("flag="+flag);
    		}
    		rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        } 		
		return flag;
	}
	//删除课程详细 文档
	public int delete(String id){
		int flag = 0;
		String sql = "DELETE FROM coursedetail WHERE id="+id+" ";
    	try {
	    	flag= conn.executeUpdate(sql);    		
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }
		return flag;
	}
	public int delByCid(int cid){
		int flag = 0;
		String sql = "DELETE FROM coursedetail WHERE cid="+cid+" ";
    	try {
	    	flag= conn.executeUpdate(sql);    		
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }
		return flag;
	}
	public int delByUrl(String url){
		int flag = 0;
		String sql = "DELETE FROM coursedetail WHERE url='"+url+"' ";
    	try {
	    	flag= conn.executeUpdate(sql);    		
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }
		return flag;
	}
}
