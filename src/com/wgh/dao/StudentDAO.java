package com.wgh.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wgh.actionForm.StudentForm;
import com.wgh.core.ChStr;
import com.wgh.core.ConnDB;
public class StudentDAO {
	private ConnDB conn=new ConnDB();
	private ChStr chStr=new ChStr();
    //考生身份验证
    public int checkStudent(StudentForm studentForm) {
        int flag = 1;
        String sql = "SELECT * FROM student where authorid='"+studentForm.getAuthorid()+"'";
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                String pwd = studentForm.getPwd();
                if (pwd.equals(rs.getString(5))) {
                    rs.last();
                    int rowSum = rs.getRow();	//获取记录总数
                    rs.first();
                    if (rowSum!=1) {
                        flag = 2;
                    //    System.out.print("获取row的值：" + sql + rowSum);
                    }
                } else {
                    flag = 2;
                }
            }else{
                flag = 2;
            }
        } catch (Exception ex) {
            flag = 2;
            System.out.println(ex.getMessage());
        }
        return flag;
    }
	
    //添加数据   以学号和编号为依据查询数据库看是否已注册
    public String insert(StudentForm s) {
        String sql1="SELECT * FROM student WHERE studentid='"+s.getStudentid()+"'";
        ResultSet rs = conn.executeQuery(sql1);							
        String sql2="SELECT * FROM student WHERE authorid='"+s.getAuthorid()+"'";
        ResultSet rs2 = conn.executeQuery(sql2);  					//执行SQL查询语句
        String sql = "";
        String falg = "miss";									//用于记录返回信息的变量    
            try {
                if (rs.next()) {											//假如存在记录
                    falg="re";										//表示考生信息已经注册
                }else if(rs2.next()){
                	falg="reid";
                } else {    			
              		sql = "INSERT INTO student(authorid,studentid,name,pwd,question,answer,contact) values('"
                          +s.getAuthorid()+"','"+s.getStudentid()+"','"+s.getName()+"','"+s.getPwd()+"','"+s.getQuestion()+
                                 "','"+s.getAnswer()+"','"+s.getContact()+"')";
                    int ret= conn.executeUpdate(sql);					//保存考生注册信息
                    if(ret==0){
                    	falg="miss";									//表示考生注册失败
                    }else{
                    	falg="恭喜您，注册成功!\\r请用你的用户ID重新登陆！";	//返回生成的准考证号
                    }
                    conn.close();											//关闭数据库连接
                }
            } catch (Exception e) {
                falg="miss";
                System.out.println("添加考生信息时的错误信息："+e.getMessage());	//输出错误提示信息到控制台
            }
        return falg;
    }
 
    //查询方法
    public List query(String id,int srow) {    	
        StudentForm studentForm1 = null;
        List studentlist = new ArrayList();
        String sql="";
        if(id==null ||id.equals("")){
            sql = "SELECT * FROM student ORDER BY id DESC LIMIT "+srow+", 10 ";
        }else{
        	sql = "SELECT * FROM student WHERE authorid='" +id+ "'";
        }
        try {
        	ResultSet rs = conn.executeQuery(sql);        
            while (rs.next()) {
                studentForm1 = new StudentForm();
                studentForm1.setId(rs.getInt(1));
                studentForm1.setAuthorid(rs.getString(2));
                studentForm1.setStudentid(rs.getString(3));
                studentForm1.setName(rs.getString(4));
                studentForm1.setPwd(rs.getString(5));
                studentForm1.setOldpwd(rs.getString(5));
                studentForm1.setQuestion(rs.getString(6));
                studentForm1.setAnswer(rs.getString(7));
                studentForm1.setContact(rs.getString(8));
                studentlist.add(studentForm1);
            }
        } catch (Exception ex) {}
        return studentlist;
    }
    
    //查询数据库的总记录数
    public int findAllrow(){
    	int allrow = 0 ;    	   	
    	try {
    		ResultSet rs = conn.executeQuery("SELECT count(id) as allrow FROM student "); 
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
    //修改考生资料
    public int update(StudentForm s){
        String sql="UPDATE student SET pwd='"+s.getPwd()+"',name='"+s.getName()+"',question='"+s.getQuestion()+"',answer='"+s.getAnswer()+"',contact='"+
        s.getContact()+"' where authorid='"+s.getAuthorid()+"'";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改考生资料时的SQL："+sql);
        conn.close();
        return ret;
    }
//找回密码（第一步）
    public StudentForm seekPwd1(StudentForm s){
    	String sql="SELECT * FROM student WHERE studentid='"+s.getStudentid()+"'";
        ResultSet rs = conn.executeQuery(sql);
            try {
                if (rs.next()) {
                    s.setAuthorid(rs.getString(2));
                    s.setQuestion(rs.getString(6));
                }else{
                	s.setAuthorid("null");
                }
            }catch(Exception e){
            	System.out.println("找回密码（第一步）出现的错误信息："+e.getMessage());
            }
            return s;
    }
//  找回密码（第二步）
    public StudentForm seekPwd2(StudentForm s){
    	String sql="SELECT * FROM student WHERE studentid='"+s.getStudentid()+"'";
    	System.out.println("SQL"+sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                	String authorid=rs.getString(2);
                	String pwd=rs.getString(5);
                	String answer=rs.getString(7);
                	if(answer.equals(s.getAnswer())){
                		s.setAuthorid(authorid);
                		s.setPwd(pwd);
                		System.out.println("密码："+pwd);
                	}else{
                		s.setAuthorid("");
                	}
                }
            }catch(Exception e){
            	System.out.println("找回密码（第二步）出现的错误信息："+e.getMessage());
            }
            return s;
    }
//    删除数据
        public int delete(StudentForm studentForm) {
        	int flag=0;
        	String[] delId=studentForm.getDelIdArray();
        	if (delId.length>0){
        		String id="";
        		for(int i=0;i<delId.length;i++){
        			id=id+delId[i]+",";
        		}
        		id=id.substring(0,id.length()-1);        		
                String sql = "DELETE FROM student where id in (" + id +")";               
                flag = conn.executeUpdate(sql);
                System.out.println("删除时的SQL："+sql);
                conn.close();
        	}else{
        		flag=0;
        	}
            return flag;
        }
}
