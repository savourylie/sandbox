pollutantmean <- function(directory, pollutant, id = 1:332) {
    id_list <- id
    file_list <- c()
    
    for (fileID in id) {
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
        
        file_list = append(file_list, temp_name)
    }
    
    p_data <- read.csv(file.path(directory, file_list[1]))
   
    if (length(file_list) > 1) {
        for (i in 2:length(file_list)) {
            p_data <- rbind(p_data, read.csv(file.path(directory, file_list[i])))
        }
    }

    sum(p_data[pollutant][!is.na(p_data[pollutant])]) / length((p_data[pollutant][!is.na(p_data[pollutant])]))
}