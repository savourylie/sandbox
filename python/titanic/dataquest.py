import pandas

# We can use the pandas library in python to read in the csv file.
# This creates a pandas dataframe and assigns it to the titanic variable.
titanic = pandas.read_csv("train.csv")

# Print the first 5 rows of the dataframe.
print(titanic.head(5))

print(titanic.describe())