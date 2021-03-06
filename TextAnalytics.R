############################################
# Text Analytics (learning from D.Langer)
# Mainly following playlist at : https://www.youtube.com/watch?v=4vuw0AsHeGw&list=PL8eNk_zTBST8olxIRFoo0YeXxEOkYdoxi
############################################

install.packages(c("quanteda","irlba"))

spam.raw <- read.csv(file = 'spam.csv' , stringsAsFactors =  FALSE)
spam.raw <- spam.raw[,1:2]

names(spam.raw) <- c("Label","Text")

length(which(!complete.cases(spam.raw)))

# It is useful to convert class labels to factors early on
spam.raw$Label <- factor(spam.raw$Label)


# Prop table express them as fractions
prop.table(table(spam.raw$Label))
table(spam.raw$Label)

# Let's look at the relative lengths of texts

spam.raw$TextLength <- nchar(spam.raw$Text)
summary(spam.raw$TextLength)

# This turns out to be a great feature for classification
library(ggplot2)
ggplot(spam.raw,aes(x = TextLength, fill = Label))+
    geom_histogram(binwidth = 5)+
    theme_bw()

# Data split (stratifed split: ie: class proportions are maintained during the split)
library(caret)

set.seed(32984)
indexes <- createDataPartition(y = spam.raw$Label,
                               p = 0.7, list = FALSE)

train <- spam.raw[indexes,]
test <- spam.raw[-indexes,]

# Note that class label proportions are maintained
prop.table(table(train$Label))
prop.table(table(test$Label))

#########################################
# More data exploration and processing
#########################################

# How do we represent text as Data Frame?

# We achieve this by TOKENIZATION

############################
# Migrated to Rmarkdown.
############################




