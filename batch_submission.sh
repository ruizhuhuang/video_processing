#!/bin/bash 

SRC="/work/03076/rhuang/maverick/CTR/LAMAR_RUNDBERG/20190106/"
TAR="/work/03076/rhuang/maverick/CTR/LAMAR_RUNDBERG/out/20190106/"
BEG=1
END=48
SIZE=3


for i in `seq $BEG $SIZE $END`; 
do 
   _END=$(( $i + $SIZE - 1))
   if [ $_END -gt $END ]; then _END=$END; fi
   echo "sbatch job4script $SRC $TAR $i $_END";

#double check before turn it on
   sbatch job4script $SRC $TAR $i $_END
   sleep 10

done 


#while [ $BEG -le $END ]
#do  
#  _END=$(( $BEG + $SIZE - 1))
#
#  echo $BEG $_END
#  BEG=$(($_END + 1))
#done 

echo "All Done"


