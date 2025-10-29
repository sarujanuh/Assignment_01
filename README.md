# Assignment 01 – Golf Ball Performance Analysis

## 📘 Overview
This project analyzes the **Par Inc. Golf Ball Testing Dataset**, which compares the driving distances achieved by current and new golf ball models.  
The goal is to determine whether the new golf ball performs better than the current model using descriptive statistics and basic R graphics.

---

## 📊 Dataset Information
- **Dataset Code:** ds324  
- **File Used:** Golf.csv  
- **Description:** Each row represents a single test comparing the drive distances (in yards) of current and new golf ball models under identical conditions.  

---

## 🔍 Key Findings
- The **current golf ball** achieves slightly longer average distances (mean = 270.3 yards) compared to the **new golf ball** (mean = 267.5 yards).  
- Both datasets show roughly normal distributions with no extreme outliers.  
- Contrary to expectations, the new golf ball does **not** outperform the current one.  

---

## 📈 Visualization
The barplot below summarizes how many times each golf ball model performed better across all tests.

```r
# R Code to generate the plot
win <- ifelse(golf$New > golf$Current, "New farther",
              ifelse(golf$New < golf$Current, "Current farther", "Equal"))
counts <- table(win)

bar_colours <- c("steelblue", "lightgreen", "lightcoral")
y_max <- max(counts) * 1.2

bp <- barplot(counts,
              main = "Comparison of Golf Ball Performance",
              ylab = "Number of Tests",
              xlab = "Result Category",
              col = bar_colours,
              border = "grey40",
              ylim = c(0, y_max))
abline(h = seq(0, y_max, by = 2), col = "lightgray", lty = "dotted", lwd = 0.8)
text(x = bp, y = counts + 0.8, labels = counts, cex = 1.1, font = 1, col = "black")
