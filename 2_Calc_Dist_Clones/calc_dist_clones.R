clone analysis

#Took qhe_z13 and removed the population locations and 9 and 12 b/c 9 and 12 have one individual or no individuals
#Couple ways to do this- could make a loop where you go through the list of clones then through each individual in each list element (members of a clone set) and calculate each possible distance.
#Instead, go through the list of clones and each time take the subset of the whole dataset with those clones and make a new matrix and then use a dist function to get all pairwise distances in a matrix- faster

#get the clone list 
#setwd("C:/Users/shoban.DESKTOP-DLPV5IJ/Dropbox/Projects/IN_PROGRESS/Oak_popgen_analyses/Qhavardii")
setwd("C:/Users/shoban/Dropbox/Projects/IN_PROGRESS/Oak_popgen_analyses/Qhavardii/7indiv_11loci")
#setwd("/home/user/Dropbox/Projects/IN_PROGRESS/Oak_popgen_analyses/Qhavardii")

setwd("/Users/shoban/My Drive/Hoban_Lab_Docs/Projects/2016_present_Q_havardii_microsatellite/Analyses/QH_formatted_csv_and_gen_files/QH_gen_Files/")library("adegenet"); library("poppr")
ade_test<-read.genepop("QH_GenePop_7Indiv_11loci_RedefinedPopsMay2019.gen.gen",ncode=3)
#identify clones
popr_test <- as.genclone(ade_test)
#Find all MLG groups
list_all<-mlg.id(popr_test)
#Find which MLG groups are length >1 e.g. multiple samples per individual
clone_index<-which(sapply(list_all,function(x) length(x)>1))
list_clones<-list_all[clone_index]

setwd("G:/My Drive/Hoban_Lab_Docs/Projects/Havardii/Analyses/Spatial_UTM_transform/UTM_to_lat_long")
dist_per_group<-data.frame(ncol=5,nrow=length(list_clones))

#These are UTM files.  Note each is needed because the range spans multiple UTM zones
qh_file_names<-c("inp_qhe_z13.csv","inp_qhe_z14.csv","inp_qhw_z12.csv","inp_qhw_z13.csv")
for (f in qh_file_names){
#This loop will go through each UTM zone
	qh<-read.csv(f)

	#for each element in the clone list 
		for (i in 1:length(list_clones)){
		this_clone<-list_clones[[i]]

		#If the clone ID is in the population file we are going through
		clone_index<-match(this_clone,qh[,1])
		#this will calculate a distance matrix and then get the min, mean and max distance 
		if (!is.na(clone_index[1])){
			dist_per_group[i,1]<-round(min(c(dist(qh[clone_index,2:3]))),3)
			dist_per_group[i,2]<-round(mean(c(dist(qh[clone_index,2:3]))),3)
			dist_per_group[i,3]<-round(max(c(dist(qh[clone_index,2:3]))),3)
			dist_per_group[i,4]<-length(this_clone)
			dist_per_group[i,5]<-this_clone[1]
		}
	}
}
colnames(dist_per_group)<-c("min_dist","mean_dist","max_dist","num_clones","first_clone_name")

write.csv(dist_per_group,file="distances_per_clone_11_loci.csv")



