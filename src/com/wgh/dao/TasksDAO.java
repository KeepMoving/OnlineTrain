package com.wgh.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wgh.actionForm.CourDeForm;
import com.wgh.actionForm.TaskForm;
import com.wgh.core.ConnDB;

public class TasksDAO {
	private ConnDB conn=new ConnDB();
	
	//添加insert
	public int insert(TaskForm tf){
		int flag = 0;
		try {                    	
            String sql = "INSERT INTO tasks (cid,student,teacher,name,url,time) values("+tf.getCid()+",'"
            	+tf.getStudent()+"','"+tf.getTeacher()+"','"+tf.getName()+"','"+tf.getUrl()+"','"+tf.getTime()+"')";
            flag = conn.executeUpdate(sql);
            conn.close();      
        } catch (Exception ex) {
            flag=0;
        }finally{
        	conn.close();
        }
    return flag;
	}
	
	//删除delete
	public int delete(int id){
		int flag = 0;
		try{
			String sql = "DELETE FROM tasks WHERE id ="+id+" ";
			flag = conn.executeUpdate(sql);
			conn.close();
		}catch(Exception e){
			flag=0;
		}finally{
			conn.close();
		}
		return flag;
	}

	public List query(int id,int cid,String name,int srow){
		List list = new ArrayList();
    	TaskForm task = null;
        String sql="";       
        if(id==0&&name==null){
            sql = "SELECT * FROM tasks WHERE cid = "+cid+" ORDER BY id DESC LIMIT "+srow+", 10 ";
        }else if(id==0&&name!=null){
        	sql = "SELECT * FROM tasks WHERE cid = "+cid+" and student='"+name+"'ORDER BY id DESC LIMIT "+srow+", 10 ";        	
        }else{
        	sql = "SELECT * FROM tasks WHERE id=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);          
        try {
            while (rs.next()) {
            	task = new TaskForm();
            	task.setId(rs.getInt(1));
            	task.setCid(rs.getInt(2));
            	task.setStudent(rs.getString(3));
            	task.setTeacher(rs.getString(4));
            	task.setName(rs.getString(5));
            	task.setUrl(rs.getString(6));
            	task.setTime(rs.getString(7));
            	task.setMark(rs.getInt(8));
            	list.add(task);              
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
    	String sql = "SELECT count(id) as allrow FROM tasks WHERE cid ="+cid+" ";
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

	//修改作业分数
	public List upMark(int tid,int mark,int cid,int srow){
		List list = new ArrayList();
		String sql="UPDATE tasks SET mark="+mark+" where id ="+tid+" ";
		int ret=conn.executeUpdate(sql);	      
	    if(ret!=1){
	       list = null;
	    }else{
	       list=query(0,cid,null,srow);
	    }
	       conn.close();	      
		return list;
	}

	//添加文档时的查询
	public int fandbyname(String fname){
		int flag = 0;
		String sql = "SELECT count(id) as allrow FROM tasks WHERE fname='"+fname+"'";
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
	public int delByCid(int cid){
		int flag = 0;
		try{
			String sql = "DELETE FROM tasks WHERE cid ="+cid+" ";
			flag = conn.executeUpdate(sql);
			conn.close();
		}catch(Exception e){
			flag=0;
		}finally{
			conn.close();
		}
		return flag;
	}
	public int delByUrl(String url){
		int flag = 0;
		try{
			String sql = "DELETE FROM tasks WHERE url ='"+url+"' ";
			flag = conn.executeUpdate(sql);
			conn.close();
		}catch(Exception e){
			flag=0;
		}finally{
			conn.close();
		}
		return flag;
	}
}
