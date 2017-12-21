#!/usr/bin/env bash
draft=`grep docName draft-newton-rdap-jcr.xml | sed -E 's/.*docName=\"([^\"]*)\".*/\1/'`
xml2rfc -b $draft --text draft-newton-rdap-jcr.xml
