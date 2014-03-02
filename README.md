## PURL Checker

This project contains a makefile for testing whether a set of OBO
Library PURLs are operating as expected. It is designed to be executed
in a CI environment such as Jenkins.

Currently it only performs redirect checks. It assumes that all PURLs
perform a 302 redirect to somewhere else. It does not follow the
redirect.
