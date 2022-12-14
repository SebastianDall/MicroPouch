library(tidyverse)
library(here)

stages_pre_post <- c("Pre", "Post", "Donor")
stages_all <- c("Pre", "treatment_5", "treatment_10", "treatment_15", "treatment_21", "Post", "followup_1m", "followup_3m", "followup_6m", "followup_12m", "Donor")
stages_labels <- c("Pre", paste0("Day ", c(5, 10, 16, 28)), "Post", paste0("Follow-up ", c(1, 3, 6, 12), "M"), "Donor")


mutate_x_axis_factor <- function(df) {
  df %>%
    mutate(x_axis = factor(x_axis, levels = c("Pre", "Post", "Donor", "followup_1m", "followup_3m", "followup_6m", "followup_12m")))
}

plot_theme <- theme_bw() +
  theme(
    legend.position = "none",
    axis.title.x = element_blank()
  )
