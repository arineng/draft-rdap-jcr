#!/usr/bin/env bash

# wget https://raw.github.com/lehmannro/assert.sh/v1.1/assert.sh

. assert.sh -v

#
# Test that the JCR is good itself
#
assert_raises "jcr -r jcr/rdap.jcr --test-jcr" 0
assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr --test-jcr" 0

#
# Good JSON
#

# entities
for good_json in json/good/entity_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S entity_response $good_json" 0
done

# networks
for good_json in json/good/network_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S network_response $good_json" 0
done

# autnums
for good_json in json/good/autnum_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S autnum_response $good_json" 0
done

# nameservers
for good_json in json/good/nameserver_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S nameserver_response $good_json" 0
done

# domains
for good_json in json/good/domain_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S domain_response $good_json" 0
done

# errors
for good_json in json/good/error_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S error_response $good_json" 0
done

# help
for good_json in json/good/help_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S help_response $good_json" 0
done

# domain search
for good_json in json/good/domainSearch_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S domainSearch_response $good_json" 0
done

# entity search
for good_json in json/good/entitySearch_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S entitySearch_response $good_json" 0
done

# nameserver search
for good_json in json/good/nameserverSearch_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S nameserverSearch_response $good_json" 0
done

#
# Bad JSON
#

# entities
for bad_json in json/bad/entity_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S entity_response $bad_json" 3
done

# networks
for bad_json in json/bad/network_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S network_response $bad_json" 3
done

# nameservers
for bad_json in json/bad/nameserver_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S nameserver_response $bad_json" 3
done

# errors
for bad_json in json/bad/error_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/strict.jcr -S error_response $bad_json" 3
done

#
# Fini
#
assert_end
