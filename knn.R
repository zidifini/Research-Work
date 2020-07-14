
# Import data set
policy <- read.csv("C:/users/zidis/Documents/Datasets/policy.csv")

# Let us look at the structure of the imported data
str(policy)

# Data cleaning
# We will select only relevant data to decrease the complexity of the machine learning model

policy_rel <- policy [c('Operations.improvement....', 'Policy..innovation...Years.', 'Strategic.operation.goals', 'Sustainable.practice.for.info.mgt', 'IOC.collabo...co.op.with.HEI', 'IOC.collabo...co.op.with.research.inst', 'IOC.collabo...co.op.with.Gov..ministeries....dept', 'Tech.involvement...infrastructure', 'Finance.towards.R...D..NM.', 'Introduction.of.new.policies.agreeable.to.stakeholders..', 'Sustainability')]

#Check the structure of policy_rel
str(policy_rel)

# Data normalization - Convert the business data into statistical data that the machine will understand i.e. zeros and ones
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

# We are now going to load the normalized data into policy_rel_n

policy_rel_n <- as.data.frame(lapply(policy_rel[,1:10], normalize))

str(policy_rel_n)


# Splitting the data into training (75% i.e. rows 1:8) and testing (25% i.e. rows 9:11) data

# 75% train data
train_data <- policy_rel_n[1:8,]

# Let us see the train data

train_data

# 25% test data
test_data <- policy_rel_n[9:11,]

# Let us see the test data 
test_data

# 75% train labels
train_labels <- policy_rel [1:8, 11] 

#Let us see the train labels
train_labels

# 25% test labels
test_labels <- policy_rel [9:11, 11]

#let us see the train labels
test_labels

# Train the model
# Install class package
install.packages('class')

# Load the package
library(class)

# Using the knn algorithm

predicted_label <- knn(train_data, test_data, train_labels, k=1)

# Let us take a look at the predicted labels using k=1
predicted_label


# Compare the result of the predicted_label for ke=1 with the test_label

test_labels

# Looking at the result, We have an accuracy of 66.67% so we increase the performace using k = 3

predicted_label <- knn(train_data, test_data, train_labels, k=3)

# Let's look at the predicted label for k=3
predicted_label

# Compare the result of the predicted label for k=3 with the test label

test_labels

# Looking at the result We have an accuracy of 100% for k = 3






