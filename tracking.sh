#!/bin/bash
#current dir
CDIR=`pwd`
LOC="ANDERSON_BURNET"
DATE=$1
TAR="/work/03076/rhuang/stampede2/video_processing/ANDERSON_BURNET/out/$DATE/"
track_exe="/work/00410/huang/soda/lable_and_track/darknet/tracking"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/apps/cuda/8.0/lib64:/work/00410/huang/maverick/yolo/ffmpeg-3.3_build/lib:/work/00410/huang/maverick/opencv3.1.0/lib:/opt/apps/cuda9_0/cudnn/7.0/lib64

#mkdir -p $TAR

for dir in `find $TAR -maxdepth 1 -mindepth 1 -type d -printf '%f\n'|grep $LOC`;
do
    full_dir=$TAR/$dir
    
    echo processing $full_dir
    #postfix=`echo $dir | cut -f  3 -d '_'`
    cd $full_dir 
    echo "$track_exe raw.mov yolo.log"
    $track_exe raw.mov yolo.log >>run.log 2>&1
    cd .. 
done
cd $CDIR
