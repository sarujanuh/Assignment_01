# Title: Practice 2 
# Author: Sarujan Puvirajan - 24156736
# Dataset: Golf.csv
# Description: Comparing performance of Current vs New golf balls

library(readr)

# Load dataset
golf <- read_csv("Golf.csv", show_col_types = FALSE)

# Ensure numeric type for both columns
golf$Current <- as.numeric(golf$Current)
golf$New <- as.numeric(golf$New)

cat("First 5 rows:\n")
print(head(golf, 5))

cat("\nDescriptive statistics:\n")
print(summary(golf))

# Determine which ball goes farther in each test
win <- ifelse(golf$New > golf$Current, "New farther",
              ifelse(golf$New < golf$Current, "Current farther", "Equal"))
counts <- table(win)

cat("\nComparison of win counts:\n")
print(counts)

# Define colours
bar_colours <- c("steelblue", "lightgreen", "lightcoral")

# Y-axis limit
y_max <- max(counts) * 1.2

# Create the barplot
bp <- barplot(counts,
              main = "Comparison of Golf Ball Performance",
              ylab = "Number of Tests",
              xlab = "Result Category",
              col = bar_colours,
              border = "grey40",
              ylim = c(0, y_max))

# Add horizontal grid lines
abline(h = seq(0, y_max, by = 2), col = "lightgray", lty = "dotted", lwd = 0.8)

# Add count labels above each bar
text(x = bp, y = counts + 0.8, labels = counts, cex = 1.1, font = 1, col = "black")

# Save the graph as PNG
png("graph.png")
bp <- barplot(counts,
              main = "Comparison of Golf Ball Performance",
              ylab = "Number of Tests",
              xlab = "Result Category",
              col = bar_colours,
              border = "grey40",
              ylim = c(0, y_max))
abline(h = seq(0, y_max, by = 2), col = "lightgrey", lty = "dotted", lwd = 0.8)
text(x = bp, y = counts + 0.8, labels = counts, cex = 1.1, font = 1, col = "black")
dev.off()

cat("\nSaved the barplot to: graph.png\n")
