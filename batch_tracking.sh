#!/bin/bash
#----------------------------------------------------
# run video tracking on maverick2 using P100, V100 or gtx 
#
#----------------------------------------------------

#SBATCH -J VideoLT              # Job name
#SBATCH -o myjob.%j.out       # Name of stdout output file (%j expands to jobId)
#SBATCH -p p100                # Queue name
#SBATCH -N 1                  # Total number of nodes requested (20 cores/node)
#SBATCH -n 1                 # Total number of mpi tasks requested
#SBATCH -t 12:00:00           # Run time (hh:mm:ss) - 1.5 hours

#SBATCH -A Traffic-Camera-Video      # <-- Allocation name to charge job against

./tracking.sh $1 # $1: 20190212
