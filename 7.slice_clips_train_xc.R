library(dplyr)
library(warbleR)
library(purrr)

# join keys for antijoin
join_keys <- c("sound.files", "selec", "start", "end")

xc_test_noise <- Pool_xc_noise

# xeno canto, weak, high SNR ####
# whine
set.seed(1)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "weak",
         SNR_cat == "High",
         Call.Type == "Whine") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=1) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique((sample$path))))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_highsnr_weak/Red Fox")

# bark
set.seed(1)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "weak",
         SNR_cat == "High",
         Call.Type == "Bark") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=1) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_highsnr_weak/Red Fox")

# noise
set.seed(1)
sample <- xc_noise %>% anti_join(xc_test_noise, by = join_keys) %>%
  slice_sample(n = 240)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_highsnr_weak/Noise")

# xeno canto, weak, low SNR ####
# whine
set.seed(2)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "weak",
         SNR_cat == "Low",
         Call.Type == "Whine") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=2) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_lowsnr_weak/Red Fox")

# bark
set.seed(2)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "weak",
         SNR_cat == "Low",
         Call.Type == "Bark") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=2) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_lowsnr_weak/Red Fox")

# noise
set.seed(2)
sample <- xc_noise %>% anti_join(xc_test_noise, by = join_keys) %>%
  slice_sample(n = 240)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_lowsnr_weak/Noise")

# xeno canto, strong, high SNR ####
# whine
set.seed(3)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "strong",
         SNR_cat == "High",
         Call.Type == "Whine") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=3) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_highsnr_strong/Red Fox")

# bark
set.seed(3)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "strong",
         SNR_cat == "High",
         Call.Type == "Bark") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=3) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_highsnr_strong/Red Fox")

# noise
set.seed(3)
sample <- xc_noise %>% anti_join(xc_test_noise, by = join_keys) %>%
  slice_sample(n = 240)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_highsnr_strong/Noise")

# xeno canto, strong, low SNR ####
# whine
set.seed(4)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "strong",
         SNR_cat == "Low",
         Call.Type == "Whine") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=4) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_lowsnr_strong/Red Fox")

# bark
set.seed(4)
sample <- public_domain %>% 
  filter(domain == "Xenocanto",
         label == "strong",
         SNR_cat == "Low",
         Call.Type == "Bark") %>%
  anti_join(xc_test_call, by = join_keys) %>%
  sample_overlap(n=4) %>%
  slice_sample(n = 120)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(sample$path)), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_lowsnr_strong/Red Fox")

# noise
set.seed(4)
sample <- xc_noise %>% anti_join(xc_test_noise, by = join_keys) %>%
  slice_sample(n = 240)
setwd(file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))))
sample <- sample %>% selection_table()
cut_sels(sample, 
         path = file.path("F:/MSc Ecology & Data Science Research", unique(dirname(sample$path))), 
         dest.path = "F:/MSc Ecology & Data Science Research/3. train_data/1. Wilcoxon/xc_lowsnr_strong/Noise")