#The goal of this code is to ocnvert UTM to lat/long and vice versa
#First I copied over the lat/long coordinates from "Tissue_Database"
#Then I split the east spreadsheet into two files, e_z13 and e_z14 according to UTM Zone
#I also split the west spreadsheet into two files, w_z13 and w_z12 according to UTM Zone
#TIP use the option 'natural sort' to keep order of individuals while sorting on utm zone then individuals 

library("sp")
 setwd("G:/My Drive/Hoban_Lab_Docs/Projects/Havardii/Analyses/Spatial_UTM_transform/")
 
qh_inp<-read.csv("inp_qhw_z13.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,3:2], proj4string = CRS("+proj=utm +zone=13 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +datum=WGS84"))
write.csv(qh_points_Transformed,"out_qhw_z13.csv")

qh_inp<-read.csv("inp_qhw_z12.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,3:2], proj4string = CRS("+proj=utm +zone=12 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +datum=WGS84"))
write.csv(qh_points_Transformed,"out_qhw_z12.csv")

qh_inp<-read.csv("inp_qhe_z14.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,3:2], proj4string = CRS("+proj=utm +zone=14 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +datum=WGS84"))
write.csv(qh_points_Transformed,"out_qhe_z14.csv")

qh_inp<-read.csv("inp_qhe_z13.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,3:2], proj4string = CRS("+proj=utm +zone=13 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +datum=WGS84"))
write.csv(qh_points_Transformed,"out_qhe_z13.csv")


#I then copied pasted in plant names manually from "inp" to "outp" files 
#and added in headers for long/ lat
#and copied both west outputs to one sheet, sorted (natural sort enabled) and saved as West_final.csv
#I then did the same for East
#I then copied over to Havardii tissue database on the drive
 
 
 
 
#####################################################
#If you want to go the opposite way, lat long to UTM, use the following
#################################################################

qh_inp<-read.csv("inp_qhw_z13.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,2:3], proj4string = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=utm +zone=13 +ellps=WGS84"))
write.csv(qh_points_Transformed,"out_qhw_z13.csv")


qh_inp<-read.csv("inp_qhw_z12.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,2:3], proj4string = CRS("+proj=utm +zone=12 +ellps=WGS84 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +ellps=WGS84"))
write.csv(qh_points_Transformed,"out_qhw_z12.csv")

qh_inp<-read.csv("inp_qhe_z14.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,2:3], proj4string = CRS("+proj=utm +zone=14 +ellps=WGS84 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +ellps=WGS84"))
write.csv(qh_points_Transformed,"out_qhe_z13.csv")


qh_inp<-read.csv("inp_qhe_z13.csv")
head(qh_inp)
#swap out zone for target zone of real data (12, 13, 14...)
qh_points <- SpatialPoints(qh_inp[,2:3], proj4string = CRS("+proj=utm +zone=13 +ellps=WGS84 +datum=WGS84"))
qh_points_Transformed <-  spTransform(qh_points,CRS("+proj=longlat +ellps=WGS84"))
write.csv(qh_points_Transformed,"out_qhw_e12.csv")

#I then pasted in plant names manually from "inp" to "outp" files and added in headers for long/ lat