library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()

library(readr)
library(tidyr)

#1.column headers that are values
students
?gather
gather(students,sex,count,-grade)
#data arguments:students
#key and value arguments: sex and count
#final argument:-grande , gather all columns Except the frade column

#2.multiple variables are stored in one column
students2
#Step1: using gather() to stack the columns of students2
res <- gather(students2,sex_class,count,-grade)
res
#Step2: using separate() to separate sex_class into two columns
?separate
separate(res,sex_class,c("sex","class"))

students2 %>%
      gather(sex_class ,count , -grade) %>%
      separate(sex_class , c("sex", "class")) %>%
      print

#3.variables are stored in both rows and columns
students3
library(readr)
?spread
parse_number("class5")

students3 %>%
      gather(class, grade, class1:class5, na.rm = TRUE) %>%
      spread(test, grade) %>%
      mutate(class=parse_number(class)) %>%
      print

#4.multiple observational units are stored in the same table
students4
#break students4 into two separate tables -- one containing basic student information (id, name, and sex) and the other containing grades (id, class, midterm, final)

student_info <- students4 %>%
      select(id, name, sex) %>%
      unique() %>%
      print

gradebook <- students4 %>%
      select(id,class,midterm,final) %>%
      print

#5.a single observational unit is stored in multiple tables
passed
failed
passed <- mutate(passed,status="passed")
failed <- mutate(failed,status="failed")
?bind_rows
bind_rows(passed,failed)

#Read practice
sat
sat %>%
      select(-contains("total")) %>%
      gather(part_sex, count, -score_range) %>%
      separate(part_sex, c("part", "sex")) %>%
      group_by(part,sex) %>%
      mutate(total=sum(count),prop=count/total) %>% 
      print