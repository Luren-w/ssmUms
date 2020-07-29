package com.wzx.service;


import com.wzx.bean.Role;

import java.util.List;

public interface IRoleService {
    List<Integer> findRoleByUserId(int id);
    List<Role> findNoRoleByUserId(int id);
    void addRole(List<Integer> ids,int userId);
}
