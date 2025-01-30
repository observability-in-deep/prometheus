#!/bin/bash

routes_error=("http://obsevabilityindeep.local/error/500" "http://obsevabilityindeep.local/error/400" "http://obsevabilityindeep.local/error/404" "http://obsevabilityindeep.local/latency/")

while true; do
    for route in "${routes_error[@]}"; do
        if [[ "$route" == *"/error/"* ]]; then
            error_code=$(shuf -e 500 400 404 -n 1)  
            route="http://obsevabilityindeep.local/error/$error_code"
        fi

        curl -X GET "$route" > /dev/null  
        echo "Requisição enviada para: $route"

        sleep 1  
    done
done
