#!/bin/sh


if [ -f .livereload.env ]; then
  source .livereload.env
fi

bash down.sh
bash up.sh


if [ "$RELOAD_SECRET" != "" ]; then
  
    echo "The containers will be refreshed when the livereload hook is called."
    while true; do
        REQUEST=$(echo -e 'HTTP/1.1 200 OK\r\n\r\n' | nc -l -p 8080 | tr -d '\0')
        SECRET=$(echo $REQUEST | grep -oP 'GET /\?secret=\K[^ ]*')
        if [ "$SECRET" = "$RELOAD_SECRET" ]; then
            echo "Secret matches. Refreshing containers..."
            bash up.sh
        else 
            echo "Secret does not match. Ignoring request."
        fi
    done
fi