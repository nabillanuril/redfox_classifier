library(warbleR)
library(tidyverse)
library(stringr)
library(chron)


# get working directory
setwd("F:/MSc Ecology & Data Science Research")

# create a metadata of raw file consisting of month, location, date, file name, and file path
# create a list of sound file
recording_list <- list.files (path = "1. Dartmoor 2023_Raw/",
                              full.names = TRUE,
                              recursive = TRUE)

# use information from the file path into categorical information
folder_list <- list.files (path = "1. Dartmoor 2023_Raw/",
                           recursive = TRUE)

folder_level <- c("month", "site", "date", "recording")

recording_metadata <- tibble(path = folder_list) %>%
  separate(path, into = folder_level, sep = "/") %>% 
  drop_na() # drop na caused by the readme file


# filter recordings from 00:00:00 to 04:00:00 and 22:00:00 to 23:40:00
time_str<- recording_metadata$recording %>%
  # remove string before and after time
      str_remove("^\\d{8}_") %>%
      str_remove(regex("\\.WAV$")) 

# turn string from the file name into time format
recording_metadata$time <- str_c(
    str_sub(time_str, 1, 2), ":",
    str_sub(time_str, 3, 4), ":",
    str_sub(time_str, 5, 6)) %>% times()

# create a new column from metadata for specific Fox time
fox_active <- recording_metadata %>% group_by(month, site, date) %>% 
  filter((time >= times("00:00:00") & time <= times("04:00:00")) |
      (time >= times("22:00:00") & time <= times("23:40:00")))

# copy the recording into new path with similar sub folder path
# create a list of output directory using information from month, site, and date
source_dir <- ("1. Dartmoor 2023_Raw")
fox_active <- fox_active %>%
  mutate(
    # list destination file directory
    dest_dir  = file.path("1. Dartmoor 2023_red fox", month, site, date),
    # list destination file path
    dest_file = file.path(dest_dir, paste(site, sep = "_", basename(recording))),
    # see if you can paste the site name to the recording name
    # list source file path
    source_file  = file.path(source_dir, month, site, date, recording))


total_recording <- 
  
# create the destination file directory
lapply(fox_active$dest_dir, dir.create, recursive = TRUE)

# move the file using the source and destination file directory
# try copy instead of move because you do not want to mess with your raw file
copy_wav <- file.copy(from = fox_active$source_file, to = fox_active$dest_file)

# check all recordings manually in raven pro
# export fox_active as an excel file
# this code can only be used once. If run, it will overwrite the manually labeled table
# fox_active %>% as.data.frame() %>%
#  write.xlsx(file = "F:/MSc Ecology & Data Science Research/1. Dartmoor 2023/fox_active.xlsx")

# label recordings with and without fox calls in ravenpro
