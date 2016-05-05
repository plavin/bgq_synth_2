#!/bin/bash

#MSUB -l partition=vulcan
#MSUB -l nodes=8
#MSUB -l walltime=10:00
#MSUB -l gres=ignore
#MSUB -q psmall
#MSUB -j oe
#MSUB -N bench

## -s specifies messsage size, 
## -l specifies number of all to all loops,
## -r specifies number of ranks in inner commnicator
## -i index of the job (will be used for names of output)

# This is a simplified version of the moab script. A typical run of the benchmark
# is on 512 nodes, with 256 in the comm1 (-r 256). (comm2 gets  num_ranks - [value of r]).

# Additionally you should use srun with a mapfile (commented out below). 

mkdir net
squeue >> squeue-$SLURM_JOB_ID.out

export BGQ_COUNTER_FILE=net/net-4D-2-1.out
#cp /nfs/tmp2/lavin2/manual_maps/4D-2 /nfs/tmp2/lavin2/map
#srun -N512 --runjob-opts='--mapping /nfs/tmp2/lavin2/map' ./bench -s 16384 -l 5000 -r 256 -i 1 -a 0 -c 1
srun -N8  ./bench -s 16384 -l 5000 -r 256 -i 1


# echo "email body" | mailx -s "Subject of email - Job Completed" <user@email.com>