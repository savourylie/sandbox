corr <- function(directory, threshold = 0) {
    id_list <- 1:332
    file_list <- c()
    
    df <- data.frame("id" = integer(), "nobs" = integer(), stringsAsFactors = FALSE)
    
    for (i in id_list) {
        df[i, 1] <- i
        
        temp_name = ""
        
        if (i < 10) {
            temp_name <- paste("00", toString(i), ".csv", sep = "")
        }
        
        else if (i >= 10 && i < 100) {
            temp_name <- paste("0", toString(i), ".csv", sep = "")
        }
        
        else {
            temp_name <- paste(toString(i), ".csv", sep = "")
        }
        
        file_list = append(file_list, temp_name)
        temp_dataframe <- read.csv(file.path(directory, temp_name))
        df[i, 2] <- sum(complete.cases(temp_dataframe))
    }
    
    df <- df[complete.cases(df), ]
    df
    
    good_data <- subset(df, nobs > threshold)
    good_id <- as.vector(as.matrix(good_data["id"]))
    
    good_file_list <- c()
    corr_vector <- c()
    
    for (fileID in good_id) {
        temp_name = ""
        
        if (fileID < 10) {
            temp_name <- paste("00", toString(fileID), ".csv", sep = "")
        }
        
        else if (fileID >= 10 && fileID < 100) {
            temp_name <- paste("0", toString(fileID), ".csv", sep = "")
        }
        
        else {
            temp_name <- paste(toString(fileID), ".csv", sep = "")
        }
        
        good_file_list = append(good_file_list, temp_name)
        
        temp_dataframe <- read.csv(file.path(directory, temp_name))
        corr_vector[fileID] <- cor(temp_dataframe$sulfate, temp_dataframe$nitrate, use = "complete.obs")
    }
    
    corr_vector[!is.na(corr_vector)]
}