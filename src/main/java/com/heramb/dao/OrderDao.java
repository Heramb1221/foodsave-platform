package com.heramb.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Orders;
import com.heramb.enums.OrderStatus;

@Component
public class OrderDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addOrder(Orders order) {
        return (Long) ht.save(order);
    }

    @Transactional
    public void updateOrder(Orders order) {
        ht.update(order);
    }

    @Transactional
    public void deleteOrder(Long id) {
        Orders order = ht.get(Orders.class, id);
        if (order != null) {
            ht.delete(order);
        }
    }

    public Orders getOrderById(Long id) {
        return ht.get(Orders.class, id);
    }

    public List<Orders> getAllOrders() {
        return ht.loadAll(Orders.class);
    }

    @SuppressWarnings("unchecked")
    public List<Orders> getOrdersByCustomer(Long customerId) {
        String hql = "from Orders where customerId = :customerId order by orderDate desc";
        return (List<Orders>) ht.findByNamedParam(hql, "customerId", customerId);
    }

    @SuppressWarnings("unchecked")
    public List<Orders> getOrdersByFoodItem(Long foodItemId) {
        String hql = "from Orders where foodItemId = :foodItemId order by orderDate desc";
        return (List<Orders>) ht.findByNamedParam(hql, "foodItemId", foodItemId);
    }

    @SuppressWarnings("unchecked")
    public List<Orders> getOrdersByStatus(OrderStatus status) {
        String hql = "from Orders where status = :status order by orderDate desc";
        return (List<Orders>) ht.findByNamedParam(hql, "status", status);
    }

    @SuppressWarnings("unchecked")
    public List<Orders> getOrdersByCustomerAndStatus(Long customerId, OrderStatus status) {
        String hql = "from Orders where customerId = :customerId and status = :status order by orderDate desc";
        return (List<Orders>) ht.findByNamedParam(
            hql,
            new String[] { "customerId", "status" },
            new Object[] { customerId, status }
        );
    }

    @SuppressWarnings("unchecked")
    public List<Orders> getOrdersBetweenDates(LocalDateTime from, LocalDateTime to) {
        String hql = "from Orders where orderDate >= :from and orderDate <= :to order by orderDate desc";
        return (List<Orders>) ht.findByNamedParam(
            hql,
            new String[] { "from", "to" },
            new Object[] { from, to }
        );
    }

    @SuppressWarnings("unchecked")
    public List<Orders> getUpcomingPickups(LocalDateTime now) {
        String hql = "from Orders where pickupTime >= :now order by pickupTime asc";
        return (List<Orders>) ht.findByNamedParam(hql, "now", now);
    }
}
