package com.wzx.service.impl;

import com.wzx.bean.Role;
import com.wzx.bean.UserRole;
import com.wzx.dao.IRoleDao;
import com.wzx.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Integer> findRoleByUserId(int id) {

        return roleDao.findRoleByUserId(id);
    }

    @Override
    public List<Role> findNoRoleByUserId(int id) {
        return roleDao.findNoRoleByUserId(id);
    }

    @Override
    public void addRole(List<Integer> ids,int userId) {
        for(int i: ids) {
            UserRole userRole=new UserRole();
            userRole.setRoleId(i);
            userRole.setUserId(userId);
            roleDao.addRole(userRole);
        }
    }
}
