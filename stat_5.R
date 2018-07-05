library("ggplot2")
getwd()
rm(list=ls())

setwd("/home/ayayitox/proyecto_redes/P5")

#leemos todos los archivos con el patron nodo en la carpeta 
list.filenames<-list.files(pattern="nodo")
list.filenames
list.data<-list()
for (i in 1:length(list.filenames))
{
  list.data[[i]]<-read.table(list.filenames[i])
}


sender_Mbits<-rep(NA,20) #crea sender para los 20 nodos

for(i in 1:length(list.filenames)){
  factor<-list.data[[i]][12,7] #extraemos el maximo pero en factor 
  ax<-as.numeric(levels(factor))[factor] #convirtiendo de numeroco a factor
  sender_Mbits[i]=ax
}

sender_Mbits
sender_Mbits[-c(1,17)]

Nodos<-c(1:20)
df1<-data.frame(Nodos,sender_Mbits)
df1$Nodos

mean(sender_Mbits[-c(1,17)])
median(sender_Mbits)
ggplot(data = df1, aes(x=Nodos, y=sender_Mbits, group=1)) + geom_line()+
  # geom_hline(yintercept=range(800,100), color='coral') +
  geom_point()+
  geom_hline(yintercept = mean(sender_Mbits[-c(1,17)]),color='red' )+
  #geom_hline(yintercept = median(sender_Mbits),color='blue' )+
  ggtitle("Ancho de banda \n Modo Sender ")+theme(plot.title = element_text(hjust = 0.5))


receiver_Mbits<-rep(NA,20)
for(i in 1:length(list.filenames)){
  factor<-list.data[[i]][13,7] #extraemos el maximo pero en factor 
  ax<-as.numeric(levels(factor))[factor] #convirtiendo de numeroco a factor
  receiver_Mbits[i]=ax
}
receiver_Mbits

Nodos<-c(1:20)
df2<-data.frame(Nodos,receiver_Mbits)
mean(receiver_Mbits[-c(1,17)])
median(receiver_Mbits[-c(1,17)])
ggplot(data = df2, aes(x=Nodos, y=receiver_Mbits, group=1)) + geom_line()+
  # geom_hline(yintercept=range(800,100), color='coral') +
  geom_point()+
  geom_hline(yintercept = mean(receiver_Mbits[-c(1,17)]),color='red' )+
  #geom_hline(yintercept = median(receiver_Mbits),color='blue' )+
  ggtitle("Ancho de banda \n Modo Receiver ")+theme(plot.title = element_text(hjust = 0.5))





