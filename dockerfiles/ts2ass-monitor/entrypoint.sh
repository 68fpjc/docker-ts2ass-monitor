#! /bin/bash

cd /app/monitor/
inotifywait -m -e close_write -e moved_to --format %f . | while read LINE ; do
    [ "${LINE##*.}" == "m2ts" ] || [ "${LINE##*.}" == "ts" ] && {
        arib-ts2ass "${LINE}"
        [ -f "${LINE}.ass" ] && cp "${LINE}.ass" "${LINE%.*}.mp4.ass"
    }
done
