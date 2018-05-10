#Reading the data
crimeNYC <- read.csv(file='nyc_1516.csv')

#Removing the missing values from the dataset
dfNYC <-  na.omit(crimeNYC)

#Changing the date format to Year/Month/Day OR Year/Month
df2 <- format(as.Date(dfNYC$CMPLNT_FR_DT,format="%m/%d/%Y"),"%Y/%m/%d")
dfNYC$CMPLNT_FR_DT <- df2
#dfNYC$Month_Yr <- format(as.Date(df$date), "%y-%m")

#Transforming the dataset by calculating the count of crimes per month or per day
dfNYC<-count(dfNYC, 'RPT_DT')

#Transforming the dataframe to time-series by week or month
keeps <- c(2)
dfNYC<-dfNYC[keeps]
y <- ts(dfNYC, frequency=7)

#Using ETS model for prediction by week
library(forecast)
fit <- ets(y)
fc <- forecast(fit,h=87)

#Plotting the results
plot(fc)
predDF <- summary(fc)
#Getting the prediction value for the week of May 2018
predMatrix <- as.matrix(predDF)

#Transforming the dataframe to time-series by monthly
time_ser=ts(dfNYC,frequency=12,start=c(2006,1))
plot(time_ser)

#Using ARIMA model for prediction by monthly
(fit<-arima(time_ser,c(0,1,1),seasonal=list(order=c(0,1,1),period=12)))
prediction<-predict(fit,n.ahead=5*12)

#Plotting the results
ts.plot(time_ser,prediction$pred,lty=c(1,3))
#Getting the prediction value for May 2018
prediction$pred[17]