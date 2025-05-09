#!/bin/bash

school_url="https://agora.xtec.cat/ies-sabadell/"

until curl -s --head "$school_url" | grep "200 OK" > /dev/null; do
    echo "No internet connection to $school_url. Retrying in 5 seconds..."
    sleep 5
done

echo "Connection established. Opening browser..."
xdg-open "$school_url" 2>/dev/null || firefox "$school_url"
