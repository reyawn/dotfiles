#!/bin/sh
echo -n "Re-connecting to ssh-agent..."
if [ -f "$HOME/.ssh/latestagent" ]
then
  . "$HOME/.ssh/latestagent"
  echo "done."
else
  echo "no agent found." 
fi
