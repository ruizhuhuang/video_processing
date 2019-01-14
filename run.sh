#!/bin/bash
#usage run.sh source_dir target_dir first_idx last_idx
SRC=$1
TAR=$2
FR=$3
TO=$4
i=1
label_exe=/work/00410/huang/soda/lable_and_track/darknet/label_gpu
track_exe=/work/00410/huang/soda/lable_and_track/darknet/tracking


for fn in $SRC/*.mp4; do 
 if [ "$i" -ge "$FR" -a  "$i" -le "$TO" ]; then  
  dir=${fn%.*}
  dir=$TAR/${dir##*/}
  echo "process $fn in $dir"
  mkdir -p $dir
  #cp $fn $dir
  cd $dir 
  ln -s /work/00410/huang/maverick/yolo/latest_yolo/darknet_dbg_0/cfg .
  ln -s /work/00410/huang/maverick/yolo/latest_yolo/darknet_dbg_0/data .
  ln -s /work/00410/huang/maverick/yolo/yolo.weights 
  date >> run.log
  echo "$label_exe $fn 1"
  $label_exe $fn 1 >> run.log 2>&1
  echo "$track_exe $fn yolo.log"
  $track_exe $fn yolo.log >>run.log 2>&1
  date >> run.log
  mv $fn $dir/raw.mov 
 else
  echo "skip $fn"
 fi
let i=i+1
 
done
