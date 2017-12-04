echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
docker run -d -p 4000-4005:4000-4005 --log-driver=none --restart always --privileged -v /dev:/dev -v /home/pi/atomdata:/distr/data --name atom princip/atom2:arm
echo 'Done'
