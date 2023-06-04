#!/bin/bash
#SBATCH -J mpitest
#SBATCH -A cs475-575
#SBATCH -p classmpitest
#SBATCH -N 4 # number of nodes
#SBATCH -n 4 # number of tasks
#SBATCH --constraint=ib
#SBATCH --tasks-per-node=1
#SBATCH -o mpitest.out
#SBATCH -e mpitest.err
module  load  openmpi
mpic++ main.cpp -o fourier  -lm
rm  -f results.csv
touch results.csv
for i  in  1 2 4 8
do
    mpiexec  -np  $i  fourier
    cat fourier.err >> results.csv
done
# mpiexec -np 4 fourier