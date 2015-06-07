#!/bin/bash
APP_NAME=${PWD##*/}
export JASMINE_SERVER_UNIT=1
export JASMINE_SERVER_INTEGRATION=1
export JASMINE_CLIENT_UNIT=1
export JASMINE_CLIENT_INTEGRATION=1
export VELOCITY_DEBUG_MIRROR=0
export VELOCITY_SINGLE_RUN=0
ARGS="--settings"

while getopts ":ha:sctm" optname
do
    case "$optname" in
        "h")
            echo "Meteor Dev Start: $APP_NAME"
            echo -e "\t-a\tSet App Name (affects mongo db)."
            echo -e "\t-s\tDisable Server Tests"
            echo -e "\t-c\tDisable Client Tests"
            echo -e "\t-m\tDebug Velocity Mirror"
            echo -e "\t-t\tRun Tests once only"
            echo -e "\t-h\tThis help message"
            exit 0;
            ;;
        "a")
            APP_NAME=$OPTARG
            echo "App Name set to $APP_NAME"
            ;;
        "t")
            VELOCITY_SINGLE_RUN=1
            ARGS="--test $ARGS"
            echo "Single test run."
            ;;
        "m")
            VELOCITY_DEBUG_MIRROR=1
            echo "Debugging Velocity Mirror"
            ;;
        "s")
            echo "Server tests disabled."
            JASMINE_SERVER_UNIT=0
            JASMINE_SERVER_INTEGRATION=0
            ;;
        "c")
            echo "Client tests disabled."
            JASMINE_CLIENT_UNIT=0
            JASMINE_CLIENT_INTEGRATION=0
            ;;
    esac
done


echo "Starting Meteor app $APP_NAME in dev mode."
export JASMINE_BROWSER=PhantomJS
export PHANTOM_PATH=/usr/local/bin/phantomjs


export MONGO_URL="mongodb://localhost:27017/$APP_NAME"

if [[ -f "dev-settings.json" ]]
then
    echo "Loading dev-settings.json"
    meteor run $ARGS dev-settings.json
else
    if [[ -f "settings.json" ]]
    then
        echo "Loading settings.json"
        meteor run $ARGS settings.json
    else
        echo "No settings file found."
        meteor run $ARGS
    fi
fi
