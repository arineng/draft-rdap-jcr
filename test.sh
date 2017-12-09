#!/usr/bin/env bash

# wget https://raw.github.com/lehmannro/assert.sh/v1.1/assert.sh

. assert.sh -v

#
# Test that the JCR is good itself
#
assert_raises "jcr -r jcr/rdap.jcr --test-jcr" 0

#
# Good JSON
#

# entities
for good_json in json/good/entity_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -S entity_response $good_json" 0
done

# networks
for good_json in json/good/network_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -S network_response $good_json" 0
done

# nameservers
for good_json in json/good/nameserver_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -S nameserver_response $good_json" 0
done

#
# Bad JSON
#

# networks
for bad_json in json/bad/network_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -S network_response $bad_json" 3
done

#
# Fini
#
assert_end