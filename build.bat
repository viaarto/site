hugo build --cleanDestinationDir --forceSyncStatic --gc
git add .
git commit -m "auto update"
git push
