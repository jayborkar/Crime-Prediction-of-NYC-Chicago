# Crime-Prediction-of-NYC-Chicago

- Performing Time-Series prediction using ARIMA and ETS models in R for predicting crimes in the future.

# Chicago

**Prediction of Crimes by Month**

- Dataset: Chicago Crimes_2001_to_present (April 2018)
- Transforming the dataset to Time - series format using the date column in the
dataset by month.
- Using ARIMA model which is AutoRegressive Integrated Moving Average -
Generalized Time series model.
- Fitting ARIMA models on the data and comparing the AIC (​Akaike information
criterion​), AIC estimates the quality of each model, relative to each of the other models. 
- Selected ARIMA(0,1,1) which is basic Exponential Smoothing model based on the ​minimum AIC value.


**Prediction of Crimes by Weekly**

- Transforming the dataset to Time - series format using the date column in the dataset by day.
- Using ETS(A,N,A) model which is Exponential Smoothing model on the data, ETS() function in R automatically chooses best model using AIC,AICc or BIC.

# New York City

**Prediction of Crimes by Month**

- Dataset: NYC Crimes_2006_to_2016
- Transforming the dataset to Time - series format using the date column in the
dataset by month.
- Using ARIMA model which is AutoRegressive Integrated Moving Average -
Generalized Time series model.
- Fitting ARIMA models on the data and comparing the AIC (​Akaike information
criterion​), AIC estimates the quality of each model, relative to each of the other models. 
- Selected ARIMA(0,1,1) which is basic Exponential Smoothing model based on the ​minimum AIC value.

**Prediction of Crimes by Weekly**

- Transforming the dataset to Time - series format using the date column in the dataset by day.
- Using ETS(A,N,A) model which is Exponential Smoothing model on the data, ETS() function which automatically chooses the best     model using AIC,AICc or BIC.
