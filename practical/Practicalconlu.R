
#A.
warpbreaks

str(warpbreaks)



#1.
sapply(warpbreaks,is.numeric)
sapply(warpbreaks,is.integer)

#2.
warpbreaks$breaks <- as.integer(warpbreaks$breaks)
warpbreaks
#3.
#Error message  report the underlying type of an object rathe


#B. 

#1.
(txt <-readLines ("exampleFile.txt"))


I<- grepl("^%", txt)
(dat <- txt[!I])

#2.
comments <- txt[grepl("^//", txt)]
data<- txt[!grepl("^//", txt)]
txt


#3.
Ex_date <- gsub("^// Survey data. Created : ", "", comments[1])
Ex_date


#4.

#a.
split_D <- strsplit(data_lines, ";")
split_D


#b.
max_fields <- max(sapply(split_D, length))
max_fields

split_D <- lapply(split_data, function(x) c(x, rep(NA, max_fields -length(x))))
split_D

#c.
matrix <- matrix(unlist(split_data), ncol = max_fields, byrow = TRUE)
matrix


#d.
field_names <- gsub("^// Field [0-9]+: ", "", comments[2:4])
colnames(matrix) <- field_names
print(matrix)



