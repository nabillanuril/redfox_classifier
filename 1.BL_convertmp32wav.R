library(av)
library(tidyverse)

setwd("F:/MSc Ecology & Data Science Research/1. Britishlib_red fox")

# Convert each file and place it into the new folder
# list files with ".mp3" file extension with the path directory
mp3_files <- list.files(pattern = "\\.mp3$", full.names = TRUE)
wav_files <- file.path(sub("\\.mp3$", ".wav", basename(mp3_files)))
for (i in seq_along(mp3_files)) {
  try(av_audio_convert(mp3_files[i], output = wav_files[i]))}
file.remove(mp3_files)
