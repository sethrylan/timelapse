COUNTER=0;
mkdir ~/captures/series
mkdir ~/captures/videos
rm ~/captures/series/*.jpg
for i in `find ~/captures -name '*.jpg'` ;
do
#Write the filename to be friendly with ffmpeg's odd filename input
echo $i
FILENAME=`printf '%03d.jpg' $COUNTER`
cp $i ~/captures/series/$FILENAME
let COUNTER=COUNTER+1;
done
nice ffmpeg -r 20 -vcodec copy  -i ~/captures/series/%3d.jpg ~/captures/videos/timelapse_complete.mov
