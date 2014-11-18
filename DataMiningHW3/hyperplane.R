# Exercise 9.7.3


# Solution (a)
x1 <- c(3, 2, 4, 1, 2, 4, 4)
x2 <- c(4, 2, 4, 4, 1, 3, 1)
colors <- c("red","red","red","red","blue","blue","blue")
plot(x1,x2, col = colors, xlim = c(0,5), ylim = c(0,5), main = "Solution 9.7.3(a)")


#Solution (b)
plot(x1,x2, col = colors, xlim = c(0,5), ylim = c(0,5), main = "Solution 9.7.3(b)", abline(-0.5,1))

#Solution (d)
plot(x1, x2, col = colors, xlim = c(0, 5), ylim = c(0, 5), main = "Solutions 9.7.3(d)")
abline(-0.5, 1)
abline(-1, 1, lty = 2)
abline(0, 1, lty = 2)

#Solution (e)
plot(x1, x2, col = colors, xlim = c(0, 5), ylim = c(0, 5), main = "Solutions 9.7.3(e)")
abline(-0.5, 1)
abline(-1, 1, lty = 2)
abline(0, 1, lty = 2)
arrows(2, 1, 2, 1.5)
arrows(2, 2, 2, 1.5)
arrows(4, 4, 4, 3.5)
arrows(4, 3, 4, 3.5)

#Solution (g)
plot(x1, x2, col = colors, xlim = c(0, 5), ylim = c(0, 5), main = "Solution 9.7.3(g)")
abline(-0.85, 1)


#Solution (h)
plot(x1, x2, col = colors, xlim = c(0, 5), ylim = c(0, 5), main = "Solution 9.7.3(h)")
points(c(3), c(2), col = c("red"))