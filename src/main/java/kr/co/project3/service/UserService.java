// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UserService.java

package kr.co.project3.service;

import javax.servlet.http.HttpSession;
import kr.co.project3.User.dto.UserDTO;

public interface UserService
{

    public abstract int id_check(UserDTO userdto);

    public abstract void userLogin(UserDTO userdto, HttpSession httpsession);

    public abstract void userJoin(UserDTO userdto);

    public abstract int Id_Check(UserDTO userdto);
}
