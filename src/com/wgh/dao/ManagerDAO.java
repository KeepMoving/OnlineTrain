package com.wgh.dao;

import com.wgh.actionForm.ManagerForm;
import com.wgh.core.ConnDB;
import java.sql.*;
import java.util.*;

public class ManagerDAO {
	private ConnDB conn=new ConnDB();
    //管理员身份验证
    public int checkManager(ManagerForm managerForm) {
        int flag = 1;
        String sql = "SELECT * FROM tb_manager where name='"+managerForm.getName()+ "' and pwd='"+managerForm.getPwd()+"'";
        try {
        	ResultSet rs = conn.executeQuery(sql);
        	if(rs.next()){
        		flag = 1;
        	}else{
        		flag = 0;
        	}
        } catch (SQLException ex) {
            flag = 0;
            System.out.println(ex.getMessage());
        }
        return flag;
    }
    //添加数据
    public int insert(ManagerForm managerForm) {
        String sql1="SELECT * FROM tb_manager WHERE name='"+managerForm.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_manager (name,pwd) values('" +
                                 managerForm.getName() + "','" +
                                 managerForm.getPwd() +
                                 "')";
                    falg = conn.executeUpdate(sql);
                    System.out.println("添加管理员信息的SQL：" + sql);
                    conn.close();
                }
            } catch (SQLException ex) {
                falg=0;
            }
        return falg;
    }
    //查询方法
    public List query(int id) {
    	List managerList = new ArrayList();
        ManagerForm managerForm1 = null;
        String sql="";
        if(id==0){
            sql = "SELECT * FROM tb_manager";
        }else{
        	sql = "SELECT * FROM tb_manager WHERE id=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setID(rs.getInt(1));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerList.add(managerForm1);
            }
        } catch (SQLException ex) {}
        return managerList;
    }
    //修改管理员密码
    public int updatePwd(ManagerForm managerForm){
        String sql="UPDATE tb_manager SET pwd='"+managerForm.getPwd()+"' where name='"+managerForm.getName()+"'";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改管理员密码时的SQL："+sql);
        conn.close();
        return ret;
    }

//    删除数据
        public int delete(ManagerForm managerForm) {
            String sql = "DELETE FROM tb_manager where id=" + managerForm.getID() +"";
            int flag = conn.executeUpdate(sql);
            conn.close();
            return flag;
        }
        public ManagerForm findByName(String name){
        	String sql = "SELECT * FROM tb_manager WHERE name='" +name+ "' ";        	 
        	 ManagerForm managerForm1 = null ;
             try {
            	 ResultSet rs = conn.executeQuery(sql);
                 while (rs.next()) {
                     managerForm1 = new ManagerForm();
                     managerForm1.setID(rs.getInt(1));
                     managerForm1.setName(rs.getString(2));
                     managerForm1.setPwd(rs.getString(3));                     
                 }
             } catch (SQLException ex) {}
             return managerForm1;
        }
}
