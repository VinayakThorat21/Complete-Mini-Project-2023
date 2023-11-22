# Load the data
import pandas as pd
from sklearn.model_selection import GridSearchCV
from xgboost import XGBClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from imblearn.over_sampling import SMOTE
from sklearn.svm import SVC
from sklearn.discriminant_analysis import StandardScaler

data = pd.read_csv('../Input/dataset.csv')
models = []
accuracy = []

# Split the Data into features and Target
X = data.drop('Outcome', axis=1)
y = data.Outcome

# Define the hyperparameter grid
xgboost_param_grid = {
    'n_estimators': [100, 200, 300],
    'max_depth': [3, 5, 7],
    'learning_rate': [0.01, 0.05, 0.1],
    'gamma': [0, 0.1, 0.5]
}

# Train the XGBoost classifier
xgboost_model = XGBClassifier()

# Train the model on the training data
xgboost_model.fit(X, y)

# Tune the hyperparameters using GridSearchCV
xgboost_grid_search = GridSearchCV(xgboost_model, xgboost_param_grid, cv=5)
xgboost_grid_search.fit(X, y)

# Get the best hyperparameters
xgboost_best_params = xgboost_grid_search.best_params_

# Create a new XGBoost classifier with the best hyperparameters
xgboost_best_model = XGBClassifier(**xgboost_best_params)

# Train the best model on the training data
xgboost_best_model.fit(X, y)

# Initialize and train the Random Forest classifier
rf_model = RandomForestClassifier(n_estimators=100, random_state=7)
rf_model.fit(X, y)

# Standardize the features (important for KNN)
scaler = StandardScaler()
knn_X = scaler.fit_transform(X)

# Define the range of k values to search
knn_param_grid = {'n_neighbors': range(1, 21)}  # You can adjust the range as needed

# Initialize the KNN classifier
k = 3  # You can adjust the number of neighbors (k) as needed
knn_model = KNeighborsClassifier(n_neighbors=k)

# Create a GridSearchCV object
knn_grid_search = GridSearchCV(knn_model, knn_param_grid, cv=5)  # Use cross-validation with 5 folds

# Fit the GridSearchCV to your data
knn_grid_search.fit(knn_X, y)

# Fit the classifier to the training data
knn_model.fit(knn_X, y)

# Get the best parameter (k value)
best_k = knn_grid_search.best_params_['n_neighbors']

# Create a new KNN classifier with the best k value
knn_best_model = KNeighborsClassifier(n_neighbors=best_k)

# Fit the best classifier to the training data
knn_best_model.fit(knn_X, y)

# Feature scaling
scaler = StandardScaler()
log_reg_X = scaler.fit_transform(X)

# Perform SMOTE for class imbalance
smote = SMOTE(sampling_strategy='auto', random_state=7)
log_reg_X_train_resampled, log_reg_y_train_resampled = smote.fit_resample(log_reg_X, y)

# Hyperparameter tuning using GridSearchCV
log_reg_param_grid = {
    'penalty': ['l2'],
    'C': [0.001, 0.01, 0.1, 1, 10]
}

grid_search = GridSearchCV(LogisticRegression(penalty=None), log_reg_param_grid, cv=5)
grid_search.fit(log_reg_X_train_resampled, log_reg_y_train_resampled)
log_reg_best_model = grid_search.best_estimator_

# Standardize the feature data
scaler = StandardScaler()
svm_X = scaler.fit_transform(X)

# Create an SVM model
svm_model = SVC(kernel='linear', C=1.0)

# Train the SVM model on the training data
svm_model.fit(svm_X, y)

def predict(pregnancies, glucose, blood_pressure, skin_thickness, insulin, bmi, dpf, age):
    individual = pd.DataFrame({
        'Pregnancies': [pregnancies],
        'Glucose': [glucose],
        'BloodPressure': [blood_pressure],
        'SkinThickness': [skin_thickness],
        'Insulin': [insulin],
        'BMI': [bmi],
        'DiabetesPedigreeFunction': [dpf],
        'Age': [age]
    })

    # Handle missing values and scaling
    # individual = preprocess_individual_data(individual)

    individual_report = xgboost_best_model.predict(individual), rf_model.predict(individual), knn_best_model.predict(scaler.transform(individual)), log_reg_best_model.predict(scaler.transform(individual)), svm_model.predict(scaler.transform(individual))
    diabetic = 0
    normal = 0

    for report in individual_report:
        if report == 1:
            diabetic += 1
        else:
            normal += 1
    
    if diabetic > normal:
        return 1
    else:
        return 0