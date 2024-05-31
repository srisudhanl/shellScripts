npm run build
git add .
git commit -m "Quick commit"
git push

ssh fleettrack@staging.gpstrack.in 'cd gps-debug; git checkout staging; git stash; git pull; npm install; npm run debug'

