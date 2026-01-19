package com.heramb.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.FoodItems;
import com.heramb.enums.FoodStatus;

@Component
public class FoodItemsDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addFoodItem(FoodItems item) {
        return (Long) ht.save(item);
    }

    @Transactional
    public void updateFoodItem(FoodItems item) {
        ht.update(item);
    }

    @Transactional
    public void deleteFoodItem(Long id) {
        FoodItems item = ht.get(FoodItems.class, id);
        if (item != null) {
            ht.delete(item);
        }
    }

    public FoodItems getFoodItemById(Long id) {
        return ht.get(FoodItems.class, id);
    }

    public List<FoodItems> getAllFoodItems() {
        return ht.loadAll(FoodItems.class);
    }
    
    public List<FoodItems> getAvailableFoodItems(int pageNumber, int pageSize) {
        String hql = "from FoodItems where status = :status and availableTill > :now order by availableTill asc";
        int firstResult = (pageNumber - 1) * pageSize;
        return (List<FoodItems>) ht.execute(session -> 
            session.createQuery(hql, FoodItems.class)
                   .setParameter("status", FoodStatus.AVAILABLE)
                   .setParameter("now", LocalDateTime.now())
                   .setFirstResult(firstResult)
                   .setMaxResults(pageSize)
                   .list()
        );
    }
    
    @Transactional
    public void reduceQuantity(Long foodItemId, int quantity) {
        FoodItems item = ht.get(FoodItems.class, foodItemId);
        if (item != null && item.getQuantity() >= quantity) {
            item.setQuantity(item.getQuantity() - quantity);
            ht.update(item);
        } else {
            throw new RuntimeException("Insufficient quantity for food item ID: " + foodItemId);
        }
    }

    @SuppressWarnings("unchecked")
    public List<FoodItems> getFoodItemsByBusinessId(Long businessId) {
        String hql = "from FoodItems where businessId = :businessId order by availableTill desc";
        return (List<FoodItems>) ht.findByNamedParam(hql, "businessId", businessId);
    }

    @SuppressWarnings("unchecked")
    public List<FoodItems> getFoodItemsByCategory(String category) {
        String hql = "from FoodItems where category = :category order by availableTill desc";
        return (List<FoodItems>) ht.findByNamedParam(hql, "category", category);
    }

    @SuppressWarnings("unchecked")
    public List<FoodItems> getFoodItemsByStatus(FoodStatus status) {
        String hql = "from FoodItems where status = :status order by availableTill desc";
        return (List<FoodItems>) ht.findByNamedParam(hql, "status", status);
    }

    @SuppressWarnings("unchecked")
    public List<FoodItems> getAvailableFoodItems() {
        String hql = "from FoodItems where status = :status and availableTill > :now order by availableTill asc";
        return (List<FoodItems>) ht.findByNamedParam(
            hql,
            new String[] { "status", "now" },
            new Object[] { FoodStatus.AVAILABLE, LocalDateTime.now() }
        );
    }

    @SuppressWarnings("unchecked")
    public List<FoodItems> getFoodItemsByBusinessAndStatus(Long businessId, FoodStatus status) {
        String hql = "from FoodItems where businessId = :businessId and status = :status order by availableTill desc";
        return (List<FoodItems>) ht.findByNamedParam(
            hql,
            new String[] { "businessId", "status" },
            new Object[] { businessId, status }
        );
    }

    @SuppressWarnings("unchecked")
    public List<FoodItems> getExpiringFoodItems(LocalDateTime beforeDate) {
        String hql = "from FoodItems where availableTill <= :beforeDate and status = :status order by availableTill asc";
        return (List<FoodItems>) ht.findByNamedParam(
            hql,
            new String[] { "beforeDate", "status" },
            new Object[] { beforeDate, FoodStatus.AVAILABLE }
        );
    }
}
