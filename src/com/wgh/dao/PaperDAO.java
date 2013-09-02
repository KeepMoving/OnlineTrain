package com.wgh.dao;

import com.wgh.actionForm.PaperForm;
import com.wgh.actionForm.QuestionsForm;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class PaperDAO {
	private ConnDB conn=new ConnDB();
	 //查询方法
    public List query(int id,int cid,int srow) {
    	List plist = new ArrayList();    	
    	PaperForm pform = null;
    	String sql="";       
        if(id==0){
            sql = "SELECT * FROM papers WHERE cid="+cid+" ORDER BY type ,id DESC LIMIT "+srow+", 10 ";
        }else{
        	sql = "SELECT * FROM papers WHERE id=" +id+ " ";
        }
        try {
        	ResultSet rs = conn.executeQuery(sql); 
            while (rs.next()) {
            	pform = new PaperForm();
            	pform.setId(rs.getInt(1));
            	pform.setTitle(rs.getString(2));
            	pform.setType(rs.getString(3));
            	pform.setState(rs.getString(4));
            	pform.setAlltime(rs.getString(5));
            	pform.setStime(rs.getString(6));
            	if(iftime(pform)==1){
            		pform.setState("进行中");	            		
            	}else if(iftime(pform)==2){
            		pform.setState("已结束");	            		
            	}else{
            		pform.setState("未开始");
            	}
            	pform.setSingle(rs.getString(7));
            	pform.setMore(rs.getString(8));
            	pform.setSlist(rs.getString(9));
            	pform.setMlist(rs.getString(10));
            	pform.setCid(rs.getInt(11));
            	pform.setCouse(rs.getString(12));
            	plist.add(pform);
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();       	
        }
        return plist;    	
    }
    //修改试卷
    public int update(PaperForm pf){
    	String sql="UPDATE papers SET title='"+pf.getTitle()+"',type='"+pf.getType()+"',state='"+pf.getState()+"',alltime='"+pf.getAlltime()+"',stime='"+
    				pf.getStime()+"',single='"+pf.getSingle()+"',more='"+pf.getMore()+"' where id ='"+pf.getId()+"'";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改教学试卷的SQL："+sql);
        conn.close();
        return ret;
    }
    //添加试卷
    public int insert(PaperForm pf){
    	 String sql1="SELECT title FROM papers WHERE title ='"+pf.getTitle()+"'";
         ResultSet rs = conn.executeQuery(sql1);
         System.out.println("添加时的查询"+sql1);
         String sql = "";      
         int falg = 0;
             try {
                 if (rs.next()) {
                     falg = 2;
                 } else {                	
                     sql = "INSERT INTO papers (title,type,state,alltime,stime,single,more,slist,mlist,cid,course) values('" +
                     		pf.getTitle()+"','"+pf.getType()+"','"+pf.getState()+"','"+pf.getAlltime()+"','"+pf.getStime()+"','"+pf.getSingle()+"','"
                            +pf.getMore()+"','"+pf.getSlist()+"','"+pf.getMlist()+"','"+pf.getCid()+"','"+pf.getCouse()+"')";                             
                     falg = conn.executeUpdate(sql);                    
                     System.out.println("添加测试试卷的SQL：" + sql);
                     conn.close();
                }
             } catch (Exception ex) {
                 falg=0;
             }finally{
             	conn.close();
             }
         return falg;
    }
    //查找总行数
    public int findAllrow(int cid){
    	int allrow = 0 ;    	   	
    	try {
    		ResultSet rs = conn.executeQuery("SELECT count(id) as allrow FROM papers WHERE cid="+cid+" "); 
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
  //查找总行数
    public int findByTitle(String title){
    	int allrow = 0 ;    	   	
    	try {
    		ResultSet rs = conn.executeQuery("SELECT count(id) as allrow FROM papers WHERE title='"+title+"' "); 
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
    //删除数据
    public int delete(String id) {
    	int flag=0; 
    	try {
        String sql = "DELETE FROM papers where id = " + id +" ";
        flag = conn.executeUpdate(sql);
        conn.close();
    	}catch(Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }    	
        return flag;      
    }
    
    public int delByCid(int cid){
    	int flag = 0;
		try{
			String sql = "DELETE FROM papers WHERE cid ="+cid+" ";
			flag = conn.executeUpdate(sql);
			conn.close();
		}catch(Exception e){
			flag=0;
		}finally{
			conn.close();
		}
		return flag;
	}
  //查询试卷状态是否应该更改
    public int iftime(PaperForm pf){
    	int flag=0;
    	Date ndate = new Date();
    	Date odate;
    	SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	try{
    		String[] t =pf.getAlltime().split(":");
    		int am = (int)(Integer.parseInt(t[0])*60+Integer.parseInt(t[1]));
    		odate = myFormatter.parse(pf.getStime());
    		long diff = ndate.getTime() - odate.getTime();    		
    		if((diff/1000/60)>am){
    			flag = 2;
    		}else if(0<=diff&&(diff/1000/60)<=am){
    			flag = 1;
    		}else{
    			flag = 0;
    		}
    	}catch(ParseException e){ e.printStackTrace();}
    	return flag;
    }
    
}
