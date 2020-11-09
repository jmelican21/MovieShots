library(tidyverse)
library(readxl)
filenames <- list.files("Movies1915to2015/", recursive = TRUE)

dataset <- data.frame()

for (i in 1:length(filenames)) {
  if (i < 41 || i > 210) { # movies from these years tended to have the same format
    temp_data <- read_excel(paste0("Movies1915to2015/", filenames[i]),
                            range = cell_cols("A:B"),
                            col_names = c("frame", "duration"), # naming the columns
                            col_types = c("numeric", "numeric")
    ) # reading them as numeric
  }
  else {
    temp_data <- read_excel(paste0("Movies1915to2015/", filenames[i]),
                            range = cell_cols("A:C"), # these years (1935-2010) usually had a
                            # different column in between
                            col_names = c("frame", "duration"),
                            col_types = c("numeric", "skip", "numeric")
    ) # skipping over the other column
  }

  movie <- temp_data %>%
    drop_na() %>%
    mutate( # extract title and year from file name
      year = as.numeric(strsplit(gsub(".xls.*", "", filenames[i]), "/")[[1]][1]),
      title = strsplit(gsub(".xls.*", "", filenames[i]), "/")[[1]][2],
    )


  dataset <- rbind(dataset, movie) # for each iteration, bind the new data to the building dataset
}

MovieShots <-
  dataset %>% filter( # manually filter out movies where it's
    # clear that the wrong variable was read in
    duration < 500, duration > -500, title != "alice2010", title != "EmpStrikesBack",
    title != "DIEHARD2", title != "homealone", title != "ALLABOUTEVE",
    title != "toystory3cuts", title != "troncuts", title != "despicablecuts", title != "WHATWOMENWANT"
  )

usethis::use_data(MovieShots)
