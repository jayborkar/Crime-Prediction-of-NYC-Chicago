#Reading the data
crimes <- read.csv(file='/Users/jayborkar/Desktop/Python3/Crimes_-_2001_to_present-2.csv')

#Removing the missing values from the dataset
df <- na.omit(crimes)

#Changing the date format to Year/Month/Day OR Year/Month
dd_hms <- tidyr::separate(crimes,"Date",c("MDY","HMS"),sep = " ")
dd_hms1 <- format(as.Date(dd_hms$MDY,format="%m/%d/%Y"),"%Y-%m")
#dd_hms1 <- format(as.Date(dd_hms$MDY,format="%m/%d/%Y"),"%Y-%m-%d")
dd_hms$Dates <- dd_hms1
dd_hms <- format(as.Date(dd_hms$MDY), "%Y/%m")


#df$Month_Yr <- format(as.Date(df$date), "%y-%m")

library(plyr)
#df<-count(df, 'Month_Yr')

#Transforming the dataset by calculating the count of crimes per month or per day
df<-count(dd_hms, 'Dates')

#Transforming the dataframe to time-series by week or month
keeps <- c(2)
df<-df[keeps]
y <- ts(df, frequency=7)

#Using ETS model for prediction by week
library(forecast)
fit <- ets(y)
fc <- forecast(fit)

#Plotting the results
plot(fc)
predDF <- summary(fc)
#Getting the prediction value for the week of May 2018
predMatrix <- as.matrix(predDF)

#Transforming the dataframe to time-series by monthly
time_ser=ts(df,frequency=12,start=c(2001,1))
plot(time_ser)

#Using ARIMA model for prediction by monthly
(fit<-arima(time_ser,c(0,1,0),seasonal=list(order=c(0,1,0),period=12)))
prediction<-predict(fit,n.ahead=5*12)

#Plotting the results
ts.plot(time_ser,prediction$pred,lty=c(1,3))
#Getting the prediction value for May 2018
prediction$pred[1]

