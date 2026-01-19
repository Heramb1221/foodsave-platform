package com.heramb.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Feedbacks;

@Component
public class FeedbackDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addFeedback(Feedbacks feedback) {
        return (Long) ht.save(feedback);
    }

    @Transactional
    public void updateFeedback(Feedbacks feedback) {
        ht.update(feedback);
    }

    @Transactional
    public void deleteFeedback(Long id) {
        Feedbacks feedback = ht.get(Feedbacks.class, id);
        if (feedback != null) {
            ht.delete(feedback);
        }
    }

    public Feedbacks getFeedbackById(Long id) {
        return ht.get(Feedbacks.class, id);
    }

    public List<Feedbacks> getAllFeedbacks() {
        return ht.loadAll(Feedbacks.class);
    }

    @SuppressWarnings("unchecked")
    public List<Feedbacks> getFeedbacksByFoodItem(Long foodItemId) {
        String hql = "from Feedbacks where foodItemId = :foodItemId order by date desc";
        return (List<Feedbacks>) ht.findByNamedParam(hql, "foodItemId", foodItemId);
    }

    @SuppressWarnings("unchecked")
    public List<Feedbacks> getFeedbacksByCustomer(Long customerId) {
        String hql = "from Feedbacks where customerId = :customerId order by date desc";
        return (List<Feedbacks>) ht.findByNamedParam(hql, "customerId", customerId);
    }

    @SuppressWarnings("unchecked")
    public List<Feedbacks> getFeedbacksByFoodItemAndDateRange(Long foodItemId, LocalDateTime start, LocalDateTime end) {
        String hql = "from Feedbacks where foodItemId = :foodItemId and date >= :start and date <= :end order by date desc";
        return (List<Feedbacks>) ht.findByNamedParam(
                hql,
                new String[] { "foodItemId", "start", "end" },
                new Object[] { foodItemId, start, end }
        );
    }

    public Double getAverageRatingForFoodItem(Long foodItemId) {
        String hql = "select avg(rating) from Feedbacks where foodItemId = :foodItemId";
        List<Double> result = (List<Double>) ht.findByNamedParam(hql, "foodItemId", foodItemId);
        return (result.isEmpty() || result.get(0) == null) ? 0.0 : result.get(0);
    }

    public Long countFeedbacksForFoodItem(Long foodItemId) {
        String hql = "select count(*) from Feedbacks where foodItemId = :foodItemId";
        List<Long> result = (List<Long>) ht.findByNamedParam(hql, "foodItemId", foodItemId);
        return (result.isEmpty() || result.get(0) == null) ? 0L : result.get(0);
    }
}
