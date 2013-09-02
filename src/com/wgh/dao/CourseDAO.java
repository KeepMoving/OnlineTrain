package com.wgh.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wgh.actionForm.CourseForm;
import com.wgh.core.ConnDB;

public class CourseDAO {
	private ConnDB conn=new ConnDB();
	//查询
    public List query(int id,int srow,String tname) {
    	List list = new ArrayList();
    	CourseForm course = null;
        String sql="";       
        if(id==0&&tname!=null){
            sql = "SELECT * FROM course WHERE teacher='"+tname+"' ORDER BY id DESC LIMIT "+srow+", 10 ";
        }else if(id==0&&tname==null){
        	sql = "SELECT * FROM course ORDER BY id LIMIT "+srow+", 10 ";
        }else{
        	sql = "SELECT * FROM course WHERE id=" +id+ " ";
        }                 
        try {
        	ResultSet rs = conn.executeQuery(sql); 
            while (rs.next()) {
            	course = new CourseForm();
            	course.setId(rs.getInt(1));
            	course.setCourse(rs.getString(2));
            	course.setTname(rs.getString(3));
            	if(id!=0){
            		course.setInfor(rs.getString(4).replaceAll("\n","<br>"));
            	}
            	course.setStart(rs.getString(5));
            	course.setEnd(rs.getString(6));
            	list.add(course);              
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();        	
        }       
        return list;
    }
    //修改
    public int update(CourseForm c){
    	String sql="UPDATE course SET start='"+c.getStart()+"', end='"+c.getEnd()+"',infor='"+c.getInfor().replaceAll("<br>","")+"' where id ="+c.getId()+" ";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改课程的sql:"+sql);
        conn.close();
        return ret;
    }
    //添加
    public int insert(CourseForm c) {
        String sql1="SELECT * FROM course WHERE course='"+c.getCourse()+"'"+" and teacher='"+c.getTname()+"'";
        ResultSet rs = conn.executeQuery(sql1);        
        int falg = 0;
        String sql;
	    try{
	        if (rs.next()) {
	            falg = 2;
	        } else {                	
	            sql = "INSERT INTO course (course,teacher,infor,start,end) values('"+ c.getCourse()+"','"+c.getTname()+"','"
	            		+c.getInfor().replaceAll("<br>","")+"','"+c.getStart()+"','"+c.getEnd()+"')";
	            falg = conn.executeUpdate(sql);                    
	            System.out.println("添加course的sql:" + sql);
	            conn.close();
	        }
	    } catch (Exception ex) {
	        falg=0;
	    }finally{
	    	conn.close();
	    }
	    return falg;
    }
    //
    public int fandAll(String tname){
    	int allrow = 0 ; 
    	String sql;
    	if(tname!=null){
    		sql= "SELECT count(id) as allrow FROM course WHERE teacher='"+tname+"'";
    	}else{
    		sql= "SELECT count(id) as allrow FROM course";
    	}
    	try {
    		ResultSet rs = conn.executeQuery(sql); 
    		while(rs.next()){
            allrow = rs.getInt(1); 
           // System.out.println("�ܼ�¼Ϊ"+allrow); 
    		}
    		rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }    	
    	return allrow;
    }  
    public int delete(int id){
    	int flag=0; 
    	try {
        String sql = "DELETE FROM course where id = " + id +" ";
        flag = conn.executeUpdate(sql);
        conn.close();
    	}catch(Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }    	
        return flag;      
    }
   
}
