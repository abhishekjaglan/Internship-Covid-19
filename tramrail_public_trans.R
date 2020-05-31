library(readODS)
library(dplyr)
a <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/lrt0101.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) #millions (Light rail and tramps) passengers
a <- a[-c(1,2,3,4,42,43,45,46,47,48,49,50,51,52,53,54,55,56,57),]
a <- a[,-c(2,12,13,14,15,16,17,18,19,20,21)]

colnames(a) <- c('Year','Docklands Light Railway','london tramlink','nottinghan express transit',' midland metro','sheffield supertram','tyne and wear metro','manchester metrolink2','blackpool tramway','england')

a$`Docklands Light Railway` <- as.integer(a$`Docklands Light Railway`)
a$`london tramlink` <- as.integer(a$`london tramlink`)
a$`nottinghan express transit` <- as.integer(a$`nottinghan express transit`)
a$`sheffield supertram` <- as.integer(a$`sheffield supertram`)
a$`tyne and wear metro` <- as.integer(a$`tyne and wear metro`)
a$`manchester metrolink2` <- as.integer(a$`manchester metrolink2`)
a$`blackpool tramway` <- as.integer(a$`blackpool tramway`)
a$england <- as.integer(a$england)
a$` midland metro` <- as.integer(a$` midland metro`)

dockland_light_rail <- data.frame(a$`Docklands Light Railway`)
dockland_light_rail <- dockland_light_rail[-c(1,2,3,4,5,6,38),]
a$`Docklands Light Railway` <- as.integer(a$`Docklands Light Railway`)
dockland_light_rail <- as.data.frame(dockland_light_rail)
rownames(dockland_light_rail) <- c('1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(dockland_light_rail) <- 'dockland light rail'
dockland_light_rail <- as.ts(dockland_light_rail)

london_tramlink <- data.frame(a$`london tramlink`)
london_tramlink <- london_tramlink[-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,38),]
london_tramlink <- as.data.frame(london_tramlink)
row.names(london_tramlink) <- c('2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(london_tramlink) <- 'london tramlink'
london_tramlink <- as.ts(london_tramlink)

nottingham_express_transit <- data.frame(a$`nottinghan express transit`)
nottingham_express_transit <- nottingham_express_transit[-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,38),]
nottingham_express_transit <- as.data.frame(nottingham_express_transit)
row.names(nottingham_express_transit) <- c('2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(nottingham_express_transit) <- 'nottingham express transit'
nottingham_express_transit <- as.ts(nottingham_express_transit)

midland_metro <- data.frame(a$` midland metro`)
midland_metro <- midland_metro[-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,38),]
midland_metro <- as.data.frame(midland_metro)
row.names(midland_metro) <- c('1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(midland_metro) <- 'midland metro'
midland_metro <- as.ts(midland_metro)

sheffield_supertram <- data.frame(a$`sheffield supertram`)
sheffield_supertram <- sheffield_supertram[-c(1,2,3,4,5,6,7,8,9,10,11,12,38),]
sheffield_supertram <- as.data.frame(sheffield_supertram)
rownames(sheffield_supertram) <- c('1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(sheffield_supertram) <- 'sheffield supertram'
sheffield_supertram <- as.ts(sheffield_supertram)

tyne_and_wear_metro <- data.frame(a$`tyne and wear metro`)
tyne_and_wear_metro <- tyne_and_wear_metro[-c(1,38),]
tyne_and_wear_metro <- as.data.frame(tyne_and_wear_metro)
rownames(tyne_and_wear_metro) <- c('1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(tyne_and_wear_metro) <- 'tyne and wear metro'
tyne_and_wear_metro <- as.ts(tyne_and_wear_metro)

manchester_metrolink2 <- data.frame(a$`manchester metrolink2`)
manchester_metrolink2 <- manchester_metrolink2[-c(1,2,3,4,5,6,7,8,9,10,38),]
manchester_metrolink2 <- as.data.frame(manchester_metrolink2)
rownames(manchester_metrolink2) <- c('1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(manchester_metrolink2) <- 'manchester metrolink2'
manchester_metrolink2 <- as.ts(manchester_metrolink2)

blackpool_tramway <- data.frame(a$`blackpool tramway`)
blackpool_tramway <- blackpool_tramway[-c(1,38),]
blackpool_tramway <- as.data.frame(blackpool_tramway)
rownames(blackpool_tramway) <- c('1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(blackpool_tramway) <- 'blackpool tramway'
blackpool_tramway <- as.ts(blackpool_tramway)

england <- data.frame(a$england)
england <- england[-c(1,38),]
england <- as.data.frame(england)
rownames(england) <- c('1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(england) <- 'england'
england <- as.ts(england)

#########################################################################
boxplot(england ~ cycle(england))          
plot(diff(log(england)))
plot(log(england))
plot(diff(england))
acf(england)
acf(diff(log(england))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(england)))# p=0 (logic same as above)
fit <- arima(log(england),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(england,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(england, frequency = 1, start = c(1983),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
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
tail(pred1)

#############################################################################
boxplot(blackpool_tramway ~ cycle(blackpool_tramway))          
plot(diff(log(blackpool_tramway)))
plot(log(blackpool_tramway))
plot(diff(blackpool_tramway))
acf(blackpool_tramway)
acf(diff(log(blackpool_tramway))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(blackpool_tramway)))# p=1 (logic same as above)
fit <- arima(log(blackpool_tramway),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(blackpool_tramway,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(blackpool_tramway, frequency = 1, start = c(1983),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(blackpool_tramway)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(blackpool_tramway)
sd(blackpool_tramway)
mean(pred1)
sd(pred1)
tail(pred1)

#################################################################
boxplot(tyne_and_wear_metro ~ cycle(tyne_and_wear_metro))          
plot(diff(log(tyne_and_wear_metro)))
plot(log(tyne_and_wear_metro))
plot(diff(tyne_and_wear_metro))
acf(tyne_and_wear_metro)
acf(diff(log(tyne_and_wear_metro))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(tyne_and_wear_metro)))# p=1 (logic same as above)
fit <- arima(log(tyne_and_wear_metro),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(tyne_and_wear_metro,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(tyne_and_wear_metro, frequency = 1, start = c(1983),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(tyne_and_wear_metro)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(tyne_and_wear_metro)
sd(tyne_and_wear_metro)
mean(pred1)
sd(pred1)
tail(pred1)
#############################################################3
boxplot(nottingham_express_transit ~ cycle(nottingham_express_transit))          
plot(diff(log(nottingham_express_transit)))
plot(log(nottingham_express_transit))
plot(diff(nottingham_express_transit))
acf(nottingham_express_transit)
acf(diff(nottingham_express_transit)) # q=3 (because the line before the line which first gets inverted is 1)
pacf(diff(nottingham_express_transit))# p=2 (logic same as above)
fit <- arima(nottingham_express_transit,c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(nottingham_express_transit,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(nottingham_express_transit, frequency = 1, start = c(2003),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(nottingham_express_transit)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(nottingham_express_transit)
sd(nottingham_express_transit)
mean(pred1)
sd(pred1)
tail(pred1)
###############################################################
boxplot(london_tramlink ~ cycle(london_tramlink))          
plot(diff(log(london_tramlink)))
plot(log(london_tramlink))
plot(diff(london_tramlink))
acf(london_tramlink)
acf(diff(log(london_tramlink))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(london_tramlink)))# p=0 (logic same as above)
fit <- arima(log(london_tramlink),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(london_tramlink,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(london_tramlink, frequency = 1, start = c(2000),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(london_tramlink)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(london_tramlink)
sd(london_tramlink)
mean(pred1)
sd(pred1)
tail(pred1)

###########################################################
boxplot(dockland_light_rail ~ cycle(dockland_light_rail))          
plot(diff(log(dockland_light_rail)))
plot(log(dockland_light_rail))
plot(diff(dockland_light_rail))
acf(dockland_light_rail)
acf(diff(log(dockland_light_rail))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(dockland_light_rail)))# p=1 (logic same as above)
fit <- arima(log(dockland_light_rail),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(dockland_light_rail,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(dockland_light_rail, frequency = 1, start = c(1988),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(dockland_light_rail)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(dockland_light_rail)
sd(dockland_light_rail)
mean(pred1)
sd(pred1)
tail(pred1)


########################################################################
boxplot(manchester_metrolink2 ~ cycle(manchester_metrolink2))          
plot(diff(log(manchester_metrolink2)))
plot(log(manchester_metrolink2))
plot(diff(manchester_metrolink2))
acf(manchester_metrolink2)
acf(diff(log(manchester_metrolink2))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(manchester_metrolink2)))# p=1 (logic same as above)
fit <- arima(log(manchester_metrolink2),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(manchester_metrolink2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(manchester_metrolink2, frequency = 1, start = c(1992),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(manchester_metrolink2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(manchester_metrolink2)
sd(manchester_metrolink2)
mean(pred1)
sd(pred1)
tail(pred1)

#################################################################
boxplot(midland_metro ~ cycle(midland_metro))          
plot(diff(log(midland_metro)))
plot(log(midland_metro))
plot(diff(midland_metro))
acf(midland_metro)
acf(diff(log(midland_metro))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(midland_metro)))# p=0 (logic same as above)
fit <- arima(log(midland_metro),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(midland_metro,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(midland_metro, frequency = 1, start = c(1999),end = c(2016))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(midland_metro)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(midland_metro)
sd(midland_metro)
mean(pred1)
sd(pred1)
tail(pred1)

###########################################################
boxplot(sheffield_supertram ~ cycle(sheffield_supertram))          
plot(diff(log(sheffield_supertram)))
plot(log(sheffield_supertram))
plot(diff(sheffield_supertram))
acf(sheffield_supertram)
acf(diff(log(sheffield_supertram))) # q=6 (because the line before the line which first gets inverted is 1)
pacf(diff(log(sheffield_supertram)))# p=2 (logic same as above)
fit <- arima(log(sheffield_supertram),c(2,1,6),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(sheffield_supertram,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(sheffield_supertram, frequency = 1, start = c(1994),end = c(2017))
fit1 <- arima(log(datawide),c(2,1,6),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(sheffield_supertram)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(sheffield_supertram)
sd(sheffield_supertram)
mean(pred1)
sd(pred1)
tail(pred1)
##############################################
##############################################
library(readODS)
library(dplyr)
b <- read_ods('/Users/juggs/Desktop/Personal/Internship/datasets/transport uk/Public transport/lrt0301.ods',sheet = 1, col_names =TRUE, col_types = NULL, na= '',skip = 0, range = NULL) #millions (Light rail and tramps)revenue
b <- b[-c(1,2,3,4,5),]
b <- b[,-2]
colnames(b) <- c('year','dockland light railway','croydon tramlink','nottingham express transit','midland metro','sheffield supertram','tyne and wear metro','manchester metrolink','blackpool tramway','england')

b$`dockland light railway` <- as.integer(b$`dockland light railway`)
b$`croydon tramlink` <- as.integer(b$`croydon tramlink`)
b$`nottingham express transit` <- as.integer(b$`nottingham express transit`)
b$`midland metro` <- as.integer(b$`midland metro`)
b$`sheffield supertram` <- as.integer(b$`sheffield supertram`)
b$`tyne and wear metro` <- as.integer(b$`tyne and wear metro`)
b$`manchester metrolink` <- as.integer(b$`manchester metrolink`)
b$`blackpool tramway` <- as.integer(b$`blackpool tramway`)
b$england <- as.integer(b$england)

dockland_light_rail2 <- data.frame(b$`dockland light railway`)
dockland_light_rail2 <- dockland_light_rail2[-c(1,2,3,4,5),]
dockland_light_rail2 <- as.data.frame(dockland_light_rail2)
rownames(dockland_light_rail2) <- c('1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(dockland_light_rail2) <- 'dockland light rail'
dockland_light_rail2 <- as.ts(dockland_light_rail2)

croydon_tramlink2 <- data.frame(b$`croydon tramlink`)
croydon_tramlink2 <- croydon_tramlink2[-c(1:17),]
croydon_tramlink2 <- as.data.frame(croydon_tramlink2)
rownames(croydon_tramlink2) <- c('2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
colnames(croydon_tramlink2) <- 'croydon tranlink'
croydon_tramlink2 <- as.ts(croydon_tramlink2)

nottingham_express_transit2 <- data.frame(b$`nottingham express transit`)
nottingham_express_transit2 <- nottingham_express_transit2[-c(1:21),]
nottingham_express_transit2 <- as.data.frame(nottingham_express_transit2)
colnames(nottingham_express_transit2) <- 'nottingham express transit'
nottingham_express_transit2 <- as.ts(nottingham_express_transit2)
rownames(nottingham_express_transit2) <- c('2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

midland_metro2 <- data.frame(b$`midland metro`)
midland_metro2 <- midland_metro2[-c(1:16),]
midland_metro2 <- as.data.frame(midland_metro2)
colnames(midland_metro2) <- 'midland metro'
midland_metro2 <- as.ts(midland_metro2)
rownames(midland_metro2) <- c('1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

sheffield_supertram2 <- data.frame(b$`sheffield supertram`)
sheffield_supertram2 <- sheffield_supertram2[-c(1:11),]
sheffield_supertram2 <- as.data.frame(sheffield_supertram2)
colnames(sheffield_supertram2) <- 'sheffield supertram'
sheffield_supertram2 <- as.ts(sheffield_supertram2) 
rownames(sheffield_supertram2) <- c('1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

tyne_and_wear_metro2 <- data.frame(b$`tyne and wear metro`)
colnames(tyne_and_wear_metro2) <- 'tyne and wear metro'
tyne_and_wear_metro2 <- as.ts(tyne_and_wear_metro2)
rownames(tyne_and_wear_metro2) <- c('1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

manchester_metrolink <- data.frame(b$`manchester metrolink`)
manchester_metrolink <- manchester_metrolink[-c(1:9),]
manchester_metrolink <- as.data.frame(manchester_metrolink)
colnames(manchester_metrolink) <- 'manchester metrolink'
manchester_metrolink <- as.ts(manchester_metrolink)
rownames(manchester_metrolink) <- c('1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

blackpool_tramway2 <- data.frame(b$`blackpool tramway`)
colnames(blackpool_tramway2) <- 'blackpool tramway'
blackpool_tramway2 <- as.ts(blackpool_tramway2)
rownames(blackpool_tramway2) <- c('1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')

england2 <- data.frame(b$england)
colnames(england2) <- 'england'
england2 <- as.ts(england2)
rownames(england2) <- c('1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018')
##########################################################################
boxplot(england2 ~ cycle(england2))          
plot(diff(log(england2)))
plot(log(england2))
plot(diff(england2))
acf(england2)
acf(diff(log(england2))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(england2)))# p=1 (logic same as above)
fit <- arima(log(england2),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(england2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(england2, frequency = 1, start = c(1983),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(england2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(england2)
sd(england2)
mean(pred1)
sd(pred1)
tail(pred1)
#########################################################################
boxplot(blackpool_tramway2 ~ cycle(blackpool_tramway2))          
plot(diff(log(blackpool_tramway2)))
plot(log(blackpool_tramway2))
plot(diff(blackpool_tramway2))
acf(blackpool_tramway2)
acf(diff(log(blackpool_tramway2))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(blackpool_tramway2)))# p=0 (logic same as above)
fit <- arima(log(blackpool_tramway2),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(blackpool_tramway2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(blackpool_tramway2, frequency = 1, start = c(1983),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(blackpool_tramway2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(blackpool_tramway2)
sd(blackpool_tramway2)
mean(pred1)
sd(pred1)
tail(pred1)

#######################################################################3
boxplot(tyne_and_wear_metro2 ~ cycle(tyne_and_wear_metro2))          
plot(diff(log(tyne_and_wear_metro2)))
plot(log(tyne_and_wear_metro2))
plot(diff(tyne_and_wear_metro2))
acf(tyne_and_wear_metro2)
acf(diff(log(tyne_and_wear_metro2))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(tyne_and_wear_metro2)))# p=1 (logic same as above)
fit <- arima(log(tyne_and_wear_metro2),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(tyne_and_wear_metro2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(tyne_and_wear_metro2, frequency = 1, start = c(1983),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(tyne_and_wear_metro2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(tyne_and_wear_metro2)
sd(tyne_and_wear_metro2)
mean(pred1)
sd(pred1)
tail(pred1)

####################################################################
boxplot(nottingham_express_transit2 ~ cycle(nottingham_express_transit2))          
plot(diff(log(nottingham_express_transit2)))
plot(log(nottingham_express_transit2))
plot(diff(nottingham_express_transit2))
acf(nottingham_express_transit2)
acf(diff(log(nottingham_express_transit2))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(nottingham_express_transit2)))# p=0 (logic same as above)
fit <- arima(log(nottingham_express_transit2),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(nottingham_express_transit2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(nottingham_express_transit2, frequency = 1, start = c(2004),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(nottingham_express_transit2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(nottingham_express_transit2)
sd(nottingham_express_transit2)
mean(pred1)
sd(pred1)
tail(pred1)

#########################################################################
boxplot(dockland_light_rail2 ~ cycle(dockland_light_rail2))          
plot(diff(log(dockland_light_rail2)))
plot(log(dockland_light_rail2))
plot(diff(dockland_light_rail2))
acf(dockland_light_rail2)
acf(diff(log(dockland_light_rail2))) # q=2 (because the line before the line which first gets inverted is 1)
pacf(diff(log(dockland_light_rail2)))# p=1 (logic same as above)
fit <- arima(log(dockland_light_rail2),c(1,1,2),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(dockland_light_rail2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(dockland_light_rail2, frequency = 1, start = c(1988),end = c(2017))
fit1 <- arima(log(datawide),c(1,1,2),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(dockland_light_rail2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(dockland_light_rail2)
sd(dockland_light_rail2)
mean(pred1)
sd(pred1)
tail(pred1)
#############################################################
boxplot(manchester_metrolink ~ cycle(manchester_metrolink))          
plot(diff(log(manchester_metrolink)))
plot(log(manchester_metrolink))
plot(diff(manchester_metrolink))
acf(manchester_metrolink)
acf(diff(log(manchester_metrolink))) # q= 4(because the line before the line which first gets inverted is 1)
pacf(diff(log(manchester_metrolink)))# p=2 (logic same as above)
fit <- arima(log(manchester_metrolink),c(2,1,4),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(manchester_metrolink,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(manchester_metrolink, frequency = 1, start = c(1992),end = c(2017))
fit1 <- arima(log(datawide),c(2,1,4),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(manchester_metrolink)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(manchester_metrolink)
sd(manchester_metrolink)
mean(pred1)
sd(pred1)
tail(pred1)

############################################################################
boxplot(midland_metro2 ~ cycle(midland_metro2))          
plot(diff(log(midland_metro2)))
plot(log(midland_metro2))
plot(diff(midland_metro2))
acf(midland_metro2)
acf(diff(log(midland_metro2))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(midland_metro2)))# p=0 (logic same as above)
fit <- arima(log(midland_metro2),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(midland_metro2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(midland_metro2, frequency = 1, start = c(1999),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(midland_metro2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(midland_metro2)
sd(midland_metro2)
mean(pred1)
sd(pred1)
tail(pred1)

#####################################################################
boxplot(sheffield_supertram2 ~ cycle(sheffield_supertram2))          
plot(diff(log(sheffield_supertram2)))
plot(log(sheffield_supertram2))
plot(diff(sheffield_supertram2))
acf(sheffield_supertram2)
acf(diff(log(sheffield_supertram2))) # q=3 (because the line before the line which first gets inverted is 1)
pacf(diff(log(sheffield_supertram2)))# p=2 (logic same as above)
fit <- arima(log(sheffield_supertram2),c(2,1,3),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(sheffield_supertram2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(sheffield_supertram2, frequency = 1, start = c(1994),end = c(2017))
fit1 <- arima(log(datawide),c(2,1,3),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(sheffield_supertram2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(sheffield_supertram2)
sd(sheffield_supertram2)
mean(pred1)
sd(pred1)
tail(pred1)

##############################################################
boxplot(croydon_tramlink2 ~ cycle(croydon_tramlink2))          
plot(diff(log(croydon_tramlink2)))
plot(log(croydon_tramlink2))
plot(diff(croydon_tramlink2))
acf(croydon_tramlink2)
acf(diff(log(croydon_tramlink2))) # q=1 (because the line before the line which first gets inverted is 1)
pacf(diff(log(croydon_tramlink2)))# p=0 (logic same as above)
fit <- arima(log(croydon_tramlink2),c(0,1,1),seasonal = list(order = c(0,1,1), period = 1)) # arima model main line
pred <- predict(fit, n.ahead = 5)
pred1 <- 2.718^pred$pred
ts.plot(croydon_tramlink2,2.718^pred$pred, log = "y", lty = c(1,3)) #plot for prediction and previous data

#testing out model
datawide <- ts(croydon_tramlink2, frequency = 1, start = c(2000),end = c(2017))
fit1 <- arima(log(datawide),c(0,1,1),seasonal = list(order = c(0,1,1),period = 1)) #second arima model without the last year
pred2 <- predict(fit1, n.ahead = 6)
pred3 <- 2.718^pred2$pred
data <- head(pred3,1)
predict_2018 <- round(data,digits = 0)
original_2018 <- tail(croydon_tramlink2)
ts.plot(datawide,2.718^pred2$pred, log = "y", lty =c(1,3))
mean(croydon_tramlink2)
sd(croydon_tramlink2)
mean(pred1)
sd(pred1)
tail(pred1)

























































