#!/bin/bash

# TODO export OOZIE_URL="http://nodename:11000/oozie"; JID=$(bash commit.sh|grep job|awk -F ':' '{print $2}'); while true; do oozie job -info $JID; sleep 30s; done

MONTH=$(date +%m)
DAY=$(date +%d)
YEAR=20$(date +%y)

PROJECT_NAME="simple-project-name"
USER_ID=$USER
START_TIME="${YEAR}-${MONTH}-${DAY}T00:00Z" # T23:59Z"
END_TIME="2030-12-31T00:00Z"
JOBTRACKER="yarn"
NAME_NODE="hdfs://nameservice"
QUEUE_NAME="default"
PROJECT_PATH=/user/${USER_ID}
PROJECT_ROOT=${PROJECT_PATH}/${PROJECT_NAME}
WORKING_ROOT="${NAME_NODE}/${PROJECT_ROOT}"
NODE_NAME="nodename"

export OOZIE_URL="http://${NODE_NAME}:11000/oozie";

hadoop fs -rm -r -f -skipTrash $PROJECT_ROOT
hadoop fs -copyFromLocal $PROJECT_NAME ${PROJECT_PATH}/

FS="hfs"
ROOT_DIR=${WORKING_ROOT}
WORKFLOWPATH=${WORKING_ROOT}
COORD_PATH=${WORKING_ROOT}
SUCCESS_PATH=${WORKING_ROOT}/success_files

oozie job \
-D start_time=$START_TIME \
-D stop_time=$STOP_TIME \
-D jobTracker=$JOBTRACKER \
-D nameNode=$NAME_NODE \
-D queueName=$QUEUE_NAME \
-D rootDir=$ROOT_DIR \
-D workflowpath=$WORKFLOWPATH \
-D coordPath=$COORD_PATH \
-D successPath=$SUCCESS_PATH \
-D fs=$FS \
-config ${PROJECT_NAME}/job.properties \
-run -verbose
# conf: cn be a coordinator.xml as well ;)
