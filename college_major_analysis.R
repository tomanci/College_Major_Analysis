install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)

library(matahari)
dance_start(value = FALSE, contents = FALSE)

library(dplyr)

sum(is.na(college))
college_data <- college[complete.cases(college),]

fit1 <- lm(median~as.factor(major_category),college_data)
fit2 <- lm(median~perc_employed+perc_low_wage_jobs+as.factor(major_category),college_data)

college_data_new<-college_data
college_data_new$major_category <- gsub("Engineering|Physical Sciences|Computers & Mathematics",1,college_data_new$major_category)
college_data_new$major_category <- gsub("Biology & Life Science|Agriculture & Natural Resources|Health",2,college_data_new$major_category)
college_data_new$major_category <- gsub("Business|Law & Public Policy|Social Science",3,college_data_new$major_category)
college_data_new$major_category <- gsub("Communications & Journalism|Industrial Arts & Consumer Services|Arts|Humanities & Liberal Arts",4,college_data_new$major_category)
college_data_new$major_category <- gsub("Education|Psychology & Social Work|Interdisciplinary",5,college_data_new$major_category)

fit3 <- lm(median~as.factor(major_category),college_data_new)
fit4 <-lm(median~perc_employed+perc_low_wage_jobs+as.factor(major_category),college_data_new)
  
summary(fit1)
summary(fit2)

summary(fit3)
summary(fit4)
  
  