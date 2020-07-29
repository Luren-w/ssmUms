package com.wzx.dao;

import com.wzx.bean.Role;
import com.wzx.bean.UserRole;

import java.util.List;

public interface IRoleDao {
    List<Integer> findRoleByUserId(int id);
    List<Role> findNoRoleByUserId(int id);
    void addRole(UserRole userRole);
}
