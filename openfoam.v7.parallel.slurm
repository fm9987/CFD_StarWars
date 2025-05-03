# !/bin/bash

# See https://portal.tacc.utexas.edu/user-guides/stampede2/#running 
# for more details

#SBATCH -J TieFighter      # Job name
#SBATCH -o TieFighter.Sim       # Name of stdout output file
#SBATCH -e TieFighter.errors       # Name of stderr error file

#SBATCH -p normal          # Queue (partition) name
### #SBATCH -p development          # Queue (partition) name
### #SBATCH -p skx-normal          # Queue (partition) name
### #SBATCH -p skx-dev          # Queue (partition) name

#SBATCH -N 1               # Total # of nodes
#SBATCH -n 8        # Total # of mpi tasks
#SBATCH -t 04:00:00        # Run time (hh:mm:ss)

#SBATCH --mail-user=fm9987@my.utexas.edu
#SBATCH --mail-type=all    # Send email at begin and end of job

#SBATCH -A CTS24005      # Allocation name (req'd if you have more than 1)

# Other commands must follow all #SBATCH directives...

module purge
module load intel/18.0.2  libfabric/1.7.0  impi/18.0.2 openfoam/7.0
module list

pwd
date

./Allrun

date