complete <- function(directory, id = 1:332) {
    id_list <- id
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
}