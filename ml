==================CYCLE 1=====================
1.Central Tendency and Dispersion Measures Description
FOR LOAD DATASET
import pandas as pd
from sklearn.datasets import load_iris

# 1. Load the dataset
dataset = load_iris()

df = pd.DataFrame(data=dataset.data, columns=dataset.feature_names)

# 2. Calculate statistics for all columns
mean_val = df.mean()
median_val = df.median()
mode_val = df.mode().iloc[0]  # mode() returns a DataFrame; iloc[0] gets the first mode
std_dev = df.std()
variance = df.var()

# 3. Display results
print("--- Descriptive Statistics ---")
stats_df = pd.DataFrame({
    'Mean': mean_val,
    'Median': median_val,
    'Mode': mode_val,
    'Std Dev': std_dev,
    'Variance': variance
})
print(stats_df)
FOR CUSTOM DATASET
import pandas as pd

# 1. Load any dataset (CSV file)
# Example: data.csv, marks.csv, sales.csv, etc.
df = pd.read_csv("diabetes.csv")#put your dataset

# 2. Select only numeric columns
numeric_df = df.select_dtypes(include=['number'])

# 3. Calculate statistics
mean_val = numeric_df.mean()
median_val = numeric_df.median()
mode_val = numeric_df.mode().iloc[0]
std_dev = numeric_df.std()
variance = numeric_df.var()

# 4. Display results
print("--- Descriptive Statistics ---")
stats_df = pd.DataFrame({
    'Mean': mean_val,
    'Median': median_val,
    'Mode': mode_val,
    'Std Dev': std_dev,
    'Variance': variance
})
print(stats_df)
---------------------------------------
2.Arithmetic Array Operations Using Python Libraries Description
# Arithmetic Array Operations using Math, Statistics, NumPy and SciPy

import math
import statistics
import numpy as np
from scipy import linalg

# Input arrays
arr1 = np.array([10, 20, 30, 40])
arr2 = np.array([2, 4, 5, 8])

print("Array 1:", arr1)
print("Array 2:", arr2)

# -----------------------------
# NumPy Arithmetic Operations
# -----------------------------
print("\n--- NumPy Arithmetic Operations ---")

print("Addition:", np.add(arr1, arr2))
print("Subtraction:", np.subtract(arr1, arr2))
print("Multiplication:", np.multiply(arr1, arr2))
print("Division:", np.divide(arr1, arr2))
print("Exponentiation:", np.power(arr1, arr2))
print("Modulus:", np.mod(arr1, arr2))

# -----------------------------
# Math Library (Scalar Example)
# -----------------------------
print("\n--- Math Library Operations ---")

a = 16
b = 3

print("Square root of a:", math.sqrt(a))
print("Power (a^b):", math.pow(a, b))
print("Modulus:", math.fmod(a, b))

# -----------------------------
# Statistics Library
# -----------------------------
print("\n--- Statistics Operations ---")

data = [10, 20, 30, 40, 50]

print("Mean:", statistics.mean(data))
print("Median:", statistics.median(data))
print("Variance:", statistics.variance(data))
print("Standard Deviation:", statistics.stdev(data))

# -----------------------------
# SciPy Operations
# -----------------------------
print("\n--- SciPy Operations ---")

matrix = np.array([[1, 2], [3, 4]])

print("Matrix:\n", matrix)
print("Determinant:", linalg.det(matrix))
print("Inverse Matrix:\n", linalg.inv(matrix))
-------------------------------------------------
3.Data Analysis and Visualization Using Dataset Description
# Import required libraries
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.datasets import load_iris # ← CHANGE HERE if needed

# -------------------------------
# a. Load Dataset
# -------------------------------

dataset = load_iris()   # ← CHANGE HERE (e.g., load_wine(), load_breast_cancer())

# Create DataFrame from dataset
df = pd.DataFrame(data=dataset.data, columns=dataset.feature_names)

# Add target column if available
if hasattr(dataset, 'target'):
    df['target'] = dataset.target

# -------------------------------
# b. Pandas: Data Analysis & Manipulation
# -------------------------------

print("First 5 rows of dataset:")
print(df.head())

print("\nDataset Information:")
print(df.info())

print("\nStatistical Summary:")
print(df.describe())

# Target distribution (only if target exists)
if 'target' in df.columns:
    print("\nTarget Value Counts:")
    print(df['target'].value_counts())

# -------------------------------
# c. Matplotlib: Data Visualization
# -------------------------------

# Select any two features for plotting
x_feature = df.columns[0]   # ← CHANGE HERE if required
y_feature = df.columns[1]   # ← CHANGE HERE if required

plt.figure()
plt.scatter(df[x_feature], df[y_feature],
            c=df['target'] if 'target' in df.columns else 'blue')

plt.xlabel(x_feature)
plt.ylabel(y_feature)
plt.title(f"{x_feature} vs {y_feature}")
plt.show()
#here we change just 2 lines load and import
-------------------------------------------------------
4.FIND-S Algorithm Description
#find s easy
data = [
    ['Sunny', 'Warm', 'Normal', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Rainy', 'Cold', 'High', 'Strong', 'Warm', 'Change', 'No'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Cool', 'Change', 'Yes']
]

# Step 1: Initialize hypothesis as empty
h = ['0', '0', '0', '0', '0', '0']

# Step 2: Apply FIND-S
k=0;
for row in data:
    if row[-1] == 'Yes':      # only positive examples
        for i in range(6):
            if h[i] == '0':
                h[i] = row[i]
            elif h[i] != row[i]:
                h[i] = '?'
    print(f"iteration : {k} ",h)
    k+=1

print("Final Hypothesis:", h)
------------------------------------------------------------
====cycle 2=====
5a. Perform simple linear regression 
FOR CUSTOM DATASET
import pandas as pd
from sklearn.linear_model import LinearRegression
data = {'Experience': [1,2,3,4,5], 'Salary': [30000,40000,50500,60000,70000]}
df = pd.DataFrame(data)
X = df[['Experience']]
y = df['Salary']
model = LinearRegression()
model.fit(X, y)
predicted_salary = model.predict([[6]])
print("Coefficient:", model.coef_)
print("Intercept:", model.intercept_)
print("Predicted Salary for 6 years experience:", predicted_salary[0])

FOR Salary_dataset.csv(u can download any dataset, And change column names)
# Import required libraries
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# Load CSV dataset
data = pd.read_csv("Salary_dataset.csv")

# Display available columns
print("Columns in the dataset:")
print(data.columns)

# Select variables
X = data[['YearsExperience']]
Y = data['Salary']

# Create and fit regression model
model = LinearRegression()
model.fit(X, Y)

# Display regression values
print("\nSlope:", model.coef_[0])
print("Intercept:", model.intercept_)

# Plot data and regression line
plt.scatter(X, Y)
plt.plot(X, model.predict(X))
plt.xlabel("Experience")
plt.ylabel("Salary")
plt.title("Simple Linear Regression")
plt.show()

5b.multiple linear regression 
# STEP 1: Import required libraries
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# STEP 2: Load the dataset
# 👉 CHANGE the file name if your dataset name is different
df = pd.read_csv("house_prices.csv")

# STEP 3: Display columns to understand the dataset
print("Available columns in dataset:")
print(df.columns)
print()

# STEP 4: Handle missing values (simple method)
# 👉 CHANGE column names if needed
df = df.fillna(df.median(numeric_only=True))

# STEP 5: Select independent (X) and dependent (y) variables
# 👉 CHANGE feature columns according to YOUR dataset
X = df[['area', 'bedrooms', 'age']]   # independent variables
y = df['price']                       # dependent variable

# STEP 6: Create and train the model
model = LinearRegression()
model.fit(X, y)

# STEP 7: Predict house price for a sample input
# 👉 CHANGE values according to features order
sample_prediction = model.predict([[2500, 3, 10]])
print("Predicted House Price:", sample_prediction[0])

# STEP 8: Display model accuracy
print("Model Score:", model.score(X, y))

# STEP 9: Plot Actual vs Predicted Prices
y_pred = model.predict(X)

plt.scatter(y, y_pred)
plt.xlabel("Actual Price")
plt.ylabel("Predicted Price")
plt.title("Multiple Linear Regression - House Price Prediction")
plt.show()
--------------------------------------------
6.Decision Tree
# STEP 1: Import required libraries
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor, plot_tree
from sklearn.metrics import r2_score

# STEP 2: Load the dataset
df = pd.read_csv("daily_weather.csv")

# STEP 3: Select input and output
X = df.drop('relative_humidity_9am', axis=1)
y = df['relative_humidity_9am']

# STEP 4: Train-test split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# STEP 5: Train Decision Tree model
model = DecisionTreeRegressor(max_depth=3)  # depth kept small for clear display
model.fit(X_train, y_train)

# STEP 6: Prediction and evaluation
y_pred = model.predict(X_test)
print("R2 Score:", r2_score(y_test, y_pred))

# STEP 7: DISPLAY THE DECISION TREE
plt.figure(figsize=(20, 10))
plot_tree(
    model,
    feature_names=X.columns,
    filled=True
)
plt.title("Decision Tree for Humidity Prediction")
plt.show()
------------------------------------------------
7.Write a program to implement k-Nearest Neighbour classification algorithm using iris dataset.

from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix, accuracy_score
data = load_iris()
X = data.data
y = data.target
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)
model = KNeighborsClassifier(n_neighbors=3)
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("Accuracy:", accuracy_score(y_test, y_pred))
-------------------------------------------------------------
8.Write a program to predict rainfall using Logistic Regression. (weatherAUS.csv)
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, accuracy_score

# Load dataset
df = pd.read_csv("weatherAUS.csv")
df = df.dropna()

# Convert output to numeric
df['RainTomorrow'] = df['RainTomorrow'].map({'No': 0, 'Yes': 1})

# Select features and target
X = df.select_dtypes(include=['float64', 'int64'])
y = df['RainTomorrow']

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

# Train model
model = LogisticRegression(max_iter=1000)
model.fit(X_train, y_train)

# Predict
y_pred = model.predict(X_test)

# Print results
print("Accuracy:", accuracy_score(y_test, y_pred))

# SIMPLE plot
plt.scatter(y_test, y_pred)
plt.xlabel("Actual")
plt.ylabel("Predicted")
plt.title("Rainfall Prediction")
plt.show()
--------------------------------------
9.K-means Algorithm 
import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# load dataset
df = pd.read_csv("Mall_Customers.csv")

# select features
X = df[['Annual Income (k$)', 'Spending Score (1-100)']]

# model
model = KMeans(n_clusters=3, random_state=42)
model.fit(X)

# add cluster labels
df['Cluster'] = model.labels_

# plot
# //all rows of 0th col,1st col
plt.scatter(X.iloc[:,0], X.iloc[:,1], c=model.labels_)
plt.xlabel("Income")
plt.ylabel("Spending Score")
plt.show()
#optional
from sklearn.metrics import silhouette_score
print("Score:", silhouette_score(X, model.labels_))
---------------------------------------------

10.Build a Multi-Layer Perceptron (MLP) neural network model for Regression using Keras
(minihomeprices.csv / housing.csv)

# STEP 1: Import required libraries
import pandas as pd
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# STEP 2: Load dataset
# 👉 Change file name if needed (minihomeprices.csv / housing.csv)
df = pd.read_csv("housing.csv")

# STEP 3: Remove missing values
df = df.dropna()

# STEP 4: Keep only numeric columns
df = df.select_dtypes(include=['int64', 'float64'])

# STEP 5: Separate input and output
# 👉 Change 'Price' if your target column name is different
X = df.drop('Price', axis=1)
y = df['Price']

# STEP 6: Split data into training and testing
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2
)

# STEP 7: Build MLP model
model = Sequential()
model.add(Dense(10, activation='relu', input_shape=(X_train.shape[1],)))
model.add(Dense(1))   # Output layer

# STEP 8: Compile model
model.compile(optimizer='adam', loss='mse')

# STEP 9: Train model
model.fit(X_train, y_train, epochs=10)

# STEP 10: Predict values
predictions = model.predict(X_test)

# STEP 11: Display output
print("Predicted values (first 5):", predictions[:5])

import matplotlib.pyplot as plt

# Simple plot: Actual vs Predicted
plt.scatter(y_test, predictions)
plt.xlabel("Actual Price")
plt.ylabel("Predicted Price")
plt.title("MLP Regression: Actual vs Predicted")
plt.show()

mse = model.evaluate(X_test, y_test)
print("Mean Squared Error (MSE):", mse)
-----------------------------------------------------
EXTRA PROGRAM
Write a Python program to implement a Random Forest classifier using standard machine learning libraries.
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Sample dataset
X = np.array([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]])
y = np.array([0, 0, 1, 1, 1])

# Create and train Random Forest model
rf = RandomForestClassifier(n_estimators=10, random_state=42)
rf.fit(X, y)

# Predict on training data
y_pred = rf.predict(X)

# Calculate accuracy
accuracy = accuracy_score(y, y_pred)

print("Predicted values:", y_pred)
print("Accuracy:", accuracy)
------------------------------------------
Extra programs

 *1. Single Layer Perceptron (AND & OR)*

*Code :*

 import numpy as np

# Step activation function
def step(x):
    return 1 if x >= 0 else 0

# Inputs
X = np.array([
    [0, 0],
    [0, 1],
    [1, 0],
    [1, 1]
])

print("AND Gate:")
for x in X:
    y = step(1*x[0] + 1*x[1] - 1.5)   # weights = 1,1  bias = -1.5
    print(x, "->", y)

print("\nOR Gate:")
for x in X:
    y = step(1*x[0] + 1*x[1] - 0.5)   # weights = 1,1  bias = -0.5
    print(x, "->", y)

 *2. Multi-Layer Perceptron (AND, OR, XOR)*

 *Code:*
    
    import numpy as np

# Step function
def step(x):
    return 1 if x >= 1 else 0

# Inputs
X = np.array([
    [0,0],
    [0,1],
    [1,0],
    [1,1]
])

print("MLP Outputs:\n")

for x in X:
    a, b = x

    # Hidden layer
    h1 = step(a + b)        # OR
    h2 = step(2 - (a + b))  # NAND

    # Output layer
    and_out = step(a + b - 1.5)
    or_out = step(a + b - 0.5)
    xor_out = step(h1 + h2 - 1.5)

    print("Input:", x)
    print("AND :", and_out)
    print("OR  :", or_out)
    print("XOR :", xor_out)
    print()


# Import libraries
import pandas as pd
import matplotlib.pyplot as plt

# Load dataset (change file name)
df = pd.read_csv("your_file.csv")

# Select columns (change based on your dataset)
x = df.columns[0]
y = df.columns[1]

# -------------------------------
# 1️⃣ SCATTER PLOT
# -------------------------------
# Shows relationship between two variables
plt.figure()
plt.scatter(df[x], df[y])
plt.xlabel(x)
plt.ylabel(y)
plt.title("Scatter Plot")
plt.show()

# -------------------------------
# 2️⃣ LINE PLOT
# -------------------------------
# Shows trend over data
plt.figure()
plt.plot(df[x], df[y])
plt.xlabel(x)
plt.ylabel(y)
plt.title("Line Plot")
plt.show()

# -------------------------------
# 3️⃣ BAR GRAPH
# -------------------------------
# Shows frequency/count of categories
plt.figure()
df[x].value_counts().plot(kind='bar')
plt.xlabel(x)
plt.ylabel("Count")
plt.title("Bar Graph")
plt.show()

# -------------------------------
# 4️⃣ HISTOGRAM
# -------------------------------
# Shows distribution of values
plt.figure()
plt.hist(df[x])
plt.xlabel(x)
plt.ylabel("Frequency")
plt.title("Histogram")
plt.show()

# -------------------------------
# 5️⃣ PIE CHART
# -------------------------------
# Shows percentage distribution
plt.figure()
df[x].value_counts().plot(kind='pie')
plt.title("Pie Chart")
plt.show()

# -------------------------------
# 6️⃣ BOX PLOT
# -------------------------------
# Shows spread + outliers
plt.figure()
plt.boxplot(df[x])
plt.title("Box Plot")
plt.show()
