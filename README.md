<!-- PROJECT LOGO -->
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg" alt="Logo" width="120" height="120">
</p>

<h1 align="center">Machine Learning Project – Churn Analysis</h1>

<p align="center">
  Predicting customer churn in the telecom industry using classical ML models<br>
  <a href="Churn_ML_Presentation_Final.html">View Presentation</a>
  ·
  <a href="Part%20A/Churn_MachineLearning_PartA.ipynb">Part A Notebook</a>
  ·
  <a href="Part%20B/Churn_MachineLearning_PartB.ipynb">Part B Notebook</a>
</p>

---
<br></br>

## Table of Contents

- [About The Project](#about-the-project)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [Code Examples](#code-examples)
- [To-Do List](#to-do-list)
- [License](#license)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

---
<br></br>

## About The Project

> This project was built as part of the **GenAI14 Python & Machine Learning course**.  
> It applies classical supervised machine learning to predict **customer churn** in a telecommunications company, using a real-world dataset of ~7,000 customers with 21 features.

The project is split into two parts:

- **Part A** – Full EDA, data preparation, and ML modelling pipeline (Decision Tree → Random Forest → KNN), with overfitting analysis, hyperparameter tuning, and a business insight summary.
- **Part B** – Extends Part A by connecting to a **MongoDB** database, executing MQL queries to retrieve customer data, reusing the best-performing model from Part A to predict churn, and exporting the enriched dataset back to CSV.

<div style="background: #272822; color: #f8f8f2; padding: 10px; border-radius: 8px;">
  <b>Technologies:</b> Python, Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn, XGBoost, MongoDB (PyMongo)
</div>

---
<br></br>

## Features

- [x] Exploratory Data Analysis (EDA) with hypothesis-driven insights  
- [x] Data cleaning — hidden nulls, type conversion, feature removal  
- [x] Feature engineering — tenure groups, binary encoding, one-hot encoding  
- [x] Three ML models: Decision Tree, Random Forest, KNN  
- [x] Overfitting analysis with cross-validation and bias/variance trade-off  
- [x] Hyperparameter tuning with GridSearchCV  
- [x] Confusion matrix & classification report evaluation  
- [x] Feature importance & SHAP-style interpretability  
- [x] MongoDB integration (Part B) — MQL queries, data retrieval, prediction export  
- [x] HTML presentation (`Churn_ML_Presentation_Final.html`)  

---
<br></br>

## Getting Started

### Prerequisites

- Python >= 3.8
- pip
- MongoDB (for Part B — local or Atlas cluster)

### Installation

```bash
git clone https://github.com/idanarbel/Python-Machine-Learning-Project-Churn-Analysis.git
cd Python-Machine-Learning-Project-Churn-Analysis
pip install -r requirements.txt
```

---
<br></br>

## Usage

### Run Part A (EDA + Modelling)

Open and run all cells in:

```
Part A/Churn_MachineLearning_PartA.ipynb
```

### Run Part B (MongoDB + Prediction Export)

Make sure your MongoDB connection string is configured, then run:

```
Part B/Churn_MachineLearning_PartB.ipynb
```

### View the Presentation

Open `Churn_ML_Presentation_Final.html` in any browser for a summary slide deck of the project.

---
<br></br>

## Project Structure

```text
Python-Machine-Learning-Project-Churn-Analysis/
├── Part A/
│   ├── Churn_MachineLearning_PartA.ipynb   # EDA, data prep, ML modelling
│   └── churn.csv                            # Raw dataset (7,043 customers)
├── Part B/
│   ├── Churn_MachineLearning_PartB.ipynb   # MongoDB integration + prediction export
│   └── churn.csv                            # Dataset copy for Part B
├── Churn_ML_Presentation_Final.html         # Final HTML presentation
├── requirements.txt
└── README.md
```

---
<br></br>

## Screenshots

<p float="left">
  <img src="https://media.istockphoto.com/id/1188462768/photo/notepad-with-churn-percent-near-marker-over-desk.jpg?s=612x612&w=0&k=20&c=1cP2pmT6oHcyrAvnMbivVx13jJyw-8Cr2FJos3JblJI=" width="400"/>
</p>

---
<br></br>

## Code Examples

```python
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

# Load prepared dataset
df = pd.read_csv('Part A/churn.csv')

# Split features and target
X = df.drop('Churn', axis=1)
y = df['Churn']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train best model (Random Forest)
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

print(classification_report(y_test, model.predict(X_test)))
```

---
<br></br>

## Key EDA Findings

| Finding | Evidence |
|---------|----------|
| ~26% of customers churn | Imbalanced classes — accuracy alone is misleading |
| Gender has almost no effect | Churn rates nearly identical (~26%) for male and female |
| Month-to-month contracts churn most | 43% churn rate vs. 3% for two-year contracts |
| New customers (0–12 months) churn most | 47% churn rate in first year |
| Senior citizens churn more | 42% vs. 24% for non-seniors |
| Electronic check payers churn most | 45% churn rate vs. ~16% for automatic payments |
| Fiber optic customers churn more | 42% churn vs. 19% for DSL |

---
<br></br>

## To-Do List

- [x] Exploratory Data Analysis
- [x] Data preparation pipeline
- [x] Decision Tree, Random Forest, KNN modelling
- [x] Overfitting analysis & hyperparameter tuning
- [x] MongoDB integration (Part B)
- [x] Final HTML presentation
- [ ] Deploy interactive dashboard (e.g., Streamlit)
- [ ] Add SHAP value visualizations

---
<br></br>

## License

No license — academic project.

---
<br></br>

## Contact

**Idan Arbel** — [idan.rbel@gmail.com](mailto:idan.rbel@gmail.com)  
Project Link: [https://github.com/idanarbel/Python-Machine-Learning-Project-Churn-Analysis](https://github.com/idanarbel/Python-Machine-Learning-Project-Churn-Analysis)

---
<br></br>

## Acknowledgments

- [Python](https://www.python.org/)
- [Pandas](https://pandas.pydata.org/)
- [Scikit-learn](https://scikit-learn.org/)
- [Seaborn](https://seaborn.pydata.org/)
- [MongoDB PyMongo](https://pymongo.readthedocs.io/)
- [GenAI14 Course]([https://www.idc.ac.il](https://cont-edu.technion.ac.il/programs/%d7%94%d7%9b%d7%a9%d7%a8%d7%95%d7%aa-%d7%9c%d7%aa%d7%97%d7%95%d7%9e%d7%99-ai/generative-ai-and-llm-hands-on/)/)

---
