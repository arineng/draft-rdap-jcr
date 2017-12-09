#!/usr/bin/env bash

# wget https://raw.github.com/lehmannro/assert.sh/v1.1/assert.sh

. assert.sh -v

assert_raises "jcr -r jcr/rdap.jcr --test-jcr" 0

for good_json in json/good/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr $good_json" 0
done

assert_end