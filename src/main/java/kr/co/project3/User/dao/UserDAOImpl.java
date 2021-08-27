// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UserDAOImpl.java

package kr.co.project3.User.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.User.dto.UserDTO;

// Referenced classes of package kr.co.project3.User.dao:
//            UserDAO

@Repository
public class UserDAOImpl implements UserDAO
{
    @Autowired
    private SqlSession session;  
    
    private static final String NameSpace = "userMapper.";

    public int Id_Check(UserDTO dto)
    {
        return session.selectOne(NameSpace+"Id_Check", dto);
    }

    public void userJoin(UserDTO dto)
    {
        int Id_Check_Result = Id_Check(dto);
        if(Id_Check_Result == 0)
            session.insert(NameSpace+"userJoin", dto);
    }

    public int id_check(UserDTO dto)
    {
        int Id_Search_Result = session.selectOne(NameSpace+"Login", dto);
        return Id_Search_Result;
    }

    public void userLogin(UserDTO dto, HttpSession hsession)
    {
        int Id_Search_Result = id_check(dto);
        if(Id_Search_Result == 1)
        {
            UserDTO dto_info = (UserDTO)session.selectOne(NameSpace+"Login_Ingo", dto);
            hsession.setAttribute("dto_info", dto_info);
        }
    }

    
}
