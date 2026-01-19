package com.heramb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.User;
import com.heramb.enums.Role;
import com.heramb.enums.Status;

@Component
public class UserDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addUser(User user) {
        return (Long) ht.save(user);
    }

    @Transactional
    public void updateUser(User user) {
        ht.update(user);
    }

    @Transactional
    public void deleteUser(Long id) {
        User user = ht.get(User.class, id);
        if (user != null) {
            ht.delete(user);
        }
    }

    public User getUserById(Long id) {
        return ht.get(User.class, id);
    }

    public List<User> getAllUsers() {
        return ht.loadAll(User.class);
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsersByRole(Role role) {
        String hql = "from User where role = :role";
        return (List<User>) ht.findByNamedParam(hql, "role", role);
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsersByStatus(Status status) {
        String hql = "from User where status = :status";
        return (List<User>) ht.findByNamedParam(hql, "status", status);
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsersByRoleAndStatus(Role role, Status status) {
        String hql = "from User where role = :role and status = :status";
        return (List<User>) ht.findByNamedParam(
            hql,
            new String[] { "role", "status" },
            new Object[] { role, status }
        );
    }

    @SuppressWarnings("unchecked")
    public User getUserByEmail(String email) {
        String hql = "from User where email = :email";
        List<User> users = (List<User>) ht.findByNamedParam(hql, "email", email);
        return users.isEmpty() ? null : users.get(0);
    }

    @SuppressWarnings("unchecked")
    public User getUserByPhone(String phone) {
        String hql = "from User where phone = :phone";
        List<User> users = (List<User>) ht.findByNamedParam(hql, "phone", phone);
        return users.isEmpty() ? null : users.get(0);
    }
}
