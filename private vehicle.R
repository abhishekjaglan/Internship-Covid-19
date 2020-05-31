install.packages('readxl')
library(readxl)
d <- read_excel('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Private vehicle.xlsx') # thousands (private vehicle)
d <- d[-c(1,2),]
d <- d[-c(1:5),2]
colnames(d) <- c('Year','Private vehicle','Motorcycles, scooters and mopeds')

private_vehicle <- d$`Private vehicle`
private_vehicle <- data.frame(private_vehicle)
private_vehicle <- private_vehicle[-c(1:5),]
private_vehicle <- as.data.frame(private_vehicle)
colnames(private_vehicle) <- 'private vehicle'
private_vehicle <- as.ts(private_vehicle)
rownames(private_vehicle) <- c('1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

small_private_vehicle <- d$`Motorcycles, scooters and mopeds`
small_private_vehicle <- data.frame(small_private_vehicle)
small_private_vehicle <- small_private_vehicle[-c(1:5),]
small_private_vehicle <- as.data.frame(small_private_vehicle)
colnames(small_private_vehicle) <- 'motorcycles, scooters and mopeds'
small_private_vehicle <- as.ts(small_private_vehicle)
row.names(small_private_vehicle) <- c('1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

###################################################
boxplot(private_vehicle ~ cycle(private_vehicle))          
plot(diff(log(private_vehicle)))
plot(log(private_vehicle))
plot(diff(private_vehicle))
acf(private_vehicle)
acf(diff(log(private_vehicle))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(private_vehicle)))# p=0 (logic same as above)
fit <- arima(log(private_vehicle),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(private_vehicle,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(private_vehicle, frequency = 1, start = c(1950),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(private_vehicle)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(private_vehicle)
sd(private_vehicle)
mean(pred1)
sd(pred1)

##################################3
boxplot(small_private_vehicle ~ cycle(small_private_vehicle))          
plot(diff(log(small_private_vehicle)))
plot(log(small_private_vehicle))
plot(diff(small_private_vehicle))
acf(small_private_vehicle)
acf(diff(log(small_private_vehicle))) # q=6 (because the line before the line which first gets inverted is 1)
pacf(diff(log(small_private_vehicle)))# p=4 (logic same as above)
fit <- arima(log(small_private_vehicle),c(4,1,6),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(small_private_vehicle,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(small_private_vehicle, frequency = 1, start = c(1950),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(small_private_vehicle)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(small_private_vehicle)
sd(small_private_vehicle)
mean(pred1)
sd(pred1)

