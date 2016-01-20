#!/usr/bin/bash 

# find generic installers and run them interactively
find . -name all.sh | while read installer ; do sh -c "${installer}" > /dev/null ; done
