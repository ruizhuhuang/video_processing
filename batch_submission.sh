#!/bin/bash 
# vidio labeling using KNL or SKX on stampede2 

SRC="/work/03076/rhuang/stampede2/video_processing/ANDERSON_BURNET/20190217/"
TAR="/work/03076/rhuang/stampede2/video_processing/ANDERSON_BURNET/out/20190217/"
BEG=1
END=56
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


