library(ggplot2)


plot_theme <- theme_bw() +
    theme(
        legend.position = "none",
        axis.title.x = element_blank()
    )

gg_alpha <- function(df, x, alpha_metric = "richness") {
    # stopifnot(!is.null(x), "the stages to be plotted on the x-axis must be stated!")

    if (is.null(x)) {
        stop("the stages to be plotted on the x-axis must be stated!")
    }

    df_rename <- df %>%
        rename(alpha_metric = all_of(alpha_metric))

    gg_richness_data <- df_rename %>%
        filter(!is.na(remission) | x_axis == "Donor", x_axis %in% x) %>% #
        mutate(x_axis = factor(x_axis, levels = x)) %>%
        arrange(id)


    gg_alpha_rich <- gg_richness_data %>%
        ggplot(aes(x = x_axis, y = alpha_metric, color = x_axis)) +
        geom_point(aes(group = id), position = position_dodge(0.2)) +
        geom_boxplot(outlier.shape = NA) +
        geom_line(data = filter(gg_richness_data, x_axis != "Donor"), aes(group = id), alpha = 0.6, color = "grey70", position = position_dodge(0.2)) +
        geom_point(aes(group = id), position = position_dodge(0.2), size = 2) +
        plot_theme +
        facet_grid(. ~ group, scales = "free_x") +
        theme(legend.position = "none")

    return(gg_alpha_rich)
}

gg_compare_means <- function(gg, test, label.y) {
    p.label <- "p.format"
    p.list <- list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), symbols = c("p < 0.0001", "p < 0.001", " p < 0.01", "p < 0.05", "ns"))

    data <- gg$data

    ggnew <- gg +
        stat_compare_means(label = p.label, method = test, comparisons = list(c("Pre", "Post")), paired = T, label.y = label.y, symnum.arg = p.list) +
        stat_compare_means(data = filter(data, group != "placebo"), label = p.label, method = test, comparisons = list(c("Pre", "Donor"), c("Post", "Donor")), symnum.arg = p.list)
    return(ggnew)
}


gg_beta <- function(metadata_beta_summarised, method) {
    if (method == "bray") {
        y_lab <- "Similarity to Donors (Bray-Curtis)"
    } else if (method == "sorensen") {
        y_lab <- "Similarity to Donors (Sørensen Coefficient)"
    } else {
        stop("method is not valid.")
    }

    gg <- metadata_beta_summarised %>%
        ggplot(aes(x = x_axis, y = 1 - median_dissimilarity, color = x_axis)) +
        geom_boxplot(outlier.shape = NA) +
        geom_line(aes(group = id), alpha = 0.6, color = "grey70", position = position_dodge(0.2)) +
        geom_point(aes(group = id), position = position_dodge(0.2), size = 2) +
        labs(y = y_lab, x = "") +
        facet_grid(. ~ paste0(group, " - ", actual_donor)) +
        plot_theme

    return(gg)
}
