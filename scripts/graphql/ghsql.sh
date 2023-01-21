#!/usr/bin/env bash

if [ ! -f $1 ] || [ $# -ne 1 ]
then
    echo Queries the graphql API
    echo "Usage:"
    echo
    echo "$0 somefile.gql"
fi

# read the gql query from the file named in the argument
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TOKEN=$(cat $DIR/token)
QUERY=$(jq -n \
           --arg q "$(cat $1 | tr -d '\n')" \
           '{ query: $q }')

# do the query
curl -i -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: $TOKEN" \
  --data "$QUERY" \
  https://houston.nandlal57.astro-cre.com/v1


 