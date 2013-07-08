CAPTURE="isightcapture -t jpg"
cd $HOME/captures
D1=`date +%y%m%d/%H`
D2=`date +%y%m%d.%H%M%S`

# If the date directory does not exist, create it
if [ ! -d $D1 ] ; then
mkdir -p $D1
fi

# Construct the filename and path and capture a pic
FN="$D1/$D2.jpg"
$CAPTURE $FN

# Make a symlinked image of the last photo taken
if [ -h 'last.jpg' ] ; then
rm last.jpg
fi
ln -s $FN last.jpg
