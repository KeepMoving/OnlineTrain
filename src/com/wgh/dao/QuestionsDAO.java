package com.wgh.dao;

import com.wgh.actionForm.QuestionsForm;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.util.*;

public class QuestionsDAO {
	private ConnDB conn=new ConnDB();
    //添加数据
    public int insert(QuestionsForm q) {
        String sql1="SELECT * FROM questions WHERE title='"+q.getTitle()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        System.out.println("添加时的查询"+sql1);
        String sql = "";
        String answer="";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                	if(q.getType().equals("多选题")){
	            		String[] mOption=(String [])q.getAnswerArr();
	                	if (mOption.length>0){
	                		String str="";
	                		for(int i=0;i<mOption.length;i++){
	                			str=str+mOption[i];
	                		}
	                		answer=str;
	                	  }
	                	}else{
	                		answer=q.getAnswer();
	                	}
                    sql = "INSERT INTO questions (title,type,optionA,optionB,optionC,optionD,answer,note,cid) values('" +
                                 q.getTitle() +"','"+q.getType()+"','"+q.getOptionA()+"','"+q.getOptionB()+"','"+q.getOptionC()+"','"+
                                 q.getOptionD()+"','"+answer+"','"+q.getNote()+"',"+q.getCid()+")";
                    falg = conn.executeUpdate(sql);
                    System.out.println("添加考试题目时的SQL：" + sql);
                    conn.close();
                }
              
             } catch (Exception ex) {
                falg=0;
            }finally{
            	conn.close();
            }
        return falg;
    }
    //查询方法
    public List query(int id,int cid,int srow) {
    	List questionsList = new ArrayList();
        QuestionsForm questionsForm1 = null;
        String sql="";       
        if(id==0){
            sql = "SELECT * FROM questions WHERE cid= "+cid+" ORDER BY type ,id DESC LIMIT "+srow+", 10 ";
        }else{
        	sql = "SELECT * FROM questions WHERE id=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);          
        try {
            while (rs.next()) {
                questionsForm1 = new QuestionsForm();
                questionsForm1.setID(rs.getInt(1));                
                questionsForm1.setTitle(rs.getString(2));
                questionsForm1.setType(rs.getString(3));                
                questionsForm1.setOptionA(rs.getString(4));
                questionsForm1.setOptionB(rs.getString(5));
                questionsForm1.setOptionC(rs.getString(6));
                questionsForm1.setOptionD(rs.getString(7));
                questionsForm1.setAnswer(rs.getString(8));
                questionsForm1.setNote(rs.getString(9)); 
                questionsForm1.setCid(rs.getInt(10));
                questionsList.add(questionsForm1);
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();        	
        }
        return questionsList;
    }
    //学生练习时试题查询
    public List stexequery( int srow,int cid, String type) {    
    	List questionsList = new ArrayList();
        QuestionsForm questionsForm1 = null;
        String sql = null;
        if("1".equals(type)){
        	sql = "SELECT * FROM questions WHERE cid="+cid+" AND type LIKE '%单选题%' LIMIT "+srow+", 5 ";        	
        }else{
        	sql = "SELECT * FROM questions WHERE cid="+cid+" AND type = '多选题' LIMIT "+srow+", 5 ";
        }        
		System.out.println(sql);        
        try {
        	ResultSet rs = conn.executeQuery(sql);
            while (rs.next()) {
                questionsForm1 = new QuestionsForm();
                questionsForm1.setID(rs.getInt(1));                
                questionsForm1.setTitle(rs.getString(2));                            
                questionsForm1.setType(rs.getString(3));                
                questionsForm1.setOptionA(rs.getString(4));
                questionsForm1.setOptionB(rs.getString(5));
                questionsForm1.setOptionC(rs.getString(6));
                questionsForm1.setOptionD(rs.getString(7));
                questionsForm1.setAnswer(rs.getString(8));
                questionsForm1.setNote(rs.getString(9)); 
                questionsForm1.setCid(rs.getInt(10));
                questionsList.add(questionsForm1);
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();        	
        }
        System.out.println("试题数目："+questionsList.size());
        return questionsList;
	}
    //查询总记录
    public int findAllrow(int i,int cid){
    	int allrow = 0 ; 
    	String sql = null;
    	if(i==0){
    		sql = "SELECT count(id) as allrow FROM questions WHERE cid="+cid+" ";
    	}else if(i==1){
    		sql = "SELECT count(id) as allrow FROM questions WHERE cid="+cid+" AND type = '单选题'";
    	}else{
    		sql = "SELECT count(id) as allrow FROM questions WHERE cid="+cid+" ANDtype = '多选题'";
    	}
    	try {
    		ResultSet rs = conn.executeQuery(sql); 
    		while(rs.next()){
            allrow = rs.getInt("allrow"); 
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
    //制作试卷时查询1
    public List paquery(int srow,int cid,String type){    	   
    	List questionsList = new ArrayList();
        QuestionsForm questionsForm1 = null;
        String sql = null;
        if("1".equals(type)){
        	sql = "SELECT * FROM questions WHERE cid="+cid+" AND type = '单选题' ORDER BY id DESC LIMIT "+srow+", 5";
        }else{
        	sql = "SELECT * FROM questions WHERE cid="+cid+" AND type = '多选题' ORDER BY id DESC LIMIT "+srow+", 100 ";
        }
		ResultSet rs = conn.executeQuery(sql);          
        try {
            while (rs.next()) {
                questionsForm1 = new QuestionsForm();
                questionsForm1.setID(rs.getInt(1));                
                questionsForm1.setTitle(rs.getString(2));                            
                questionsForm1.setType(rs.getString(3));                
                questionsForm1.setOptionA(rs.getString(4));
                questionsForm1.setOptionB(rs.getString(5));
                questionsForm1.setOptionC(rs.getString(6));
                questionsForm1.setOptionD(rs.getString(7));
                questionsForm1.setAnswer(rs.getString(8));
                questionsForm1.setNote(rs.getString(9)); 
                questionsForm1.setCid(rs.getInt(10));
                questionsList.add(questionsForm1);
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        	
        }
        return questionsList;
    }
    //试卷测试时的查询
    public List tpaquery(String ql){
    	List questionsList = new ArrayList();
        QuestionsForm questionsForm1 = null;       
        String sql = "SELECT * FROM questions WHERE id in ("+ql+") ";        
        ResultSet rs = conn.executeQuery(sql);          
        try {
            while (rs.next()) {
                questionsForm1 = new QuestionsForm();
                questionsForm1.setID(rs.getInt(1));                
                questionsForm1.setTitle(rs.getString(2));
                questionsForm1.setType(rs.getString(3));                
                questionsForm1.setOptionA(rs.getString(4));
                questionsForm1.setOptionB(rs.getString(5));
                questionsForm1.setOptionC(rs.getString(6));
                questionsForm1.setOptionD(rs.getString(7));
                questionsForm1.setAnswer(rs.getString(8));
                questionsForm1.setNote(rs.getString(9));
                questionsForm1.setCid(rs.getInt(10));
                questionsList.add(questionsForm1);
            }
            rs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();        	
        }
        return questionsList;    	
    }
    //查询试题
    public List search(QuestionsForm q) {
    	List questionsList = new ArrayList();
        QuestionsForm questionsForm1 = null;
        String sql="";
        if("type".equals(q.getOptionA())){
        	sql = "SELECT * FROM questions where type = '"+q.getOptionB()+"' ORDER BY id DESC ";
        }else{
        	sql = "SELECT * FROM questions WHERE title LIKE '%" +q.getOptionB()+"%' ORDER BY type,id DESC ";
        }
        ResultSet rs = conn.executeQuery(sql);          
        try {
            while (rs.next()) {
                questionsForm1 = new QuestionsForm();
                questionsForm1.setID(rs.getInt(1));                
                questionsForm1.setTitle(rs.getString(2));
                questionsForm1.setType(rs.getString(3));                
                questionsForm1.setOptionA(rs.getString(4));
                questionsForm1.setOptionB(rs.getString(5));
                questionsForm1.setOptionC(rs.getString(6));
                questionsForm1.setOptionD(rs.getString(7));
                questionsForm1.setAnswer(rs.getString(8));
                questionsForm1.setNote(rs.getString(9));
                questionsForm1.setCid(rs.getInt(10));
                questionsList.add(questionsForm1);
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }finally{
        	conn.close();
        }
        return questionsList;
    }
    //修改数据
    public int update(QuestionsForm q){
    	String answer="";
       	if(q.getType().equals("多选题")){
    		String[] mOption=(String [])q.getAnswerArr();
        	if (mOption.length>0){
        		String str="";
        		for(int i=0;i<mOption.length;i++){
        			str=str+mOption[i];
        		}
        		answer=str;
        	}
    	}else{
    		answer=q.getAnswer();
    	}
       	if(q.getNote()==null){q.setNote("null");}
        String sql="UPDATE questions SET title='"+q.getTitle()+"',type='"+q.getType()+"',optionA='"+q.getOptionA()+"',optionB='"+q.getOptionB()+"',optionC='"+
        		q.getOptionC()+"',optionD='"+q.getOptionD()+"',answer='"+answer+"',note='"+q.getNote()+"' where id="+q.getID()+" ";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改考试题目时的SQL："+sql);
        conn.close();
        return ret;
    }
   
//    删除数据
    public int delete(QuestionsForm questionsForm) {
        	int flag=0;
        	String[] delId=questionsForm.getDelIdArray();
        	if (delId.length>0){
        		String id="";
        		for(int i=0;i<delId.length;i++){
        			id=id+delId[i]+",";
        		}
        		id=id.substring(0,id.length()-1);
                String sql = "DELETE FROM questions where id in (" + id +")";
                flag = conn.executeUpdate(sql);
                conn.close();
        	}else{
        		flag=0;
        	}
            return flag;
        }
    public int delByCid(int cid){
        	int flag = 0;
    		try{
    			String sql = "DELETE FROM questions WHERE cid ="+cid+" ";
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
