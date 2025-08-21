library(warbleR)
library(tidyverse)
library(stringr)
library(tibble) 
library(openxlsx) 
library(av)

setwd("F:/MSc Ecology & Data Science Research")

# download metadata for red fox recordings
xc_metadata <- query_xc("Vulpes vulpes", download = FALSE, 
                        file.name = c("Genus", "Quality"), 
                        path = "1. Xenocanto")

# download all files from xeno-canto and attach the quality type to the name
query_xc("Vulpes vulpes", download = TRUE, 
          file.name = c("Genus", "Quality"), 
          path = "1. Xenocanto")

# combine string of recording ID and quality type in a new column to form recording base name
xc_metadata$recording_name <- str_c(xc_metadata$Quality, "-", xc_metadata$Recording_ID, ".wav")

# get file basename and path
# create a list of sound files and change it into a data frame 
xc_list <- list.files (path = "1. Xenocanto/",
                              full.names = FALSE,
                              recursive = TRUE) %>% tibble(recording = .)

# add source_path into a new column
xc_list <- xc_list %>% mutate(source_path = file.path("1. Xenocanto", recording))

# add recording id column
xc_list <- xc_list %>% mutate(Recording_ID = recording %>% 
                                str_remove("^[A-Za-z]-") %>% 
                                str_remove("\\.mp3$"))

# merge xc_list with xc_metadata by Recording_ID
xc_metadata <- merge(xc_metadata, xc_list, by  = "Recording_ID")

# filter foreground recordings (without background species) and copy them to a new folder
# this way, the sound presumably will only belong to red foxes
xc_sono <- xc_metadata %>% filter(is.na(Other_species) &
                                    is.na(Other_species1) &
                                    is.na(Other_species2) &
                                    is.na(Other_species3) &
                                    is.na(Other_species4) &
                                    is.na(Other_species5)) 

# create the file destination path
xc_sono <- xc_sono %>% mutate(dest_path = file.path("1. Xenocanto_foreground_mp3", basename(recording)))
write.xlsx(xc_sono, "F:/MSc Ecology & Data Science Research/1. Xenocanto_foreground_wav/xclist.xlsx", append = TRUE)

# copy file to a new folder
# yes, copy, if you move them and rerun the code, you'll get confused when the files are gone and it returns an error
file.copy(from = xc_sono$source_path, to = xc_sono$dest_path)

# Convert each file and place it into the new folder
# the sound files needed to be converted to wav files because I will use warbleR for the next step
# warbleR only works with wav files
mp3_files <- list.files("1. Xenocanto_foreground_mp3", pattern = "\\.mp3$", full.names = TRUE)
wav_files <- file.path("1. Xenocanto_foreground_wav", sub("\\.mp3$", ".wav", basename(mp3_files)))
for (i in seq_along(mp3_files)) {
  try(av_audio_convert(mp3_files[i], output = wav_files[i]))}
# remove mp3 files after being converted to wav files to safe storage
file.remove(mp3_files)
