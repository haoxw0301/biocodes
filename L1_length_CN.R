library(ggplot2)
library(reshape2)
library(tidyr)
##### ----L1 DNA in human an mouse ----

Length_CN <- data.frame(group = c("mouse","mouse","human","human"),
                        compartment = c("A","B","A","B"),
                        copy_number = c(155523,379372,380585,383847),
                        length = c (66638049,283952768,183459741,230597586))

Length_CN_m <- melt(data = Length_CN, id.vars = c("group","compartment"))
Length_CN_mu <-unite(data = Length_CN_m, "group", group,variable, sep = "_")

Length_CN_mu$group <- factor(Length_CN_mu$group,
                             levels = c("mouse_length","human_length","mouse_copy_number","human_copy_number"),
                             labels = c("mouse","human","mouse","human"),
                             ordered = TRUE)

pdf("../../length_cn_L1.pdf")
ggplot(data = Length_CN_mu, aes(x = group, y = value, fill = compartment,)) + 
  geom_col(position = "fill", width = 0.5) + 
  theme_classic() + 
  labs(x = "", y = "") + 
  theme(axis.text = element_text(size = 15))
dev.off()
