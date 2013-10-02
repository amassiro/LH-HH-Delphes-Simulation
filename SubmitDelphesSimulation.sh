# !/bin/sh

DELPHESFOLDER="/afs/cern.ch/work/a/amassiro/Generation/Delphes-3.0.10"
TMPDIR="/tmp/WWbb/"
TMPDIRDELPHES="/tmp/WWbbDelphes/"

INPUTDIRONEOS="/eos/cms/store/user/amassiro/HH/VBF/WWbb/"
OUTPUTDIRONEOS="/eos/cms/store/user/amassiro/HH/VBF/WWbb-Delphes/"

echo " >>> input directory on eos "
echo "     "$INPUTDIRONEOS

echo " >>> create tmp local folder:  "$TMPDIR

mkdir $TMPDIR
cd $DELPHESFOLDER

execCommand="/afs/cern.ch/project/eos/installation/0.2.31/bin/eos.select ls "$INPUTDIRONEOS" | awk '{print \"/afs/cern.ch/project/eos/installation/0.2.31/bin/eos.select cp "$DELPHESFOLDER"\"\$1\" "$TMPDIR"\"}' | /bin/sh"
echo " >>> exec: "$execCommand
$execCommand



echo " >>> create tmp local folder:  "$TMPDIRDELPHES
mkdir $TMPDIRDELPHES



echo " >>> simulate Delphes"

execCommandDelphes="ls "$TMPDIR"/*_GEN.root | tr \"_\" \" \" | sed -e s%"$TMPDIR"%%g | awk '{print \"./DelphesCMSFWLite examples/delphes_card_CMS.tcl "$TMPDIRDELPHES"delphes_output_vbfHH_\"\$1\"_\"\$2\"_\"\$3\"_\"\$4\"_GEN.root "$TMPDIRDELPHES"\"\$1\"_\"\$2\"_\"\$3\"_\"\$4\"_GEN.root\"}' | /bin/sh"
echo " >>> exec: "$execCommandDelphes
$execCommandDelphes



echo " >>> copy to eos the result"

execCommandCopy="ls "$TMPDIRDELPHES"*.root | sed -e s%"$TMPDIRDELPHES"%%g | awk '{ print \"/afs/cern.ch/project/eos/installation/0.2.31/bin/eos.select cp "$TMPDIRDELPHES"\"\$1\" "$OUTPUTDIRONEOS" ; rm "$TMPDIRDELPHES"\"\$1}' | /bin/sh "
echo " >>> exec: "$execCommandCopy
$execCommandCopy



echo " >>> output directory on eos "
echo "     "$OUTPUTDIRONEOS



echo " clean up"
rm -r $TMPDIR
rm -r $TMPDIRDELPHES

cd -