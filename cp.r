#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

if(length(args)==0){
	print("You must provide a port number as first argument")
	stop()
}

c1<-paste("sudo netstat -tanopl|grep ", args[1])

content<-system(c1, intern = TRUE)
splited<-strsplit(content, " ")
full<-as.data.frame(matrix(ncol = 9, nrow=0))
c_names<-c("protocol","","","source","destination", "wait","pid","typ","alive")
colnames(full)<-c_names
for(s in splited){
	s<-as.data.frame(s)
	s<-s[s!=""]
	full[nrow(full)+1,]<-s
}

for(s in full$source){
	
	pid<-full$pid[full$source==s]
	pid<-strsplit(pid,"/")
	process<-pid[[1]][1]
	for(a in args){
		value<-grepl(a, s, fixed=TRUE)

		done<-FALSE

		if(is.numeric(process)){
			com<-paste("sudo kill -9 ",process)
			if(value==TRUE){
				system(as.character(com))
				print(paste("killed process id:", com))
				done<-TRUE
			}
		}

		if(!done)
			print("There is no process to kill")
		else
			print("Finished")

		
	}
	
}