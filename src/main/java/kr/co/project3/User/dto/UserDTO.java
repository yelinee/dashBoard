// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UserDTO.java

package kr.co.project3.User.dto;


public class UserDTO
{

    public UserDTO()
    {
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getPasswd()
    {
        return passwd;
    }

    public void setPasswd(String passwd)
    {
        this.passwd = passwd;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getHp()
    {
        return hp;
    }

    public void setHp(String hp)
    {
        this.hp = hp;
    }

    public String toString()
    {
        return (new StringBuilder("MemberDTO[id=")).append(id).append(",passwd=").append(passwd).append(",name=").append(name).append(",email").append(email).append(",hp=").append(hp).append("]").toString();
    }

    private String id;
    private String passwd;
    private String email;
    private String name;
    private String hp;
}
