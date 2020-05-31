install.packages('readODS')
library(readODS)
library(ggplot2)
library(prophet)
library(tseries)
a <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Aviation/avi0101.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) #thousands

transport <- a[7:75,2]
transport <- as.integer(transport)
year_transport <- data.frame(transport)
colnames(year_transport) <- 'transport'
year_transport <- as.ts(year_transport)
row.names(year_transport) <- c('1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

class(year_transport)

frequency(year_transport)
boxplot(year_transport ~ cycle(year_transport))          
plot(diff(log(year_transport)))
plot(log(year_transport))
plot(diff(year_transport))
acf(year_transport)
acf(diff(log(year_transport))) # q=13 (because the line before the line which first gets inverted is 1)
pacf(diff(log(year_transport)))# p=1 (logic same as above)
fit <- arima(log(year_transport),c(1,1,13),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(year_transport,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(year_transport, frequency = 1, start = c(1950),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,13),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(year_transport)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(year_transport)
sd(year_transport)
mean(pred1)
sd(pred1)
sum(year_transport)
sum(pred1)
(81681+11932)/74





##############################################################
passengers <- a[7:75,3]
passengers <- as.integer(passengers)
year_passengers <- data.frame(passengers)
colnames(year_passengers) <- 'passengers'
year_passengers <- as.ts(year_passengers)
row.names(year_passengers) <- c('1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
class(year_passengers)

boxplot(year_passengers ~ cycle(year_passengers))          
plot(diff(log(year_passengers)))
plot(log(year_passengers))
plot(diff(year_passengers))
acf(year_passengers)
acf(diff(log(year_passengers))) # q=13 (because the line before the line which first gets inverted is 1)
pacf(diff(log(year_passengers)))# p=6 (logic same as above)
fit <- arima(log(year_passengers),c(6,1,13),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(year_passengers,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(year_passengers, frequency = 1, start = c(1950),end = c(2017))
fit1 <- arima(log(datawide),c(6,1,13),seasonal = list(order = c(6,1,13),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(year_passengers)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(year_passengers)
sd(year_passengers)
mean(pred1)
sd(pred1)




###################################################################
freight <- a[7:75,4]
freight <- as.integer(freight)
year_freight <- data.frame(freight)
colnames(year_freight) <- 'freight'
year_freight <- as.ts(year_freight)
row.names(year_freight) <- c('1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

boxplot(year_freight ~ cycle(year_freight))          
plot(diff(log(year_freight)))
plot(log(year_freight))
plot(diff(year_freight))
acf(year_freight)
acf(diff(log(year_freight))) # q=12 (because the line before the line which first gets inverted is 1)
pacf(diff(log(year_freight)))# p=6 (logic same as above)
fit <- arima(log(year_freight),c(6,1,12),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(year_freight,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(year_freight, frequency = 1, start = c(1950),end = c(2017))
fit1 <- arima(log(datawide),c(6,1,12),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(year_freight)
ts.plot(year_freight,2.718^pred$pred, log = "y", lty =c(1,3))
mean(year_freight)
sd(year_freight)
mean(pred1)
sd(pred1)




