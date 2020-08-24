
outdirPre="subSample"# Modificable
i = 1
name = dir()
name = name[grep(".PEanno",name)] # Modificable

for(ggg in name){
  IN=ggg
  OUT= paste(outdirPre,i,sep="")
  i=i+1
  dir.create(OUT)
  ###########################
  dirname(rstudioapi::getActiveDocumentContext()$path)
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  FIN=read.table(IN)
  nrow(FIN)
  str(FIN)
  CHR_LIST<-unique(FIN$V1)
  str(CHR_LIST)
  for(CHROM in CHR_LIST){
    
    subFIN = subset(FIN, FIN$V1 == CHROM)
    FILE01=paste0(CHROM,".tsv")
    file.remove(FILE01)
    write.table(subFIN,FILE01,sep = "\t",quote=FALSE,row.names=FALSE,col.names=FALSE,append = TRUE)
    
  }
  
  for(CHROM in CHR_LIST){
    FILE01=paste0(CHROM,".tsv")
    FILE02=paste0(OUT,"/",CHROM,".SUBRDS")
    saveRDS(read.table(FILE01),FILE02)
    #  file.remove(FILE01)
  }
  
  for(CHROM in CHR_LIST){
    FILE01=paste0(CHROM,".tsv")
    file.remove(FILE01)
  }
}
  
