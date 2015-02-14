#!/bin/bash
date >> /tmp/trigger.out
TRIG_PASSED_LINE=$1

# parse TMC message
STRUCT_ID=${TRIG_PASSED_LINE:0:4}
VERSION=${TRIG_PASSED_LINE:4:4}
QUEUE=${TRIG_PASSED_LINE:8:48}
PROCESS=${TRIG_PASSED_LINE:56:48}
TRIGDATA=${TRIG_PASSED_LINE:104:64}
APPL_TYPE=${TRIG_PASSED_LINE:168:4}
APPL_ID=${TRIG_PASSED_LINE:172:256}
ENV_DATA=${TRIG_PASSED_LINE:428:128}
USER_DATA=$(${TRIG_PASSED_LINE:556:128}) # WARNING: treats USERDATA as a valid command
QMGR=${TRIG_PASSED_LINE:684:48}
DEPTH=$(echo "DISPLAY QSTATUS($QUEUE)" | runmqsc $QMGR | grep -i CURDEPTH | awk {'print $1'})

# print them
echo STRUCT_ID [$STRUCT_ID] >> /tmp/trigger.out
echo VERSION [$VERSION] >> /tmp/trigger.out
echo QUEUE [$QUEUE] >> /tmp/trigger.out
echo PROCESS [$PROCESS] >> /tmp/trigger.out
echo TRIGDATA [${TRIGDATA}] >> /tmp/trigger.out
echo APPL_TYPE [$APPL_TYPE] >> /tmp/trigger.out
echo APPL_ID [$APPL_ID] >> /tmp/trigger.out
echo ENV_DATA [$ENV_DATA] >> /tmp/trigger.out
echo USER_DATA [$USER_DATA] >> /tmp/trigger.out
echo QMGR [$QMGR] >> /tmp/trigger.out
echo DEPTH [$DEPTH] >> /tmp/trigger.out