findsorguk-solr
===============

Solr configuration for findsorguk using solr 4.2

Cores
=====
* Bibliography - links to finds for publications
* Coin summary - coin summary records for hoards
* Content - general site content
* Geodata - Yahoo WOEID and OS open data
* Hoards - Hoards information
* Images - images of objects
* People - people table
* Publications - referenced publications
* Tags - semantic tags sourced from OpenCalais

Operating environment
============

* Tomcat 7 +
* Tested on OSX and Linux

Installation
============

OSX

Linux

Importing data
==============

You can either use the solr admin panel, or use:

http://{hostname}:8080/solr/{corename}/dataimport?command=full-import&clean={true|false}&commit={true|false}

Of course remove the angle brackets from your value.