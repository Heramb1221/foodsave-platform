package com.heramb.model;

import javax.persistence.*;

import org.springframework.stereotype.Component;

import com.heramb.enums.FoodStatus;

import java.time.LocalDateTime;

@Entity
@Component
@Table(name = "food_items")
public class FoodItems {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long businessId;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(length = 500)
    private String description;

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false)
    private Double originalPrice;

    @Column(nullable = false)
    private Double discountedPrice;

    @Column(length = 50)
    private String category;

    @Column(length = 255)
    private String image;

    @Column(nullable = false)
    private LocalDateTime availableTill;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private FoodStatus status;

    public FoodItems() {
    }

    public FoodItems(Long businessId, String name, String description, Integer quantity,
                    Double originalPrice, Double discountedPrice, String category,
                    String image, LocalDateTime availableTill, FoodStatus status) {
        this.businessId = businessId;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
        this.originalPrice = originalPrice;
        this.discountedPrice = discountedPrice;
        this.category = category;
        this.image = image;
        this.availableTill = availableTill;
        this.status = status;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Double getDiscountedPrice() {
        return discountedPrice;
    }

    public void setDiscountedPrice(Double discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public LocalDateTime getAvailableTill() {
        return availableTill;
    }

    public void setAvailableTill(LocalDateTime availableTill) {
        this.availableTill = availableTill;
    }

    public FoodStatus getStatus() {
        return status;
    }

    public void setStatus(FoodStatus status) {
        this.status = status;
    }
}
