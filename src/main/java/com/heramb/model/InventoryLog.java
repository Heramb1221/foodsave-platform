package com.heramb.model;

import javax.persistence.*;

import org.springframework.stereotype.Component;

import com.heramb.enums.ChangeType;

import java.time.LocalDateTime;

@Entity
@Component
@Table(name = "inventory_logs")
public class InventoryLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long foodItemId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private ChangeType changeType;

    @Column(nullable = false)
    private LocalDateTime changeDate;

    @Column(nullable = false)
    private Integer quantityBefore;

    @Column(nullable = false)
    private Integer quantityAfter;

    @Column(length = 500)
    private String note;

    public InventoryLog() {
    }

    public InventoryLog(Long foodItemId, ChangeType changeType, LocalDateTime changeDate,
                        Integer quantityBefore, Integer quantityAfter, String note) {
        this.foodItemId = foodItemId;
        this.changeType = changeType;
        this.changeDate = changeDate;
        this.quantityBefore = quantityBefore;
        this.quantityAfter = quantityAfter;
        this.note = note;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getFoodItemId() {
        return foodItemId;
    }

    public void setFoodItemId(Long foodItemId) {
        this.foodItemId = foodItemId;
    }

    public ChangeType getChangeType() {
        return changeType;
    }

    public void setChangeType(ChangeType changeType) {
        this.changeType = changeType;
    }

    public LocalDateTime getChangeDate() {
        return changeDate;
    }

    public void setChangeDate(LocalDateTime changeDate) {
        this.changeDate = changeDate;
    }

    public Integer getQuantityBefore() {
        return quantityBefore;
    }

    public void setQuantityBefore(Integer quantityBefore) {
        this.quantityBefore = quantityBefore;
    }

    public Integer getQuantityAfter() {
        return quantityAfter;
    }

    public void setQuantityAfter(Integer quantityAfter) {
        this.quantityAfter = quantityAfter;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
