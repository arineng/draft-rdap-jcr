# RDAP JCR

The Registry Data Access Protocol (RDAP) is a JSON-over-HTTP protocol. The JSON for RDAP is
specified in RFC 7483 using prose. This project provides a more formal definition of the RDAP
JSON using JSON Content Rules (JCR).

# Getting JCRValidator

This project uses JCRValidator to test and setup the JCR. JCRValidator is a Ruby program
and should be installed as a Ruby gem.

    gem install jcrvalidator


# Testing RDAP JSON

To test JSON files, you will need the JCRValidator (see above). The JSON files are broken up
into files which do validate and those which do not. Inside the `good` and `bad` directories,
the files are categorized by response type.

To run the tests, simply invoke the `test.sh` script.

If you wish to add files, simply drop them into the appropriate directory. If the directory
does not exist, create it according to the scheme and extend the `test.sh` script to cover
the directory (that should mostly be a matter cut-n-paste).

# Building the JCR Parts

The Internet Draft discusses the JCR in sections to make it readable. This is done by breaking
the full JCR into smaller files and including the smaller files into specific sections of the
draft using XML entity references.

The "source" JCR is in `jcr/rdap.jcr`. This file can be split apart using the `--process-parts`
option of the JCRValidator. To do this, issue the `rdap_jcr.sh` script.

# Building the Draft

The Internet Draft is written in XML and requires `xml2rfc` to convert it to a text or html
file. Some Linux distributions have packages for this. For other platforms, it can be installed
using the Python package systems, see [instructions here](https://pypi.python.org/pypi/xml2rfc).

Once `xml2rfc` is installed, used the `xml2rfc.sh` script to create the draft.
