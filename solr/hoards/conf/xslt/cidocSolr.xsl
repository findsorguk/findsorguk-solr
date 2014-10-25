<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
		xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
		xmlns:owl="http://www.w3.org/2002/07/owl#"
		xmlns:crm="http://erlangen-crm.org/current/"
		xmlns:crmeh="http://purl.org/crmeh#"
		xmlns:crmbm="http://collection.britishmuseum.org/id/crm/bm-extensions/"
		xmlns:bm="http://collection.britishmuseum.org/id/"
		xmlns:claros="http://purl.org/NET/Claros/vocab#"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:oac="http://www.openannotation.org/ns/"
		xmlns:dcterms="http://purl.org/dc/terms/"
		xmlns:skos="http://www.w3.org/2004/02/skos/core#"
		xmlns:google="http://rdf.data-vocabulary.org/#"
		xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
		xmlns:units="http://qudt.org/vocab/unit#"
		xmlns:og="http://ogp.me/ns#"
		xmlns:nm="http://nomisma.org/id/"
		xmlns:foaf="http://xmlns.com/foaf/0.1/"
		xmlns:cc="http://creativecommons.org/ns#"
		xmlns:geonames="http://www.geonames.org/ontology#"
		xmlns:osAdminGeo="http://data.ordnancesurvey.co.uk/ontology/admingeo/"
		xmlns:osSpatialRel="http://data.ordnancesurvey.co.uk/ontology/spatialrelations/"
		xmlns:provenance="http://purl.org/net/provenance/types#"
		xmlns:lawd="http://lawd.info/ontology/1.0/"
		xmlns:pas="http://ontology.finds.org.uk/"
		xmlns:schema="http://schema.org/"
		xmlns:con="http://www.w3.org/2000/10/swap/pim/contact#"
		xml:lang="en"
>

    <xsl:output method="xml" indent="yes" encoding="utf-8" />

	<xsl:param name="url">
		<xsl:value-of select="'http://finds.org.uk/database/artefacts/record/id/'" />
	</xsl:param>

	<xsl:param name="denomUrl">
		<xsl:value-of select="'http://finds.org.uk/database/terminology/denominations/denomination/id/'" />
	</xsl:param>

	<xsl:param name="findsTerms">
		<xsl:value-of select="'http://finds.org.uk/database/terminology/'"/>
	</xsl:param>

	<xsl:param name="bmThes">
		<xsl:value-of select="'http://collection.britishmuseum.org/id/thesauri/'" />
	</xsl:param>

	<xsl:param name="bmDoc">
		<xsl:value-of select="'http://collection.britishmuseum.org/id/doc/'" />
	</xsl:param>

	<xsl:param name="thumb">
		<xsl:value-of select="'http://finds.org.uk/images/thumbnails/'" />
	</xsl:param>

	<xsl:param name="images">
		<xsl:value-of select="'http://finds.org.uk/images/'" />
	</xsl:param>

	<xsl:param name="nomismaUri">
		<xsl:value-of select="'http://nomisma.org/id/'" />
	</xsl:param>

	<xsl:param name="osUri">
		<xsl:value-of select="'http://data.ordnancesurvey.co.uk/doc/7000000000'" />
	</xsl:param>

	<xsl:param name="pleiadesUri">
		<xsl:value-of select="'http://pleiades.stoa.org/places/'"/>
	</xsl:param>

	<xsl:param name="dbpediaUri">
		<xsl:value-of select="'http://dbpedia.org/page/'"/>
	</xsl:param>

	<xsl:param name="pasUri">
		<xsl:value-of select="'http://finds.org.uk'"/>
	</xsl:param>

	<xsl:param name="wikipediaUri">
		<xsl:value-of select="'http://en.wikipedia.org/wiki/'"/>
	</xsl:param>

	<xsl:param name="ehUri">
		<xsl:value-of select="'http://purl.org/heritagedata/schemes/eh_period/concepts/'" />
	</xsl:param>

	<xsl:param name="language">
		<xsl:value-of select="'en'" />
	</xsl:param>

	<xsl:template match="/">
		<rdf:RDF>
			<xsl:apply-templates select="//result" />
		</rdf:RDF>
	</xsl:template>


	<xsl:template match="//result">
	<rdf:Description>
	<xsl:attribute name="rdf:about"><xsl:value-of select="$pasUri"/></xsl:attribute>
	<provenance:DataCreatingService rdf:datatype="xsd:string">The Portable Antiquities Scheme/ The British Museum</provenance:DataCreatingService>
	<dcterms:title rdf:datatype="xsd:string">Portable Antiquities Scheme linked data</dcterms:title>
	<dcterms:description rdf:datatype="xsd:string">The Portable Antiquities Scheme is a DCMS funded project to encourage the voluntary recording of archaeological objects found by members of the public in England and Wales. Every year many thousands of objects are discovered, many of these by metal-detector users, but also by people whilst out walking, gardening or going about their daily work. Such discoveries offer an important source for understanding our past.</dcterms:description>
	<dcterms:coverage>
	<xsl:attribute name="rdf:resource">http://data.ordnancesurvey.co.uk/doc/country/england</xsl:attribute>
	</dcterms:coverage>
	<dcterms:coverage>
	<xsl:attribute name="rdf:resource">http://data.ordnancesurvey.co.uk/doc/country/wales</xsl:attribute>
	</dcterms:coverage>
	<dcterms:publisher rdf:datatype="xsd:string">The British Museum</dcterms:publisher>
	<dcterms:language rdf:datatype="xsd:string">en-GB</dcterms:language>
	<dcterms:subject rdf:datatype="xsd:string">Archaeology and numismatics</dcterms:subject>
	<geonames:parentCountry rdf:resource="http://www.geonames.org/2635167"/>
	<geonames:countryCode>GB</geonames:countryCode>
	<schema:name rdf:datatype="xsd:string">The Portable Antiquities Scheme</schema:name>
	<schema:url><xsl:attribute name="rdf:resource"><xsl:value-of select="$pasUri"/></xsl:attribute></schema:url>
	<schema:geo>
		<schema:GeoCoordinates>
			<schema:latitude>51.51897</schema:latitude>
			<schema:longitude>-0.1265</schema:longitude>
		</schema:GeoCoordinates>
	</schema:geo>


	</rdf:Description>
	<foaf:Organization>
		<xsl:attribute name="rdf:about"><xsl:value-of select="$pasUri"/></xsl:attribute>
		<foaf:name><xsl:attribute name="xsd:string">The Portable Antiquities Scheme</xsl:attribute></foaf:name>
		<foaf:nick><xsl:attribute name="xsd:string">PAS</xsl:attribute></foaf:nick>
		<foaf:fundedBy>Department for Culture, Media and Sport</foaf:fundedBy>
		<foaf:logo rdf:resource="http://finds.org.uk/images/logos/pasrgbsize5.gif"/>
		<foaf:mbox_sha1sum>842a757b9667def6fd8276a25929c1d80c8cec7d</foaf:mbox_sha1sum>
		<foaf:mbox rdf:resource="mailto:info@finds.org.uk"/>
		<foaf:workplaceHomepage rdf:resource="http://finds.org.uk"/>
		<foaf:weblog rdf:resource="http://finds.org.uk/blogs"/>
		<foaf:workInfoHomepage rdf:resource="http://www.britishmuseum.org/the_museum/departments/portable_antiquities_treasure.aspx"/>
		<foaf:depiction rdf:resource="http://finds.org.uk/images/logos/pasrgbsize5.gif"/>
	</foaf:Organization>

	<xsl:for-each select="//result/doc">

	<foaf:Document>
	<xsl:attribute name="rdf:about"><xsl:value-of select="$url"/><xsl:value-of select="int[@name='id']"/></xsl:attribute>

		<rdf:type><crm:E22_Man-Made_Object></crm:E22_Man-Made_Object></rdf:type>

		<skos:definition><xsl:value-of select="normalize-space(str[@name='description'])" /></skos:definition>

		<dcterms:contributor>
			<foaf:Person>
				<rdfs:label rdf:datatype="xsd:string">Created by: <xsl:value-of select="str[@name='creator']"/></rdfs:label>
				<foaf:name rdf:datatype="xsd:string"><xsl:value-of select="str[@name='creator']"/></foaf:name>
			</foaf:Person>
		</dcterms:contributor>

		<dcterms:isVersionOf><xsl:attribute name="rdf:resource"><xsl:value-of select="$url"/><xsl:value-of select="int[@name='id']"/></xsl:attribute></dcterms:isVersionOf>

		<xsl:if test="str[@name='updater']">
		<dcterms:contributor>
			<foaf:Person>
				<rdfs:label rdf:datatype="xsd:string">Updated by: <xsl:value-of select="str[@name='updater']"/></rdfs:label>
				<foaf:name rdf:datatype="xsd:string"><xsl:value-of select="str[@name='updater']"/></foaf:name>
			</foaf:Person>
		</dcterms:contributor>
		</xsl:if>

		<xsl:if test="str[@name='identifier']">
		<dcterms:contributor>
			<foaf:Person>
				<rdfs:label rdf:datatype="xsd:string">Identified by: <xsl:value-of select="str[@name='identifier']"/></rdfs:label>
				<foaf:name rdf:datatype="xsd:string"><xsl:value-of select="str[@name='identifier']"/></foaf:name>
			</foaf:Person>
		</dcterms:contributor>
		</xsl:if>

		<xsl:if test="str[@name='secondaryIdentifier']">
		<dcterms:contributor>
			<foaf:Person>
				<rdfs:label rdf:datatype="xsd:string">Secondary identifier: <xsl:value-of select="str[@name='secondaryIdentifier']"/></rdfs:label>
				<foaf:name rdf:datatype="xsd:string"><xsl:value-of select="str[@name='secondaryIdentifier']"/></foaf:name>
			</foaf:Person>
		</dcterms:contributor>
		</xsl:if>

		<xsl:if test="str[@name='description']">
		<dcterms:description rdf:datatype="xsd:string"><xsl:value-of select="normalize-space(str[@name='description'])"/></dcterms:description>
		</xsl:if>

		<xsl:if test="updated">
		<dcterms:modified rdf:datatype="xsd:date"><xsl:value-of select="date[@name='updated']"/></dcterms:modified>
		</xsl:if>

		<dcterms:created rdf:datatype="xsd:date"><xsl:value-of select="date[@name='created']"/></dcterms:created>

		<dcterms:coverage rdf:datatype="xsd:string">England and Wales</dcterms:coverage>

		<dcterms:coverage rdf:datatype="xsd:string"><xsl:value-of select="str[@name='broadperiod']"/></dcterms:coverage>

		<dcterms:publisher rdf:datatype="xsd:string">Portable Antiquities Scheme/ The British Museum</dcterms:publisher>

		<dcterms:isPartOf rdf:resource="http://finds.org.uk/database"/>

		<dcterms:license rdf:resource="http://creativecommons.org/licenses/by-sa/3.0/"/>
		<cc:attributionName rdf:datatype="xsd:string">The Portable Antiquities Scheme and the British Museum</cc:attributionName>

		<cc:attributionURL>
			<xsl:attribute name="rdf:resource">http://finds.org.uk</xsl:attribute>
		</cc:attributionURL>

		<cc:license>
			<rdf:Description>
			<xsl:attribute name="rdf:about">http://creativecommons.org/licenses/by-sa/3.0/</xsl:attribute>
				<cc:permits>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/Reproduction</xsl:attribute>
				</cc:permits>
				<cc:permits>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/Distribution</xsl:attribute>
				</cc:permits>
				<cc:permits>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/DerivativeWorks</xsl:attribute>
				</cc:permits>
				<cc:permits>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/CommercialUse</xsl:attribute>
				</cc:permits>
				<cc:requires>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/Attribution</xsl:attribute>
				</cc:requires>
				<cc:requires>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/Notice</xsl:attribute>
				</cc:requires>
				<cc:requires>
					<xsl:attribute name="rdf:resource">http://web.resource.org/cc/ShareAlike</xsl:attribute>
				</cc:requires>
				<rdfs:label rdf:datatype="xsd:string">By Attribution Share-Alike 3.0</rdfs:label>
			</rdf:Description>
		</cc:license>

	<rdfs:label rdf:datatype="xsd:string">RDF description of <xsl:value-of select="str[@name='old_findID']"/></rdfs:label>

	<foaf:thumbnail><xsl:attribute name="rdf:resource"><xsl:value-of select="$thumb"/><xsl:value-of select="int[@name='thumbnail']"/>.jpg</xsl:attribute></foaf:thumbnail>



			<!--  Number of parts -->
			<crm:P57_has_number_of_parts rdf:datatype="xsd:integer"><xsl:value-of select="int[@name='quantity']"/></crm:P57_has_number_of_parts>

			<!--  The object's title -->
			<crm:P102_has_title>
			    <crm:E35_Title>
			    	<xsl:attribute name="xsd:string">Object record for: <xsl:value-of select="str[@name='old_findID']"/></xsl:attribute></crm:E35_Title>
			</crm:P102_has_title>

			<!-- The preferred identifier: Must exist only once-->
			<crm:P48_has_preferred_identifier>
				<crm:E42_Identifier>
				 <xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='old_findID']"/></xsl:attribute>
				 <rdfs:label rdf:datatype="xsd:string">Unique id: <xsl:value-of select="str[@name='old_findID']"/></rdfs:label>
				 <crm:P3_has_note>
				 	<crm:E62_String>
				 	<xsl:attribute name="xsd:string">This identifier is uniquely assigned and is a composite of an Institution ID and a guid.</xsl:attribute></crm:E62_String>
				 </crm:P3_has_note>
				</crm:E42_Identifier>
			</crm:P48_has_preferred_identifier>

			<!--  Identifiers  -->

			<!--  internal UID  -->
			<crm:P1_is_identified_by>
				<crm:E42_Identifier>
					<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='secuid']"/></xsl:attribute>
					<rdfs:label rdf:datatype="xsd:string">Secure ID: <xsl:value-of select="str[@name='secuid']"/></rdfs:label>
				</crm:E42_Identifier>
			</crm:P1_is_identified_by>

			<!--  The integer used for constructing uris -->
			<crm:P1_is_identified_by>
				<crm:E42_Identifier>
					<xsl:attribute name="xsd:string"><xsl:value-of select="int[@name='id']"/></xsl:attribute>
					<rdfs:label rdf:datatype="xsd:string">Url string integer ID: <xsl:value-of select="int[@name='id']"/></rdfs:label>
				</crm:E42_Identifier>
			</crm:P1_is_identified_by>

			<!--  The other ref that might be applied -->
			<xsl:if test="str[@name='otherRef']">
			<crm:P1_is_identified_by>
				<crm:E42_Identifier>
					<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='otherRef']"/></xsl:attribute>
					<crm:P2_has_type>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes"/>thesauri/identifier/otherid</xsl:attribute>
					</crm:P2_has_type>
					<rdfs:label rdf:datatype="xsd:string">Other reference number: <xsl:value-of select="str[@name='otherRef']" /></rdfs:label>
				</crm:E42_Identifier>
			</crm:P1_is_identified_by>
			<crmbm:reg_id rdf:datatype="xsd:string"><xsl:value-of select="otherRef"/></crmbm:reg_id>
			</xsl:if>


			<!--  The treasure case number -->
			<xsl:if test="str[@name='TID']">
			<crm:P1_is_identified_by>
				<crm:E42_Identifier>
					<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='TID']"/></xsl:attribute>
				</crm:E42_Identifier>
			</crm:P1_is_identified_by>

			<!--  Build into database the acquired through treasure Act -->
			<crm:P24i_changed_ownership_through>
				<crm:E8_Acquistion>
					<crm:P2_has_type>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>acquisition/TA</xsl:attribute>
					</crm:P2_has_type>
					<crm:P17_was_motivated_by>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$bmDoc"/>treasure-act-1996</xsl:attribute>
					</crm:P17_was_motivated_by>
					<crm:P3_has_note>
					<xsl:attribute name="xsd:string">These objects were acquired via virtue of the Treasure Act.</xsl:attribute>
					</crm:P3_has_note>
				</crm:E8_Acquistion>
			</crm:P24i_changed_ownership_through>
			<crmbm:other_id rdf:datatype="xsd:string"><xsl:value-of select="str[@name='treasureID']"/></crmbm:other_id>
			</xsl:if>


			<!--  Where documented -->
			<crm:P70i_is_documented_in>
				<crm:E32_Authority_Document>
					<crm:P48_has_preferred_identifier>
			  		<crm:E42_Identifier>
			  		<xsl:attribute name="rdf:about"><xsl:value-of select="$url"/><xsl:value-of select="int[@name='id']"/>/format/rdf</xsl:attribute>
                                        </crm:E42_Identifier>
			  		</crm:P48_has_preferred_identifier>
				</crm:E32_Authority_Document>
			</crm:P70i_is_documented_in>

			<!-- Rights of use -->
			<crm:P104_is_subject_to >
				<crm:E30_Right>
					<xsl:attribute name="rdf:type">http://creativecommons.org/licenses/by-sa/3.0/</xsl:attribute>
					<crm:P3_has_note>
						<xsl:attribute name="xsd:string">Copyright the Portable Antiquities Scheme/British Museum</xsl:attribute>
					</crm:P3_has_note>
				</crm:E30_Right>
			</crm:P104_is_subject_to>

			<!--  object type appellation -->
			<crmbm:PX_object_type>
				<xsl:attribute name="rdf:resource">http://finds.org.uk/database/terminology/object/term/<xsl:value-of select="str[@name='objecttype']"/></xsl:attribute>
			</crmbm:PX_object_type>

			<crm:P2_has_type>
				<crm:E55_Type>
				<xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/object/term/<xsl:value-of select="str[@name='objecttype']"/></xsl:attribute>
					<rdf:value>
						<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='objecttype']"/></xsl:attribute>
					</rdf:value>
					<rdfs:label rdf:datatype="xsd:string">Object type: <xsl:value-of select="str[@name='objecttype']"/></rdfs:label>
					<skos:inScheme><xsl:value-of select="$bmThes"/>object</skos:inScheme>
				</crm:E55_Type>
			</crm:P2_has_type>

			<!-- Description of the object -->
			<crmbm:PX_curatorial_comment rdf:datatype="xsd:string"><xsl:value-of select="normalize-space(str[@name='description'])"/></crmbm:PX_curatorial_comment>

			<!-- Dating of the object -->
			<!--  Timespan -->
			<crm:P4_has_time-span>
				<crm:E52_Time-Span>
					<crm:P79_beginning_is_qualified_by><xsl:value-of select="str[@name='fromDateQualifier']" /></crm:P79_beginning_is_qualified_by>
					<crm:P80_end_is_qualified_by><xsl:value-of select="str[@name='toDateQualifier']" /></crm:P80_end_is_qualified_by>
					<crm:P82a_begin_of_the_begin rdf:datatype="xsd:gYear"><xsl:value-of select="format-number(int[@name='fromdate'], '0000')" /></crm:P82a_begin_of_the_begin>
					<xsl:if test="int[@name='todate']">
					<crm:P82b_end_of_the_end rdf:datatype="xsd:gYear"><xsl:value-of select="format-number(int[@name='todate'], '0000')" /></crm:P82b_end_of_the_end>
					</xsl:if>
					<crm:P3_has_note rdf:datatype="xsd:string"><xsl:value-of select="format-number(int[@name='fromdate'], '0000')" /><xsl:if test="format-number(int[@name='todate'],'0000')"> to <xsl:value-of select="format-number(int[@name='todate'], '0000')" /></xsl:if></crm:P3_has_note>
					<rdfs:label rdf:datatype="xsd:string">Date range for object: <xsl:value-of select="format-number(int[@name='fromdate'], '0000')" /><xsl:if test="format-number(int[@name='todate'],'0000')"> to <xsl:value-of select="format-number(int[@name='fromdate'], '0000')" /></xsl:if></rdfs:label>
					<crm:P82_at_some_time_within>
						<crm:E61_Time_primitive>
							<claros:not_before><xsl:attribute name="xsd:gYear"><xsl:value-of select="format-number(int[@name='fromdate'], '0000')" /></xsl:attribute></claros:not_before>
							<xsl:if test="int[@name='todate']">
							<claros:not_after><xsl:attribute name="xsd:gYear"><xsl:value-of select="format-number(int[@name='todate'],'0000')" /></xsl:attribute></claros:not_after>
							</xsl:if>
						</crm:E61_Time_primitive>
					</crm:P82_at_some_time_within>
				</crm:E52_Time-Span>
			</crm:P4_has_time-span>

			<!-- Period mapping (broadperiod) -->
			<crm:P108i_was_produced_by>
                            <crm:E12_Production>
                                <crm:P10_falls_within>
                                    <crm:E4_Period>
                                        <xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/><xsl:value-of select="str[@name='broadperiodBM']" /></xsl:attribute>
                                        <owl:sameAs>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="$ehUri"/><xsl:value-of select="str[@name='broadperiodEH']" />
                                            </xsl:attribute>
                                        </owl:sameAs>
							<rdfs:label rdf:datatype="xsd:string">The broadperiod of the object is: <xsl:value-of select="str[@name='broadperiod']"/></rdfs:label>
							<crm:E49_Time_Appellation>
								<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='broadperiod']"/></xsl:attribute>
							</crm:E49_Time_Appellation>
						</crm:E4_Period>
					</crm:P10_falls_within>
				</crm:E12_Production>
			</crm:P108i_was_produced_by>

			<xsl:if test="str[@name='periodFrom']">
			<crm:P108i_was_produced_by>
				<crm:E12_Production>
					<crm:P10_falls_within>
						<crm:E4_Period>
							<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/><xsl:value-of select="str[@name='periodFromBM']" /></xsl:attribute>
							<rdfs:label>
								<xsl:attribute name="xsd:string">The starting period of the object is: <xsl:value-of select="str[@name='periodFromName']"/></xsl:attribute>
							</rdfs:label>
							<crm:E49_Time_Appellation>
								<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='periodFromName']"/></xsl:attribute>
							</crm:E49_Time_Appellation>
						</crm:E4_Period>
					</crm:P10_falls_within>
				</crm:E12_Production>
			</crm:P108i_was_produced_by>
			</xsl:if>

			<xsl:if test="str[@name='periodTo']" >
			<crm:P108i_was_produced_by>
				<crm:E12_Production>
					<crm:P10_falls_within>
						<crm:E4_Period>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/><xsl:value-of select="str[@name='periodToBM']" /></xsl:attribute>
							<rdfs:label rdf:datatype="xsd:string">The end period of the object is: <xsl:value-of select="str[@name='periodToName']"/></rdfs:label>
							<crm:E49_Time_Appellation>
									<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='periodToName']"/></xsl:attribute>
							</crm:E49_Time_Appellation>
						</crm:E4_Period>
					</crm:P10_falls_within>
				</crm:E12_Production>
			</crm:P108i_was_produced_by>
			</xsl:if>

			<!--  Part of the PAS collection -->
			<crm:P46i_forms_part_of>
				<crm:E78_Collection>
					<crm:P53_has_former_or_current_location>
						<crm:E53_Place>
							<crm:P1_is_identified_by>
								<crm:E48_Place_Name>
								<xsl:attribute name="xsd:string">The Portable Antiquities Scheme database</xsl:attribute></crm:E48_Place_Name>
							</crm:P1_is_identified_by>
						</crm:E53_Place>
					</crm:P53_has_former_or_current_location>
				</crm:E78_Collection>
			</crm:P46i_forms_part_of>

			<!--  Dimensions and weights -->

			<!--  Width -->
			<xsl:if test="double[@name='width']">
			<crm:P43_has_dimension>
	            <crm:E54_Dimension>
	            <crm:P2_has_type>
	            <xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>dimension/width</xsl:attribute>
	            </crm:P2_has_type>
	            <crm:E58_Measurement_Unit>
            		<crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Millimeter" />
            	</crm:E58_Measurement_Unit>
            	<crm:E16_Measurement>
					<crm:P90_has_value>
						<xsl:attribute name="xsd:decimal"><xsl:value-of select="double[@name='width']"/></xsl:attribute>
					</crm:P90_has_value>
				</crm:E16_Measurement>
	                <rdfs:label rdf:datatype="xsd:string">Width: <xsl:value-of select="double[@name='width']"/> mm</rdfs:label>
	                <crm:P3_has_note rdf:datatype="xsd:string"><xsl:value-of select="double[@name='width']"/></crm:P3_has_note>
	            </crm:E54_Dimension>
	        </crm:P43_has_dimension>
         	</xsl:if>

			<!--  Diameter  -->
			<xsl:if test="double[@name='diameter']">
			<crm:P43_has_dimension>
            	<crm:E54_Dimension>
        			<crm:P2_has_type>
            			<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>dimension/diameter</xsl:attribute>
            		</crm:P2_has_type>
				<crm:E58_Measurement_Unit>
            		<crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Millimeter" />
            	</crm:E58_Measurement_Unit>
            	<crm:E16_Measurement>
            		<crm:P90_has_value>
            			<xsl:attribute name="xsd:decimal"><xsl:value-of select="double[@name='diameter']"/></xsl:attribute>
            		</crm:P90_has_value>
            	</crm:E16_Measurement>
            		<rdfs:label rdf:datatype="xsd:string">Diameter: <xsl:value-of select="double[@name='diameter']"/> mm</rdfs:label>
        		</crm:E54_Dimension>
             </crm:P43_has_dimension>
        	</xsl:if>

			<!--  Height  -->
			<xsl:if test="double[@name='height']">
			<crm:P43_has_dimension>
                <crm:E54_Dimension>
                 <crm:P2_has_type>
                 <xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>dimension/height</xsl:attribute>
                 </crm:P2_has_type>
				<crm:E58_Measurement_Unit>
                    <crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Millimeter"/>
				</crm:E58_Measurement_Unit>
				<crm:E16_Measurement>
                    <crm:P90_has_value>
                    	<xsl:attribute name="xsd:decimal"><xsl:value-of select="double[@name='height']"/></xsl:attribute>
                    </crm:P90_has_value>
                </crm:E16_Measurement>
                    <rdfs:label rdf:datatype="xsd:string">Height: <xsl:value-of select="double[@name='height']"/> mm</rdfs:label>
                </crm:E54_Dimension>
            </crm:P43_has_dimension>
       	 </xsl:if>

		<!--  Thickness  -->
		<xsl:if test="double[@name='thickness']">
			<crm:P43_has_dimension>
                <crm:E54_Dimension>
                	<crm:P2_has_type>
                	  <xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>dimension/thickness</xsl:attribute>
                	</crm:P2_has_type>
				<crm:E58_Measurement_Unit>
                    <crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Millimeter" />
                </crm:E58_Measurement_Unit>
                <crm:E16_Measurement>
                    <crm:P90_has_value>
                    	<xsl:attribute name="xsd:decimal"><xsl:value-of select="double[@name='thickness']"/></xsl:attribute>
                    </crm:P90_has_value>
                </crm:E16_Measurement>
                    <rdfs:label rdf:datatype="xsd:string">Thickness: <xsl:value-of select="double[@name='thickness']"/> mm</rdfs:label>
                </crm:E54_Dimension>
            </crm:P43_has_dimension>
         </xsl:if>

         <!--  Weight  -->
		<xsl:if test="double[@name='weight']">
		<crm:P43_has_dimension>
	        <crm:E54_Dimension>
	        	<crm:P2_has_type>
	        	<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>dimension/weight</xsl:attribute>
	       	</crm:P2_has_type>
	       	<crm:E58_Measurement_Unit>
	            <crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Gram" />
	        </crm:E58_Measurement_Unit>
	        <crm:E16_Measurement>
	        	<crm:P90_has_value>
	        		<xsl:attribute name="xsd:decimal"><xsl:value-of select="double[@name='weight']"/></xsl:attribute>
	        	</crm:P90_has_value>
	        </crm:E16_Measurement>
	            <rdfs:label rdf:datatype="xsd:string">Weight: <xsl:value-of select="double[@name='weight']"/> grammes</rdfs:label>
	        </crm:E54_Dimension>
        </crm:P43_has_dimension>
		</xsl:if>

		<!--  Quantity -->
		<crm:P43_has_dimension>
			<crm:E54_Dimension>
				<crm:P2_has_type>
		        	<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>dimension/quantity</xsl:attribute>
		       	</crm:P2_has_type>
				<crm:P90_has_value rdf:datatype="xsd:integer"><xsl:value-of select="int[@name='quantity']"/></crm:P90_has_value>
				<rdfs:label rdf:datatype="xsd:string">Quantity: <xsl:value-of select="int[@name='quantity']"/></rdfs:label>
			</crm:E54_Dimension>
		</crm:P43_has_dimension>

		<!--  the current location -->
		<xsl:if test="currentLocation">
		<crm:P55F_has_current_location>
	         <crm:P87_is_identified_by>
	             <crm:E53_Place>
	             	<crm:P1_is_identified_by>
	             		<crm:E48_Place_Name>
	             			<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='currentLocation']"/></xsl:attribute>
	             		</crm:E48_Place_Name>
	                 </crm:P1_is_identified_by>
	             </crm:E53_Place>
	         </crm:P87_is_identified_by>
		</crm:P55F_has_current_location>
		</xsl:if>

		<!--  Image representations -->
			<xsl:if test="thumbnail">
			<!--  Thumbnail -->
			<crm:P138i_has_representation>
				<crm:E38_Image>
				<xsl:attribute name="rdf:about"><xsl:value-of select="$thumb"/><xsl:value-of select="int[@name='thumbnail']"/>.jpg</xsl:attribute>
					<rdfs:label>
						<xsl:attribute name="xsd:string">A thumbnail image of <xsl:value-of select="str[@name='old_findID']"/></xsl:attribute>
					</rdfs:label>
					<crm:P2_has_type rdf:resource="http://purl.org/NET/Claros/vocab#Thumbnail" />
					<crm:P104_is_subject_to >
				<crm:E30_Right>
					<xsl:attribute name="rdf:type">http://creativecommons.org/licenses/by/3.0/</xsl:attribute>
					<crm:P3_has_note>
						<xsl:attribute name="xsd:string">Attribute as the Portable Antiquities Scheme/British Museum</xsl:attribute>
					</crm:P3_has_note>
				</crm:E30_Right>
			</crm:P104_is_subject_to>
				</crm:E38_Image>
			</crm:P138i_has_representation>

			<xsl:if test="str[@name='filename']">
			<crm:P138i_has_representation>
				<crm:E38_Image>
				<xsl:attribute name="rdf:about"><xsl:value-of select="$images"/><xsl:value-of select="str[@name='imagedir']"/><xsl:value-of select="str[@name='filename']"/></xsl:attribute>
					<rdfs:label>
						<xsl:attribute name="xsd:string">A fullsized image of <xsl:value-of select="str[@name='old_findID']"/></xsl:attribute>
					</rdfs:label>
					<crm:P104_is_subject_to >
				<crm:E30_Right>
					<xsl:attribute name="rdf:type">http://creativecommons.org/licenses/by-sa/3.0/</xsl:attribute>
					<crm:P3_has_note>
						<xsl:attribute name="xsd:string">Copyright the Portable Antiquities Scheme/British Museum</xsl:attribute>
					</crm:P3_has_note>
				</crm:E30_Right>
			</crm:P104_is_subject_to>
				</crm:E38_Image>
			</crm:P138i_has_representation>

			<!--  BM extension for main image of object -->
			<crmbm:PX_has_main_representation>
			<xsl:attribute name="rdf:resource"><xsl:value-of select="$images"/><xsl:value-of select="str[@name='imagedir']"/><xsl:value-of select="str[@name='filename']"/></xsl:attribute>
			</crmbm:PX_has_main_representation>

			</xsl:if> <!-- end of test for filename -->

			</xsl:if>	<!--  end of test for end of thumbnail element -->



			<!--  The discovery data -->
				<crm:P12i_was_present_at>
				<crmbm:EX_discovery>
					<rdfs:label>
						<xsl:attribute name="xsd:string">Discovered or excavated</xsl:attribute>
					</rdfs:label>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes"/>id/thesauri/find/E</xsl:attribute>
					</crm:P2_has_type>
					<xsl:if test="date[@name='datefound1']">
					<crmbm:PX_time-span_earliest><xsl:attribute name="xsd:dateTime"><xsl:value-of select="date[@name='datefound1']"/></xsl:attribute></crmbm:PX_time-span_earliest>
					</xsl:if>
					<xsl:if test="date[@name='datefound2']">
					<crmbm:PX_time-span_latest><xsl:attribute name="xsd:dateTime"><xsl:value-of select="date[@name='datefound2']"/></xsl:attribute></crmbm:PX_time-span_latest>
					</xsl:if>
					<crm:P14_carried_out_by>
						<xsl:attribute name="rdf:resource">http://finds.org.uk</xsl:attribute>
					</crm:P14_carried_out_by>
					<crm:P7_took_place_at>
					<crm:E53_Place>
		             	<crm:P1_is_identified_by>
		             		<crm:E48_Place_Name>
		             			<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='parish']"/>, <xsl:value-of select="str[@name='district']"/>, <xsl:value-of select="str[@name='county']"/></xsl:attribute>
		             		</crm:E48_Place_Name>
		                 	</crm:P1_is_identified_by>
		             	</crm:E53_Place>
		             </crm:P7_took_place_at>
					<crm:P7_took_place_at>
						<xsl:if test="str[@name='knownas']">
						<pas:knownas><xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='knownas']"/></xsl:attribute></pas:knownas>
						</xsl:if>
						<!--  A known as test to hide parish and coordinates -->
						<xsl:if test="not(str[@name='knownas'])">
						<!--  EH extensions for coordinates -->
						<crm:E47_Spatial_Coordinates>
						<crm:P2_has_type rdf:resource="http://purl.org/NET/Claros/vocab#coordinates-find" />
							<xsl:if test="double[@name='elevation']">
						       <crm:P43_has_dimension>
						        <crm:E54_Dimension>
						        <crm:P2_has_type>
						        	<crmeh:EXP5_spatial_z></crmeh:EXP5_spatial_z>
						        </crm:P2_has_type>
						        <rdfs:label>Elevation: <xsl:value-of select="double[@name='elevation']"/></rdfs:label>
							       	<crm:E58_Measurement_Unit>
							            <crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Meter" />
							        </crm:E58_Measurement_Unit>
						        	<crm:E16_Measurement>
						        	<crm:P90_has_value>
						        		<xsl:attribute name="xsd:decimal"><xsl:value-of select="double[@name='elevation']"/></xsl:attribute>
						        	</crm:P90_has_value>
						        	</crm:E16_Measurement>
						        </crm:E54_Dimension>
						       </crm:P43_has_dimension>
							</xsl:if>
							<crmeh:EXP5_spatial_x rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLat']" /></crmeh:EXP5_spatial_x>
							<crmeh:EXP5_spatial_y rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLon']" /></crmeh:EXP5_spatial_y>
							<!--  Claros style geo object -->
							<claros:has_geoObject>
			        			<geo:Point>
						          <geo:lat rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLat']"/></geo:lat>
						          <geo:long rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLon']"/></geo:long>
						        </geo:Point>
			      			</claros:has_geoObject>
						</crm:E47_Spatial_Coordinates>
						</xsl:if>
					</crm:P7_took_place_at>

			      	<xsl:if test="int[@name='precision']">
			      	<pas:coordinatePrecision>
			      		<rdf:Description>
				      		<rdf:value rdf:datatype="xsd:integer"><xsl:value-of select="int[@name='precision']"/></rdf:value>
				      		<rdfs:label rdf:datatype="xsd:string">Grid reference precision to: <xsl:value-of select="int[@name='precision']"/> figures</rdfs:label>
			      		</rdf:Description>
			      	</pas:coordinatePrecision>
			      	</xsl:if>
			      	<xsl:if test="int[@name='accuracy']">
			      	<pas:accuracy>
						<rdf:Description>
							<rdf:value rdf:datatype="xsd:integer"><xsl:value-of select="int[@name='accuracy']"/></rdf:value>
							<rdfs:label rdf:datatype="xsd:string">Coordinates place object within a <xsl:value-of select="int[@name='accuracy']"/> metre square</rdfs:label>
						</rdf:Description>
					</pas:accuracy>
					</xsl:if>
					<xsl:if test="int[@name='regionID']">
				      	<osAdminGeo:inEuropeanRegion>
					    <xsl:attribute name="rdf:resource"><xsl:value-of select="$osUri"/><xsl:value-of select="format-number(int[@name='regionID'],'000000')"/></xsl:attribute>
					    </osAdminGeo:inEuropeanRegion>
					    </xsl:if>
					    <xsl:if test="int[@name='countyID']">
					    <osSpatialRel:within>
					    <xsl:attribute name="rdf:resource"><xsl:value-of select="$osUri"/><xsl:value-of select="format-number(int[@name='countyID'],'000000')"/></xsl:attribute>
					    </osSpatialRel:within>
					    </xsl:if>
					    <xsl:if test="int[@name='districtID']">
					    <osAdminGeo:inDistrict>
					    <xsl:attribute name="rdf:resource"><xsl:value-of select="$osUri"/><xsl:value-of select="format-number(int[@name='districtID'],'000000')"/></xsl:attribute>
					    </osAdminGeo:inDistrict>
					    </xsl:if>
					    <xsl:if test="str[@name='county']">
					    <osAdminGeo:county>
					      	<rdf:Description>
					      	<xsl:attribute name="rdf:about"><xsl:value-of select="$osUri"/><xsl:value-of select="format-number(int[@name='countyID'],'000000')"/></xsl:attribute>
					  			<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="county"/></rdfs:label>
					    	</rdf:Description>
					    </osAdminGeo:county>
					    </xsl:if>
					    <xsl:if test="str[@name='district']">
						<osAdminGeo:district>
							<rdf:Description>
						      	<xsl:attribute name="rdf:about"><xsl:value-of select="$osUri"/><xsl:value-of select="format-number(int[@name='districtID'],'000000')"/></xsl:attribute>
						  			<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='district']"/></rdfs:label>
						  	</rdf:Description>
						</osAdminGeo:district>
						</xsl:if>
						<xsl:if test="str[@name='parish']">
						<osAdminGeo:parish>
							<rdf:Description>
						      	<xsl:attribute name="rdf:about"><xsl:value-of select="$osUri"/><xsl:value-of select="format-number(int[@name='parishID'],'000000')"/></xsl:attribute>
						  			<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='parish']"/></rdfs:label>
						  	</rdf:Description>
						</osAdminGeo:parish>
						</xsl:if>
				</crmbm:EX_discovery>
				</crm:P12i_was_present_at>


			<xsl:if test="str[@name='objecttype'] = 'COIN'">
			<!--  The denomination -->
			<crm:P43_has_dimension>
				<crm:E54_Dimension>
					<rdfs:label>Unit of currency</rdfs:label>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes" />dimension/currency</xsl:attribute>
					</crm:P2_has_type>
					<crm:P91_has_unit>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$denomUrl"/><xsl:value-of select="str[@name='denomination']"/></xsl:attribute>
					</crm:P91_has_unit>
					<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='denominationName']"/></rdfs:label>
					<xsl:if test="nomismaDenomination">
					<owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri"/><xsl:value-of select="str[@name='nomismaDenomination']"/></xsl:attribute>
					</owl:sameAs>
					</xsl:if>
					<xsl:if test="str[@name='bmDenomination']">
					<owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes" />currency/<xsl:value-of select="str[@name='bmDenomination']"/></xsl:attribute>
					</owl:sameAs>
					</xsl:if>
					<xsl:if test="str[@name='dbpediaDenomination']">
					<owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$dbpediaUri" /><xsl:value-of select="str[@name='dbpediaDenomination']"/></xsl:attribute>
					</owl:sameAs>
					</xsl:if>
					<crm:P3_has_note>
						<xsl:attribute name="xsd:string">Portable Antiquities currency term: <xsl:value-of select="str[@name='denominationName']"/></xsl:attribute>
					</crm:P3_has_note>
				</crm:E54_Dimension>
            </crm:P43_has_dimension>

            <xsl:if test="int[@name='axis']">
            <crm:P43_has_dimension>
            	<crm:E54_Dimension>
					<rdfs:label>
						<xsl:attribute name="xsd:string">Die axis for coin: <xsl:value-of select="int[@name='axis']"/> o'clock</xsl:attribute>
					</rdfs:label>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes" />unit/oclock</xsl:attribute>
					</crm:P2_has_type>
					<crm:E58_Measurement_Unit>
            			<crm:P91_has_unit rdf:type="http://qudt.org/vocab/unit#Hour" />
            		</crm:E58_Measurement_Unit>
            		<crm:E16_Measurement>
					<crm:P90_has_value>
						<xsl:attribute name="xsd:integer"><xsl:value-of select="int[@name='axis']"/></xsl:attribute>
					</crm:P90_has_value>
				</crm:E16_Measurement>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" />axis</xsl:attribute>
					</owl:sameAs>
            	</crm:E54_Dimension>
            </crm:P43_has_dimension>
            </xsl:if>


            <crmbm:PX_currency rdf:datatype="rdf:resource"><xsl:value-of select="$bmThes"/>id/currency/<xsl:value-of select="str[@name='denominationName']"/></crmbm:PX_currency>

            <crmbm:PX_denomination><xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='denominationName']"/></xsl:attribute></crmbm:PX_denomination>
            <!--  The mint -->
            <xsl:if test="int[@name='mint']">
			<crmbm:PX_minted_in>
				<xsl:attribute name="rdf:resource">http://finds.org.uk/terminology/mints/mint/id/<xsl:value-of select="int[@name='mint']"/></xsl:attribute>
			</crmbm:PX_minted_in>

			<crm:P108i_was_produced_by>
    			<crm:E12_Production>
      				<rdfs:label rdf:datatype="xsd:string">Minted at: <xsl:value-of select="str[@name='mintName']"/></rdfs:label>
      				<crm:E53_Place>
      					  <crm:P87_is_identified_by>
      					  <xsl:attribute name="rdf:type">http://finds.org.uk/terminology/mints/mint/id/<xsl:value-of select="int[@name='mint']"/></xsl:attribute>
						    <crm:E48_Place_Name>
						    	<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='mintName']"/></xsl:attribute>
						    </crm:E48_Place_Name>
						  </crm:P87_is_identified_by>
						</crm:E53_Place>
						<crm:P2_has_type>
							<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes"/>production/MI</xsl:attribute>
						</crm:P2_has_type>
      			</crm:E12_Production>
      		</crm:P108i_was_produced_by>
      		</xsl:if>


			<!--  Representation of the ruler 	-->
			<xsl:if test="int[@name='ruler']">
			<crm:P138_represents>
				<crm:E21_Person>
				<xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/rulers/ruler/id/<xsl:value-of select="ruler"/></xsl:attribute>
					<crm:P2_has_type><xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes"/>profession/ruler</xsl:attribute></crm:P2_has_type>
					<crmbm:PX_profession>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes"/>authority/K</xsl:attribute>
					</crmbm:PX_profession>
					<xsl:if test="broadperiod = ROMAN">
					<crm:P107i_is_current_or_former_member_of>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes"/>id/nationality/Roman</xsl:attribute>
					</crm:P107i_is_current_or_former_member_of>
					</xsl:if>
					<rdf:type>
						<crm:E39_Actor></crm:E39_Actor>
					</rdf:type>
					<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='rulerName']"/></rdfs:label>
					<crm:P131_is_identified_by>
						<crm:E82_Actor_Appellation>
							<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='rulerName']"/></xsl:attribute>
							<rdfs:label rdf:datatype="xsd:string">The assigned ruler <xsl:value-of select="str[@name='rulerName']"/></rdfs:label>
						</crm:E82_Actor_Appellation>
					</crm:P131_is_identified_by>
				</crm:E21_Person>
			</crm:P138_represents>

			<crm:P17_was_motivated_by>
				<crm:E21_Person>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$pasUri"/><xsl:value-of select="int[@name='ruler']"/></xsl:attribute>
					<crm:P131_is_identified_by>
						<crm:E82_Actor_Appellation>
							<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='rulerName']"/></rdfs:label>
						</crm:E82_Actor_Appellation>
					</crm:P131_is_identified_by>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>production/I</xsl:attribute>
					</crm:P2_has_type>
					<rdf:type>
						<crm:E39_Actor></crm:E39_Actor>
					</rdf:type>
					<crm:P3_has_note>
							<crm:P90_has_value>
								<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='rulerName']"/></xsl:attribute>
							</crm:P90_has_value>
					</crm:P3_has_note>
					<xsl:if test="str[@name='broadperiod'] = ROMAN">
					<crm:P107i_is_current_or_former_member_of>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>id/nationality/Roman</xsl:attribute>
					</crm:P107i_is_current_or_former_member_of>
					</xsl:if>
				</crm:E21_Person>
			</crm:P17_was_motivated_by>
			</xsl:if>



			<xsl:if test="str[@name='broadperiod'] = ROMAN">
			<crm:P108i_was_produced_by>
				<crm:E12_Production>
					<crm:P10_falls_within>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes" />x14451</xsl:attribute>
					</crm:P10_falls_within>
				</crm:E12_Production>
			</crm:P108i_was_produced_by>

			<crm:P108i_was_produced_by>
				<crm:E12_Production>
					<crm:P10_falls_within>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes" />political-state/roman-empire</xsl:attribute>
					</crm:P10_falls_within>
				</crm:E12_Production>
			</crm:P108i_was_produced_by>
			</xsl:if>

			<!-- Moneyer -->
			<xsl:if test="str[@name='moneyerName']">
			<crm:P17_was_motivated_by>
				<crm:E21_Person>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$pasUri"/><xsl:value-of select="int[@name='moneyer']"/></xsl:attribute>
					<crm:P131_is_identified_by>
						<crm:E82_Actor_Appellation>
							<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='moneyerName']"/></rdfs:label>
						</crm:E82_Actor_Appellation>
					</crm:P131_is_identified_by>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>production/MO</xsl:attribute>
					</crm:P2_has_type>
					<rdf:type>
						<crm:E39_Actor></crm:E39_Actor>
					</rdf:type>
					<crm:P3_has_note>
							<crm:P90_has_value>
								<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='moneyerName']"/></xsl:attribute>
							</crm:P90_has_value>
					</crm:P3_has_note>
					<xsl:if test="str[@name='broadperiod'] = ROMAN">
					<crm:P107i_is_current_or_former_member_of>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>id/nationality/Roman</xsl:attribute>
					</crm:P107i_is_current_or_former_member_of>
					</xsl:if>
				</crm:E21_Person>
			</crm:P17_was_motivated_by>
			</xsl:if>

			<!-- Tribe IA only -->
			<xsl:if test="int[@name='tribe']">
			<crm:P17_was_motivated_by>
				<crm:E39_Actor>
					<crm:E74_Group>
						<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='tribeName']"/></rdfs:label>
						<rdf:type>
							<crm:E39_Actor></crm:E39_Actor>
						</rdf:type>
						<crm:P3_has_note>
								<crm:P90_has_value rdf:datatype="xsd:string">Iron Age Tribe: <xsl:value-of select="str[@name='tribeName']"/></crm:P90_has_value>
						</crm:P3_has_note>
						<crm:P131_is_identified_by>
							<crm:E82_Actor_Appellation>
								<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='tribeName']"/></xsl:attribute>
							</crm:E82_Actor_Appellation>
						</crm:P131_is_identified_by>
					</crm:E74_Group>
				</crm:E39_Actor>
			</crm:P17_was_motivated_by>
			</xsl:if>

			<!--  The  -->
			<xsl:if test="str[@name='obverseDescription']">
			<crm:P56_bears_feature>
				<crm:E25_Man-Made_Feature>
					<crm:P2_has_type>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>aspect/obverse</xsl:attribute>
					</crm:P2_has_type>
					<rdfs:label rdf:datatype="xsd:string">Obverse description</rdfs:label>
					<crmbm:PX_physical_description rdf:datatype="xsd:string"><xsl:value-of select="str[@name='obverseDescription']"/></crmbm:PX_physical_description>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" />obverse</xsl:attribute>
					</owl:sameAs>
				</crm:E25_Man-Made_Feature>
			</crm:P56_bears_feature>
			</xsl:if>

			<xsl:if test="str[@name='obverseLegend']">
			<crm:P56_bears_feature>
				<crm:E34_Inscription>
                    <crm:P2_has_type>
                        <xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>association/namedInscription</xsl:attribute>
                    </crm:P2_has_type>
                    <rdfs:label rdf:datatype="xsd:string">Obverse legend</rdfs:label>
                    <crmbm:PX_physical_description rdf:datatype="xsd:string"><xsl:value-of select="str[@name='obverseLegend']"/></crmbm:PX_physical_description>
                    <owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" />obverse</xsl:attribute>
                    </owl:sameAs>
                    <crm:P72_language>
                    	<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>language/latin</xsl:attribute>
                    </crm:P72_language>
                    <crm:PX_inscription_postion>Obverse</crm:PX_inscription_postion>
				</crm:E34_Inscription>
			</crm:P56_bears_feature>
			</xsl:if>

			<!--  Reverse -->
			<xsl:if test="str[@name='reverseDescription']">
			<crm:P56_bears_feature>
				<crm:E25_Man-Made_Feature>
				<crm:P2_has_type>
				<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>aspect/reverse</xsl:attribute>
				</crm:P2_has_type>
				<rdfs:label rdf:datatype="xsd:string">Reverse description</rdfs:label>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" />reverse</xsl:attribute>
				</owl:sameAs>
				<crmbm:PX_physical_description rdf:datatype="xsd:string"><xsl:value-of select="str[@name='reverseDescription']"/></crmbm:PX_physical_description>
                </crm:E25_Man-Made_Feature>
			</crm:P56_bears_feature>
			</xsl:if>

			<xsl:if test="str[@name='reverseLegend']">
			<crm:P56_bears_feature>
				<crm:E34_Inscription>
				<crm:P2_has_type>
				<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>inscription</xsl:attribute>
				</crm:P2_has_type>
				<rdfs:label rdf:datatype="xsd:string">Reverse legend</rdfs:label>
				<crmbm:PX_physical_description rdf:datatype="xsd:string"><xsl:value-of select="str[@name='reverseLegend']"/></crmbm:PX_physical_description>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" />reverse</xsl:attribute>
				</owl:sameAs>
				<crm:P72_language>
                    	<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>language/latin</xsl:attribute>
				</crm:P72_language>
				<crm:PX_inscription_postion>Reverse</crm:PX_inscription_postion>
                </crm:E34_Inscription>
			</crm:P56_bears_feature>
			</xsl:if>

			<!-- Mint mark -->
			<xsl:if test="str[@name='mintmark']">
			<crm:E36_Visual_Item>
				<crm:E37_Mark>
				<crm:P2_has_type>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes" />inscription-type/mintmark</xsl:attribute>
				</crm:P2_has_type>
					<crm:P62_depicts>
						<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='mintmark']" /></xsl:attribute>
					</crm:P62_depicts>
				</crm:E37_Mark>
			</crm:E36_Visual_Item>
			</xsl:if>

			<!-- Typings for coin such as reece/abc  -->

			<!-- Reece period -->
			<xsl:if test="int[@name='reeceID']">
			<crm:P2_has_type>
			<crm:E55_Type>
					<xsl:attribute name="xsd:string"><xsl:value-of select="int[@name='reeceID']"/></xsl:attribute>
					<rdfs:label rdf:datatype="xsd:string">Reece period: <xsl:value-of select="int[@name='reeceID']"/></rdfs:label>
					<rdf:type><xsl:value-of select="$findsTerms"/>reeceperiods/id/<xsl:value-of select="int[@name='reeceID']"/></rdf:type>
					<rdfs:comment rdf:datatype="xsd:string">The assigned Reece period assigned for this coin. Only applicable to Roman coins.</rdfs:comment>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$nomismaUri"/>reeceperiod</xsl:attribute>
					</crm:P2_has_type>
			</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!--  Medieval category -->
			<xsl:if test="int[@name='categoryID']">
			<crm:P2_has_type>
				<crm:E55_Type>
					<rdfs:label rdf:datatype="xsd:string">Medieval category: <xsl:value-of select="str[@name='categoryTerm']"/></rdfs:label>
					<rdfs:comment rdf:datatype="xsd:string">A medieval category assigned for breaking down coin types.</rdfs:comment>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>categories/id/<xsl:value-of select="int[@name='categoryID']"/></xsl:attribute>
					</crm:P2_has_type>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='categoryTerm']"/></crm:P90_has_value>
				</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!-- Medieval type -->
			<xsl:if test="int[@name='typeID']">
			<crm:P2_has_type>
				<crm:E55_Type>
					<rdfs:label rdf:datatype="xsd:string">Medieval type: <xsl:value-of select="str[@name='typeTerm']"/></rdfs:label>
					<rdfs:comment rdf:datatype="xsd:string">A medieval category type assigned for breaking down coin types.</rdfs:comment>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>types/id/<xsl:value-of select="int[@name='typeID']"/></xsl:attribute>
					</crm:P2_has_type>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='typeTerm']"/></crm:P90_has_value>
				</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!-- Reverse type -->
			<xsl:if test="int[@name='reverse']">
			<crm:P2_has_type>
				<crm:E55_Type>
					<rdfs:label rdf:datatype="xsd:string">Fourth Century reverse type: <xsl:value-of select="str[@name='reverseType']"/></rdfs:label>
					<rdfs:comment rdf:datatype="xsd:string">Roman reverse types by concept</rdfs:comment>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>reversetypes/id/<xsl:value-of select="int[@name='reverse']"/></xsl:attribute>
					</crm:P2_has_type>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='reverseType']"/></crm:P90_has_value>
				</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!-- ABC type  -->
			<xsl:if test="double[@name='abcType']">
			<crm:P2_has_type>
				<crm:E55_Type>
					<rdfs:label rdf:datatype="xsd:string">Ancient British Coinage identifier: <xsl:value-of select="double[@name='abcType']"/></rdfs:label>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>abctypes/id/<xsl:value-of select="double[@name='abcType']"/></xsl:attribute>
					</crm:P2_has_type>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="double[@name='abcType']"/></crm:P90_has_value>
				</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!-- Allen type -->
			<xsl:if test="str[@name='allenType']">
			<crm:P2_has_type>
				<crm:E55_Type>
					<rdfs:label rdf:datatype="xsd:string">Fourth Century reverse type: <xsl:value-of select="str[@name='allenType']"/></rdfs:label>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>allentypes/id/<xsl:value-of select="str[@name='allenType']"/></xsl:attribute>
					</crm:P2_has_type>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='allenType']"/></crm:P90_has_value>
				</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!-- Van Arsdell type -->
			<xsl:if test="str[@name='vaType']">
			<crm:P2_has_type>
				<crm:E55_Type>
					<rdfs:label rdf:datatype="xsd:string">Fourth Century reverse type: <xsl:value-of select="str[@name='vaType']"/></rdfs:label>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>vatypes/id/<xsl:value-of select="str[@name='vaType']"/></xsl:attribute>
					</crm:P2_has_type>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='vaType']"/></crm:P90_has_value>
				</crm:E55_Type>
			</crm:P2_has_type>
			</xsl:if>

			<!-- end of coin test -->
			</xsl:if>

			<!--  an object's inscription -->
			<xsl:if test="str[@name='inscription']">
			<crm:P56_bears_feature>
				<crm:E25_Man-Made_Feature>
					<crm:P2_has_type>
					<xsl:attribute name="rdf:type"><xsl:value-of select="$bmThes"/>inscription</xsl:attribute>
					</crm:P2_has_type>
					<rdfs:label rdf:datatype="xsd:string"><xsl:attribute name="xsd:string">Object inscription:</xsl:attribute></rdfs:label>
					<crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='inscription']"/></crm:P90_has_value>
					<crmbm:PX_physical_description rdf:datatype="xsd:string"><xsl:value-of select="str[@name='inscription']"/></crmbm:PX_physical_description>
				</crm:E25_Man-Made_Feature>
			</crm:P56_bears_feature>
			</xsl:if>

			<!--  Completeness of object -->
			<xsl:if test="int[@name='completeness']">
			<crm:P44_has_condition>
				  <crm:E3_Condition_State>
				    <crm:P2_has_type>
				      <crm:E55_Type>
				      	<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms" />conditions/<xsl:value-of select="int[@name='completeness']" /></xsl:attribute>
				      	<rdfs:label rdf:datatype="xsd:string">Object completeness: <xsl:value-of select="str[@name='completenessTerm']" /></rdfs:label>
				        <crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='completenessTerm']" /></crm:P90_has_value>
				      </crm:E55_Type>
				    </crm:P2_has_type>
				  </crm:E3_Condition_State>
			</crm:P44_has_condition>
			</xsl:if>

			<xsl:if test="int[@name='preservation']">
			<crm:P44_has_condition>
				  <crm:E3_Condition_State>
				    <crm:P2_has_type>
				      <crm:E55_Type>
				      	<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms" />conditions/<xsl:value-of select="int[@name='preservation']" /></xsl:attribute>
				      	<rdfs:label rdf:datatype="xsd:string">Object preservation <xsl:value-of select="str[@name='preservationTerm']" /></rdfs:label>
				        <crm:P90_has_value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='preservationTerm']" /></crm:P90_has_value>
				      </crm:E55_Type>
				    </crm:P2_has_type>
				  </crm:E3_Condition_State>
			</crm:P44_has_condition>
			</xsl:if>

		<!--  Primary  -->
        <xsl:if test="int[@name='material']">
          <crm:P45_consists_of>
              <crm:E57_Material>
              <xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/material/id/<xsl:value-of select="int[@name='material']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='materialTerm']"/></rdfs:label>
					<owl:sameAs>
                    	<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes" />x<xsl:value-of select="int[@name='primaryMaterialBM']" /></xsl:attribute>
					</owl:sameAs>
                      <crm:P1_is_identified_by>
				      <crm:E41_Appellation>
				        	<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='materialTerm']"/></xsl:attribute>
				      </crm:E41_Appellation>
				    </crm:P1_is_identified_by>
              </crm:E57_Material>
          </crm:P45_consists_of>
		</xsl:if>

		<!--  Secondary material -->
        <xsl:if test="int[@name='secondaryMaterial']">
          <crm:P45_consists_of>
              <crm:E57_Material>
                  <xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/material/id/<xsl:value-of select="int[@name='secondaryMaterial']"/></xsl:attribute>
                  <rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='secondaryMaterialTerm']"/></rdfs:label>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource"><xsl:value-of select="$bmThes" />x<xsl:value-of select="str[@name='secondaryMaterialBM']" /></xsl:attribute>
					</owl:sameAs>
                      <crm:P1_is_identified_by>
				      <crm:E41_Appellation>
				        	<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='secondaryMaterialTerm']"/></xsl:attribute>
				      </crm:E41_Appellation>
				    </crm:P1_is_identified_by>
              </crm:E57_Material>
          </crm:P45_consists_of>
        </xsl:if>

        <!--  Identifier of object -->
		<crm:P41i_was_classified_by>
		    <crm:E17_Type_Assignment>
		      <crm:P14_carried_out_by>
		        <crm:E39_Actor>
		         <crm:P107i_is_current_or_former_member_of>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$pasUri"/></xsl:attribute>
				</crm:P107i_is_current_or_former_member_of>
		          <rdfs:label rdf:datatype="xsd:string">Created by: <xsl:value-of select="str[@name='creator']"/></rdfs:label>
		          <crm:P131_is_identified_by >
					  <crm:E82_Actor_Appellation>
					    <xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='creator']"/></xsl:attribute>
					  </crm:E82_Actor_Appellation>
				</crm:P131_is_identified_by>
		        </crm:E39_Actor>
		      </crm:P14_carried_out_by>
		    </crm:E17_Type_Assignment>
		</crm:P41i_was_classified_by>

		<!--  Recorder of object -->
		<crm:P41i_was_classified_by>
		    <crm:E17_Type_Assignment>
		      <crm:P14_carried_out_by>
		        <crm:E39_Actor>
		        <crm:P107i_is_current_or_former_member_of>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$pasUri"/></xsl:attribute>
				</crm:P107i_is_current_or_former_member_of>
		          <rdfs:label rdf:datatype="xsd:string">Recorded by: <xsl:value-of select="str[@name='recorder']"/></rdfs:label>
		          <crm:P131_is_identified_by >
					  <crm:E82_Actor_Appellation>
					  	<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='recorder']"/></xsl:attribute>
					  </crm:E82_Actor_Appellation>
				</crm:P131_is_identified_by>
		        </crm:E39_Actor>
		      </crm:P14_carried_out_by>
		    </crm:E17_Type_Assignment>
		</crm:P41i_was_classified_by>

		<!--  Identifier of object -->
		<xsl:if test="str[@name='identifierID']">
		<crm:P41i_was_classified_by>
		    <crm:E17_Type_Assignment>
		      <crm:P14_carried_out_by>
		        <crm:E39_Actor>
		         <crm:P3_has_note>Identifier string is anonymised as sometimes this might breach the Data Protection Act.</crm:P3_has_note>
		         <crm:P107i_is_current_or_former_member_of>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$pasUri"/></xsl:attribute>
				</crm:P107i_is_current_or_former_member_of>
		          <rdfs:label rdf:datatype="xsd:string">Identified by: <xsl:value-of select="str[@name='identifierID']"/></rdfs:label>
		          <crm:P131_is_identified_by >
					  <crm:E82_Actor_Appellation>
					    <xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='identifierID']"/></xsl:attribute>
					  </crm:E82_Actor_Appellation>
				</crm:P131_is_identified_by>
		        </crm:E39_Actor>
		      </crm:P14_carried_out_by>
		    </crm:E17_Type_Assignment>
		</crm:P41i_was_classified_by>
		</xsl:if>

		<!--  Secondary Identifier of object -->
		<xsl:if test="str[@name='secondaryIdentifier']">
		<crm:P41i_was_classified_by>
		    <crm:E17_Type_Assignment>
		      <crm:P14_carried_out_by>
		        <crm:E39_Actor>
		        <crm:P107i_is_current_or_former_member_of>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$pasUri"/></xsl:attribute>
				</crm:P107i_is_current_or_former_member_of>
		          <rdfs:label rdf:datatype="xsd:string">Identified by: <xsl:value-of select="str[@name='secondaryIdentifier']"/></rdfs:label>
		          <crm:P131_is_identified_by >
					  <crm:E82_Actor_Appellation>
					  <xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='secondaryIdentifier']"/></xsl:attribute>
					  </crm:E82_Actor_Appellation>
				</crm:P131_is_identified_by>
		        </crm:E39_Actor>
		      </crm:P14_carried_out_by>
		    </crm:E17_Type_Assignment>
		</crm:P41i_was_classified_by>
		</xsl:if>

		<!--  Institution recording the object -->
		<crm:P41i_was_classified_by>
		    <crm:E17_Type_Assignment>
		      <crm:P14_carried_out_by>
		      <crm:E39_Actor>
		      <xsl:attribute name="rdf:type">http://erlangen-crm.org/current/E74_Group</xsl:attribute>
		      <crm:P107i_is_current_or_former_member_of>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$pasUri"/></xsl:attribute>
				</crm:P107i_is_current_or_former_member_of>
		      <rdfs:label rdf:datatype="xsd:string">Recording institution: <xsl:value-of select="str[@name='institution']"/></rdfs:label>
		      <crm:P3_has_note>
				<xsl:attribute name="xsd:string">This is the institutional affiliation for the individual who recorded the object.</xsl:attribute>
				</crm:P3_has_note>
		        <crm:E74_Group>
		          	<crm:P131_is_identified_by >
					  <crm:E82_Actor_Appellation>
					  	<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='institution']"/></xsl:attribute>
					  </crm:E82_Actor_Appellation>
					</crm:P131_is_identified_by>
	        	</crm:E74_Group>
	        	</crm:E39_Actor>
		      </crm:P14_carried_out_by>
		    </crm:E17_Type_Assignment>
		</crm:P41i_was_classified_by>

		<!-- Method of production -->
		<crm:P108i_was_produced_by>
			<crm:E12_Production>
				<crm:P32_used_general_technique>
					<crm:E55_Type>
						<crm:P2_has_type>
							<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>manufacture/id/<xsl:value-of select="int[@name='manufacture']"/></xsl:attribute>
						</crm:P2_has_type>
					<rdfs:label rdf:datatype="xsd:string">Method of manufacture: <xsl:value-of select="str[@name='manufactureTerm']"/></rdfs:label>
					<crm:P131_is_identified_by>
					<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='manufactureTerm']"/></xsl:attribute>
					</crm:P131_is_identified_by>
					</crm:E55_Type>
				</crm:P32_used_general_technique>
			</crm:E12_Production>
		</crm:P108i_was_produced_by>

        <!--  Method of decoration -->
        <xsl:if test="str[@name='decstyleTerm']">
        <crm:P108i_was_produced_by>
			<crm:E12_Production>
				<crm:P32_used_general_technique>
					<crm:E55_Type>
					<crm:P2_has_type>
						<xsl:attribute name="rdf:type"><xsl:value-of select="$findsTerms"/>decoration/id<xsl:value-of select="int[@name='decstyle']"/></xsl:attribute>
					</crm:P2_has_type>
					<rdfs:label rdf:datatype="xsd:string">Decorative style: <xsl:value-of select="str[@name='decstyleTerm']"/></rdfs:label>
					<crm:P131_is_identified_by>
					<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='decstyleTerm']"/></xsl:attribute>
					</crm:P131_is_identified_by>
					</crm:E55_Type>
				</crm:P32_used_general_technique>
			</crm:E12_Production>
		</crm:P108i_was_produced_by>
		</xsl:if>

		<xsl:if test="str[@name='currentLocation']">
		<crm:E30_Right>
			<crm:P75i_is_possessed_by >
				<crm:E39_Actor>
		          	<crm:P131_is_identified_by >
						<crm:E82_Actor_Appellation>
						<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='currentLocation']"/></xsl:attribute>
						</crm:E82_Actor_Appellation>
					</crm:P131_is_identified_by>
				</crm:E39_Actor>
			</crm:P75i_is_possessed_by>
		</crm:E30_Right>
		</xsl:if>




	<xsl:if test="objecttype = 'COIN'" >

		<rdf:type><xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri"/>coin</xsl:attribute></rdf:type>
		<dcterms:title rdf:datatype="xsd:string"><xsl:value-of select="str[@name='old_findID']" /></dcterms:title>
		<dcterms:identifier rdf:datatype="xsd:string"><xsl:value-of select="int[@name='id']" /></dcterms:identifier>

		<nm:collection rdf:datatype="xsd:string">The Portable Antiquities Scheme</nm:collection>

				<xsl:if test="str[@name='broadperiod'] = 'ROMAN'">
		<dcterms:partOf rdf:resource="http://nomisma.org/id/roman_numismatics"/>
              </xsl:if>

		<xsl:if test="str[@name='broadperiod'] = 'BYZANTINE'">
		<dcterms:partOf rdf:resource="http://nomisma.org/id/byzantine_numismatics"/>
              </xsl:if>

		<xsl:if test="str[@name='broadperiod'] = 'GREEK AND ROMAN PROVINCIAL'">
		<dcterms:partOf rdf:resource="http://nomisma.org/id/greek_numismatics"/>
              </xsl:if>

		<nm:numismatic_term rdf:resource="http://nomisma.org/id/coin"/>

		<nm:collection rdf:datatype="xsd:string">Portable Antiquities Scheme</nm:collection>

		<xsl:if test="int[@name='axis']" >
		<nm:axis rdf:datatype="xsd:integer"><xsl:value-of select="axis" /></nm:axis>
		</xsl:if>

		<xsl:if test="double[@name='diameter']">
		<nm:diameter>
			<rdf:Description>
				<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='diameter']"/></rdf:value>
				<nm:units rdf:resource="http://qudt.org/vocab/unit#Millimeter" />
			</rdf:Description>
		</nm:diameter>
		</xsl:if>

		<xsl:if test="double[@name='weight']">
		<nm:weight >
			<rdf:Description>
				<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='weight']"/></rdf:value>
				<nm:units rdf:resource="http://qudt.org/vocab/unit#Gram" />
			</rdf:Description>
		</nm:weight>
		</xsl:if>

		<xsl:if test="double[@name='thickness']">
		<nm:thickness>
			<rdf:Description>
			<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='thickness']"/></rdf:value>
			<nm:units rdf:resource="http://qudt.org/vocab/unit#Millimeter" />
			</rdf:Description>
		</nm:thickness>
		</xsl:if>

		<xsl:if test="int[@name='fromdate']">
		<nm:start_date rdf:datatype="xsd:gYear"><xsl:value-of select="format-number(int[@name='fromdate'], '0000')"/></nm:start_date>
		</xsl:if>

		<xsl:if test="int[@name='todate']">
		<nm:end_date rdf:datatype="xsd:gYear"><xsl:value-of select="format-number(int[@name='todate'], '0000')"/></nm:end_date>
		</xsl:if>

		<xsl:if test="str[@name='denominationName']">
		<nm:denomination>
			<rdf:Description >
				<xsl:attribute name="xsd:string"><xsl:value-of select="str[@name='denominationName']"/></xsl:attribute>
				<xsl:if test="str[@name='denominationDbpedia']">
				<owl:sameAs>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$dbpediaUri" /><xsl:value-of select="str[@name='denominationDbpedia']"/></xsl:attribute>
				</owl:sameAs>
				</xsl:if>
			</rdf:Description>
		</nm:denomination>
		</xsl:if>

		<xsl:if test="str[@name='reverseDescription']">
		<nm:reverse>
			<nm:description>
				<xsl:attribute name="xsd:string">
					<xsl:value-of select="str[@name='denominationName']"/>
				</xsl:attribute>
			</nm:description>
		</nm:reverse>
		</xsl:if>

		<xsl:if test="str[@name='reverseLegend']">
		<nm:reverse>
			<nm:legend>
				<xsl:attribute name="xsd:string">
					<xsl:value-of select="str[@name='reverseLegend']"/>
				</xsl:attribute>
			</nm:legend>
		</nm:reverse>
		</xsl:if>

		<xsl:if test="str[@name='obverseDescription']">
		<nm:obverse>
			<nm:description>
				<xsl:attribute name="xsd:string">
					<xsl:value-of select="str[@name='obverseDescription']"/>
				</xsl:attribute>
			</nm:description>
		</nm:obverse>
		</xsl:if>

		<xsl:if test="str[@name='obverseLegend']">
		<nm:obverse>
			<nm:legend>
				<xsl:attribute name="xsd:string">
					<xsl:value-of select="str[@name='obverseLegend']"/>
				</xsl:attribute>
			</nm:legend>
		</nm:obverse>
		</xsl:if>

		<xsl:if test="int[@name='ruler']">
		<nm:authority>
			<rdf:Description>
			<xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/rulers/ruler/id/<xsl:value-of select="int[@name='ruler']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='rulerName']"/></rdfs:label>
				<xsl:if test="str[@name='rulerDbpedia']">
				<owl:sameAs >
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$dbpediaUri" /><xsl:value-of select="str[@name='rulerDbpedia']"/></xsl:attribute>
				</owl:sameAs>
				<skos:related>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$wikipediaUri" /><xsl:value-of select="str[@name='rulerDbpedia']"/></xsl:attribute>
				</skos:related>
				</xsl:if>
				<xsl:if test="int[@name='rulerViaf']">
				<owl:sameAs >
					<xsl:attribute name="rdf:resource">http://viaf.org/viaf/<xsl:value-of select="int[@name='rulerViaf']"/></xsl:attribute>
				</owl:sameAs>
				</xsl:if>
				<xsl:if test="str[@name='rulerNomisma']">
				<owl:sameAs>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" /><xsl:value-of select="str[@name='rulerNomisma']"/></xsl:attribute>
				</owl:sameAs>
				</xsl:if>
			</rdf:Description>
		</nm:authority>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="not(str[@name='knownas'])" >
				<nm:findspot>
				      <rdf:Description>
				      	<geo:lat rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLat']"/></geo:lat>
						<geo:long rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLon']"/></geo:long>
						<geo:lat_long rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='fourFigureLat']"/>,<xsl:value-of select="double[@name='fourFigureLon']"/></geo:lat_long>
						<xsl:if test="int[@name='accuracy']">
						<pas:accuracy>
							<rdf:Description>
								<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="int[@name='accuracy']"/></rdf:value>
								<rdfs:label rdf:datatype="xsd:string">Coordinates place object within a <xsl:value-of select="int[@name='accuracy']"/> metre square</rdfs:label>
							</rdf:Description>
						</pas:accuracy>
						</xsl:if>
						<xsl:if test="int[@name='precision']">
						<pas:coordinatePrecision>
				      		<rdf:Description>
					      		<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="int[@name='precision']"/></rdf:value>
					      		<rdfs:label rdf:datatype="xsd:string">Grid reference length of <xsl:value-of select="int[@name='precision']"/> figures</rdfs:label>
				      		</rdf:Description>
				      	</pas:coordinatePrecision>
				      	</xsl:if>
					</rdf:Description>
				</nm:findspot>
			</xsl:when>
			<xsl:otherwise>
				<nm:findspot>
				      <rdf:Description>
				      	<xsl:if test="int[@name='accuracy']">
						<pas:accuracy>
							<rdf:Description>
								<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="int[@name='accuracy']"/></rdf:value>
								<rdfs:label rdf:datatype="xsd:string">Coordinates place object within a <xsl:value-of select="int[@name='accuracy']"/> metre square</rdfs:label>
							</rdf:Description>
						</pas:accuracy>
						</xsl:if>
						<xsl:if test="int[@name='precision']">
				      	<pas:coordinatePrecision>
				      		<rdf:Description>
					      		<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="int[@name='precision']"/></rdf:value>
					      		<rdfs:label rdf:datatype="xsd:string">Grid reference length <xsl:value-of select="int[@name='precision']"/> figures</rdfs:label>
				      		</rdf:Description>
				      	</pas:coordinatePrecision>
				      	</xsl:if>
						<xsl:if test="str[@name='knownas']">
						<pas:knownas rdf:datatype="xsd:string"><xsl:value-of select="str[@name='knownas']"/></pas:knownas>
						</xsl:if>
				      </rdf:Description>
				</nm:findspot>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="str[@name='mintName'] != ''" >
			<nm:mint>
			<rdf:Description>
			<xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/mints/mint/id/<xsl:value-of select="int[@name='mint']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string">Mint attributed: <xsl:value-of select="str[@name='mintName']"/></rdfs:label>
				<xsl:if test="str[@name='mintNomismaID']">
				<owl:sameAs>
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$nomismaUri" /><xsl:value-of select="str[@name='nomismaMintID']"/></xsl:attribute>
				</owl:sameAs>
				</xsl:if>
				<xsl:if test="int[@name='mintWoeid']">
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">http://woe.spum.org/id/<xsl:value-of select="int[@name='mintWoeid']"/></xsl:attribute>
				</owl:sameAs>
				</xsl:if>
				<xsl:if test="int[@name='mintGeonamesID']">
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">http://geonames.org/<xsl:value-of select="int[@name='mintGeonamesID']"/></xsl:attribute>
				</owl:sameAs>
				</xsl:if>
				<xsl:if test="int[@name='pleiadesID']">
				<owl:sameAs >
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$pleiadesUri" /><xsl:value-of select="int[@name='pleiadesID']"/>#this</xsl:attribute>
				</owl:sameAs>
				</xsl:if>
			</rdf:Description>
			</nm:mint>
		</xsl:if>

		<xsl:if test="int[@name='moneyer']">
		<nm:moneyer>
			<rdf:Description>
			<xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/moneyers/moneyer/id/<xsl:value-of select="int[@name='moneyer']"/></xsl:attribute>
			<rdfs:label rdf:datatype="xsd:string">Moneyer attributed: <xsl:value-of select="str[@name='moneyerName']"/></rdfs:label>
			<xsl:if test="str[@name='moneyerDbpedia']">
				<owl:sameAs >
					<xsl:attribute name="rdf:resource"><xsl:value-of select="$dbpediaUri" /><xsl:value-of select="str[@name='moneyerDbpedia']"/></xsl:attribute>
				</owl:sameAs>
			</xsl:if>
			</rdf:Description>
		</nm:moneyer>
		</xsl:if>

		<xsl:if test="int[@name='reeceID']">
		<nm:reeceperiod>
			<rdf:Description>
			<xsl:attribute name="rdf:type">http://finds.org.uk/romancoins/reeceperiods/period/id/<xsl:value-of select="str[@name='reeceID']"/></xsl:attribute>
			<rdfs:label rdf:datatype="xsd:string">Reece period <xsl:value-of select="str[@name='reeceID']"/></rdfs:label>
			<rdf:value rdf:datatype="xsd:integer"><xsl:value-of select="str[@name='reeceID']" /></rdf:value>
			</rdf:Description>
			</nm:reeceperiod>
		</xsl:if>

		<xsl:if test="str[@name='reverseType']">
		<nm:reverseType>
			<rdf:Description>
			<xsl:attribute name="rdf:type">http://finds.org.uk/romancoins/reversetypes/type/id/<xsl:value-of select="int[@name='reverse']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='reverseType']" /></rdfs:label>
			</rdf:Description>
		</nm:reverseType>
		</xsl:if>

		<xsl:if test="int[@name='thumbnail']">
		<nm:thumbnail>
			<rdf:Description>
			<xsl:attribute name="rdf:about"><xsl:value-of select="$thumb"/><xsl:value-of select="int[@name='thumbnail']"/>.jpg</xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string">Thumbnail image of <xsl:value-of select="str[@name='old_findID']"/></rdfs:label>
			</rdf:Description>
		</nm:thumbnail>
		</xsl:if>

		<xsl:if test="str[@name='materialTerm']">
		<nm:material>
			<rdf:Description>
				<xsl:attribute name="rdf:type">http://finds.org.uk/database/terminology/material/id/<xsl:value-of select="int[@name='material']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string"><xsl:value-of select="str[@name='materialTerm']"/></rdfs:label>
			</rdf:Description>
		</nm:material>
		</xsl:if>

		<!-- Type series for coins -->
		<xsl:if test="double[@name='cciNumber']">
		<nm:type_series_item>
			<rdf:Description>
				<xsl:attribute name="rdf:type">http://finds.org.uk/ironagecoins/cci/id/<xsl:value-of select="double[@name='cciNumber']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string">Celtic Coin Index number: <xsl:value-of select="double[@name='cciNumber']"/></rdfs:label>
				<rdf:value rdf:datatype="xsd:decimal"><xsl:value-of select="double[@name='cciNumber']"/></rdf:value>
				<rdfs:comment rdf:datatype="xsd:string">No identifier in nomisma for cciNumbers</rdfs:comment>
			</rdf:Description>
		</nm:type_series_item>
		</xsl:if>

		<xsl:if test="str[@name='vaType']">
		<nm:type_series_item>
			<rdf:Description>
				<xsl:attribute name="rdf:type">http://finds.org.uk/ironagecoins/vatypes/type/<xsl:value-of select="str[@name='vaType']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string">Van Arsdell type: <xsl:value-of select="str[@name='vaType']"/></rdfs:label>
				<rdf:value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='vaType']"/></rdf:value>
			</rdf:Description>
		</nm:type_series_item>
		</xsl:if>

		<xsl:if test="str[@name='abcType']">
		<nm:type_series_item>
			<rdf:Description>
				<xsl:attribute name="rdf:type">http://finds.org.uk/ironagecoins/abctypes/type/<xsl:value-of select="str[@name='abcType']"/></xsl:attribute>
				<rdfs:label rdf:datatype="xsd:string">ABC type number: <xsl:value-of select="str[@name='abcType']"/></rdfs:label>
				<rdf:value rdf:datatype="xsd:string"><xsl:value-of select="str[@name='abcType']"/></rdf:value>
			</rdf:Description>
		</nm:type_series_item>
		</xsl:if>

		</xsl:if> <!--  end of test for a coin -->
		<!-- End of FOAF document -->
	</foaf:Document>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
