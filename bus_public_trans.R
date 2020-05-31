library(readODS)
a <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/bus0103.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) #millions (Passengers)
a <- a[-c(1,2,3,4,5,6,7,8),]
a <- a[,-c(2,3)]
colnames(a) <- c('Year','London','English metropolitan areas','English non-metropolitan areas','England','Scotland','Wales','Great Britain','England outside London')
a
a$London <- as.numeric(a$London)
a$`English metropolitan areas` <- as.numeric(a$`English metropolitan areas`)
a$`English non-metropolitan areas` <- as.numeric(a$`English non-metropolitan areas`)
a$England <- as.numeric(a$England)
a$Scotland <- as.numeric(a$Scotland)
a$Wales <- as.numeric(a$Wales)
a$`Great Britain` <- as.numeric(a$`Great Britain`)
a$`England outside London` <- as.numeric(a$`England outside London`)
####################################
library(dplyr)
london_bus <- data.frame(a$London)
row.names(london_bus) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(london_bus) <- 'london'
class(london_bus)
london_bus <- as.ts(london_bus)
class(london_bus)

eng_metro_areas <- data.frame(a$`English metropolitan areas`)
row.names(eng_metro_areas) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(eng_metro_areas) <- 'eng_metro_areas'
eng_metro_areas <- as.ts(eng_metro_areas)

eng_nonmetro_areas <- data.frame(a$`English non-metropolitan areas`)
row.names(eng_nonmetro_areas) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(eng_nonmetro_areas) <- 'eng_nonmetro_areas'
eng_nonmetro_areas <- as.ts(eng_nonmetro_areas)
class(eng_nonmetro_areas)

england <- data.frame(a$England)
row.names(england) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(england) <- 'england'
england <- as.ts(england)
class(england)

scotland <- data.frame(a$Scotland)
row.names(scotland) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(scotland) <- 'scotland'
scotland <- as.ts(scotland)
class(scotland)

wales <- data.frame(a$Wales)
row.names(wales) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(wales) <- 'wales'
wales <- as.ts(wales)
class(wales)

gbr <- data.frame(a$`Great Britain`)
row.names(gbr) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(gbr) <- 'gbr'
gbr <- as.ts(gbr)
class(gbr)

eng_outside_lon <- data.frame(a$`England outside London`)
row.names(eng_outside_lon) <- c('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(eng_outside_lon) <- 'eng_outside_lon'
eng_outside_lon <- as.ts(eng_outside_lon)
class(eng_outside_lon)

#################################################

boxplot(london_bus ~ cycle(london_bus))          
plot(diff(log(london_bus)))
plot(log(london_bus))
plot(diff(london_bus))
acf(london_bus)
acf(diff(log(london_bus))) # q=11 (because the line before the line which first gets inverted is 1)
pacf(diff(log(london_bus)))# p=1 (logic same as above)
fit <- arima(log(london_bus),c(1,1,11),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(london_bus,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(london_bus, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,11),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(london_bus,1)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(london_bus)
sd(london_bus)
mean(pred1)
sd(pred1)

################################################
boxplot(eng_metro_areas ~ cycle(eng_metro_areas))          
plot(diff(log(eng_metro_areas)))
plot(log(eng_metro_areas))
plot(diff(eng_metro_areas))
acf(eng_metro_areas)
acf(diff(log(eng_metro_areas))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(eng_metro_areas)))# p=0 (logic same as above)
fit <- arima(log(eng_metro_areas),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(eng_metro_areas,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(eng_metro_areas, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(eng_metro_areas,1)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(eng_metro_areas)
sd(eng_metro_areas)
mean(pred1)
sd(pred1)

#############################################
boxplot(eng_nonmetro_areas ~ cycle(eng_nonmetro_areas))          
plot(diff(log(eng_nonmetro_areas)))
plot(log(eng_nonmetro_areas))
plot(diff(eng_nonmetro_areas))
acf(eng_nonmetro_areas)
acf(diff(log(eng_nonmetro_areas))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(eng_nonmetro_areas)))# p=1 (logic same as above)
fit <- arima(log(eng_nonmetro_areas),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(eng_nonmetro_areas,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(eng_nonmetro_areas, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(eng_nonmetro_areas,1)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(eng_nonmetro_areas)
sd(eng_nonmetro_areas)
mean(pred1)
sd(pred1)
###########################################
boxplot(england ~ cycle(england))          
plot(diff(log(england)))
plot(log(england))
plot(diff(england))
acf(england)
acf(diff(log(england))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(england)))# p=2 (logic same as above)
fit <- arima(log(england),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(england,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(england, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(2,1,4),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(england)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(england)
sd(england)
mean(pred1)
sd(pred1)
##################################
boxplot(scotland ~ cycle(scotland))          
plot(diff(log(scotland)))
plot(log(scotland))
plot(diff(scotland))
acf(scotland)
acf(diff(log(scotland))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(scotland)))# p=1 (logic same as above)
fit <- arima(log(scotland),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(scotland,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(scotland, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(scotland)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(scotland)
sd(scotland)
mean(pred1)
sd(pred1)
###################################
boxplot(wales ~ cycle(wales))          
plot(diff(log(wales)))
plot(log(wales))
plot(diff(wales))
acf(wales)
acf(diff(log(wales))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(wales)))# p=0 (logic same as above)
fit <- arima(log(wales),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(wales,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(wales, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(wales)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(wales)
sd(wales)
mean(pred1)
sd(pred1)

################################################################
boxplot(gbr ~ cycle(gbr))          
plot(diff(log(gbr)))
plot(log(gbr))
plot(diff(gbr))
acf(gbr)
acf(diff(log(gbr))) # q=13 (because the line before the line which first gets inverted is 1)
pacf(diff(log(gbr)))# p=1 (logic same as above)
fit <- arima(log(gbr),c(1,1,13),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(gbr,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(gbr, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,13),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(gbr)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(gbr)
sd(gbr)
mean(pred1)
sd(pred1)

###################################################
boxplot(eng_outside_lon ~ cycle(eng_outside_lon))          
plot(diff(log(eng_outside_lon)))
plot(log(eng_outside_lon))
plot(diff(eng_outside_lon))
acf(eng_outside_lon)
acf(diff(log(eng_outside_lon))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(eng_outside_lon)))# p=3 (logic same as above)
fit <- arima(log(eng_outside_lon),c(3,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(eng_outside_lon,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(eng_outside_lon, frequency = 1, start = c(1970),end = c(2017))
fit1 <- arima(log(datawide),c(3,1,4),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(eng_outside_lon)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(eng_outside_lon)
sd(eng_outside_lon)
mean(pred1)
sd(pred1)

#########################################
########################################
b <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/bus0205.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) #millions (miles for bus)
b <- b[-c(1,2,3,4,5,6,7,8,9,10,28),]
b <- b[,-c(2,3,4)]
colnames(b) <- c('Year','English Metropolitan Areas','English Non-etropolitan Areas','England excluding London','Scotland','Wales','Great Britain excluding London')
for(i in 1:7){
  b[,i] <- as.numeric(b[,i])
}

##################################
eng_metro_areas2 <- data.frame(b$`English Metropolitan Areas`)
eng_metro_areas2 <- as.ts(eng_metro_areas2)
row.names(eng_metro_areas2) <- c('1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(eng_metro_areas2) <- 'eng_metro_areas'
eng_metro_areas2 <- as.ts(eng_metro_areas2)

eng_nonmetro_areas2 <- data.frame(b$`English Non-etropolitan Areas`)
eng_nonmetro_areas2 <- as.ts(eng_nonmetro_areas2)
row.names(eng_nonmetro_areas2) <- c('1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(eng_nonmetro_areas2) <- 'eng_nonmetro_areas'
eng_nonmetro_areas2 <- as.ts(eng_nonmetro_areas2)

eng_outside_lon2 <- data.frame(b$`England excluding London`)
eng_outside_lon2 <- as.ts(eng_outside_lon2)
row.names(eng_outside_lon2) <- c('1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(eng_outside_lon2) <- 'eng_metro_areas'
eng_outside_lon2 <- as.ts(eng_outside_lon2)

scotland2 <- data.frame(b$Scotland)
scotland2 <- as.ts(scotland2)
row.names(scotland2) <- c('1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(scotland2) <- 'eng_metro_areas'
scotland2 <- as.ts(scotland2)

wales2 <- data.frame(b$Wales)
wales2 <- as.ts(wales2)
row.names(wales2) <- c('1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(wales2) <- 'wales'
wales2 <- as.ts(wales2)

gbr_outside_lon <- data.frame(b$`Great Britain excluding London`)
gbr <- as.ts(gbr_outside_lon)
row.names(gbr_outside_lon) <- c('1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(gbr_outside_lon) <- 'gbr excluding lodon'
gbr_outside_lon <- as.ts(gbr_outside_lon)
#####################################################################
boxplot(eng_metro_areas2 ~ cycle(eng_metro_areas2))          
plot(diff(log(eng_metro_areas2)))
plot(log(eng_metro_areas2))
plot(diff(eng_metro_areas2))
acf(eng_metro_areas2)
acf(diff(log(eng_metro_areas2))) # q=7 (because the line before the line which first gets inverted is 1)
pacf(diff(log(eng_metro_areas2)))# p=6 (logic same as above)
fit <- arima(log(eng_metro_areas2),c(6,1,7),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(eng_metro_areas2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(eng_metro_areas2, frequency = 1, start = c(1987),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(eng_metro_areas2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(eng_metro_areas2)
sd(eng_metro_areas2)
mean(pred1)
sd(pred1)
######################################################
boxplot(eng_nonmetro_areas2 ~ cycle(eng_nonmetro_areas2))          
plot(diff(log(eng_nonmetro_areas2)))
plot(log(eng_nonmetro_areas2))
plot(diff(eng_nonmetro_areas2))
acf(eng_nonmetro_areas2)
acf(diff(log(eng_nonmetro_areas2))) # q=5 (because the line before the line which first gets inverted is 1)
pacf(diff(log(eng_nonmetro_areas2)))# p=3 (logic same as above)
fit <- arima(log(eng_nonmetro_areas2),c(3,1,5),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(eng_nonmetro_areas2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(eng_nonmetro_areas2, frequency = 1, start = c(1987),end = c(2017))
fit1 <- arima(log(datawide),c(3,1,5),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(eng_nonmetro_areas2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(eng_nonmetro_areas2)
sd(eng_nonmetro_areas2)
mean(pred1)
sd(pred1)


#####################################################################
boxplot(eng_outside_lon2 ~ cycle(eng_outside_lon2))          
plot(diff(log(eng_outside_lon2)))
plot(log(eng_outside_lon2))
plot(diff(eng_outside_lon2))
acf(eng_outside_lon2)
acf(diff(log(eng_outside_lon2))) # q=7 (because the line before the line which first gets inverted is 1)
pacf(diff(log(eng_outside_lon2)))# p=2 (logic same as above)
fit <- arima(log(eng_outside_lon2),c(2,1,7),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(eng_outside_lon2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(eng_outside_lon2, frequency = 1, start = c(1987),end = c(2017))
fit1 <- arima(log(datawide),c(2,1,7),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(eng_outside_lon2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(eng_outside_lon2)
sd(eng_outside_lon2)
mean(pred1)
sd(pred1)


######################################################################
boxplot(scotland2 ~ cycle(scotland2))          
plot(diff(log(scotland2)))
plot(log(scotland2))
plot(diff(scotland2))
acf(scotland2)
acf(diff(log(scotland2))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(scotland2)))# p=0 (logic same as above)
fit <- arima(log(scotland2),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(scotland2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(scotland2, frequency = 1, start = c(1987),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(scotland2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(scotland2)
sd(scotland2)
mean(pred1)
sd(pred1)


######################################################################3
boxplot(wales2 ~ cycle(wales2))          
plot(diff(log(wales2)))
plot(log(wales2))
plot(diff(wales2))
acf(wales2)
acf(diff(log(wales2))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(wales2)))# p=1 (logic same as above)
fit <- arima(log(wales2),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(wales2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(wales2, frequency = 1, start = c(1987),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(wales2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(wales2)
sd(wales2)
mean(pred1)
sd(pred1)

#########################################################################
boxplot(gbr_outside_lon ~ cycle(gbr_outside_lon))          
plot(diff(log(gbr_outside_lon)))
plot(log(gbr_outside_lon))
plot(diff(gbr_outside_lon))
acf(gbr_outside_lon)
acf(diff(log(gbr_outside_lon))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(gbr_outside_lon)))# p=3 (logic same as above)
fit <- arima(log(gbr_outside_lon),c(3,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(gbr_outside_lon,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(gbr_outside_lon, frequency = 1, start = c(1987),end = c(2017))
fit1 <- arima(log(datawide),c(3,1,4),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(gbr_outside_lon)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(gbr_outside_lon)
sd(gbr_outside_lon)
mean(pred1)
sd(pred1)

#########################################################################
########################################################################
install.packages('readxl')
library(readxl)
d <- read_excel('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/0501.xlsx') #millions (Passengers)
View(d)
class(d)
class(d$`Area / Financial Year`)
fin_england <- data.frame(d$England)
fin_england <- as.ts(fin_england)
colnames(fin_england) <- 'england'
row.names(fin_england) <- c('2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
fin_england <- as.ts(fin_england)

fin_eng_nonmetro <- data.frame(d$`English non-metropolitan areas`)
fin_eng_nonmetro <- as.ts(fin_eng_nonmetro)
colnames(fin_eng_nonmetro) <- 'english non-metropolitan areas'
row.names(fin_eng_nonmetro) <- c('2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
fin_eng_nonmetro <- as.ts(fin_eng_nonmetro)

fin_eng_outside_lon <- data.frame(d$`England outside London`)
fin_eng_outside_lon <- as.ts(fin_eng_outside_lon)
colnames(fin_eng_outside_lon) <- 'England outside London'
row.names(fin_eng_outside_lon) <- c('2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
fin_eng_outside_lon <- as.ts(fin_eng_outside_lon)

fin_london <- data.frame(d$London7)
fin_london <- as.ts(fin_london)
colnames(fin_london) <- 'London7'
row.names(fin_london) <- c('2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
fin_london <- as.ts(fin_london)

fin_eng_metro <- data.frame(d$`English metropolitan areas 10`)
fin_eng_metro <- as.ts(fin_eng_metro)
colnames(fin_eng_metro) <- 'English metropolitan areas'
row.names(fin_eng_metro) <- c('2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
fin_eng_metro <- as.ts(fin_eng_metro)
############################################################################
boxplot(fin_england ~ cycle(fin_england))          
plot(diff(log(fin_england)))
plot(log(fin_england))
plot(diff(fin_england))
acf(fin_england)
acf(diff(log(fin_england))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(fin_england)))# p=2 (logic same as above)
fit <- arima(log(fin_england),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(fin_england,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(fin_england, frequency = 1, start = c(1950),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(fin_england)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(fin_england)
sd(fin_england)
mean(pred1)
sd(pred1)
########################################################################
boxplot(fin_london ~ cycle(fin_london))          
plot(diff(log(fin_london)))
plot(log(fin_london))
plot(diff(fin_london))
acf(fin_london)
acf(diff(log(fin_london))) # q=3 (because the line before the line which first gets inverted is 1)
pacf(diff(log(fin_london)))# p=2 (logic same as above)
fit <- arima(log(gbr_outside_lon),c(2,1,3),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(fin_london,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(fin_london, frequency = 1, start = c(2004),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(fin_london)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(fin_london)
sd(fin_london)
mean(pred1)
sd(pred1)
##################################################################
boxplot(fin_eng_outside_lon ~ cycle(fin_eng_outside_lon))          
plot(diff(log(fin_eng_outside_lon)))
plot(log(fin_eng_outside_lon))
plot(diff(fin_eng_outside_lon))
acf(fin_eng_outside_lon)
acf(diff(log(fin_eng_outside_lon))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(fin_eng_outside_lon)))# p=2 (logic same as above)
fit <- arima(log(fin_eng_outside_lon),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(fin_eng_outside_lon,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(fin_eng_outside_lon, frequency = 1, start = c(2004),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(fin_eng_outside_lon)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(fin_eng_outside_lon)
sd(fin_eng_outside_lon)
mean(pred1)
sd(pred1)
##################################################################
boxplot(fin_eng_nonmetro ~ cycle(fin_eng_nonmetro))          
plot(diff(log(fin_eng_nonmetro)))
plot(log(fin_eng_nonmetro))
plot(diff(fin_eng_nonmetro))
acf(fin_eng_nonmetro)
acf(diff(log(fin_eng_nonmetro))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(fin_eng_nonmetro)))# p=2 (logic same as above)
fit <- arima(log(fin_eng_nonmetro),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(fin_eng_nonmetro,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(fin_eng_nonmetro, frequency = 1, start = c(2004),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(fin_eng_nonmetro)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(fin_eng_nonmetro)
sd(fin_eng_nonmetro)
mean(pred1)
sd(pred1)
###############################################################
boxplot(fin_eng_metro ~ cycle(fin_eng_metro))          
plot(diff(log(fin_eng_metro)))
plot(log(fin_eng_metro))
plot(diff(fin_eng_metro))
acf(fin_eng_metro)
acf(diff(log(fin_eng_metro))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(fin_eng_metro)))# p=2 (logic same as above)
fit <- arima(log(fin_eng_metro),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(fin_eng_metro,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(fin_eng_metro, frequency = 1, start = c(2004),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(fin_eng_metro)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(fin_eng_metro)
sd(fin_eng_metro)
mean(pred1)
sd(pred1)
tail(pred1)
##############################################################
############################################################# GBR local bus miles (billion)
d <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/TSGB0633(bus0301)new.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) #billions (gbr local bus miles)
d <- d[-c(1:8),]
d <- d[,-2]
colnames(d) <- c('Year','Miles')
gbr_bus_miles <- d$Miles
gbr_bus_miles <- data.frame(gbr_bus_miles)
colnames(gbr_bus_miles) <- 'Miles'
gbr_bus_miles <- as.ts(gbr_bus_miles)
rownames(gbr_bus_miles) <- c('1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
##########################

boxplot(gbr_bus_miles ~ cycle(gbr_bus_miles))          
plot(diff(log(gbr_bus_miles)))
plot(log(gbr_bus_miles))
plot(diff(gbr_bus_miles))
acf(gbr_bus_miles)
acf(diff(log(gbr_bus_miles))) # q=4 (because the line before the line which first gets inverted is 1)
pacf(diff(log(gbr_bus_miles)))# p=2 (logic same as above)
fit <- arima(log(gbr_bus_miles),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(gbr_bus_miles,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(gbr_bus_miles, frequency = 1, start = c(1969),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(gbr_bus_miles)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(gbr_bus_miles)
sd(gbr_bus_miles)
mean(pred1)
sd(pred1)

