[![Build Status](https://travis-ci.org/Opendigitalradio/mmbtools-doc.svg?branch=master)](https://travis-ci.org/Opendigitalradio/mmbtools-doc)
Documentation for ODR-mmbTools
==============================

This repository contains a LaTeX document that summarises the ODR-mmbTools.
The goal is to create something like a manual for the whole tool-set, which
complements the man-pages and documentation for each part with a more
global perspective.

It also complements the opendigitalradio.org wiki.

How to build locally
--------------------

1. On a debian-based host, install the packages: `texlive texlive-fonts-extra texlive-latex-extra texlive-science cm-super`
1. Run the following command: `make clean && make`

Latest Version
--------------

It is a work in progress. No version has been released yet, but the
document gets compiled automatically by Travis-CI and uploaded to
http://opendigitalradio.github.io/mmbtools-doc/mmbtools.pdf


Acknowledgements
----------------
 * Rash and Adam for proof-reading and corrections
 * Wim Nelis for the section about Monitoring using Xymon
