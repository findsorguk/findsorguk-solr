<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs xsl" version="2.0"
                xmlns:dcterms="http://purl.org/dc/terms/"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:owl="http://www.w3.org/2002/07/owl#"
		xmlns:java="http://xml.apache.org/xalan/java"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:nm="http://nomisma.org/id/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:oa="http://www.w3.org/ns/oa#"
                xmlns:pelagios="http://pelagios.github.io/vocab/terms#"
                xmlns:relations="http://pelagios.github.io/vocab/relations#"
                xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
        >
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:param name="url">
        <xsl:value-of select="'https://finds.org.uk/database/artefacts/record/id/'"/>
    </xsl:param>

    <xsl:param name="thumbnail">
        <xsl:value-of select="'https://finds.org.uk/images/thumbnails/'"/>
    </xsl:param>

    <xsl:param name="base">
        <xsl:value-of select="'https://finds.org.uk/'"/>
    </xsl:param>

    <xsl:param name="dump">
        <xsl:value-of select="'https://finds.org.uk/rdf/pelagios.rdf'"/>
    </xsl:param>

    <foaf:Organization>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$base"/>rdf/pelagios.rdf#agents/me
        </xsl:attribute>
        <foaf:name>
            <xsl:value-of select="$base"/>
        </foaf:name>
    </foaf:Organization>

    <xsl:template match="/">
        <rdf:RDF>
            <xsl:apply-templates select="response/result/doc"/>
        </rdf:RDF>
    </xsl:template>

    <xsl:template match="doc">
        <pelagios:AnnotatedThing>
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="$url"/><xsl:value-of select="int[@name='id']"/>
            </xsl:attribute>
            <dcterms:title>
                <xsl:choose>
                    <xsl:when test="str[@name='rulerName']">
                        <xsl:value-of select="str[@name='old_findID']"/>: A coin issued by <xsl:value-of select="str[@name='rulerName']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="str[@name='old_findID']"/>: A coin with an unrecorded/uncertain issuer.
                    </xsl:otherwise>
                </xsl:choose>
            </dcterms:title>
            <dcterms:description>
                <xsl:value-of select="str[@name='description']"/>
            </dcterms:description>
            <foaf:homepage>
                <xsl:attribute name="rdf:resource">
                    <xsl:value-of select="$url"/><xsl:value-of select="int[@name='id']"/>
                </xsl:attribute>
            </foaf:homepage>
            <xsl:choose>
                <xsl:when test="int[@name='thumbnail']">
                    <foaf:thumbnail><xsl:value-of select="$thumbnail"/><xsl:value-of select="int[@name='thumbnail']"/>.jpg</foaf:thumbnail>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="str[@name='filename']">
                    <foaf:depiction>
			<xsl:value-of select="$base"/>
			<xsl:value-of select="str[@name='imagedir']"/>
			<xsl:value-of select="java:java.net.URLEncoder.encode(str[@name='filename'], 'UTF-8')"/>
		    </foaf:depiction>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="int[@name='fromdate']">
            <xsl:choose>
                <xsl:when test="int[@name='todate']">
                    <dcterms:temporal><xsl:value-of select="int[@name='fromdate']"/>/<xsl:value-of select="int[@name='todate']"/>
                    </dcterms:temporal>
                </xsl:when>
                <xsl:otherwise>
                    <dcterms:temporal>
                        <xsl:value-of select="int[@name='fromdate']"/>
                    </dcterms:temporal>
                </xsl:otherwise>
            </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </pelagios:AnnotatedThing>
        <oa:Annotation>
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="$base"/>#<xsl:value-of select="int[@name='id']"/>/annotations/001</xsl:attribute>
            <xsl:for-each select="int[@name='pleiadesID']">
                <oa:hasBody rdf:resource="https://pleiades.stoa.org/places/{.}#this"/>
            </xsl:for-each>
            <oa:hasTarget>
                <xsl:attribute name="rdf:resource"><xsl:value-of select="$url"/><xsl:value-of select="int[@name='id']"/></xsl:attribute>
            </oa:hasTarget>
            <pelagios:relation rdf:resource="https://pelagios.github.io/vocab/relations#attestsTo"/>
            <oa:annotatedBy>
                <xsl:attribute name="rdf:resource"><xsl:value-of select="$base"/>#agents/me</xsl:attribute>
            </oa:annotatedBy>
            <oa:annotatedAt rdf:datatype="https://www.w3.org/2001/XMLSchema#dateTime">
                <xsl:value-of select="date[@name='created']"/>
            </oa:annotatedAt>
        </oa:Annotation>
    </xsl:template>
</xsl:stylesheet>
