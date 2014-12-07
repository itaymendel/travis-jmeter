#!/bin/bash
curl -H "X-API-KEY: $BLAZEMETER_USER_KEY" https://a.blazemeter.com/api/latest/tests/"$BLAZEMETER_TEST_ID"/start
