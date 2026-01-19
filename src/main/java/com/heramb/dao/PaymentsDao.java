package com.heramb.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Payments;
import com.heramb.enums.PaymentStatus;
import com.heramb.enums.PaymentMode;

@Component
public class PaymentsDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addPayment(Payments payment) {
        return (Long) ht.save(payment);
    }

    @Transactional
    public void updatePayment(Payments payment) {
        ht.update(payment);
    }

    @Transactional
    public void deletePayment(Long id) {
        Payments payment = ht.get(Payments.class, id);
        if (payment != null) {
            ht.delete(payment);
        }
    }

    public Payments getPaymentById(Long id) {
        return ht.get(Payments.class, id);
    }

    public List<Payments> getAllPayments() {
        return ht.loadAll(Payments.class);
    }

    @SuppressWarnings("unchecked")
    public List<Payments> getPaymentsByOrderId(Long orderId) {
        String hql = "from Payments where orderId = :orderId order by date desc";
        return (List<Payments>) ht.findByNamedParam(hql, "orderId", orderId);
    }

    @SuppressWarnings("unchecked")
    public List<Payments> getPaymentsByStatus(PaymentStatus status) {
        String hql = "from Payments where status = :status order by date desc";
        return (List<Payments>) ht.findByNamedParam(hql, "status", status);
    }

    @SuppressWarnings("unchecked")
    public List<Payments> getPaymentsByMode(PaymentMode mode) {
        String hql = "from Payments where mode = :mode order by date desc";
        return (List<Payments>) ht.findByNamedParam(hql, "mode", mode);
    }

    @SuppressWarnings("unchecked")
    public List<Payments> getPaymentsByStatusAndMode(PaymentStatus status, PaymentMode mode) {
        String hql = "from Payments where status = :status and mode = :mode order by date desc";
        return (List<Payments>) ht.findByNamedParam(
            hql,
            new String[] { "status", "mode" },
            new Object[] { status, mode }
        );
    }

    @SuppressWarnings("unchecked")
    public List<Payments> getPaymentsBetweenDates(LocalDateTime from, LocalDateTime to) {
        String hql = "from Payments where date >= :from and date <= :to order by date desc";
        return (List<Payments>) ht.findByNamedParam(
            hql,
            new String[] { "from", "to" },
            new Object[] { from, to }
        );
    }
}
