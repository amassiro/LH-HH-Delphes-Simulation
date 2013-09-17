LH-HH-Delphes-Simulation
========================

Delphes simulation through the detector


#### running Delphes on CMSSW output
from https://cp3.irmp.ucl.ac.be/projects/delphes/wiki/WorkBook/ReadingCMSFiles

* cd /afs/cern.ch/work/a/amassiro/Generation/Delphes-3.0.10
* export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
* cd ../CMSSW_5_3_9_patch1/src/
* cmsenv
* cd -
* make -j 4


* ./DelphesCMSFWLite examples/delphes_card_CMS.tcl delphes_output_vbfHH_GEN_8TeV.root /tmp/amassiro/GEN_8TeV.root



#### script to run on batch

