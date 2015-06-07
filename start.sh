#!/bin/bash
APP_NAME=${PWD##*/}

while getopts ":ha:" optname
do
    case "$optname" in
        "h")
            echo "Meteor Start: $APP_NAME"
            echo -e "\t-a\tSet App Name (affects mongo db)."
            echo -e "\t-h\tThis help message."
            exit 0;
            ;;
        "a")
            APP_NAME=$OPTARG
            echo "App Name set to $APP_NAME"
            ;;
    esac
done

echo "Starting Meteor app $APP_NAME in normal mode."
export JASMINE_SERVER_UNIT=0
export JASMINE_SERVER_INTEGRATION=0
export JASMINE_CLIENT_UNIT=0
export JASMINE_CLIENT_INTEGRATION=0



export MONGO_URL="mongodb://localhost:27017/$APP_NAME"
echo "MONGO URL: $MONGO_URL"

if [[ -f "./settings.json" ]]
then
    echo "Loading settings.json"
    meteor run --settings settings.json
else
    echo "No settings file found."
    meteor run
fi
