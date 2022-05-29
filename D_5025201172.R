# 1a
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)
selisih <- y-x
standardeviasi <- sd(selisih)

# 1b
library(BSDA)
t.test(selisih, alternative = 'two.sided', mu=15, sigma.x=standardeviasi)

# 1c
qt(p = 0.025, df = 8, lower.tail = FALSE)

# 2a
library(BSDA)
zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative="greater", mu=20000)

# 3b
library(BSDA)
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, conf.level = 0.95)

# 3c
sp2 <- (((27 - 1) * (1.32)^2) + ((19 - 1) * (1.67)^2))/(27 + 19 - 2)
sp <- sqrt(sp2)
x2 <- (1/27) + (1/19)
x <- sqrt(x2)
t <- (2.79 - 3.64)/(sp*x)

# 3d
qt(p = 0.025, df = 2, lower.tail = FALSE)


# 4a
kucing <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")

library(ggpubr)

ggboxplot(kucing, x = "Group", y = "Length", 
          color = "Group",
          ylab = "Length", xlab = "Group")
# 4b
library(onewaytests)
bartlett.test(Length ~ Group, data = kucing)

# 4c
model1 <- lm(formula = Group ~ Length, data = kucing)
print(model1)

# 4d

# 4e

# 4f

# 5a
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# 5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
print(anova)
summary(anova)

# 5c
data_sum <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_sum)

# 5d 
tukey <- TukeyHSD(anova)
print(tukey)

# 5e