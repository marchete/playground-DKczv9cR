# { autofold
#!/bin/bash

VIEWERFILE="/project/target/content.html"
TESTING="echo \"Hello World!\""
history -a
history -r
function checkHistory {
  COUNT=0
  FILE=`history | grep "$1" | grep -v history |wc -l`
  echo "Status of $FILE ">/tmp/status
  history -a >/tmp/history 
  FINISHED=0
  while [ $FINISHED -eq 0 ]; do
    if [ $FILE -ge 1 ]
    then
	  echo "<h1>SUCCESS!</h1>">$VIEWERFILE
	  sleep 2s
      echo "TECHIO> success true"
      FINISHED=1
    fi
    sleep 0.1
	COUNT=$(( COUNT + 1 ))
	echo "<h1>Please write the following command: echo \"Hello World!\" $COUNT </h1></p>`history`">$VIEWERFILE
  done 
}
echo "<h1>Please write the following command: echo \"Hello World!\"</h1>">$VIEWERFILE
echo "TECHIO> open -s /project/target/ /viewer.html"
echo "TECHIO> terminal"

echo "Going to test $TESTING">/tmp/testing
checkHistory $TESTING
# }
