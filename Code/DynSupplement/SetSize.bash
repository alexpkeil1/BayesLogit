#!/bin/bash

# Default
samp=10000
burn=2000
verb=1000
reps=10

# Small
if [[ $1 == "Small" ]]; then
	samp=100
	burn=20
	verb=10
	reps=2
fi

# Large
if [[ $1 == "Large" ]]; then
	samp=10000
	burn=2000
	verb=1000
	reps=10
fi

echo "Setting..."
echo "Number of samples: $samp"
echo "Burn in: $burn"
echo "Report mod: $verb"
echo "Batches: $reps"
echo "Will run all data sets."

sedexp='s/^samp = [0-9]*$/samp = '${samp}'/ 
        s/^burn = [0-9]*$/burn = '${burn}'/
        s/^verbose = [0-9]*$/verbose = '${verb}'/
        s/^ntrials = [0-9]* #/ntrials = '${reps}' #/
        s/"allsynth"=FALSE/"allsynth"=TRUE/'


# echo "$sedexp"
sed -i~ -e "$sedexp" Benchmark-DynLogit.R
sed -i~ -e "$sedexp" Benchmark-DynNB.R