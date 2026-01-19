package com.heramb.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.InventoryLog;
import com.heramb.enums.ChangeType;

@Component
public class InventoryLogDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public Long addLog(InventoryLog log) {
        return (Long) ht.save(log);
    }

    @Transactional
    public void updateLog(InventoryLog log) {
        ht.update(log);
    }

    @Transactional
    public void deleteLog(Long id) {
        InventoryLog log = ht.get(InventoryLog.class, id);
        if (log != null) {
            ht.delete(log);
        }
    }

    public InventoryLog getLogById(Long id) {
        return ht.get(InventoryLog.class, id);
    }

    public List<InventoryLog> getAllLogs() {
        return ht.loadAll(InventoryLog.class);
    }

    @SuppressWarnings("unchecked")
    public List<InventoryLog> getLogsByFoodItem(Long foodItemId) {
        String hql = "from InventoryLog where foodItemId = :foodItemId order by changeDate desc";
        return (List<InventoryLog>) ht.findByNamedParam(hql, "foodItemId", foodItemId);
    }

    @SuppressWarnings("unchecked")
    public List<InventoryLog> getLogsByChangeType(ChangeType changeType) {
        String hql = "from InventoryLog where changeType = :changeType order by changeDate desc";
        return (List<InventoryLog>) ht.findByNamedParam(hql, "changeType", changeType);
    }

    @SuppressWarnings("unchecked")
    public List<InventoryLog> getLogsByFoodItemAndChangeType(Long foodItemId, ChangeType changeType) {
        String hql = "from InventoryLog where foodItemId = :foodItemId and changeType = :changeType order by changeDate desc";
        return (List<InventoryLog>) ht.findByNamedParam(
            hql,
            new String[] { "foodItemId", "changeType" },
            new Object[] { foodItemId, changeType }
        );
    }

    @SuppressWarnings("unchecked")
    public List<InventoryLog> getLogsBetweenDates(LocalDateTime from, LocalDateTime to) {
        String hql = "from InventoryLog where changeDate >= :from and changeDate <= :to order by changeDate desc";
        return (List<InventoryLog>) ht.findByNamedParam(
            hql,
            new String[] { "from", "to" },
            new Object[] { from, to }
        );
    }

    @SuppressWarnings("unchecked")
    public InventoryLog getLatestLogForFoodItem(Long foodItemId) {
        String hql = "from InventoryLog where foodItemId = :foodItemId order by changeDate desc";
        List<InventoryLog> logs = (List<InventoryLog>) ht.findByNamedParam(hql, "foodItemId", foodItemId);
        return logs.isEmpty() ? null : logs.get(0);
    }
}
