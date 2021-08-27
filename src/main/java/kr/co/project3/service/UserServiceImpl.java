// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UserServiceImpl.java

package kr.co.project3.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.User.dao.UserDAO;
import kr.co.project3.User.dto.UserDTO;

// Referenced classes of package kr.co.project3.service:
//            UserService

@Component
public class UserServiceImpl implements UserService
{

    @Autowired
    private UserDAO userDao;

    public int id_check(UserDTO dto)
    {
        return userDao.id_check(dto);
    }

    public int Id_Check(UserDTO dto)
    {
        return userDao.Id_Check(dto);
    }

    public void userLogin(UserDTO dto, HttpSession hsession)
    {
        userDao.userLogin(dto, hsession);
    }

    public void userJoin(UserDTO dto)
    {
        userDao.userJoin(dto);
    }

}
