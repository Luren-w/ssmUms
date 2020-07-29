package com.wzx.service.impl;

import com.wzx.bean.PageInfo;
import com.wzx.bean.User;
import com.wzx.dao.IUserDao;
import com.wzx.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public int login(String username, String password) {
        User user = userDao.findUserByUsername(username);
        if(user!=null&&user.getPassword().equals(password)){
            return user.getId();
        }
        return -1;
    }

    @Override
    public PageInfo<User> findAll(int currentPage,String username) {
        PageInfo pageInfo=new PageInfo();
        pageInfo.setSize(5);
        int totalCount=userDao.getTotalCount(username);
        pageInfo.setTotalCount(totalCount);
        double d=totalCount/5.0;
        int totalpage=(int) Math.ceil(d);
        pageInfo.setTotalPage(totalpage);
        if(currentPage<1){
            pageInfo.setCurrentPage(1);
        }else if(currentPage>totalpage){
            pageInfo.setCurrentPage(totalpage);
        }else {
            pageInfo.setCurrentPage(currentPage);
        }
        int start=(pageInfo.getCurrentPage()-1)*5;
        List<User> userList = userDao.findAll(start, 5,username);
        pageInfo.setList(userList);
        return pageInfo;
    }

    @Override
    public void deleteById(int id) {
        userDao.deleteById(id);
    }

    @Override
    public void add(User user) {
        userDao.add(user);
    }

    @Override
    public User selectUserById(int id) {
        return userDao.selectUserById(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void deleteAll(List<Integer> ids) {
        userDao.deleteAll(ids);
    }
}
