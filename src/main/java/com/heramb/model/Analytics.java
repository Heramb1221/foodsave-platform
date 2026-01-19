package com.heramb.model;

import javax.persistence.*;

import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Entity
@Component
@Table(name = "analytics")
public class Analytics {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long businessId;

    @Column(nullable = false)
    private LocalDate date;

    @Column(nullable = false)
    private Double foodSavedKg;

    @Column(nullable = false)
    private Integer ordersCompleted;

    @Column(nullable = false)
    private Double avgDiscountRate;

    @Column(nullable = false)
    private Double wasteReducedPercent;

    public Analytics() {
    }

    public Analytics(Long businessId, LocalDate date, Double foodSavedKg,
                     Integer ordersCompleted, Double avgDiscountRate,
                     Double wasteReducedPercent) {
        this.businessId = businessId;
        this.date = date;
        this.foodSavedKg = foodSavedKg;
        this.ordersCompleted = ordersCompleted;
        this.avgDiscountRate = avgDiscountRate;
        this.wasteReducedPercent = wasteReducedPercent;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Long businessId) {
        this.businessId = businessId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Double getFoodSavedKg() {
        return foodSavedKg;
    }

    public void setFoodSavedKg(Double foodSavedKg) {
        this.foodSavedKg = foodSavedKg;
    }

    public Integer getOrdersCompleted() {
        return ordersCompleted;
    }

    public void setOrdersCompleted(Integer ordersCompleted) {
        this.ordersCompleted = ordersCompleted;
    }

    public Double getAvgDiscountRate() {
        return avgDiscountRate;
    }

    public void setAvgDiscountRate(Double avgDiscountRate) {
        this.avgDiscountRate = avgDiscountRate;
    }

    public Double getWasteReducedPercent() {
        return wasteReducedPercent;
    }

    public void setWasteReducedPercent(Double wasteReducedPercent) {
        this.wasteReducedPercent = wasteReducedPercent;
    }
}
