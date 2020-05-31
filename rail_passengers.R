#######################################################################
######################################################################
library(readODS)
library(dplyr)
c <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/rai0101.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) # passenger(million) - journey(billion) [national,london underground]
c <- c[,-c(2,3,4)]
c <- c[-c(1:8),]
colnames(c) <- c('Year','Rail passenger journey (mil)','Rail passenger killometer (bil)','Lon underground passenger journey (mil)','Lon underground passenger killometer (bil)')

c$`Rail passenger journey (mil)` <- as.integer(c$`Rail passenger journey (mil)`)
c$`Rail passenger killometer (bil)` <- as.integer(c$`Rail passenger killometer (bil)`)
c$`Lon underground passenger journey (mil)` <- as.integer(c$`Lon underground passenger journey (mil)`)
c$`Lon underground passenger killometer (bil)` <- as.integer(c$`Lon underground passenger killometer (bil)`)

rail_pass_jour <- c$`Rail passenger journey (mil)`
rail_pass_jour <- as.data.frame(rail_pass_jour)
rail_pass_jour <- rail_pass_jour[-c(1:6),]
rail_pass_jour <- as.data.frame(rail_pass_jour)
colnames(rail_pass_jour) <- 'rail passenger journey (mil)'
rownames(rail_pass_jour) <- c('1946','1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
rail_pass_jour <- as.ts(rail_pass_jour)

rail_pass_km <- c$`Rail passenger killometer (bil)`
rail_pass_km <- data.frame(rail_pass_km)
rail_pass_km <- rail_pass_km[-c(1:6),]
rail_pass_km <- as.data.frame(rail_pass_km)
colnames(rail_pass_km) <- 'rail passenger killometer (billion)'
rail_pass_km <- as.ts(rail_pass_km)
rownames(rail_pass_km) <- c('1946','1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

lon_under_pass_jour <- c$`Lon underground passenger journey (mil)`
lon_under_pass_jour <- data.frame(lon_under_pass_jour)
lon_under_pass_jour <- lon_under_pass_jour[-c(1:6),]
lon_under_pass_jour <- as.data.frame(lon_under_pass_jour)
colnames(lon_under_pass_jour) <- 'london underground passenger journey (million)'
lon_under_pass_jour <- as.ts(lon_under_pass_jour)
rownames(lon_under_pass_jour) <- c('1946','1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

lon_under_pass_km <- c$`Lon underground passenger killometer (bil)`
lon_under_pass_km <- data.frame(lon_under_pass_km)
lon_under_pass_km <- lon_under_pass_km[-c(1:7),]
lon_under_pass_km <- as.data.frame(lon_under_pass_km)
colnames(lon_under_pass_km) <- 'london underground passenger killometer (billion)'
lon_under_pass_km <- as.ts(lon_under_pass_km)
rownames(lon_under_pass_km) <- c('1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

###################################################################################
boxplot(rail_pass_jour ~ cycle(rail_pass_jour))          
plot(diff(log(rail_pass_jour)))
plot(log(rail_pass_jour))
plot(diff(rail_pass_jour))
acf(rail_pass_jour)
acf(diff(log(rail_pass_jour))) # q=19 (because the line before the line which first gets inverted is 1)
pacf(diff(log(rail_pass_jour)))# p=1 (logic same as above)
fit <- arima(log(rail_pass_jour),c(1,1,19),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(rail_pass_jour,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(rail_pass_jour, frequency = 1, start = c(1946),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,19),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(rail_pass_jour)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(rail_pass_jour)
sd(rail_pass_jour)
mean(pred1)
sd(pred1)
tail(pred1)

#############################################################
boxplot(rail_pass_km ~ cycle(rail_pass_km))          
plot(diff(log(rail_pass_km)))
plot(log(rail_pass_km))
plot(diff(rail_pass_km))
acf(rail_pass_km)
acf(diff(log(rail_pass_km))) # q=6 (because the line before the line which first gets inverted is 1)
pacf(diff(log(rail_pass_km)))# p=4 (logic same as above)
fit <- arima(log(rail_pass_km),c(4,1,6),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(rail_pass_km,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(rail_pass_km, frequency = 1, start = c(1946),end = c(2017))
fit1 <- arima(log(datawide),c(4,1,6),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(rail_pass_km)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(rail_pass_km)
sd(rail_pass_km)
mean(pred1)
sd(pred1)
tail(pred1)

##########################################################33
boxplot(lon_under_pass_jour ~ cycle(lon_under_pass_jour))          
plot(diff(log(lon_under_pass_jour)))
plot(log(lon_under_pass_jour))
plot(diff(lon_under_pass_jour))
acf(lon_under_pass_jour)
acf(diff(log(lon_under_pass_jour))) # q=3 (because the line before the line which first gets inverted is 1)
pacf(diff(log(lon_under_pass_jour)))# p=1 (logic same as above)
fit <- arima(log(lon_under_pass_jour),c(1,1,3),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(lon_under_pass_jour,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(lon_under_pass_jour, frequency = 1, start = c(1946),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,3),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(lon_under_pass_jour)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(lon_under_pass_jour)
sd(lon_under_pass_jour)
mean(pred1)
sd(pred1)
tail(pred1)

###################################################################
boxplot(lon_under_pass_km ~ cycle(lon_under_pass_km))          
plot(diff(log(lon_under_pass_km)))
plot(log(lon_under_pass_km))
plot(diff(lon_under_pass_km))
acf(lon_under_pass_km)
acf(diff(log(lon_under_pass_km))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(lon_under_pass_km)))# p=1 (logic same as above)
fit <- arima(log(lon_under_pass_km),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(lon_under_pass_km,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(lon_under_pass_km, frequency = 1, start = c(1947),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(lon_under_pass_km)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(lon_under_pass_km)
sd(lon_under_pass_km)
mean(pred1)
sd(pred1)
tail(pred1)
