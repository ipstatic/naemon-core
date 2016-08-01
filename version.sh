#!/bin/sh

VERSION=1.0.5
if test -e .git; then
    if hash git 2>/dev/null; then
        VERSION=$(git describe --always --tags --dirty | \
            sed -e 's/^v//' -e 's/-[0-9]*-g/-g/' | tr -d '\n')
    fi
fi

if [ -e .naemon.official ]; then
  echo -n "${VERSION}-pkg"
else
  echo -n "${VERSION}-source"
fi

exit 0
