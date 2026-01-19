package com.heramb.dao;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Analytics;

@Component
public class AnalyticsDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addAnalytics(Analytics analytics) {
        return (Long) ht.save(analytics);
    }

    @Transactional
    public void updateAnalytics(Analytics analytics) {
        ht.update(analytics);
    }

    @Transactional
    public void deleteAnalytics(Long id) {
        Analytics analytics = ht.get(Analytics.class, id);
        if (analytics != null) {
            ht.delete(analytics);
        }
    }

    public Analytics getAnalyticsById(Long id) {
        return ht.get(Analytics.class, id);
    }

    public List<Analytics> getAllAnalytics() {
        return ht.loadAll(Analytics.class);
    }
}
