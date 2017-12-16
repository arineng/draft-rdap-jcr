#!/usr/bin/env bash

# wget https://raw.github.com/lehmannro/assert.sh/v1.1/assert.sh

. assert.sh -v

#
# Test that the JCR is good itself
#
assert_raises "jcr -r jcr/rdap.jcr --test-jcr" 0
assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr --test-jcr" 0

#
# Good JSON
#

# entities
for good_json in json/good/entity_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S entity_response $good_json" 0
done

# networks
for good_json in json/good/network_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S network_response $good_json" 0
done

# autnums
for good_json in json/good/autnum_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S autnum_response $good_json" 0
done

# nameservers
for good_json in json/good/nameserver_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S nameserver_response $good_json" 0
done

# domains
for good_json in json/good/domain_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S domain_response $good_json" 0
done

# errors
for good_json in json/good/error_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S error_response $good_json" 0
done

# help
for good_json in json/good/help_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S help_response $good_json" 0
done

#
# Bad JSON
#

# networks
for bad_json in json/bad/network_response/*.json
do
  assert_raises "jcr -r jcr/rdap.jcr -o jcr/rdap_strict.jcr -S network_response $bad_json" 3
done

#
# Fini
#
assert_end