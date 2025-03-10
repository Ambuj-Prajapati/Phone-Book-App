package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contect;
import com.servlet.AddContact;

public class ContactDAO {
	private Connection conn;
	private int uId;
	
	public ContactDAO(Connection conn)
	{
		super();
		this.conn=conn;
	}
	public boolean saveContact(Contect c)
	{
		boolean f=false;
		try
		{
			String sql="insert into contect(name,email.phno,about,userid) values(?,?,?,?,?) ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getAbout());
			ps.setLong(5, c.getUserId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<Contect> getAllContact()
	{
		List<Contect> list=new ArrayList<Contect>();
		Contect c=null;
		try
		{
			String sql="select * from contect where userId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, uId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				c=new Contect();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(5));
				list.add(c);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	public Contect getContectByID(int cid)
	{
		Contect c=new Contect();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from contect where id=?");
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(5));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return c;
	}
	
	public boolean updateContect(Contect c)
	{
		
		boolean f=false;
		try
		{
			String sql="update contect set name=?, email=?, phno=?, about=? where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getAbout());
			ps.setLong(5, c.getId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteContectById(int id)
	{
		boolean f=false;
		try {
			String sql="delete from contect where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
}
