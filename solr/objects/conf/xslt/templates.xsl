<?xml version="1.0" encoding="UTF-8"?>
<!-- Repeated functions for regularization to be used through Numishare -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nh="http://nomisma.org/nudsHoard" xmlns:numishare="https://github.com/ewg118/numishare"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">

	<!-- ************** NORMALIZATION TEMPLATES ************** -->
	<xsl:function name="nh:normalize_date">
		<xsl:param name="start_date"/>
		<xsl:param name="end_date"/>

		<xsl:choose>
			<xsl:when test="number($start_date) = number($end_date)">
				<xsl:if test="number($start_date) &lt; 500 and number($start_date) &gt; 0">
					<xsl:text>A.D. </xsl:text>
				</xsl:if>
				<xsl:value-of select="abs(number($start_date))"/>
				<xsl:if test="number($start_date) &lt; 0">
					<xsl:text> B.C.</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- start date -->

				<xsl:if test="number($start_date) &lt; 500 and number($start_date) &gt; 0">
					<xsl:text>A.D. </xsl:text>
				</xsl:if>
				<xsl:value-of select="abs(number($start_date))"/>
				<xsl:if test="number($start_date) &lt; 0">
					<xsl:text> B.C.</xsl:text>
				</xsl:if>
				<xsl:text> - </xsl:text>

				<!-- end date -->
				<xsl:if test="number($end_date) &lt; 500 and number($end_date) &gt; 0">
					<xsl:text>A.D. </xsl:text>
				</xsl:if>
				<xsl:value-of select="abs(number($end_date))"/>
				<xsl:if test="number($end_date) &lt; 0">
					<xsl:text> B.C.</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<!-- normalize NUDS element -->
	<!-- Google spreadsheet regular expressions
		find: ([^\s]+)\t.*\t(.*)
		replace: <xsl:when test="\$label='$1'">$2</xsl:when>
	-->
	<xsl:function name="numishare:regularize_node">
		<xsl:param name="label"/>
		<xsl:param name="lang"/>
		<xsl:choose>
			<xsl:when test="$lang='ar'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">?????</xsl:when>
					<xsl:when test="$label='acquiredFrom'">???? ?????? ?????</xsl:when>
					<xsl:when test="$label='appraisal'">??????</xsl:when>
					<xsl:when test="$label='appraiser'">?? ???? ??? ?????? </xsl:when>
					<xsl:when test="$label='authority'">??????? ????</xsl:when>
					<xsl:when test="$label='axis'">?????? ?????? </xsl:when>
					<xsl:when test="$label='collection'">??? ????? ? ??????? ??????? ??????? </xsl:when>
					<xsl:when test="$label='completeness'"> ?????? ???????? </xsl:when>
					<xsl:when test="$label='condition'">?????? </xsl:when>
					<xsl:when test="$label='conservationState'">???? ??????? </xsl:when>
					<xsl:when test="$label='coordinates'">?????????? </xsl:when>
					<xsl:when test="$label='countermark'">??????? ??????? </xsl:when>
					<xsl:when test="$label='provenance'">???? ???? ??????</xsl:when>
					<xsl:when test="$label='date'">??????? </xsl:when>
					<xsl:when test="$label='dateOnObject'">??????? ???? ??? ??????</xsl:when>
					<xsl:when test="$label='denomination'">?????</xsl:when>
					<xsl:when test="$label='department'">?????</xsl:when>
					<xsl:when test="$label='deposit'">???? ?????</xsl:when>
					<xsl:when test="$label='description'">???????</xsl:when>
					<xsl:when test="$label='diameter'">???</xsl:when>
					<xsl:when test="$label='discovery'">????????</xsl:when>
					<xsl:when test="$label='disposition'">????? ? ????? ?????</xsl:when>
					<xsl:when test="$label='edge'">?????? </xsl:when>
					<xsl:when test="$label='era'">?????? ??????? </xsl:when>
					<xsl:when test="$label='finder'"> ??????? </xsl:when>
					<xsl:when test="$label='findspot'">???? ?????? ?????? </xsl:when>
					<xsl:when test="$label='geographic'">?????? </xsl:when>
					<xsl:when test="$label='grade'">????? ?????? </xsl:when>
					<xsl:when test="$label='height'">???????? </xsl:when>
					<xsl:when test="$label='identifier'">??? ????? </xsl:when>
					<xsl:when test="$label='issuer'">?????? ?? ?????</xsl:when>
					<xsl:when test="$label='landowner'">??????</xsl:when>
					<xsl:when test="$label='legend'">????????</xsl:when>
					<xsl:when test="$label='material'">?????? ?????</xsl:when>
					<xsl:when test="$label='measurementsSet'">????????</xsl:when>
					<xsl:when test="$label='mint'">??? ?????</xsl:when>
					<xsl:when test="$label='note'">???????</xsl:when>
					<xsl:when test="$label='objectType'">????? ??????</xsl:when>
					<xsl:when test="$label='obverse'">?????</xsl:when>
					<xsl:when test="$label='owner'">???? ??????</xsl:when>
					<xsl:when test="$label='portrait'">?????</xsl:when>
					<xsl:when test="$label='private'">?????? ?????? </xsl:when>
					<xsl:when test="$label='public'">?????? ?????? </xsl:when>
					<xsl:when test="$label='reference'">????</xsl:when>
					<xsl:when test="$label='region'">??????</xsl:when>
					<xsl:when test="$label='repository'">???? ???? ?????? </xsl:when>
					<xsl:when test="$label='reverse'">????? </xsl:when>
					<xsl:when test="$label='saleCatalog'">???????? </xsl:when>
					<xsl:when test="$label='saleItem'">????? ????????? </xsl:when>
					<xsl:when test="$label='salePrice'">?????????????? </xsl:when>
					<xsl:when test="$label='shape'">????? ??????? </xsl:when>
					<xsl:when test="$label='state'">?????? </xsl:when>
					<xsl:when test="$label='symbol'">????? </xsl:when>
					<xsl:when test="$label='testmark'">?????? ?????????? ????? </xsl:when>
					<xsl:when test="$label='title'">????? </xsl:when>
					<xsl:when test="$label='type'">?????? </xsl:when>
					<xsl:when test="$label='thickness'">????? </xsl:when>
					<xsl:when test="$label='wear'">?????? ?? ????? </xsl:when>
					<xsl:when test="$label='weight'">????? </xsl:when>
					<xsl:when test="$label='width'">????? </xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='bg'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">????????????</xsl:when>
					<xsl:when test="$label='acquisition'">???????????</xsl:when>
					<xsl:when test="$label='acquiredFrom'">?????????/? ?? </xsl:when>
					<xsl:when test="$label='adminDesc'">??????????????? ???????</xsl:when>
					<xsl:when test="$label='appraisal'">?????????</xsl:when>
					<xsl:when test="$label='appraiser'">????????</xsl:when>
					<xsl:when test="$label='auction'">???????</xsl:when>
					<xsl:when test="$label='authority'">?????????</xsl:when>
					<xsl:when test="$label='axis'">???????????? ?? ??????</xsl:when>
					<xsl:when test="$label='century'">???</xsl:when>
					<xsl:when test="$label='chronList'">?????????????? ??????</xsl:when>
					<xsl:when test="$label='chronItem'">?????????????? ????? </xsl:when>
					<xsl:when test="$label='coinType'">??????? ???</xsl:when>
					<xsl:when test="$label='collection'">????????</xsl:when>
					<xsl:when test="$label='color'">????</xsl:when>
					<xsl:when test="$label='completeness'">??????? / ?????? </xsl:when>
					<xsl:when test="$label='condition'">?????????</xsl:when>
					<xsl:when test="$label='conservationState'">???????????</xsl:when>
					<xsl:when test="$label='contents'">??????????</xsl:when>
					<xsl:when test="$label='coordinates'">?????????? </xsl:when>
					<xsl:when test="$label='countermark'">???????????</xsl:when>
					<xsl:when test="$label='date'">???? </xsl:when>
					<xsl:when test="$label='dateOnObject'">???? ?? ?????? </xsl:when>
					<xsl:when test="$label='dob'">???? ?? ?????? </xsl:when>
					<xsl:when test="$label='dateRange'">?????? ?? ????????</xsl:when>
					<xsl:when test="$label='decade'">???????????</xsl:when>
					<xsl:when test="$label='degree'">??????</xsl:when>
					<xsl:when test="$label='deity'">????????</xsl:when>
					<xsl:when test="$label='denomination'">???????</xsl:when>
					<xsl:when test="$label='department'">?????</xsl:when>
					<xsl:when test="$label='deposit'">????????? </xsl:when>
					<xsl:when test="$label='description'">????????</xsl:when>
					<xsl:when test="$label='diameter'">????????</xsl:when>
					<xsl:when test="$label='discovery'">????????</xsl:when>
					<xsl:when test="$label='disposition'">???????????? </xsl:when>
					<xsl:when test="$label='dynasty'">????????</xsl:when>
					<xsl:when test="$label='edge'">?????? ??? ?? ????????</xsl:when>
					<xsl:when test="$label='era'">????? </xsl:when>
					<xsl:when test="$label='finder'">??????????</xsl:when>
					<xsl:when test="$label='findspot'">????????????? </xsl:when>
					<xsl:when test="$label='fromDate'">??????? ????</xsl:when>
					<xsl:when test="$label='geographic'">?????????? </xsl:when>
					<xsl:when test="$label='grade'">??????</xsl:when>
					<xsl:when test="$label='height'">????????</xsl:when>
					<xsl:when test="$label='hoardDesc'">???????? ?? ???????????</xsl:when>
					<xsl:when test="$label='identifieri'">??????????????/ ? ?? </xsl:when>
					<xsl:when test="$label='issuer'">???????</xsl:when>
					<xsl:when test="$label='landowner'">?????????? ?? ??????</xsl:when>
					<xsl:when test="$label='legend'">???????</xsl:when>
					<xsl:when test="$label='manufacture'">????????????</xsl:when>
					<xsl:when test="$label='material'">???????? </xsl:when>
					<xsl:when test="$label='measurementsSet'">???????</xsl:when>
					<xsl:when test="$label='mint'">???????????</xsl:when>
					<xsl:when test="$label='note'">???????</xsl:when>
					<xsl:when test="$label='noteSet'">???????</xsl:when>
					<xsl:when test="$label='objectType'">??? ?? ??????</xsl:when>
					<xsl:when test="$label='obverse'">?????</xsl:when>
					<xsl:when test="$label='obv_leg'">??????? ???????</xsl:when>
					<xsl:when test="$label='obv_type'">??????? ???</xsl:when>
					<xsl:when test="$label='owner'">??????????</xsl:when>
					<xsl:when test="$label='physDesc'">????????? ????????</xsl:when>
					<xsl:when test="$label='portrait'">???????</xsl:when>
					<xsl:when test="$label='previousColl'">???????? ????????</xsl:when>
					<xsl:when test="$label='private'">??????</xsl:when>
					<xsl:when test="$label='provenance'">????????</xsl:when>
					<xsl:when test="$label='public'">????????</xsl:when>
					<xsl:when test="$label='publisher'">???????????</xsl:when>
					<xsl:when test="$label='reference'">??????????</xsl:when>
					<xsl:when test="$label='refDesc'">??????????</xsl:when>
					<xsl:when test="$label='region'">??????</xsl:when>
					<xsl:when test="$label='repository'">???????????? </xsl:when>
					<xsl:when test="$label='reverse'">??????</xsl:when>
					<xsl:when test="$label='rev_leg'">???????? ???????</xsl:when>
					<xsl:when test="$label='rev_type'">???????? ???</xsl:when>
					<xsl:when test="$label='saleCatalog'">????????? ???????</xsl:when>
					<xsl:when test="$label='saleItem'">????????? ?????</xsl:when>
					<xsl:when test="$label='salePrice'">???????? ????</xsl:when>
					<xsl:when test="$label='shape'">?????</xsl:when>
					<xsl:when test="$label='state'">?????????</xsl:when>
					<xsl:when test="$label='subject'">??????</xsl:when>
					<xsl:when test="$label='subjectSet'">???????</xsl:when>
					<xsl:when test="$label='symbol'">??????</xsl:when>
					<xsl:when test="$label='testmark'">?????</xsl:when>
					<xsl:when test="$label='timestamp'">???? ?? ????????????</xsl:when>
					<xsl:when test="$label='title'">????????</xsl:when>
					<xsl:when test="$label='toDate'">?? ???? </xsl:when>
					<xsl:when test="$label='type'">???</xsl:when>
					<xsl:when test="$label='typeDesc'">??????????? ????????</xsl:when>
					<xsl:when test="$label='thickness'">???????? </xsl:when>
					<xsl:when test="$label='undertypeDesc'">???????? ?? ???????</xsl:when>
					<xsl:when test="$label='wear'">??????????</xsl:when>
					<xsl:when test="$label='weight'">?????</xsl:when>
					<xsl:when test="$label='width'">??????</xsl:when>
					<xsl:when test="$label='year'">??????</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='de'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Bestätigung</xsl:when>
					<xsl:when test="$label='acquisition'">Erwerb</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Erworben von</xsl:when>
					<xsl:when test="$label='adminDesc'">Administrative Geschichte</xsl:when>
					<xsl:when test="$label='appraisal'">Schätzung</xsl:when>
					<xsl:when test="$label='appraiser'">Schätzer</xsl:when>
					<xsl:when test="$label='auction'">Auktion</xsl:when>
					<xsl:when test="$label='authority'">Autorität</xsl:when>
					<xsl:when test="$label='axis'">Stellung</xsl:when>
					<xsl:when test="$label='century'">Jahrhundert</xsl:when>
					<xsl:when test="$label='chronList'">Chronologische Liste</xsl:when>
					<xsl:when test="$label='chronItem'">Chronologischer Gegenstand</xsl:when>
					<xsl:when test="$label='coinType'">Münztyp</xsl:when>
					<xsl:when test="$label='collection'">Sammlung</xsl:when>
					<xsl:when test="$label='color'">Farbe</xsl:when>
					<xsl:when test="$label='completeness'">Vollständigkeit</xsl:when>
					<xsl:when test="$label='condition'">Erhaltung</xsl:when>
					<xsl:when test="$label='conservationState'">Erhaltungszustand</xsl:when>
					<xsl:when test="$label='contents'">Inhalt</xsl:when>
					<xsl:when test="$label='coordinates'">Koordinaten</xsl:when>
					<xsl:when test="$label='countermark'">Gegenstempel</xsl:when>
					<xsl:when test="$label='date'">Datum</xsl:when>
					<xsl:when test="$label='dateOnObject'">Datum auf Gegenstand</xsl:when>
					<xsl:when test="$label='dob'">Datum auf Gegenstand</xsl:when>
					<xsl:when test="$label='dateRange'">Datierungsspanne</xsl:when>
					<xsl:when test="$label='decade'">Jahrzehnt</xsl:when>
					<xsl:when test="$label='degree'">Grad</xsl:when>
					<xsl:when test="$label='deity'">Gottheit</xsl:when>
					<xsl:when test="$label='denomination'">Nominale</xsl:when>
					<xsl:when test="$label='department'">Abteilung</xsl:when>
					<xsl:when test="$label='deposit'">Depot</xsl:when>
					<xsl:when test="$label='description'">Beschreibung</xsl:when>
					<xsl:when test="$label='diameter'">Durchmesser</xsl:when>
					<xsl:when test="$label='discovery'">Entdeckung</xsl:when>
					<xsl:when test="$label='disposition'">Disposition</xsl:when>
					<xsl:when test="$label='dynasty'">Dynastie</xsl:when>
					<xsl:when test="$label='edge'">Rand</xsl:when>
					<xsl:when test="$label='era'">Epoche</xsl:when>
					<xsl:when test="$label='finder'">Finder</xsl:when>
					<xsl:when test="$label='findspot'">Fundstelle</xsl:when>
					<xsl:when test="$label='fromDate'">Datum von</xsl:when>
					<xsl:when test="$label='geographic'">geographisch</xsl:when>
					<xsl:when test="$label='grade'">Grad</xsl:when>
					<xsl:when test="$label='height'">Höhe</xsl:when>
					<xsl:when test="$label='hoardDesc'">Schatzfundbeschreibung</xsl:when>
					<xsl:when test="$label='identifieri'">Bestimmt von</xsl:when>
					<xsl:when test="$label='issuer'">Herausgeber</xsl:when>
					<xsl:when test="$label='landowner'">Grundstückseigentümer</xsl:when>
					<xsl:when test="$label='legend'">Legende</xsl:when>
					<xsl:when test="$label='manufacture'">Herstellung</xsl:when>
					<xsl:when test="$label='material'">Material</xsl:when>
					<xsl:when test="$label='measurementsSet'">Maße</xsl:when>
					<xsl:when test="$label='mint'">Münzstätte</xsl:when>
					<xsl:when test="$label='note'">Anmerkung</xsl:when>
					<xsl:when test="$label='noteSet'">Anmerkungen</xsl:when>
					<xsl:when test="$label='objectType'">Objekttyp</xsl:when>
					<xsl:when test="$label='obverse'">Vorderseite</xsl:when>
					<xsl:when test="$label='obv_leg'">Vorderseitenlegende</xsl:when>
					<xsl:when test="$label='obv_type'">Vorderseitentyp</xsl:when>
					<xsl:when test="$label='owner'">Eigentümer</xsl:when>
					<xsl:when test="$label='physDesc'">Physische Beschreibung</xsl:when>
					<xsl:when test="$label='portrait'">Porträt</xsl:when>
					<xsl:when test="$label='previousColl'">Vormalige sammlung</xsl:when>
					<xsl:when test="$label='private'">Privat</xsl:when>
					<xsl:when test="$label='provenance'">Herkunft</xsl:when>
					<xsl:when test="$label='public'">öffentlich</xsl:when>
					<xsl:when test="$label='publisher'">Verlag</xsl:when>
					<xsl:when test="$label='reference'">Zitat</xsl:when>
					<xsl:when test="$label='refDesc'">Zitate</xsl:when>
					<xsl:when test="$label='region'">Region</xsl:when>
					<xsl:when test="$label='repository'">Depot</xsl:when>
					<xsl:when test="$label='reverse'">Rückseite</xsl:when>
					<xsl:when test="$label='rev_leg'">Rückseitenlegende</xsl:when>
					<xsl:when test="$label='rev_type'">Rückseitentyp</xsl:when>
					<xsl:when test="$label='saleCatalog'">Auktionskatalog</xsl:when>
					<xsl:when test="$label='saleItem'">Auktionslot</xsl:when>
					<xsl:when test="$label='salePrice'">Verkaufspreis</xsl:when>
					<xsl:when test="$label='shape'">Form</xsl:when>
					<xsl:when test="$label='state'">Zustand</xsl:when>
					<xsl:when test="$label='subject'">Subjekt</xsl:when>
					<xsl:when test="$label='subjectSet'">Subjekte</xsl:when>
					<xsl:when test="$label='symbol'">Symbol</xsl:when>
					<xsl:when test="$label='testmark'">Prüfmarke</xsl:when>
					<xsl:when test="$label='timestamp'">Moodifizierungsdatum</xsl:when>
					<xsl:when test="$label='title'">Titel</xsl:when>
					<xsl:when test="$label='toDate'">Datum bis</xsl:when>
					<xsl:when test="$label='type'">Typ</xsl:when>
					<xsl:when test="$label='typeDesc'">typologische Beschreibung</xsl:when>
					<xsl:when test="$label='thickness'">Dicke</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Untertyp Beschreibung</xsl:when>
					<xsl:when test="$label='wear'">Abnutzung</xsl:when>
					<xsl:when test="$label='weight'">Gewicht</xsl:when>
					<xsl:when test="$label='width'">Breite</xsl:when>
					<xsl:when test="$label='year'">Jahr</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='el'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">???????????</xsl:when>
					<xsl:when test="$label='acquisition'">?????????</xsl:when>
					<xsl:when test="$label='acquiredFrom'">????????? ???</xsl:when>
					<xsl:when test="$label='adminDesc'">??????? ???????????</xsl:when>
					<xsl:when test="$label='appraisal'">??????????</xsl:when>
					<xsl:when test="$label='appraiser'">???????????</xsl:when>
					<xsl:when test="$label='auction'">??????????</xsl:when>
					<xsl:when test="$label='authority'">???????? ????</xsl:when>
					<xsl:when test="$label='axis'">??????</xsl:when>
					<xsl:when test="$label='century'">??????</xsl:when>
					<xsl:when test="$label='chronList'">???????????? ?????????</xsl:when>
					<xsl:when test="$label='chronItem'">??????????? ????????</xsl:when>
					<xsl:when test="$label='coinType'">???????????? ?????</xsl:when>
					<xsl:when test="$label='collection'">???????</xsl:when>
					<xsl:when test="$label='color'">?????</xsl:when>
					<xsl:when test="$label='completeness'">?????????</xsl:when>
					<xsl:when test="$label='condition'">?????????</xsl:when>
					<xsl:when test="$label='conservationState'">????????? ??????????</xsl:when>
					<xsl:when test="$label='contents'">???????????</xsl:when>
					<xsl:when test="$label='coordinates'">?????????????</xsl:when>
					<xsl:when test="$label='countermark'">??????????</xsl:when>
					<xsl:when test="$label='date'">???????????</xsl:when>
					<xsl:when test="$label='dateOnObject'">?????????? ??? ??? ????????????</xsl:when>
					<xsl:when test="$label='dob'">?????????? ??? ??? ????????????</xsl:when>
					<xsl:when test="$label='dateRange'">??????? ????????</xsl:when>
					<xsl:when test="$label='decade'">????????</xsl:when>
					<xsl:when test="$label='degree'">??????</xsl:when>
					<xsl:when test="$label='deity'">???????</xsl:when>
					<xsl:when test="$label='denomination'">??????????? ????</xsl:when>
					<xsl:when test="$label='department'">?????</xsl:when>
					<xsl:when test="$label='deposit'">????????</xsl:when>
					<xsl:when test="$label='description'">?????????</xsl:when>
					<xsl:when test="$label='diameter'">?????????</xsl:when>
					<xsl:when test="$label='discovery'">????????</xsl:when>
					<xsl:when test="$label='disposition'">???????</xsl:when>
					<xsl:when test="$label='dynasty'">?????????</xsl:when>
					<xsl:when test="$label='edge'">??????????</xsl:when>
					<xsl:when test="$label='era'">?????</xsl:when>
					<xsl:when test="$label='finder'">???????</xsl:when>
					<xsl:when test="$label='findspot'">?????? ???????</xsl:when>
					<xsl:when test="$label='fromDate'">???? ??? ?? ????</xsl:when>
					<xsl:when test="$label='geographic'">??????????</xsl:when>
					<xsl:when test="$label='grade'">??????????</xsl:when>
					<xsl:when test="$label='height'">????</xsl:when>
					<xsl:when test="$label='hoardDesc'">????????? «????????»</xsl:when>
					<xsl:when test="$label='identifieri'">????????? ????????</xsl:when>
					<xsl:when test="$label='issuer'">????????? ???????</xsl:when>
					<xsl:when test="$label='landowner'">?????????? ????? ?????????</xsl:when>
					<xsl:when test="$label='legend'">????????</xsl:when>
					<xsl:when test="$label='manufacture'">?????? ??????????</xsl:when>
					<xsl:when test="$label='material'">?????</xsl:when>
					<xsl:when test="$label='measurementsSet'">??????????</xsl:when>
					<xsl:when test="$label='mint'">???????????????</xsl:when>
					<xsl:when test="$label='note'">????????</xsl:when>
					<xsl:when test="$label='noteSet'">??????????</xsl:when>
					<xsl:when test="$label='objectType'">????? ????????????</xsl:when>
					<xsl:when test="$label='obverse'">?????????????</xsl:when>
					<xsl:when test="$label='obv_leg'">???????? ?????????????</xsl:when>
					<xsl:when test="$label='obv_type'">????????? ?????????????</xsl:when>
					<xsl:when test="$label='owner'">??????????</xsl:when>
					<xsl:when test="$label='physDesc'">?????? ?????????</xsl:when>
					<xsl:when test="$label='portrait'">?????????</xsl:when>
					<xsl:when test="$label='previousColl'">??????????? ???????</xsl:when>
					<xsl:when test="$label='private'">????????</xsl:when>
					<xsl:when test="$label='provenance'">?????????</xsl:when>
					<xsl:when test="$label='public'">???????</xsl:when>
					<xsl:when test="$label='publisher'">???????</xsl:when>
					<xsl:when test="$label='reference'">?????????</xsl:when>
					<xsl:when test="$label='refDesc'">??????????</xsl:when>
					<xsl:when test="$label='region'">???????</xsl:when>
					<xsl:when test="$label='repository'">????? ???????</xsl:when>
					<xsl:when test="$label='reverse'">???????????</xsl:when>
					<xsl:when test="$label='rev_leg'">???????? ???????????</xsl:when>
					<xsl:when test="$label='rev_type'">????????? ???????????</xsl:when>
					<xsl:when test="$label='saleCatalog'">????????? ???????????</xsl:when>
					<xsl:when test="$label='saleItem'">??????? ?????? ???????????</xsl:when>
					<xsl:when test="$label='salePrice'">???? ????????????</xsl:when>
					<xsl:when test="$label='shape'">?????</xsl:when>
					<xsl:when test="$label='state'">?????????</xsl:when>
					<xsl:when test="$label='subject'">????</xsl:when>
					<xsl:when test="$label='subjectSet'">??????</xsl:when>
					<xsl:when test="$label='symbol'">???????</xsl:when>
					<xsl:when test="$label='testmark'">??????????? ??????</xsl:when>
					<xsl:when test="$label='timestamp'">?????????? ???????????? ????????</xsl:when>
					<xsl:when test="$label='title'">??????</xsl:when>
					<xsl:when test="$label='toDate'">????? ?? ????</xsl:when>
					<xsl:when test="$label='type'">?????</xsl:when>
					<xsl:when test="$label='typeDesc'">?????????? ?????????</xsl:when>
					<xsl:when test="$label='thickness'">?????</xsl:when>
					<xsl:when test="$label='undertypeDesc'">????????? ??????????? ?????</xsl:when>
					<xsl:when test="$label='wear'">?????? ??????</xsl:when>
					<xsl:when test="$label='weight'">?????</xsl:when>
					<xsl:when test="$label='width'">??????</xsl:when>
					<xsl:when test="$label='year'">????</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='es'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Agradecimiento</xsl:when>
					<xsl:when test="$label='acquisition'">Adquisición</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Adquirido a</xsl:when>
					<xsl:when test="$label='adminDesc'">Historia administrativa</xsl:when>
					<xsl:when test="$label='appraisal'">Estimación</xsl:when>
					<xsl:when test="$label='appraiser'">Perito</xsl:when>
					<xsl:when test="$label='auction'">Subasta</xsl:when>
					<xsl:when test="$label='authority'">Autoridad emisora</xsl:when>
					<xsl:when test="$label='axis'">Posición de cuño</xsl:when>
					<xsl:when test="$label='century'">Siglo</xsl:when>
					<xsl:when test="$label='chronList'">Lista cronológica</xsl:when>
					<xsl:when test="$label='chronItem'">Cronología del objeto</xsl:when>
					<xsl:when test="$label='coinType'">Tipo monetal</xsl:when>
					<xsl:when test="$label='collection'">Colección</xsl:when>
					<xsl:when test="$label='color'">Color</xsl:when>
					<xsl:when test="$label='completeness'">Integridad</xsl:when>
					<xsl:when test="$label='condition'">Condición</xsl:when>
					<xsl:when test="$label='conservationState'">Estado de conservación</xsl:when>
					<xsl:when test="$label='contents'">Sumario</xsl:when>
					<xsl:when test="$label='coordinates'">Coordenada</xsl:when>
					<xsl:when test="$label='countermark'">Contramarca</xsl:when>
					<xsl:when test="$label='date'">Fecha</xsl:when>
					<xsl:when test="$label='dateOnObject'">Fecha del objeto</xsl:when>
					<xsl:when test="$label='dob'">Fecha del objeto</xsl:when>
					<xsl:when test="$label='dateRange'">Período cronológico</xsl:when>
					<xsl:when test="$label='decade'">Década</xsl:when>
					<xsl:when test="$label='degree'">Grado</xsl:when>
					<xsl:when test="$label='deity'">Divinidad</xsl:when>
					<xsl:when test="$label='denomination'">Denominación</xsl:when>
					<xsl:when test="$label='department'">Departamento</xsl:when>
					<xsl:when test="$label='deposit'">Depósito</xsl:when>
					<xsl:when test="$label='description'">Descripción</xsl:when>
					<xsl:when test="$label='diameter'">Diámetro</xsl:when>
					<xsl:when test="$label='discovery'">Descubierto</xsl:when>
					<xsl:when test="$label='disposition'">Disposición</xsl:when>
					<xsl:when test="$label='dynasty'">Dinastía</xsl:when>
					<xsl:when test="$label='edge'">Borde</xsl:when>
					<xsl:when test="$label='era'">Era</xsl:when>
					<xsl:when test="$label='finder'">Descubridor</xsl:when>
					<xsl:when test="$label='findspot'">Hallazgo</xsl:when>
					<xsl:when test="$label='fromDate'">A partir del año</xsl:when>
					<xsl:when test="$label='geographic'">Geográfico</xsl:when>
					<xsl:when test="$label='grade'">Grado</xsl:when>
					<xsl:when test="$label='height'">Altura</xsl:when>
					<xsl:when test="$label='hoardDesc'">Descripción del tesoro</xsl:when>
					<xsl:when test="$label='identifieri'">Clasificador</xsl:when>
					<xsl:when test="$label='issuer'">Emisor</xsl:when>
					<xsl:when test="$label='landowner'">Propietario del terreno</xsl:when>
					<xsl:when test="$label='legend'">Leyenda</xsl:when>
					<xsl:when test="$label='manufacture'">Manufactura</xsl:when>
					<xsl:when test="$label='material'">Material</xsl:when>
					<xsl:when test="$label='measurementsSet'">Dimensiones</xsl:when>
					<xsl:when test="$label='mint'">Ceca</xsl:when>
					<xsl:when test="$label='note'">Nota</xsl:when>
					<xsl:when test="$label='noteSet'">Anotación</xsl:when>
					<xsl:when test="$label='objectType'">Tipo de objeto</xsl:when>
					<xsl:when test="$label='obverse'">Anverso</xsl:when>
					<xsl:when test="$label='obv_leg'">Leyenda de anverso</xsl:when>
					<xsl:when test="$label='obv_type'">Tipo de anverso</xsl:when>
					<xsl:when test="$label='owner'">Propietario</xsl:when>
					<xsl:when test="$label='physDesc'">Descripción física</xsl:when>
					<xsl:when test="$label='portrait'">Retrato</xsl:when>
					<xsl:when test="$label='previousColl'">Colección anterior</xsl:when>
					<xsl:when test="$label='private'">Privada</xsl:when>
					<xsl:when test="$label='provenance'">Procedencia</xsl:when>
					<xsl:when test="$label='public'">Público</xsl:when>
					<xsl:when test="$label='publisher'">Editor</xsl:when>
					<xsl:when test="$label='reference'">Referencia</xsl:when>
					<xsl:when test="$label='refDesc'">Referencia descriptiva</xsl:when>
					<xsl:when test="$label='region'">Región</xsl:when>
					<xsl:when test="$label='repository'">Repositorio</xsl:when>
					<xsl:when test="$label='reverse'">Reverso</xsl:when>
					<xsl:when test="$label='rev_leg'">Leyenda de reverso</xsl:when>
					<xsl:when test="$label='rev_type'">Tipo de reverso</xsl:when>
					<xsl:when test="$label='saleCatalog'">Catálogo de subasta</xsl:when>
					<xsl:when test="$label='saleItem'">Número de lote</xsl:when>
					<xsl:when test="$label='salePrice'">Precio de venta</xsl:when>
					<xsl:when test="$label='shape'">Forma</xsl:when>
					<xsl:when test="$label='state'">Estado</xsl:when>
					<xsl:when test="$label='subject'">Sujeto</xsl:when>
					<xsl:when test="$label='subjectSet'">Sujetos</xsl:when>
					<xsl:when test="$label='symbol'">Símbolo</xsl:when>
					<xsl:when test="$label='testmark'">Marca de comprobación</xsl:when>
					<xsl:when test="$label='timestamp'">Fecha de publicación</xsl:when>
					<xsl:when test="$label='title'">Título</xsl:when>
					<xsl:when test="$label='toDate'">Hasta el año</xsl:when>
					<xsl:when test="$label='type'">Tipo</xsl:when>
					<xsl:when test="$label='typeDesc'">Descripción del tipo</xsl:when>
					<xsl:when test="$label='thickness'">Grosor</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Descripción del soporte</xsl:when>
					<xsl:when test="$label='wear'">Desgaste</xsl:when>
					<xsl:when test="$label='weight'">Peso</xsl:when>
					<xsl:when test="$label='width'">Ancho</xsl:when>
					<xsl:when test="$label='year'">Año</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='fr'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Remerciement</xsl:when>
					<xsl:when test="$label='acquisition'">Acquisition</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Acquis de </xsl:when>
					<xsl:when test="$label='adminDesc'">Historique administratif</xsl:when>
					<xsl:when test="$label='appraisal'">Valorisation</xsl:when>
					<xsl:when test="$label='appraiser'">Evaluateur</xsl:when>
					<xsl:when test="$label='auction'">Enchère</xsl:when>
					<xsl:when test="$label='authority'">Autorité émettrice</xsl:when>
					<xsl:when test="$label='axis'">Axe</xsl:when>
					<xsl:when test="$label='century'">Siècle</xsl:when>
					<xsl:when test="$label='chronList'">Liste chronologique</xsl:when>
					<xsl:when test="$label='chronItem'">Objet chronologique</xsl:when>
					<xsl:when test="$label='coinType'">Référence typologique</xsl:when>
					<xsl:when test="$label='collection'">Collection</xsl:when>
					<xsl:when test="$label='color'">Couleur</xsl:when>
					<xsl:when test="$label='completeness'">Intégrité</xsl:when>
					<xsl:when test="$label='condition'">Condition</xsl:when>
					<xsl:when test="$label='conservationState'">Etat de conservation</xsl:when>
					<xsl:when test="$label='contents'">Contenu</xsl:when>
					<xsl:when test="$label='coordinates'">Coordonnées</xsl:when>
					<xsl:when test="$label='countermark'">Contremarque</xsl:when>
					<xsl:when test="$label='date'">Date</xsl:when>
					<xsl:when test="$label='dateOnObject'">Date sur l'objet</xsl:when>
					<xsl:when test="$label='dob'">Date sur l'objet</xsl:when>
					<xsl:when test="$label='dateRange'">Intervalle chronologique</xsl:when>
					<xsl:when test="$label='decade'">Décennie</xsl:when>
					<xsl:when test="$label='degree'">Degré</xsl:when>
					<xsl:when test="$label='deity'">Divinité</xsl:when>
					<xsl:when test="$label='denomination'">Dénomination</xsl:when>
					<xsl:when test="$label='department'">Département</xsl:when>
					<xsl:when test="$label='deposit'">Dépôt</xsl:when>
					<xsl:when test="$label='description'">Description</xsl:when>
					<xsl:when test="$label='diameter'">Diamètre</xsl:when>
					<xsl:when test="$label='discovery'">Découverte</xsl:when>
					<xsl:when test="$label='disposition'">Disposition</xsl:when>
					<xsl:when test="$label='dynasty'">Dynastie</xsl:when>
					<xsl:when test="$label='edge'">Bordure</xsl:when>
					<xsl:when test="$label='era'">Ere</xsl:when>
					<xsl:when test="$label='finder'">Inventeur</xsl:when>
					<xsl:when test="$label='findspot'">Lieu de découverte</xsl:when>
					<xsl:when test="$label='fromDate'">A partir de l'année</xsl:when>
					<xsl:when test="$label='geographic'">Géographique</xsl:when>
					<xsl:when test="$label='grade'">Grade</xsl:when>
					<xsl:when test="$label='height'">Hauteur</xsl:when>
					<xsl:when test="$label='hoardDesc'">Description du trésor</xsl:when>
					<xsl:when test="$label='identifieri'">Identifiant</xsl:when>
					<xsl:when test="$label='issuer'">Emetteur</xsl:when>
					<xsl:when test="$label='landowner'">Propriétaire du sol</xsl:when>
					<xsl:when test="$label='legend'">Légende</xsl:when>
					<xsl:when test="$label='manufacture'">Technique d'émission</xsl:when>
					<xsl:when test="$label='material'">Matériau</xsl:when>
					<xsl:when test="$label='measurementsSet'">Dimensions</xsl:when>
					<xsl:when test="$label='mint'">Atelier</xsl:when>
					<xsl:when test="$label='note'">Note</xsl:when>
					<xsl:when test="$label='noteSet'">Notes</xsl:when>
					<xsl:when test="$label='objectType'">Type d'objet</xsl:when>
					<xsl:when test="$label='obverse'">Avers/Droit</xsl:when>
					<xsl:when test="$label='obv_leg'">Légende d'avers/de droit</xsl:when>
					<xsl:when test="$label='obv_type'">Type d'avers</xsl:when>
					<xsl:when test="$label='owner'">Propriétaire</xsl:when>
					<xsl:when test="$label='physDesc'">Description physique</xsl:when>
					<xsl:when test="$label='portrait'">Portrait</xsl:when>
					<xsl:when test="$label='previousColl'">Collection antérieure</xsl:when>
					<xsl:when test="$label='private'">Privé</xsl:when>
					<xsl:when test="$label='provenance'">Provenance</xsl:when>
					<xsl:when test="$label='public'">Publique</xsl:when>
					<xsl:when test="$label='publisher'">Maison d'édition</xsl:when>
					<xsl:when test="$label='reference'">Référence</xsl:when>
					<xsl:when test="$label='refDesc'">Références</xsl:when>
					<xsl:when test="$label='region'">Région</xsl:when>
					<xsl:when test="$label='repository'">Dépositaire</xsl:when>
					<xsl:when test="$label='reverse'">Revers</xsl:when>
					<xsl:when test="$label='rev_leg'">Légende de revers</xsl:when>
					<xsl:when test="$label='rev_type'">Type de revers</xsl:when>
					<xsl:when test="$label='saleCatalog'">Catalogue de vente</xsl:when>
					<xsl:when test="$label='saleItem'">Numéro de lot</xsl:when>
					<xsl:when test="$label='salePrice'">Prix de vente</xsl:when>
					<xsl:when test="$label='shape'">Forme</xsl:when>
					<xsl:when test="$label='state'">Etat</xsl:when>
					<xsl:when test="$label='subject'">Sujet</xsl:when>
					<xsl:when test="$label='subjectSet'">Sujets</xsl:when>
					<xsl:when test="$label='symbol'">Symbole</xsl:when>
					<xsl:when test="$label='testmark'">Marque de test</xsl:when>
					<xsl:when test="$label='timestamp'">Date de l'entrée dans catalogue</xsl:when>
					<xsl:when test="$label='title'">Titre</xsl:when>
					<xsl:when test="$label='toDate'">Jusqu'à l'année</xsl:when>
					<xsl:when test="$label='type'">Type</xsl:when>
					<xsl:when test="$label='typeDesc'">Description typologique</xsl:when>
					<xsl:when test="$label='thickness'">Epaisseur</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Description du sous-type</xsl:when>
					<xsl:when test="$label='wear'">Usure</xsl:when>
					<xsl:when test="$label='weight'">Poids</xsl:when>
					<xsl:when test="$label='width'">Largeur</xsl:when>
					<xsl:when test="$label='year'">Année</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='it'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Riconoscimento</xsl:when>
					<xsl:when test="$label='acquisition'">Acquisizione</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Acqusito da</xsl:when>
					<xsl:when test="$label='adminDesc'">Storia amministrativa</xsl:when>
					<xsl:when test="$label='appraisal'">Stima</xsl:when>
					<xsl:when test="$label='appraiser'">Perito</xsl:when>
					<xsl:when test="$label='auction'">Asta</xsl:when>
					<xsl:when test="$label='authority'">Autorità emittente</xsl:when>
					<xsl:when test="$label='axis'">Asse</xsl:when>
					<xsl:when test="$label='century'">Secolo</xsl:when>
					<xsl:when test="$label='chronList'">Elenco cronologico</xsl:when>
					<xsl:when test="$label='chronItem'">Voce cronologica</xsl:when>
					<xsl:when test="$label='coinType'">Tipo monetale</xsl:when>
					<xsl:when test="$label='collection'">Collezione</xsl:when>
					<xsl:when test="$label='color'">Colore</xsl:when>
					<xsl:when test="$label='completeness'">Integrità</xsl:when>
					<xsl:when test="$label='condition'">Conservazione</xsl:when>
					<xsl:when test="$label='conservationState'">Stato di conservazione</xsl:when>
					<xsl:when test="$label='contents'">Sommario</xsl:when>
					<xsl:when test="$label='coordinates'">Coordinate</xsl:when>
					<xsl:when test="$label='countermark'">Contromarca</xsl:when>
					<xsl:when test="$label='date'">Data</xsl:when>
					<xsl:when test="$label='dateOnObject'">Datazione dell'oggetto</xsl:when>
					<xsl:when test="$label='dob'">Datazione dell'oggetto</xsl:when>
					<xsl:when test="$label='dateRange'">Arco cronologico</xsl:when>
					<xsl:when test="$label='decade'">Decennio</xsl:when>
					<xsl:when test="$label='degree'">Grado</xsl:when>
					<xsl:when test="$label='deity'">Divinità</xsl:when>
					<xsl:when test="$label='denomination'">Nominale</xsl:when>
					<xsl:when test="$label='department'">Dipartimento</xsl:when>
					<xsl:when test="$label='deposit'">Deposito</xsl:when>
					<xsl:when test="$label='description'">Descrizione</xsl:when>
					<xsl:when test="$label='diameter'">Diametro</xsl:when>
					<xsl:when test="$label='discovery'">Scoperta</xsl:when>
					<xsl:when test="$label='disposition'">Deposizione</xsl:when>
					<xsl:when test="$label='dynasty'">Dinastia</xsl:when>
					<xsl:when test="$label='edge'">Bordo</xsl:when>
					<xsl:when test="$label='era'">Periodo</xsl:when>
					<xsl:when test="$label='finder'">Scopritore</xsl:when>
					<xsl:when test="$label='findspot'">Luogo di rinvenimento</xsl:when>
					<xsl:when test="$label='fromDate'">A partire dall'anno</xsl:when>
					<xsl:when test="$label='geographic'">Geografico</xsl:when>
					<xsl:when test="$label='grade'">Grado</xsl:when>
					<xsl:when test="$label='height'">Altezza</xsl:when>
					<xsl:when test="$label='hoardDesc'">Descrizione del ripostiglio</xsl:when>
					<xsl:when test="$label='identifieri'">Numero identificativo</xsl:when>
					<xsl:when test="$label='issuer'">Emittente</xsl:when>
					<xsl:when test="$label='landowner'">Proprietario del terreno</xsl:when>
					<xsl:when test="$label='legend'">Legenda</xsl:when>
					<xsl:when test="$label='manufacture'">Tecnica di produzione</xsl:when>
					<xsl:when test="$label='material'">Materiale</xsl:when>
					<xsl:when test="$label='measurementsSet'">Dimensioni</xsl:when>
					<xsl:when test="$label='mint'">Zecca</xsl:when>
					<xsl:when test="$label='note'">Nota</xsl:when>
					<xsl:when test="$label='noteSet'">Annotazioni</xsl:when>
					<xsl:when test="$label='objectType'">Tipo d'oggetto</xsl:when>
					<xsl:when test="$label='obverse'">Dritto</xsl:when>
					<xsl:when test="$label='obv_leg'">Legenda del dritto</xsl:when>
					<xsl:when test="$label='obv_type'">Tipo del dritto</xsl:when>
					<xsl:when test="$label='owner'">Proprietario</xsl:when>
					<xsl:when test="$label='physDesc'">Descrizione fisica</xsl:when>
					<xsl:when test="$label='portrait'">Ritratto</xsl:when>
					<xsl:when test="$label='previousColl'">Collezione precedente</xsl:when>
					<xsl:when test="$label='private'">Privato</xsl:when>
					<xsl:when test="$label='provenance'">Provenienza</xsl:when>
					<xsl:when test="$label='public'">Pubblico</xsl:when>
					<xsl:when test="$label='publisher'">Editore</xsl:when>
					<xsl:when test="$label='reference'">Riferimento</xsl:when>
					<xsl:when test="$label='refDesc'">Riferimenti</xsl:when>
					<xsl:when test="$label='region'">Regione</xsl:when>
					<xsl:when test="$label='repository'">Deposito</xsl:when>
					<xsl:when test="$label='reverse'">Rovescio</xsl:when>
					<xsl:when test="$label='rev_leg'">Legenda del rovescio</xsl:when>
					<xsl:when test="$label='rev_type'">Tipo del rovescio</xsl:when>
					<xsl:when test="$label='saleCatalog'">Catalogo d'asta</xsl:when>
					<xsl:when test="$label='saleItem'">Numero del lotto</xsl:when>
					<xsl:when test="$label='salePrice'">Prezzo d'asta</xsl:when>
					<xsl:when test="$label='shape'">Forma</xsl:when>
					<xsl:when test="$label='state'">Stato</xsl:when>
					<xsl:when test="$label='subject'">Soggetto</xsl:when>
					<xsl:when test="$label='subjectSet'">Soggetti</xsl:when>
					<xsl:when test="$label='symbol'">Simbolo</xsl:when>
					<xsl:when test="$label='testmark'">Punzonatura</xsl:when>
					<xsl:when test="$label='timestamp'">Data di modifica dell'inserimento nel catalogo</xsl:when>
					<xsl:when test="$label='title'">Titolo</xsl:when>
					<xsl:when test="$label='toDate'">Fino all'anno</xsl:when>
					<xsl:when test="$label='type'">Tipo</xsl:when>
					<xsl:when test="$label='typeDesc'">Descrizione del tipo</xsl:when>
					<xsl:when test="$label='thickness'">Spessore</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Descrizione del sottotipo</xsl:when>
					<xsl:when test="$label='wear'">Usura</xsl:when>
					<xsl:when test="$label='weight'">Peso</xsl:when>
					<xsl:when test="$label='width'">Larghezza</xsl:when>
					<xsl:when test="$label='year'">Anno</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='nl'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Dankbetuiging</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Verworven van</xsl:when>
					<xsl:when test="$label='adminDesc'">Administratieve geschiedenis</xsl:when>
					<xsl:when test="$label='appraisal'">Taxatie</xsl:when>
					<xsl:when test="$label='appraiser'">Taxateur</xsl:when>
					<xsl:when test="$label='auction'">Veiling</xsl:when>
					<xsl:when test="$label='authority'">Autoriteit</xsl:when>
					<xsl:when test="$label='axis'">Stempelstand</xsl:when>
					<xsl:when test="$label='century'">Eeuw</xsl:when>
					<xsl:when test="$label='coinType'">Munttype</xsl:when>
					<xsl:when test="$label='collection'">Collectie</xsl:when>
					<xsl:when test="$label='color'">Kleur</xsl:when>
					<xsl:when test="$label='completeness'">Compleetheid</xsl:when>
					<xsl:when test="$label='condition'">Conditie</xsl:when>
					<xsl:when test="$label='conservationState'">Staat van conservering</xsl:when>
					<xsl:when test="$label='contents'">Inhoud</xsl:when>
					<xsl:when test="$label='coordinates'">Coördinaten</xsl:when>
					<xsl:when test="$label='countermark'">Instempeling</xsl:when>
					<xsl:when test="$label='date'">Datum</xsl:when>
					<xsl:when test="$label='dateOnObject'">Datum op voorwerp</xsl:when>
					<xsl:when test="$label='dob'">Datum op voorwerp</xsl:when>
					<xsl:when test="$label='dateRange'">Dateringsperiode</xsl:when>
					<xsl:when test="$label='decade'">Decennium</xsl:when>
					<xsl:when test="$label='degree'">Graad</xsl:when>
					<xsl:when test="$label='deity'">Godheid</xsl:when>
					<xsl:when test="$label='denomination'">Denominatie</xsl:when>
					<xsl:when test="$label='department'">Afdeling</xsl:when>
					<xsl:when test="$label='deposit'">Depot</xsl:when>
					<xsl:when test="$label='description'">Beschrijving</xsl:when>
					<xsl:when test="$label='diameter'">Diameter</xsl:when>
					<xsl:when test="$label='discovery'">Vondst</xsl:when>
					<xsl:when test="$label='disposition'">Verplaatsing</xsl:when>
					<xsl:when test="$label='dynasty'">Dynastie</xsl:when>
					<xsl:when test="$label='edge'">Rand</xsl:when>
					<xsl:when test="$label='era'">Periode</xsl:when>
					<xsl:when test="$label='finder'">Vinder</xsl:when>
					<xsl:when test="$label='findspot'">Vindplaats</xsl:when>
					<xsl:when test="$label='fromDate'">Datum van</xsl:when>
					<xsl:when test="$label='geographic'">Geografisch</xsl:when>
					<xsl:when test="$label='grade'">Kwaliteitsaanduiding</xsl:when>
					<xsl:when test="$label='height'">Hoogte</xsl:when>
					<xsl:when test="$label='hoardDesc'">Schatvondstbeschrijving</xsl:when>
					<xsl:when test="$label='identifier'">Beschrijver</xsl:when>
					<xsl:when test="$label='issuer'">Uitgever</xsl:when>
					<xsl:when test="$label='landowner'">Grondeigenaar</xsl:when>
					<xsl:when test="$label='legend'">Om- of opschrift</xsl:when>
					<xsl:when test="$label='manufacture'">Maakwijze</xsl:when>
					<xsl:when test="$label='material'">Materiaal</xsl:when>
					<xsl:when test="$label='measurementsSet'">Afmetingen</xsl:when>
					<xsl:when test="$label='mint'">Muntplaats</xsl:when>
					<xsl:when test="$label='note'">Opmerking</xsl:when>
					<xsl:when test="$label='noteSet'">Opmerkingen</xsl:when>
					<xsl:when test="$label='objectType'">Objecttype</xsl:when>
					<xsl:when test="$label='obverse'">Voorzijde</xsl:when>
					<xsl:when test="$label='obv_leg'">Tekst voorzijde</xsl:when>
					<xsl:when test="$label='obv_type'">Voorzijdetype</xsl:when>
					<xsl:when test="$label='owner'">Eigenaar</xsl:when>
					<xsl:when test="$label='physDesc'">Fysieke beschrijving</xsl:when>
					<xsl:when test="$label='portrait'">Portret</xsl:when>
					<xsl:when test="$label='previousColl'">Voormalige collectie</xsl:when>
					<xsl:when test="$label='private'">Privé</xsl:when>
					<xsl:when test="$label='provenance'">Herkomst</xsl:when>
					<xsl:when test="$label='public'">Publiek</xsl:when>
					<xsl:when test="$label='publisher'">Uitgever</xsl:when>
					<xsl:when test="$label='reference'">Referentie</xsl:when>
					<xsl:when test="$label='refDesc'">Referenties</xsl:when>
					<xsl:when test="$label='region'">Regio</xsl:when>
					<xsl:when test="$label='repository'">Verblijfplaats</xsl:when>
					<xsl:when test="$label='reverse'">Keerzijde</xsl:when>
					<xsl:when test="$label='rev_leg'">Tekst keerzijde</xsl:when>
					<xsl:when test="$label='rev_type'">keerzijdetype</xsl:when>
					<xsl:when test="$label='saleCatalog'">Veilingcatalogus</xsl:when>
					<xsl:when test="$label='saleItem'">Kavel nummer</xsl:when>
					<xsl:when test="$label='salePrice'">Verkoopprijs</xsl:when>
					<xsl:when test="$label='shape'">Vorm</xsl:when>
					<xsl:when test="$label='state'">Staat</xsl:when>
					<xsl:when test="$label='subject'">Onderwerp</xsl:when>
					<xsl:when test="$label='subjectSet'">Onderwerpen</xsl:when>
					<xsl:when test="$label='symbol'">Symbool</xsl:when>
					<xsl:when test="$label='testmark'">Testmerk</xsl:when>
					<xsl:when test="$label='timestamp'">Wijzigingsdatum record</xsl:when>
					<xsl:when test="$label='title'">Titel</xsl:when>
					<xsl:when test="$label='toDate'">Datum tot</xsl:when>
					<xsl:when test="$label='type'">Type</xsl:when>
					<xsl:when test="$label='typeDesc'">Typologische beschrijving</xsl:when>
					<xsl:when test="$label='thickness'">Dikte</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Subtype beschrijving</xsl:when>
					<xsl:when test="$label='wear'">Slijtage</xsl:when>
					<xsl:when test="$label='weight'">Massa</xsl:when>
					<xsl:when test="$label='width'">Breedte</xsl:when>
					<xsl:when test="$label='year'">Jaar</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='ro'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Mul?umiri</xsl:when>
					<xsl:when test="$label='acquisition'">Achizi?ie</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Achizi?ionat de la</xsl:when>
					<xsl:when test="$label='adminDesc'">Istoric administrativ</xsl:when>
					<xsl:when test="$label='appraisal'">Evaluare</xsl:when>
					<xsl:when test="$label='appraiser'">Evaluator</xsl:when>
					<xsl:when test="$label='auction'">Licita?ie</xsl:when>
					<xsl:when test="$label='authority'">Autoritate emitent?</xsl:when>
					<xsl:when test="$label='axis'">Ax?</xsl:when>
					<xsl:when test="$label='century'">Secol</xsl:when>
					<xsl:when test="$label='chronList'">List? cronologic?</xsl:when>
					<xsl:when test="$label='chronItem'">Termen cronologic</xsl:when>
					<xsl:when test="$label='coinType'">Tip monetar</xsl:when>
					<xsl:when test="$label='collection'">Colec?ie</xsl:when>
					<xsl:when test="$label='color'">Culoare</xsl:when>
					<xsl:when test="$label='completeness'">Integralitate</xsl:when>
					<xsl:when test="$label='condition'">Stare de conservare</xsl:when>
					<xsl:when test="$label='conservationState'">Stare de conservare</xsl:when>
					<xsl:when test="$label='contents'">Con?inut</xsl:when>
					<xsl:when test="$label='coordinates'">Coordonate</xsl:when>
					<xsl:when test="$label='countermark'">Contramarc?</xsl:when>
					<xsl:when test="$label='date'">Datare</xsl:when>
					<xsl:when test="$label='dateOnObject'">Datarea de pe obiect</xsl:when>
					<xsl:when test="$label='dob'">Datarea de pe obiect</xsl:when>
					<xsl:when test="$label='dateRange'">Interval de datare</xsl:when>
					<xsl:when test="$label='decade'">Deceniu</xsl:when>
					<xsl:when test="$label='degree'">Grad</xsl:when>
					<xsl:when test="$label='deity'">Divinitate</xsl:when>
					<xsl:when test="$label='denomination'">Nominal</xsl:when>
					<xsl:when test="$label='department'">Departament</xsl:when>
					<xsl:when test="$label='deposit'">Depozit</xsl:when>
					<xsl:when test="$label='description'">Descriere</xsl:when>
					<xsl:when test="$label='diameter'">Diametru</xsl:when>
					<xsl:when test="$label='discovery'">Descoperire</xsl:when>
					<xsl:when test="$label='disposition'">Dispunere</xsl:when>
					<xsl:when test="$label='dynasty'">Dinastie</xsl:when>
					<xsl:when test="$label='edge'">Margine</xsl:when>
					<xsl:when test="$label='era'">Era</xsl:when>
					<xsl:when test="$label='finder'">Descoperitor</xsl:when>
					<xsl:when test="$label='findspot'">Loc de descoperire</xsl:when>
					<xsl:when test="$label='fromDate'">Datare de la</xsl:when>
					<xsl:when test="$label='geographic'">Geografic</xsl:when>
					<xsl:when test="$label='grade'">Stadiu</xsl:when>
					<xsl:when test="$label='height'">În?l?ime</xsl:when>
					<xsl:when test="$label='hoardDesc'">Descrierea tezaurului</xsl:when>
					<xsl:when test="$label='identifieri'">Identificator</xsl:when>
					<xsl:when test="$label='issuer'">Emitent</xsl:when>
					<xsl:when test="$label='landowner'">Proprietarul locului de descoperire</xsl:when>
					<xsl:when test="$label='legend'">Legenda</xsl:when>
					<xsl:when test="$label='manufacture'">Mod de fabricare</xsl:when>
					<xsl:when test="$label='material'">Material</xsl:when>
					<xsl:when test="$label='measurementsSet'">Dimensiuni</xsl:when>
					<xsl:when test="$label='mint'">Monet?rie</xsl:when>
					<xsl:when test="$label='note'">Observa?ie</xsl:when>
					<xsl:when test="$label='noteSet'">Observa?ii</xsl:when>
					<xsl:when test="$label='objectType'">Tipul obiectului</xsl:when>
					<xsl:when test="$label='obverse'">Avers</xsl:when>
					<xsl:when test="$label='obv_leg'">Legenda aversului</xsl:when>
					<xsl:when test="$label='obv_type'">Tip de avers</xsl:when>
					<xsl:when test="$label='owner'">Proprietar</xsl:when>
					<xsl:when test="$label='physDesc'">Descriere fizic?</xsl:when>
					<xsl:when test="$label='portrait'">Portret</xsl:when>
					<xsl:when test="$label='previousColl'">Colec?ie anterioar?</xsl:when>
					<xsl:when test="$label='private'">Privat</xsl:when>
					<xsl:when test="$label='provenance'">Provenien??</xsl:when>
					<xsl:when test="$label='public'">Public</xsl:when>
					<xsl:when test="$label='reference'">Referin??</xsl:when>
					<xsl:when test="$label='refDesc'">Referin?e</xsl:when>
					<xsl:when test="$label='region'">Regiune</xsl:when>
					<xsl:when test="$label='repository'">Depozitar</xsl:when>
					<xsl:when test="$label='reverse'">Revers</xsl:when>
					<xsl:when test="$label='rev_leg'">Legenda reversului</xsl:when>
					<xsl:when test="$label='rev_type'">Tip de revers</xsl:when>
					<xsl:when test="$label='saleCatalog'">Catalog de vânzare</xsl:when>
					<xsl:when test="$label='saleItem'">Num?rul lotului</xsl:when>
					<xsl:when test="$label='salePrice'">Pre? de vânzare</xsl:when>
					<xsl:when test="$label='shape'">Form?</xsl:when>
					<xsl:when test="$label='state'">Stadiu</xsl:when>
					<xsl:when test="$label='subject'">Subiect</xsl:when>
					<xsl:when test="$label='subjectSet'">Subiecte</xsl:when>
					<xsl:when test="$label='symbol'">Simbol</xsl:when>
					<xsl:when test="$label='testmark'">Marc? de test</xsl:when>
					<xsl:when test="$label='timestamp'">Data modific?rii de intrare în catalog</xsl:when>
					<xsl:when test="$label='title'">Titlu</xsl:when>
					<xsl:when test="$label='toDate'">Pân? în/la (datare)</xsl:when>
					<xsl:when test="$label='type'">Tip</xsl:when>
					<xsl:when test="$label='typeDesc'">Descriere tipologic?</xsl:when>
					<xsl:when test="$label='thickness'">Grosime</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Descrierea subtipului</xsl:when>
					<xsl:when test="$label='wear'">Uzur?</xsl:when>
					<xsl:when test="$label='weight'">Greutate</xsl:when>
					<xsl:when test="$label='width'">L??ime</xsl:when>
					<xsl:when test="$label='year'">An</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='ru'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">?????????????</xsl:when>
					<xsl:when test="$label='acquiredFrom'">???????? ??</xsl:when>
					<xsl:when test="$label='adminDesc'">???????????????? ???????</xsl:when>
					<xsl:when test="$label='appraisal'">??????</xsl:when>
					<xsl:when test="$label='appraiser'">???????</xsl:when>
					<xsl:when test="$label='auction'">???????</xsl:when>
					<xsl:when test="$label='authority'">?????????</xsl:when>
					<xsl:when test="$label='axis'">???</xsl:when>
					<xsl:when test="$label='century'">???</xsl:when>
					<xsl:when test="$label='coinType'">???????? ???</xsl:when>
					<xsl:when test="$label='collection'">????????</xsl:when>
					<xsl:when test="$label='color'">????</xsl:when>
					<xsl:when test="$label='completeness'">???????</xsl:when>
					<xsl:when test="$label='condition'">???????</xsl:when>
					<xsl:when test="$label='conservationState'">?????????</xsl:when>
					<xsl:when test="$label='contents'">??????????</xsl:when>
					<xsl:when test="$label='coordinates'">??????????</xsl:when>
					<xsl:when test="$label='countermark'">???????????</xsl:when>
					<xsl:when test="$label='date'">?????????</xsl:when>
					<xsl:when test="$label='dateOnObject'">????????? ????????</xsl:when>
					<xsl:when test="$label='dob'">????????? ????????</xsl:when>
					<xsl:when test="$label='dateRange'">???????? ???</xsl:when>
					<xsl:when test="$label='decade'">???????????</xsl:when>
					<xsl:when test="$label='degree'">?????</xsl:when>
					<xsl:when test="$label='deity'">????????</xsl:when>
					<xsl:when test="$label='denomination'">???????</xsl:when>
					<xsl:when test="$label='department'">?????????</xsl:when>
					<xsl:when test="$label='deposit'">???????</xsl:when>
					<xsl:when test="$label='description'">????????</xsl:when>
					<xsl:when test="$label='diameter'">???????</xsl:when>
					<xsl:when test="$label='discovery'">????????</xsl:when>
					<xsl:when test="$label='disposition'">??????????</xsl:when>
					<xsl:when test="$label='dynasty'">????????</xsl:when>
					<xsl:when test="$label='edge'">????</xsl:when>
					<xsl:when test="$label='era'">???</xsl:when>
					<xsl:when test="$label='finder'">????????</xsl:when>
					<xsl:when test="$label='findspot'">????? ???????</xsl:when>
					<xsl:when test="$label='fromDate'">????????? ? </xsl:when>
					<xsl:when test="$label='geographic'">??????????????</xsl:when>
					<xsl:when test="$label='grade'">??????</xsl:when>
					<xsl:when test="$label='height'">??????</xsl:when>
					<xsl:when test="$label='hoardDesc'">???????? ?????</xsl:when>
					<xsl:when test="$label='identifier'">?????????????</xsl:when>
					<xsl:when test="$label='issuer'">???????</xsl:when>
					<xsl:when test="$label='landowner'">?????????????</xsl:when>
					<xsl:when test="$label='legend'">???????</xsl:when>
					<xsl:when test="$label='manufacture'">????????????</xsl:when>
					<xsl:when test="$label='material'">????????</xsl:when>
					<xsl:when test="$label='measurementsSet'">?????????</xsl:when>
					<xsl:when test="$label='mint'">???????? ????</xsl:when>
					<xsl:when test="$label='note'">??????????</xsl:when>
					<xsl:when test="$label='noteSet'">??????????</xsl:when>
					<xsl:when test="$label='objectType'">??? ????????</xsl:when>
					<xsl:when test="$label='obverse'">?????</xsl:when>
					<xsl:when test="$label='obv_leg'">??????? ??????</xsl:when>
					<xsl:when test="$label='obv_type'">??? ??????</xsl:when>
					<xsl:when test="$label='owner'">????????</xsl:when>
					<xsl:when test="$label='physDesc'">?????????? ????????</xsl:when>
					<xsl:when test="$label='portrait'">???????</xsl:when>
					<xsl:when test="$label='previousColl'">?????????? ????????</xsl:when>
					<xsl:when test="$label='private'">???????</xsl:when>
					<xsl:when test="$label='provenance'">?????????????</xsl:when>
					<xsl:when test="$label='public'">?????????</xsl:when>
					<xsl:when test="$label='publisher'">????????????</xsl:when>
					<xsl:when test="$label='reference'">??????</xsl:when>
					<xsl:when test="$label='refDesc'">??????</xsl:when>
					<xsl:when test="$label='region'">?????? </xsl:when>
					<xsl:when test="$label='repository'">????? ????????</xsl:when>
					<xsl:when test="$label='reverse'">??????</xsl:when>
					<xsl:when test="$label='rev_leg'">??????? ???????</xsl:when>
					<xsl:when test="$label='rev_type'">??? ???????</xsl:when>
					<xsl:when test="$label='saleCatalog'">?????????? ???????</xsl:when>
					<xsl:when test="$label='saleItem'">?????????? ???</xsl:when>
					<xsl:when test="$label='salePrice'">????????? ????</xsl:when>
					<xsl:when test="$label='shape'">?????</xsl:when>
					<xsl:when test="$label='state'">?????????</xsl:when>
					<xsl:when test="$label='subject'">???????</xsl:when>
					<xsl:when test="$label='subjectSet'">????????</xsl:when>
					<xsl:when test="$label='symbol'">??????</xsl:when>
					<xsl:when test="$label='testmark'">??????????? ?????</xsl:when>
					<xsl:when test="$label='timestamp'">???? ??????????</xsl:when>
					<xsl:when test="$label='title'">?????????</xsl:when>
					<xsl:when test="$label='toDate'">? ????</xsl:when>
					<xsl:when test="$label='type'">???</xsl:when>
					<xsl:when test="$label='typeDesc'">?????????????? ????????</xsl:when>
					<xsl:when test="$label='thickness'">???????</xsl:when>
					<xsl:when test="$label='undertypeDesc'">???????? ???????</xsl:when>
					<xsl:when test="$label='wear'">?????</xsl:when>
					<xsl:when test="$label='weight'">???</xsl:when>
					<xsl:when test="$label='width'">??????</xsl:when>
					<xsl:when test="$label='year'">???</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:regularize_node($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='sv'">
				<xsl:choose>
					<xsl:when test="$label='acknowledgment'">Erkännande</xsl:when>
					<xsl:when test="$label='acquiredFrom'">Förvärvat från</xsl:when>
					<xsl:when test="$label='adminDesc'">Administrativ historia</xsl:when>
					<xsl:when test="$label='appraisal'">Värdering</xsl:when>
					<xsl:when test="$label='appraiser'">Värderare</xsl:when>
					<xsl:when test="$label='auction'">Auktion</xsl:when>
					<xsl:when test="$label='authority'">Autoritet</xsl:when>
					<xsl:when test="$label='axis'">Axel</xsl:when>
					<xsl:when test="$label='century'">Århundrade/tal</xsl:when>
					<xsl:when test="$label='coinType'">Mynttyp</xsl:when>
					<xsl:when test="$label='collection'">Samling</xsl:when>
					<xsl:when test="$label='color'">Färg</xsl:when>
					<xsl:when test="$label='completeness'">Fullständighet</xsl:when>
					<xsl:when test="$label='condition'">Kondition</xsl:when>
					<xsl:when test="$label='conservationState'">Konserveringstillstånd</xsl:when>
					<xsl:when test="$label='contents'">Innehål</xsl:when>
					<xsl:when test="$label='coordinates'">Koordinater</xsl:when>
					<xsl:when test="$label='countermark'">Kontramarkering</xsl:when>
					<xsl:when test="$label='date'">Datum</xsl:when>
					<xsl:when test="$label='dateOnObject'">Datum på objektet</xsl:when>
					<xsl:when test="$label='dob'">Datum på objektet</xsl:when>
					<xsl:when test="$label='dateRange'">Dateringsperiod</xsl:when>
					<xsl:when test="$label='decade'">Decennium</xsl:when>
					<xsl:when test="$label='degree'">Grad</xsl:when>
					<xsl:when test="$label='deity'">Gudomlighet</xsl:when>
					<xsl:when test="$label='denomination'">Valör</xsl:when>
					<xsl:when test="$label='department'">Avdelning</xsl:when>
					<xsl:when test="$label='deposit'">Deposition</xsl:when>
					<xsl:when test="$label='description'">Beskrivning</xsl:when>
					<xsl:when test="$label='diameter'">Diameter</xsl:when>
					<xsl:when test="$label='discovery'">Fynd</xsl:when>
					<xsl:when test="$label='disposition'">Förflyttning</xsl:when>
					<xsl:when test="$label='dynasty'">Dynasti</xsl:when>
					<xsl:when test="$label='edge'">Rand</xsl:when>
					<xsl:when test="$label='era'">Period</xsl:when>
					<xsl:when test="$label='finder'">Upphittare</xsl:when>
					<xsl:when test="$label='findspot'">Fyndplats</xsl:when>
					<xsl:when test="$label='fromDate'">Datum från </xsl:when>
					<xsl:when test="$label='geographic'">Geografisk</xsl:when>
					<xsl:when test="$label='grade'">Kvalitet</xsl:when>
					<xsl:when test="$label='height'">Höjd</xsl:when>
					<xsl:when test="$label='hoardDesc'">Fynd beskrivning</xsl:when>
					<xsl:when test="$label='identifieri'">Beskrivare</xsl:when>
					<xsl:when test="$label='issuer'">Utgivare</xsl:when>
					<xsl:when test="$label='landowner'">Markägare</xsl:when>
					<xsl:when test="$label='legend'">Omskrift</xsl:when>
					<xsl:when test="$label='manufacture'">Tillverkning</xsl:when>
					<xsl:when test="$label='material'">Material</xsl:when>
					<xsl:when test="$label='measurementsSet'">Mått</xsl:when>
					<xsl:when test="$label='mint'">Myntverk</xsl:when>
					<xsl:when test="$label='note'">Anteckning</xsl:when>
					<xsl:when test="$label='noteSet'">Anteckningar</xsl:when>
					<xsl:when test="$label='objectType'">Typ av objekt</xsl:when>
					<xsl:when test="$label='obverse'">Åtsida</xsl:when>
					<xsl:when test="$label='obv_leg'">Text på åtsidan</xsl:when>
					<xsl:when test="$label='obv_type'">Åtsidetyp</xsl:when>
					<xsl:when test="$label='owner'">Ägare</xsl:when>
					<xsl:when test="$label='physDesc'">Fysisk beskrivning</xsl:when>
					<xsl:when test="$label='portrait'">Porträtt</xsl:when>
					<xsl:when test="$label='previousColl'">Tidigare samling</xsl:when>
					<xsl:when test="$label='private'">Privat</xsl:when>
					<xsl:when test="$label='provenance'">Proviniens</xsl:when>
					<xsl:when test="$label='public'">Allmän</xsl:when>
					<xsl:when test="$label='publisher'">Utgivare</xsl:when>
					<xsl:when test="$label='reference'">Referens</xsl:when>
					<xsl:when test="$label='refDesc'">Referenser</xsl:when>
					<xsl:when test="$label='region'">Region</xsl:when>
					<xsl:when test="$label='repository'">Förvar</xsl:when>
					<xsl:when test="$label='reverse'">Frånsida</xsl:when>
					<xsl:when test="$label='rev_leg'">Text på frånsidan</xsl:when>
					<xsl:when test="$label='rev_type'">Frånsidetyp</xsl:when>
					<xsl:when test="$label='saleCatalog'">Försäljningskatalog</xsl:when>
					<xsl:when test="$label='saleItem'">Lot nummer</xsl:when>
					<xsl:when test="$label='salePrice'">Försäljningspris</xsl:when>
					<xsl:when test="$label='shape'">Form</xsl:when>
					<xsl:when test="$label='state'">Tillstånd</xsl:when>
					<xsl:when test="$label='subject'">Ämne</xsl:when>
					<xsl:when test="$label='subjectSet'">Ämnen</xsl:when>
					<xsl:when test="$label='symbol'">symbol</xsl:when>
					<xsl:when test="$label='testmark'">Märkestest</xsl:when>
					<xsl:when test="$label='timestamp'">ändringsdatum av posten</xsl:when>
					<xsl:when test="$label='title'">Titel</xsl:when>
					<xsl:when test="$label='toDate'">Fram till År</xsl:when>
					<xsl:when test="$label='type'">Typ</xsl:when>
					<xsl:when test="$label='typeDesc'">Typologisk beskrivning</xsl:when>
					<xsl:when test="$label='thickness'">Tjocklek</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Beskrivning av undertyp</xsl:when>
					<xsl:when test="$label='wear'">Slitage</xsl:when>
					<xsl:when test="$label='weight'">Vikt</xsl:when>
					<xsl:when test="$label='width'">Bredd</xsl:when>
					<xsl:when test="$label='year'">År</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$label='acquiredFrom'">Acquired From</xsl:when>
					<xsl:when test="$label='adminDesc'">Administrative History</xsl:when>
					<xsl:when test="$label='chronItem'">Chronological Item</xsl:when>
					<xsl:when test="$label='chronList'">Chronological List</xsl:when>
					<xsl:when test="$label='coinType'">Coin Type</xsl:when>
					<xsl:when test="$label='closing_date'">Closing Date</xsl:when>
					<xsl:when test="$label='conservationState'">Conservation State</xsl:when>
					<xsl:when test="$label='provenance'">Provenance</xsl:when>
					<xsl:when test="$label='dateOnObject'">Date on Object</xsl:when>
					<xsl:when test="$label='dob'">Date on Object</xsl:when>
					<xsl:when test="$label='dateRange'">Date Range</xsl:when>
					<xsl:when test="$label='findspotDesc'">Findspot Description</xsl:when>
					<xsl:when test="$label='fulltext'">Keyword</xsl:when>
					<xsl:when test="$label='hoardDesc'">Hoard Description</xsl:when>
					<xsl:when test="$label='fromDate'">From Date</xsl:when>
					<xsl:when test="$label='toDate'">To Date</xsl:when>
					<xsl:when test="$label='measurementsSet'">Measurements</xsl:when>
					<xsl:when test="$label='noteSet'">Notes</xsl:when>
					<xsl:when test="$label='objectType'">Object Type</xsl:when>
					<xsl:when test="$label='obv_leg'">Obverse Legend</xsl:when>
					<xsl:when test="$label='obv_type'">Obverse Type</xsl:when>
					<xsl:when test="$label='physDesc'">Physical Description</xsl:when>
					<xsl:when test="$label='previousColl'">Previous Collection</xsl:when>
					<xsl:when test="$label='refDesc'">References</xsl:when>
					<xsl:when test="$label='rev_leg'">Reverse Legend</xsl:when>
					<xsl:when test="$label='rev_type'">Reverse Type</xsl:when>
					<xsl:when test="$label='saleCatalog'">Sale Catalog</xsl:when>
					<xsl:when test="$label='saleItem'">Sale Item</xsl:when>
					<xsl:when test="$label='salePrice'">Sale Price</xsl:when>
					<xsl:when test="$label='subjectSet'">SubjectSet</xsl:when>
					<xsl:when test="$label='tpq'">Opening Date</xsl:when>
					<xsl:when test="$label='taq'">Closing Date</xsl:when>
					<xsl:when test="$label='testmark'">Test Mark</xsl:when>
					<xsl:when test="$label='typeDesc'">Typological Description</xsl:when>
					<xsl:when test="$label = 'timestamp'">Date Record Modified</xsl:when>
					<xsl:when test="$label='undertypeDesc'">Undertype Description</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(upper-case(substring($label, 1, 1)), substring($label, 2))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<!-- normalize solr fields -->
	<xsl:function name="numishare:normalize_fields">
		<xsl:param name="field"/>
		<xsl:param name="lang"/>
		<xsl:choose>
			<xsl:when test="contains($field, '_uri')">
				<xsl:variable name="label" select="substring-before($field, '_uri')"/>
				<xsl:value-of select="numishare:regularize_node($label, $lang)"/>
				<xsl:text> URI</xsl:text>
			</xsl:when>
			<xsl:when test="contains($field, '_facet')">
				<xsl:variable name="label" select="substring-before($field, '_facet')"/>
				<xsl:value-of select="numishare:regularize_node($label, $lang)"/>
			</xsl:when>
			<xsl:when test="contains($field, '_hier')">
				<xsl:variable name="label" select="substring-before($field, '_hier')"/>
				<xsl:value-of select="numishare:regularize_node($label, $lang)"/>
			</xsl:when>
			<xsl:when test="contains($field, '_num')">
				<xsl:variable name="label" select="substring-before($field, '_num')"/>
				<xsl:value-of select="numishare:regularize_node($label, $lang)"/>
			</xsl:when>
			<xsl:when test="contains($field, '_text')">
				<xsl:variable name="label" select="substring-before($field, '_text')"/>
				<xsl:value-of select="numishare:regularize_node($label, $lang)"/>
			</xsl:when>
			<xsl:when test="contains($field, '_min') or contains($field, '_max')">
				<xsl:variable name="label" select="substring-before($field, '_m')"/>
				<xsl:value-of select="numishare:normalize_fields($label, $lang)"/>
			</xsl:when>
			<xsl:when test="contains($field, '_display')">
				<xsl:variable name="label" select="substring-before($field, '_display')"/>
				<xsl:value-of select="numishare:regularize_node($label, $lang)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="numishare:regularize_node($field, $lang)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="numishare:normalizeLabel">
		<xsl:param name="label"/>
		<xsl:param name="lang"/>
		<xsl:choose>
			<xsl:when test="$lang='ar'">
				<xsl:choose>
					<!-- header menu labels -->
					<xsl:when test="$label='header_home'">??????</xsl:when>
					<xsl:when test="$label='header_search'">?????</xsl:when>
					<xsl:when test="$label='header_browse'">????? ????????</xsl:when>
					<xsl:when test="$label='header_maps'">???????</xsl:when>
					<xsl:when test="$label='header_compare'">????????</xsl:when>
					<xsl:when test="$label='header_language'">?????</xsl:when>
					<xsl:when test="$label='lang_ar'">????????</xsl:when>
					<xsl:when test="$label='lang_de'">??????</xsl:when>
					<xsl:when test="$label='lang_en'">???????</xsl:when>
					<xsl:when test="$label='lang_fr'">?????</xsl:when>
					<xsl:when test="$label='lang_ro'">???????</xsl:when>
					<xsl:when test="$label='lang_pl'">??????</xsl:when>
					<xsl:when test="$label='lang_ru'">???????</xsl:when>
					<xsl:when test="$label='lang_nl'">??????</xsl:when>
					<xsl:when test="$label='lang_sv'">????? ????????</xsl:when>
					<xsl:when test="$label='lang_el'">????? ?????????</xsl:when>
					<xsl:when test="$label='lang_tr'">????? ???????</xsl:when>
					<xsl:when test="$label='lang_it'">????????</xsl:when>
					<xsl:when test="$label='lang_da'">??? ???</xsl:when>
					<xsl:when test="$label='lang_nn'">????? ????????</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='bg'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">??????</xsl:when>
					<xsl:when test="$label='header_browse'">?????????</xsl:when>
					<xsl:when test="$label='header_search'">???????</xsl:when>
					<xsl:when test="$label='header_maps'">?????</xsl:when>
					<xsl:when test="$label='header_compare'">?????????</xsl:when>
					<xsl:when test="$label='header_language'">?????</xsl:when>
					<xsl:when test="$label='header_analyze'">?????? ?? ??????? ?????????</xsl:when>
					<xsl:when test="$label='header_visualize'">???????????? ?? ????????????</xsl:when>
					<xsl:when test="$label='display_summary'">?????????</xsl:when>
					<xsl:when test="$label='display_map'">?????</xsl:when>
					<xsl:when test="$label='display_administrative'">?????????????</xsl:when>
					<xsl:when test="$label='display_visualization'">????????????</xsl:when>
					<xsl:when test="$label='display_data-download'">??????? ?? ????? </xsl:when>
					<xsl:when test="$label='display_quantitative'">??????????? ??????</xsl:when>
					<xsl:when test="$label='display_date-analysis'">?????? ?? ??????</xsl:when>
					<xsl:when test="$label='display_contents'">??????????</xsl:when>
					<xsl:when test="$label='display_examples'">??????? ?? ???? ???</xsl:when>
					<xsl:when test="$label='results_all-terms'">?????? ???????</xsl:when>
					<xsl:when test="$label='results_map-results'">????????? ?? ?????</xsl:when>
					<xsl:when test="$label='results_filters'">??????</xsl:when>
					<xsl:when test="$label='results_keyword'">??????? ????</xsl:when>
					<xsl:when test="$label='results_clear-all'">??????? ?????? ???????</xsl:when>
					<xsl:when test="$label='results_data-options'">??????????? ?? ?????</xsl:when>
					<xsl:when test="$label='results_refine-results'">???????? ???????????</xsl:when>
					<xsl:when test="$label='results_quick-search'">????? ???????</xsl:when>
					<xsl:when test="$label='results_has-images'">??? ???????????</xsl:when>
					<xsl:when test="$label='results_refine-search'">???????? ?????????</xsl:when>
					<xsl:when test="$label='results_select'">?????? ?? ??????</xsl:when>
					<xsl:when test="$label='results_sort-results'">???????? ???????????</xsl:when>
					<xsl:when test="$label='results_sort-category'">???????? ???????????</xsl:when>
					<xsl:when test="$label='results_ascending'">?????????</xsl:when>
					<xsl:when test="$label='results_descending'">?????????</xsl:when>
					<xsl:when test="$label='results_result-desc'">????????? ?? ?????? ?? ?? ?? YY, ?? ???? ZZ ????????? </xsl:when>
					<xsl:when test="$label='results_coin'">??????</xsl:when>
					<xsl:when test="$label='results_coins'">??????</xsl:when>
					<xsl:when test="$label='results_hoard'">??????? ????????? </xsl:when>
					<xsl:when test="$label='results_hoards'">??????? ?????????</xsl:when>
					<xsl:when test="$label='results_and'">?</xsl:when>
					<xsl:when test="$label='visualize_typological'">??????????? ??????</xsl:when>
					<xsl:when test="$label='visualize_measurement'">?????? ?? ?????????</xsl:when>
					<xsl:when test="$label='visualize_desc'">??????????? ?????????? ????? ? ????????????? ?? ????????????? ??????, ?? ?? ?????????? ????????, ???????? ?? ?????????? ?????????.
						?????????? ?? ?????????? ?? ???? ??????? ????? ?? ????? ???????? ???</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">??????????? ???? ???????, ?? ?? ????????????? ?????????? ??? ???? ?? ??????? ?? ???????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">??????????? ???? ???????, ?? ?? ???????? ?????????? ??? ???? ?? ??????? ?? ?????? ? ?????????? ???? ? ???????????</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">??????????? ???? ???????, ?? ?? ??????? CSV ?? ??????????? ????????? ? ????????? ??????? ????????? </xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">?????? ???????</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">?????? ??? ????????</xsl:when>
					<xsl:when test="$label='visualize_categories'">?????? ????????? ?? ??????</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">?????? ??????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">?????? ??????? ????????? ?? ?????????? (?? ?????)</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">?????????? ?? ?????????</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">?????? ? ????? ?????????? (?? ?????)</xsl:when>
					<xsl:when test="$label='visualize_compare'">?????? ????????????</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">????????? ?? ?????????</xsl:when>
					<xsl:when test="$label='visualize_add_custom'">?????? ?????????????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">?????????????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_remove_query'">???????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_add_query'">?????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">?????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_add_new'">?????? (???)</xsl:when>
					<xsl:when test="$label='visualize_query'">?????????</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">?????????? ?? ???????</xsl:when>
					<xsl:when test="$label='visualize_filter_query'">?????????? ?? ????????????</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">???????? ???????</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">??????????? ???????? ???? ??-????, ?? ?? ??????????? ?????? ????????? ?? ?????????. ???? ?? ?? ?????? ???? ?? ???? ??????? ??????
						?? ?????????. </xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">????????? ?? ?????</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">?????? / ????? ???????</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">????? ?? ???????????</xsl:when>
					<xsl:when test="$label='visualize_exclude_certainty_codes'">??????? ???????????? ??????</xsl:when>
					<xsl:when test="$label='visualize_arrange'">??????? ?? ??????? (?? ?????)</xsl:when>
					<xsl:when test="$label='visualize_interval'">???????? (??????)</xsl:when>
					<xsl:when test="$label='visualize_duration'">???????????????</xsl:when>
					<xsl:when test="$label='visualize_calculate'">??????? ?????????? </xsl:when>
					<xsl:when test="$label='visualize_generate'">????????? ???????? </xsl:when>
					<xsl:when test="$label='numeric_count'">????</xsl:when>
					<xsl:when test="$label='numeric_percentage'">???????</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">?????????</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">????????? ???????</xsl:when>
					<xsl:when test="$label='chart_bar'">???? </xsl:when>
					<xsl:when test="$label='chart_column'">??????</xsl:when>
					<xsl:when test="$label='chart_area'">??????</xsl:when>
					<xsl:when test="$label='chart_spline'">???????????? ????? </xsl:when>
					<xsl:when test="$label='chart_areaspline'">????????????? ????? </xsl:when>
					<xsl:when test="$label='chart_line'">?????</xsl:when>
					<xsl:when test="$label='visualize_alert'">????????! </xsl:when>
					<xsl:when test="$label='visualize_error1'">?????????? ?? ???????? ? ??????????????? </xsl:when>
					<xsl:when test="$label='visualize_error2'">???????? ???? ?????? ?? ???? ??-????? ?? ????????? ????</xsl:when>
					<xsl:when test="$label='visualize_error3'">?????? ?? ???? ??????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_error4'">????? ?? ??????? ?? (???-?????) 1 ?? (???-?????) 8 ?????????</xsl:when>
					<xsl:when test="$label='visualize_error5'">????? ?? ????? ??????? ?? 8 ?????????</xsl:when>
					<xsl:when test="$label='visualize_error6'">????? ?? ??????? ?? (???-?????) 1 ?? (???-?????) 30 ?????????</xsl:when>
					<xsl:when test="$label='visualize_error7'">????? ?? ????? ??????? ?? 30 ?????????</xsl:when>
					<xsl:when test="$label='lang_ar'">??????? </xsl:when>
					<xsl:when test="$label='lang_bg'">????????</xsl:when>
					<xsl:when test="$label='lang_de'">??????</xsl:when>
					<xsl:when test="$label='lang_en'">?????????</xsl:when>
					<xsl:when test="$label='lang_es'">????????</xsl:when>
					<xsl:when test="$label='lang_fr'">???????</xsl:when>
					<xsl:when test="$label='lang_ro'">????????</xsl:when>
					<xsl:when test="$label='lang_pl'">?????? </xsl:when>
					<xsl:when test="$label='lang_ru'">?????</xsl:when>
					<xsl:when test="$label='lang_nl'">?????????</xsl:when>
					<xsl:when test="$label='lang_sv'">???????</xsl:when>
					<xsl:when test="$label='lang_el'">??????</xsl:when>
					<xsl:when test="$label='lang_tr'">??????</xsl:when>
					<xsl:when test="$label='lang_it'">??????????</xsl:when>
					<xsl:when test="$label='lang_da'">??????</xsl:when>
					<xsl:when test="$label='lang_nn'">????????</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='de'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Start</xsl:when>
					<xsl:when test="$label='header_browse'">Browsen</xsl:when>
					<xsl:when test="$label='header_search'">Suchen</xsl:when>
					<xsl:when test="$label='header_maps'">Karten</xsl:when>
					<xsl:when test="$label='header_compare'">Vergleichen</xsl:when>
					<xsl:when test="$label='header_language'">Sprache</xsl:when>
					<xsl:when test="$label='header_analyze'">Hortfunde analysieren</xsl:when>
					<xsl:when test="$label='header_visualize'">Anfragen visualisieren</xsl:when>
					<xsl:when test="$label='display_summary'">Zusammenfassung</xsl:when>
					<xsl:when test="$label='display_map'">Karten</xsl:when>
					<xsl:when test="$label='display_administrative'">Aadministrativ</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualisierung</xsl:when>
					<xsl:when test="$label='display_data-download'">Datendownlaod</xsl:when>
					<xsl:when test="$label='display_quantitative'">Quantitative Analyse</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Datumsanalyse</xsl:when>
					<xsl:when test="$label='display_contents'">Inhalt</xsl:when>
					<xsl:when test="$label='display_examples'">Exemplare dieses Typs</xsl:when>
					<xsl:when test="$label='results_all-terms'">Alle Begriffe</xsl:when>
					<xsl:when test="$label='results_map-results'">Kartierungsergebnisse</xsl:when>
					<xsl:when test="$label='results_filters'">Filter</xsl:when>
					<xsl:when test="$label='results_keyword'">Schlagwort</xsl:when>
					<xsl:when test="$label='results_clear-all'">Alle Begriffe löchen</xsl:when>
					<xsl:when test="$label='results_data-options'">Datenoptionen</xsl:when>
					<xsl:when test="$label='results_refine-results'">Ergebnisse eingrenzen</xsl:when>
					<xsl:when test="$label='results_quick-search'">Schnelle Suche</xsl:when>
					<xsl:when test="$label='results_has-images'">Hat Bilder</xsl:when>
					<xsl:when test="$label='results_refine-search'">Suche eingrenzen</xsl:when>
					<xsl:when test="$label='results_select'">Aus Liste auswählen</xsl:when>
					<xsl:when test="$label='results_sort-results'">Ergebnisse sortieren</xsl:when>
					<xsl:when test="$label='results_sort-category'">Sortierungskategorie</xsl:when>
					<xsl:when test="$label='results_ascending'">Aufsteigend</xsl:when>
					<xsl:when test="$label='results_descending'">Absteigend</xsl:when>
					<xsl:when test="$label='results_result-desc'">Ergebnisse von XX bis YY aus ZZ Gesamtergebnissen anzeigen</xsl:when>
					<xsl:when test="$label='results_coin'">Münze</xsl:when>
					<xsl:when test="$label='results_coins'">Münzen</xsl:when>
					<xsl:when test="$label='results_hoard'">Schatzfund</xsl:when>
					<xsl:when test="$label='results_hoards'">Schatzfunden</xsl:when>
					<xsl:when test="$label='results_and'">und</xsl:when>
					<xsl:when test="$label='visualize_typological'">Typologische Analyse</xsl:when>
					<xsl:when test="$label='visualize_measurement'">Analyse der Dimensionen</xsl:when>
					<xsl:when test="$label='visualize_desc'">Verwenden Sie die Datenauswahl- und Visualisierungsoptionen, um eine auf ausgewählten Parametern basierte Grafik zu erzeugen. Eine Gebrauchsanleitung dafür finden Sie hier</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">Verwenden Sie diese Option, um Prozent- bzw. absolute Zahlen der folgenden Typologien zu visualisieren</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">Verwenden Sie diese Option, um das Vorkommen von Münzen eines bestimmten Datums in Schtazfunden als Prozent- bzw. absolute Zahlen zu erhalten</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">Verwenden Sie diese Option, um eine CSV-Datei für die Abfrage und die ausgewählten Schatzfunde zu downloaden</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">Dimensionen auswählen</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">Grafikart auswählen</xsl:when>
					<xsl:when test="$label='visualize_categories'">Analysekategorien auswählen</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">Schatzfunde auswählen</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">Schatzfunde für Verleich auswählen (optional)</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">Vergleich nach Kategorie</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">Vergleich mit anderen Abfragen (optional)</xsl:when>
					<xsl:when test="$label='visualize_compare'">Abfragen vergleichen</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">Vergleichsabfrage</xsl:when>
					<xsl:when test="$label='visualize_add_custom'">Spezifische Abfrage hinzufügen</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">Spezifische Abfrage</xsl:when>
					<xsl:when test="$label='visualize_remove_query'">Abfrage entfernen</xsl:when>
					<xsl:when test="$label='visualize_add_query'">Abfrage hinzufügen</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">Abfragen hinzufügen</xsl:when>
					<xsl:when test="$label='visualize_add_new'">Neu hinzufügen</xsl:when>
					<xsl:when test="$label='visualize_query'">Abfrage</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">Filterliste</xsl:when>
					<xsl:when test="$label='visualize_filter_query'">Filterabfrage</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">Filter entfernen</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">Verwenden Sie die Ausklappmenüs unten, um Ihre Dimensionsabfrage zu formulieren. Ein Datumsbereich kann für jede Abfrage nur einmal angegeben werden</xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">Optionale Einstellungen</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">Optionen ausblenden/zeigen</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">Stapeloptionen</xsl:when>
					<xsl:when test="$label='visualize_exclude_certainty_codes'">Sicherheitscodes entfernen</xsl:when>
					<xsl:when test="$label='visualize_arrange'">Nach Intervall anordnen (optional)</xsl:when>
					<xsl:when test="$label='visualize_interval'">Intervall (Jahre)</xsl:when>
					<xsl:when test="$label='visualize_duration'">Dauer</xsl:when>
					<xsl:when test="$label='visualize_calculate'">Ausgewähltes berechnen</xsl:when>
					<xsl:when test="$label='visualize_generate'">Grafik erzeugen</xsl:when>
					<xsl:when test="$label='numeric_count'">Zählen</xsl:when>
					<xsl:when test="$label='numeric_percentage'">Prozentzahl</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">Cumulativ</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">Cumulative Prozentzahl</xsl:when>
					<xsl:when test="$label='chart_bar'">Balken</xsl:when>
					<xsl:when test="$label='chart_column'">Säule</xsl:when>
					<xsl:when test="$label='chart_area'">Fläche</xsl:when>
					<xsl:when test="$label='chart_spline'">Spline</xsl:when>
					<xsl:when test="$label='chart_areaspline'">Spline-Fläche</xsl:when>
					<xsl:when test="$label='chart_line'">Linie</xsl:when>
					<xsl:when test="$label='visualize_alert'">Alarm</xsl:when>
					<xsl:when test="$label='visualize_error1'">Intervall und Dauer werden benötigt</xsl:when>
					<xsl:when test="$label='visualize_error2'">Datum bis muss später als Datum von sein</xsl:when>
					<xsl:when test="$label='visualize_error3'">Eine Kategorie muss ausgewählt sein</xsl:when>
					<xsl:when test="$label='visualize_error4'">Mindestens 1 und bis zu 8 Schatzfunden können ausgewählt werden</xsl:when>
					<xsl:when test="$label='visualize_error5'">Bis zu 8 Schatzfunden können ausgewählt werden</xsl:when>
					<xsl:when test="$label='visualize_error6'">Mindestens 1 und bis zu 30 Schatzfunden können ausgewählt werden</xsl:when>
					<xsl:when test="$label='visualize_error7'">Bis zu 30 Schatzfunden können ausgewählt werden</xsl:when>
					<xsl:when test="$label='lang_ar'">Arabisch</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgarisch</xsl:when>
					<xsl:when test="$label='lang_de'">Deutsch</xsl:when>
					<xsl:when test="$label='lang_en'">Englisch</xsl:when>
					<xsl:when test="$label='lang_fr'">Französisch</xsl:when>
					<xsl:when test="$label='lang_ro'">Rumänisch</xsl:when>
					<xsl:when test="$label='lang_pl'">Polnische </xsl:when>
					<xsl:when test="$label='lang_ru'">Russisch</xsl:when>
					<xsl:when test="$label='lang_nl'">Holländisch</xsl:when>
					<xsl:when test="$label='lang_sv'">Schwedisch</xsl:when>
					<xsl:when test="$label='lang_el'">Griechisch</xsl:when>
					<xsl:when test="$label='lang_tr'">Türkisch</xsl:when>
					<xsl:when test="$label='lang_it'">Italienisch</xsl:when>
					<xsl:when test="$label='lang_da'">Dänisch</xsl:when>
					<xsl:when test="$label='lang_nn'">Norwegisch</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='el'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">????????</xsl:when>
					<xsl:when test="$label='header_browse'">?????????</xsl:when>
					<xsl:when test="$label='header_search'">?????????</xsl:when>
					<xsl:when test="$label='header_maps'">??????</xsl:when>
					<xsl:when test="$label='header_compare'">????????????</xsl:when>
					<xsl:when test="$label='header_language'">??????</xsl:when>
					<xsl:when test="$label='header_analyze'">??????? «????????»</xsl:when>
					<xsl:when test="$label='header_visualize'">???????????? ???????????</xsl:when>
					<xsl:when test="$label='display_summary'">????????? ??????????</xsl:when>
					<xsl:when test="$label='display_map'">??????</xsl:when>
					<xsl:when test="$label='display_administrative'">??????????</xsl:when>
					<xsl:when test="$label='display_visualization'">????????????</xsl:when>
					<xsl:when test="$label='display_data-download'">???? ?????????</xsl:when>
					<xsl:when test="$label='display_quantitative'">???????? ???????</xsl:when>
					<xsl:when test="$label='display_date-analysis'">??????????? ???????</xsl:when>
					<xsl:when test="$label='display_contents'">??????? ????????????</xsl:when>
					<xsl:when test="$label='display_examples'">???????????? ??? ????? ?????</xsl:when>
					<xsl:when test="$label='results_all-terms'">??????? ???? ??? ????</xsl:when>
					<xsl:when test="$label='results_map-results'">???????????? ??? ??????</xsl:when>
					<xsl:when test="$label='results_filters'">??????</xsl:when>
					<xsl:when test="$label='results_keyword'">????-??????</xsl:when>
					<xsl:when test="$label='results_clear-all'">?????????? ???? ??? ????</xsl:when>
					<xsl:when test="$label='results_data-options'">???????? ?????????</xsl:when>
					<xsl:when test="$label='results_refine-results'">??????????? ?????????????</xsl:when>
					<xsl:when test="$label='results_quick-search'">??????? ?????????</xsl:when>
					<xsl:when test="$label='results_has-images'">??????????? ???????</xsl:when>
					<xsl:when test="$label='results_refine-search'">??????????? ??????????</xsl:when>
					<xsl:when test="$label='results_select'">??????? ??? ?? ?????</xsl:when>
					<xsl:when test="$label='results_sort-results'">?????????? ?????????????</xsl:when>
					<xsl:when test="$label='results_sort-category'">?????????? ??????????</xsl:when>
					<xsl:when test="$label='results_ascending'">??????? ?????</xsl:when>
					<xsl:when test="$label='results_descending'">???????? ?????</xsl:when>
					<xsl:when test="$label='results_result-desc'">?????????? ????????????? XX ??? YY ??? ???????? ZZ</xsl:when>
					<xsl:when test="$label='results_coin'">???????</xsl:when>
					<xsl:when test="$label='results_coins'">?????????</xsl:when>
					<xsl:when test="$label='results_hoard'">«????????»</xsl:when>
					<xsl:when test="$label='results_hoards'">«????????»</xsl:when>
					<xsl:when test="$label='results_and'">???</xsl:when>
					<xsl:when test="$label='visualize_typological'">?????????? ???????</xsl:when>
					<xsl:when test="$label='visualize_measurement'">??????? ???????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_desc'">??????????????? ??? ??????? ????????? ??? ??? ??????????? ????????????? ?????? ??? ?? ????????????? ??? ??????? ????????? ?? ???????????
						???????????. ??????? ??? ?? ????? ????? ??? ????????? ???????? ???.</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">??????????????? ???? ?? ???????? ??? ?? ?????????????? ??????? ? ?????????? ???????? ??? ???? ???????? ??????</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">??????????????? ???? ?? ???????? ??? ?? ?????????????? ??????? ? ?????????? ???????? ???? ????? ?? ????????? ???? ??????????
						???????????? ????? «????????»</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">??????????????? ???? ?? ???????? ??? ?? ?????????? ??? ?????? CSV (???????? ????????? ?? ???????) ??? ?? ???????????? ????????? ???
						???? ???????????? «?????????»</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">???????? ??????? ????????</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">???????? ???? ??????????</xsl:when>
					<xsl:when test="$label='visualize_categories'">???????? ?????????? ????????</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">???????? «?????????»</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">???????? «?????????» ??? ???????? (???????????)</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">???????? ????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">???????????? ?? ????? ??????????? (???????????)</xsl:when>
					<xsl:when test="$label='visualize_compare'">???????????? ???????????</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">??????????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_add_custom'">???????? ??????? ???????????</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">??????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_remove_query'">?????????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_add_query'">???????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">???????? ???????????</xsl:when>
					<xsl:when test="$label='visualize_add_new'">???????? ???? ??????????</xsl:when>
					<xsl:when test="$label='visualize_query'">??????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">????? ??????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_filter_query'">??????????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">?????????? ??????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">??????????????? ?? ?????? ????? ??? ?? ???????????? ??? ????????? ???????? ?????????. ???? ??? ??????? ???????? ?????? ?? ???????
						??? ???? ?????????.</xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">???????????? ?????????</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">????????/???????? ????????</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">???????? stacking</xsl:when>
					<xsl:when test="$label='visualize_exclude_certainty_codes'">???????? certainty codes</xsl:when>
					<xsl:when test="$label='visualize_arrange'">???????? ????? ???????? ??????????? (???????????)</xsl:when>
					<xsl:when test="$label='visualize_interval'">??????? ???????? (???)</xsl:when>
					<xsl:when test="$label='visualize_duration'">????????</xsl:when>
					<xsl:when test="$label='visualize_calculate'">??????????? ???????????</xsl:when>
					<xsl:when test="$label='visualize_generate'">?????????? ??????????</xsl:when>
					<xsl:when test="$label='numeric_count'">????????</xsl:when>
					<xsl:when test="$label='numeric_percentage'">???????</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">?????????????</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">????????????? ???????</xsl:when>
					<xsl:when test="$label='chart_bar'">????? ??????????</xsl:when>
					<xsl:when test="$label='chart_column'">????? ??????????</xsl:when>
					<xsl:when test="$label='chart_area'">??????? ??????????</xsl:when>
					<xsl:when test="$label='chart_spline'">??????????? ??????? ??????????</xsl:when>
					<xsl:when test="$label='chart_areaspline'">??????? ???????????? ???????? ??????????</xsl:when>
					<xsl:when test="$label='chart_line'">?????? ??????????</xsl:when>
					<xsl:when test="$label='visualize_alert'">???????!</xsl:when>
					<xsl:when test="$label='visualize_error1'">??????? ???????? ??? ???????? ????? ??????????.</xsl:when>
					<xsl:when test="$label='visualize_error2'">? ???????????? ?????????? ?????? ?? ????? ????????????? ??? ??? ??????????.</xsl:when>
					<xsl:when test="$label='visualize_error3'">??? ????????? ?????? ?? ?????????.</xsl:when>
					<xsl:when test="$label='visualize_error4'">??????? ?? ?????????? ???? (???????????) ??? ???? «????????».</xsl:when>
					<xsl:when test="$label='visualize_error5'">??????? ?? ?????????? ????? ???? «????????».</xsl:when>
					<xsl:when test="$label='visualize_error6'">??????? ?? ?????????? ???? (???????????) ??? ??????? «????????».</xsl:when>
					<xsl:when test="$label='visualize_error7'">??????? ?? ?????????? ????? ??????? «????????».</xsl:when>
					<xsl:when test="$label='lang_ar'">???????</xsl:when>
					<xsl:when test="$label='lang_bg'">?????????</xsl:when>
					<xsl:when test="$label='lang_de'">?????????</xsl:when>
					<xsl:when test="$label='lang_en'">???????</xsl:when>
					<xsl:when test="$label='lang_es'">????????</xsl:when>
					<xsl:when test="$label='lang_fr'">???????</xsl:when>
					<xsl:when test="$label='lang_ro'">?????????</xsl:when>
					<xsl:when test="$label='lang_pl'">????????</xsl:when>
					<xsl:when test="$label='lang_ru'">??????</xsl:when>
					<xsl:when test="$label='lang_nl'">?????????</xsl:when>
					<xsl:when test="$label='lang_sv'">????????</xsl:when>
					<xsl:when test="$label='lang_el'">????????</xsl:when>
					<xsl:when test="$label='lang_tr'">????????</xsl:when>
					<xsl:when test="$label='lang_it'">???????</xsl:when>
					<xsl:when test="$label='lang_da'">??????</xsl:when>
					<xsl:when test="$label='lang_nn'">?????????</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='es'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Inicio</xsl:when>
					<xsl:when test="$label='header_browse'">Navegar</xsl:when>
					<xsl:when test="$label='header_search'">Buscar</xsl:when>
					<xsl:when test="$label='header_maps'">Mapa de la web</xsl:when>
					<xsl:when test="$label='header_compare'">Comparar</xsl:when>
					<xsl:when test="$label='header_language'">Lengua</xsl:when>
					<xsl:when test="$label='header_analyze'">Análisis</xsl:when>
					<xsl:when test="$label='header_visualize'">Visualizar</xsl:when>
					<xsl:when test="$label='display_summary'">Sumario</xsl:when>
					<xsl:when test="$label='display_map'">Mapa</xsl:when>
					<xsl:when test="$label='display_administrative'">Administrativo</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualización</xsl:when>
					<xsl:when test="$label='display_data-download'">Descargar los datos</xsl:when>
					<xsl:when test="$label='display_quantitative'">Análisis cuantitativo</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Análisis de los datos</xsl:when>
					<xsl:when test="$label='display_contents'">Índice</xsl:when>
					<xsl:when test="$label='display_examples'">Ejemplos</xsl:when>
					<xsl:when test="$label='results_all-terms'">Todos los términos</xsl:when>
					<xsl:when test="$label='results_map-results'">Resultados en el mapa</xsl:when>
					<xsl:when test="$label='results_filters'">Filtros</xsl:when>
					<xsl:when test="$label='results_keyword'">Palabras clave</xsl:when>
					<xsl:when test="$label='results_clear-all'">Limpiar</xsl:when>
					<xsl:when test="$label='results_data-options'">Ocultar todos los términos</xsl:when>
					<xsl:when test="$label='results_refine-results'">Detallar resultados</xsl:when>
					<xsl:when test="$label='results_quick-search'">Búsqueda rápida</xsl:when>
					<xsl:when test="$label='results_has-images'">Imágenes disponibles </xsl:when>
					<xsl:when test="$label='results_refine-search'">Volver a definir la búsqueda</xsl:when>
					<xsl:when test="$label='results_select'">Seleccionar</xsl:when>
					<xsl:when test="$label='results_sort-results'">Ordenar los resultados</xsl:when>
					<xsl:when test="$label='results_sort-category'">Ordenar por categorías</xsl:when>
					<xsl:when test="$label='results_ascending'">Ascendente</xsl:when>
					<xsl:when test="$label='results_descending'">Descendente</xsl:when>
					<xsl:when test="$label='results_result-desc'">Resultados de XX a YY sobre un total de ZZ</xsl:when>
					<xsl:when test="$label='results_coin'">Moneda</xsl:when>
					<xsl:when test="$label='results_coins'">Monedas</xsl:when>
					<xsl:when test="$label='results_hoard'">Tesoro</xsl:when>
					<xsl:when test="$label='results_hoards'">Tesoros</xsl:when>
					<xsl:when test="$label='results_and'">y</xsl:when>
					<xsl:when test="$label='visualize_typological'">Tipológico</xsl:when>
					<xsl:when test="$label='visualize_measurement'">Dimensiones</xsl:when>
					<xsl:when test="$label='visualize_desc'">Desc</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">Tipo desc</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">Fecha desc</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">csv desc</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">Seleccionar dimensiones</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">Mapa tipo</xsl:when>
					<xsl:when test="$label='visualize_categories'">Categorías</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">Seleccionar tesoros</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">Seleccionar tesoros opcional</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">Comparar categoría</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">Comparar opcional</xsl:when>
					<xsl:when test="$label='visualize_compare'">Comparar</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">Comparar búsqueda</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">Búsqueda personal</xsl:when>
					<xsl:when test="$label='visualize_add_query'">Añadir búsqueda</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">Añadir búsquedas</xsl:when>
					<xsl:when test="$label='visualize_add_new'">Anadir nuevo</xsl:when>
					<xsl:when test="$label='visualize_query'">Búsqueda</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">lista de filtros</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">Limpiar filtro</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">Añadir Búqueda Desc</xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">Parámetros opcionales</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">Ocultar Mostrar</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">Juntar opciones</xsl:when>
					<xsl:when test="$label='visualize_exclude_certainty_codes'">Excluir Certeza Codes</xsl:when>
					<xsl:when test="$label='visualize_arrange'">Poner en orden</xsl:when>
					<xsl:when test="$label='visualize_interval'">Intervalo</xsl:when>
					<xsl:when test="$label='visualize_duration'">Duración</xsl:when>
					<xsl:when test="$label='visualize_calculate'">Calcular</xsl:when>
					<xsl:when test="$label='visualize_generate'">Generar</xsl:when>
					<xsl:when test="$label='numeric_count'">Contar</xsl:when>
					<xsl:when test="$label='numeric_percentage'">Porcentaje</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">Acumulativo</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">Porcentaje acumulativo</xsl:when>
					<xsl:when test="$label='chart_bar'">Barra</xsl:when>
					<xsl:when test="$label='chart_column'">Columna</xsl:when>
					<xsl:when test="$label='chart_area'">Área</xsl:when>
					<xsl:when test="$label='chart_spline'">Franja</xsl:when>
					<xsl:when test="$label='chart_areaspline'">Área de franja</xsl:when>
					<xsl:when test="$label='chart_line'">Línea</xsl:when>
					<xsl:when test="$label='visualize_alert'">Alerta</xsl:when>
					<xsl:when test="$label='lang_ar'">Árabe</xsl:when>
					<xsl:when test="$label='lang_de'">Alemán</xsl:when>
					<xsl:when test="$label='lang_es'">Español</xsl:when>
					<xsl:when test="$label='lang_bg'">Búlgaro</xsl:when>
					<xsl:when test="$label='lang_en'">Inglés</xsl:when>
					<xsl:when test="$label='lang_fr'">Francés</xsl:when>
					<xsl:when test="$label='lang_ro'">Rumano</xsl:when>
					<xsl:when test="$label='lang_pl'">Polaco</xsl:when>
					<xsl:when test="$label='lang_ru'">Ruso</xsl:when>
					<xsl:when test="$label='lang_nl'">Holandés</xsl:when>
					<xsl:when test="$label='lang_sv'">Sueco</xsl:when>
					<xsl:when test="$label='lang_el'">Griego</xsl:when>
					<xsl:when test="$label='lang_tr'">Turco</xsl:when>
					<xsl:when test="$label='lang_it'">Italiano</xsl:when>
					<xsl:when test="$label='lang_da'">Danés</xsl:when>
					<xsl:when test="$label='lang_nn'">Noruego</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='fr'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Accueil</xsl:when>
					<xsl:when test="$label='header_browse'">Explorer</xsl:when>
					<xsl:when test="$label='header_search'">Chercher</xsl:when>
					<xsl:when test="$label='header_maps'">Cartes</xsl:when>
					<xsl:when test="$label='header_compare'">Comparer</xsl:when>
					<xsl:when test="$label='header_language'">Langue</xsl:when>
					<xsl:when test="$label='header_analyze'">Analyse des trésors</xsl:when>
					<xsl:when test="$label='header_visualize'">Visualiser la recherche</xsl:when>
					<xsl:when test="$label='display_summary'">Résumé</xsl:when>
					<xsl:when test="$label='display_map'">Carte</xsl:when>
					<xsl:when test="$label='display_administrative'">Administratif</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualisation</xsl:when>
					<xsl:when test="$label='display_data-download'">Récupérer les données</xsl:when>
					<xsl:when test="$label='display_quantitative'">Analyse quantitative</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Analyse des dates</xsl:when>
					<xsl:when test="$label='display_contents'">Contenu</xsl:when>
					<xsl:when test="$label='display_examples'">Exemples de ce type</xsl:when>
					<xsl:when test="$label='results_all-terms'">Tous les termes</xsl:when>
					<xsl:when test="$label='results_map-results'">Résultats géographiques</xsl:when>
					<xsl:when test="$label='results_filters'">Filtres</xsl:when>
					<xsl:when test="$label='results_keyword'">Mot clef</xsl:when>
					<xsl:when test="$label='results_clear-all'">Effacer les termes sélectionnés</xsl:when>
					<xsl:when test="$label='results_data-options'">Options de données</xsl:when>
					<xsl:when test="$label='results_refine-results'">Raffiner le résultat</xsl:when>
					<xsl:when test="$label='results_quick-search'">Recherche rapide</xsl:when>
					<xsl:when test="$label='results_has-images'">Images disponibles</xsl:when>
					<xsl:when test="$label='results_refine-search'">Raffiner la recherche</xsl:when>
					<xsl:when test="$label='results_select'">Sélectionner à partir de la liste</xsl:when>
					<xsl:when test="$label='results_sort-results'">Classer les résultats</xsl:when>
					<xsl:when test="$label='results_sort-category'">Classer les catégories</xsl:when>
					<xsl:when test="$label='results_ascending'">Ordre ascendant</xsl:when>
					<xsl:when test="$label='results_descending'">Ordre descendant</xsl:when>
					<xsl:when test="$label='results_result-desc'">Afficher les références XX à YY à partir de ZZ résultats</xsl:when>
					<xsl:when test="$label='results_coin'">monnaie</xsl:when>
					<xsl:when test="$label='results_coins'">monnaies</xsl:when>
					<xsl:when test="$label='results_hoard'">trésor</xsl:when>
					<xsl:when test="$label='results_hoards'">trésors</xsl:when>
					<xsl:when test="$label='results_and'">et</xsl:when>
					<xsl:when test="$label='visualize_typological'">Analyse typologique</xsl:when>
					<xsl:when test="$label='visualize_measurement'">Analyse des mesures</xsl:when>
					<xsl:when test="$label='visualize_desc'">Utilisez la sélection des informations et les options de visualisation ci-dessous pour créer un graphique basés sur les paramètres sélectionnés. Les instructions d'utilisation de cette fonction peuvent être trouvés ici.</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">Utilisez cette fonctionalité pour visualiser les pourcentages ou le nombre de fois où cette typologie apparaît</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">Utilisez cette fonctionalité pour obtenir le pourcentage ou le nombre de fois où cette monnaie apparaît à une date particulière au sein des trésors</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">Utilisez cette fonctionalité pour télécharger un CSV correspondant à la recherche et les trésors sélectionnés</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">Selectionnez Mesure</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">Sélectionnez Type de graphe.</xsl:when>
					<xsl:when test="$label='visualize_categories'">Sélectionnez Catégories pour analyse.</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">Sélectionnez Trésors</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">Sélectionnez Comparaison de trésors (Optionnel)</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">Comparez par catégorie</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">Comparez aux autres recherches (optionnel)</xsl:when>
					<xsl:when test="$label='visualize_compare'">Comparez les recherches</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">Demande de comparaison</xsl:when>
					<xsl:when test="$label='visualize_add_custom'">Ajoutez des demandes spécifiques</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">Demande spécifique</xsl:when>
					<xsl:when test="$label='visualize_remove_query'">Enlevez la demande</xsl:when>
					<xsl:when test="$label='visualize_add_query'">Ajoutez une demande</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">Ajoutez des demandes</xsl:when>
					<xsl:when test="$label='visualize_add_new'">Ajoutez </xsl:when>
					<xsl:when test="$label='visualize_query'">Demande</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">Filtre de liste</xsl:when>
					<xsl:when test="$label='visualize_filter_query'">Demande de filtre</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">Enlevez le filtre</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">Utilisez les fonctions de défilement ci-dessous pour fromuler votre demande de mesure. Une période entre deux dates ne peut être spécifiée qu'une seule fois par demande</xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">Cadre de travail optionnel</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">Options de Cacher/Afficher</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">Options de mise en ordre</xsl:when>
					<xsl:when test="$label='visualize_exclude_certainty_codes'">Exclure les codes certains</xsl:when>
					<xsl:when test="$label='visualize_arrange'">Organiser par intervalles (optionnel)</xsl:when>
					<xsl:when test="$label='visualize_interval'">Intervalle (années)</xsl:when>
					<xsl:when test="$label='visualize_duration'">Durée</xsl:when>
					<xsl:when test="$label='visualize_calculate'">Calculer la sélection</xsl:when>
					<xsl:when test="$label='visualize_generate'">Générer un graphe</xsl:when>
					<xsl:when test="$label='numeric_count'">Dénombrer</xsl:when>
					<xsl:when test="$label='numeric_percentage'">Pourcentage</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">Cumulé</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">Pourcentage cumulé</xsl:when>
					<xsl:when test="$label='chart_bar'">Barre</xsl:when>
					<xsl:when test="$label='chart_column'">Colonne</xsl:when>
					<xsl:when test="$label='chart_area'">Surface</xsl:when>
					<xsl:when test="$label='chart_spline'">Courbe spline</xsl:when>
					<xsl:when test="$label='chart_areaspline'">Surface spline</xsl:when>
					<xsl:when test="$label='chart_line'">Ligne</xsl:when>
					<xsl:when test="$label='visualize_alert'">Alerte</xsl:when>
					<xsl:when test="$label='visualize_error1'">Intervalle et période sont requis</xsl:when>
					<xsl:when test="$label='visualize_error2'">La date finale doit se situer après la date initiale</xsl:when>
					<xsl:when test="$label='visualize_error3'">Une catégorie doit être sélectionnée</xsl:when>
					<xsl:when test="$label='visualize_error4'">Un minimum de 1 et un maximum de 8 trésors peuvent être sélectionnés</xsl:when>
					<xsl:when test="$label='visualize_error5'">Jusqu'à 8 trésors peuvent être sélectionnés</xsl:when>
					<xsl:when test="$label='visualize_error6'">Un minimum de 1 et un maximum de 30 trésors peuvent être sélectionnés</xsl:when>
					<xsl:when test="$label='visualize_error7'">Jusqu'à 30 trésors peuvent être sélectionnés</xsl:when>
					<xsl:when test="$label='lang_ar'">Arabe</xsl:when>
					<xsl:when test="$label='lang_de'">Allemand</xsl:when>
					<xsl:when test="$label='lang_en'">Anglais</xsl:when>
					<xsl:when test="$label='lang_fr'">Français</xsl:when>
					<xsl:when test="$label='lang_ro'">Roumain</xsl:when>
					<xsl:when test="$label='lang_pl'">Polonais</xsl:when>
					<xsl:when test="$label='lang_ru'">Russe</xsl:when>
					<xsl:when test="$label='lang_nl'">Néerlandais</xsl:when>
					<xsl:when test="$label='lang_sv'">Suédois</xsl:when>
					<xsl:when test="$label='lang_el'">Grec</xsl:when>
					<xsl:when test="$label='lang_tr'">Turc</xsl:when>
					<xsl:when test="$label='lang_it'">Italien</xsl:when>
					<xsl:when test="$label='lang_da'">Danois</xsl:when>
					<xsl:when test="$label='lang_nn'">Norvégien</xsl:when>
					<xsl:when test="$label='lang_es'">Espagnol</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgare</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='it'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Pagina iniziale</xsl:when>
					<xsl:when test="$label='header_browse'">Naviga</xsl:when>
					<xsl:when test="$label='header_search'">Cerca</xsl:when>
					<xsl:when test="$label='header_maps'">Mappe</xsl:when>
					<xsl:when test="$label='header_compare'">Confronta</xsl:when>
					<xsl:when test="$label='header_language'">Lingua</xsl:when>
					<xsl:when test="$label='header_analyze'">Analisi dei ripostigli</xsl:when>
					<xsl:when test="$label='header_visualize'">Visualizza queries</xsl:when>
					<xsl:when test="$label='display_summary'">Sommario</xsl:when>
					<xsl:when test="$label='display_map'">Mappa</xsl:when>
					<xsl:when test="$label='display_administrative'">Amministrativo</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualizzazione</xsl:when>
					<xsl:when test="$label='display_data-download'">Scarica i dati</xsl:when>
					<xsl:when test="$label='display_quantitative'">Analisi quantitativa</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Analisi dei dati</xsl:when>
					<xsl:when test="$label='display_contents'">Sommario</xsl:when>
					<xsl:when test="$label='display_examples'"> Esempi di questo tipo</xsl:when>
					<xsl:when test="$label='results_all-terms'">Tutti i termini</xsl:when>
					<xsl:when test="$label='results_map-results'">Risultati geografici</xsl:when>
					<xsl:when test="$label='results_filters'">Filtri</xsl:when>
					<xsl:when test="$label='results_keyword'">Parola chiave</xsl:when>
					<xsl:when test="$label='results_clear-all'">Azzera tutti i termini</xsl:when>
					<xsl:when test="$label='results_data-options'">Opzioni dei dati</xsl:when>
					<xsl:when test="$label='results_refine-results'">Affina i risultati</xsl:when>
					<xsl:when test="$label='results_quick-search'">Ricerca veloce</xsl:when>
					<xsl:when test="$label='results_has-images'">Immagini disponibili</xsl:when>
					<xsl:when test="$label='results_refine-search'">Raffina la ricerca</xsl:when>
					<xsl:when test="$label='results_select'">Seleziona dalla lista</xsl:when>
					<xsl:when test="$label='results_sort-results'">Ordina i risultati</xsl:when>
					<xsl:when test="$label='results_sort-category'">Ordina la categoria</xsl:when>
					<xsl:when test="$label='results_ascending'">Ordine crescente</xsl:when>
					<xsl:when test="$label='results_descending'">Ordine decrescente</xsl:when>
					<xsl:when test="$label='results_result-desc'">Esporre i risultati da XX a YY su un totale di ZZ risultati</xsl:when>
					<xsl:when test="$label='results_coin'">moneta</xsl:when>
					<xsl:when test="$label='results_coins'">monete</xsl:when>
					<xsl:when test="$label='results_hoard'">ripostiglio</xsl:when>
					<xsl:when test="$label='results_hoards'">ripostigli</xsl:when>
					<xsl:when test="$label='results_and'">e</xsl:when>
					<xsl:when test="$label='visualize_typological'">Analisi tipologica</xsl:when>
					<xsl:when test="$label='visualize_measurement'">Analisi dimensionale</xsl:when>
					<xsl:when test="$label='visualize_desc'">Utilizza le opzioni per la selezione e visualizzazione dei dati in basso per creare un grafico basato sui parametri selezionati. Le
						istruzioni per utilizzare questa funzione si possono consultare qui.</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">Utilizza questa funzione per visualizzare le percentuali o le frequenze numeriche di queste tipologie.</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">Utilizza questa funzione per rappresentare le percentuali o le frequenze numeriche di monete con una datazione specifica all'interno
						dei ripostigli.</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">Utilizza questa funzione per scaricare CSV (valori separati da virgola) relativi alla query considerata e ai ripostigli
						selezionati.</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">Seleziona dimensioni</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">Seleziona tipo di grafico</xsl:when>
					<xsl:when test="$label='visualize_categories'">Seleziona categorie per le analisi</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">Seleziona ripostigli</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">Seleziona ripostigli per confrontare (opzionale)</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">Confronta per categoria</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">Confronta con altre queries</xsl:when>
					<xsl:when test="$label='visualize_compare'">Confronta queries</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">Query di confronto</xsl:when>
					<xsl:when test="$label='visualize_error3'">Dev'essere selezionata una categoria</xsl:when>
					<xsl:when test="$label='visualize_error4'">Possono essere selezionati da un minimo di 1 fino a un massimo di 8 ripostigli</xsl:when>
					<xsl:when test="$label='visualize_error5'">Possono essere selezionati fino a un massimo di 8 ripostigli</xsl:when>
					<xsl:when test="$label='visualize_error6'">Possono essere selezionati da un minimo di 1 fino a un massimo di 30 ripostigli</xsl:when>
					<xsl:when test="$label='visualize_error7'">Possono essere selezionati fino a un massimo di 30 ripostigli</xsl:when>
					<xsl:when test="$label='lang_ar'">Arabo</xsl:when>
					<xsl:when test="$label='lang_de'">Tedesco</xsl:when>
					<xsl:when test="$label='lang_en'">Inglese</xsl:when>
					<xsl:when test="$label='lang_fr'">Francese</xsl:when>
					<xsl:when test="$label='lang_ro'">Rumeno</xsl:when>
					<xsl:when test="$label='lang_pl'">Polacco</xsl:when>
					<xsl:when test="$label='lang_ru'">Russo</xsl:when>
					<xsl:when test="$label='lang_nl'">Olandese</xsl:when>
					<xsl:when test="$label='lang_sv'">Svedese</xsl:when>
					<xsl:when test="$label='lang_el'">Greco</xsl:when>
					<xsl:when test="$label='lang_tr'">Turco</xsl:when>
					<xsl:when test="$label='lang_it'">Italiano</xsl:when>
					<xsl:when test="$label='lang_da'">Danese</xsl:when>
					<xsl:when test="$label='lang_nn'">Norvegese</xsl:when>
					<xsl:when test="$label='lang_es'">Spagnolo</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgaro</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='nl'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Start</xsl:when>
					<xsl:when test="$label='header_browse'">Bladeren</xsl:when>
					<xsl:when test="$label='header_search'">Zoeken</xsl:when>
					<xsl:when test="$label='header_maps'">Kaarten</xsl:when>
					<xsl:when test="$label='header_compare'">Vergelijken</xsl:when>
					<xsl:when test="$label='header_language'">Taal</xsl:when>
					<xsl:when test="$label='header_analyze'">Analyseer schatvondsten</xsl:when>
					<xsl:when test="$label='header_visualize'">Visualiseer zoekvraag</xsl:when>
					<xsl:when test="$label='display_summary'">Samenvatting</xsl:when>
					<xsl:when test="$label='display_map'">Kaart</xsl:when>
					<xsl:when test="$label='display_administrative'">Administratief</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualisatie</xsl:when>
					<xsl:when test="$label='display_data-download'">Data download</xsl:when>
					<xsl:when test="$label='display_quantitative'">Quantitatieve analyse</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Data-analyse</xsl:when>
					<xsl:when test="$label='display_contents'">Inhoud</xsl:when>
					<xsl:when test="$label='results_all-terms'">Alle termen</xsl:when>
					<xsl:when test="$label='results_map-results'">Kaartresultaten</xsl:when>
					<xsl:when test="$label='results_filters'">Filters</xsl:when>
					<xsl:when test="$label='results_keyword'">Trefwoord</xsl:when>
					<xsl:when test="$label='results_clear-all'">Alle termen verwijderen</xsl:when>
					<xsl:when test="$label='results_data-options'">Data-opties</xsl:when>
					<xsl:when test="$label='results_refine-results'">Verfijn resultaten</xsl:when>
					<xsl:when test="$label='results_quick-search'">Snel zoeken</xsl:when>
					<xsl:when test="$label='results_has-images'">Met afbeeldingen</xsl:when>
					<xsl:when test="$label='results_refine-search'">Verfijn zoeken</xsl:when>
					<xsl:when test="$label='results_select'">Kies uit lijst</xsl:when>
					<xsl:when test="$label='results_sort-results'">Sorteer resultaten</xsl:when>
					<xsl:when test="$label='results_sort-category'">Sorteer categorie</xsl:when>
					<xsl:when test="$label='results_ascending'">Oplopend</xsl:when>
					<xsl:when test="$label='results_descending'">Aflopend</xsl:when>
					<xsl:when test="$label='results_result-desc'">Toon records XX tot YY van ZZ resultaten.</xsl:when>
					<xsl:when test="$label='results_coin'">munt</xsl:when>
					<xsl:when test="$label='results_coins'">munten</xsl:when>
					<xsl:when test="$label='results_hoard'">schatvondst</xsl:when>
					<xsl:when test="$label='results_hoards'">schatvondsten</xsl:when>
					<xsl:when test="$label='results_and'">en</xsl:when>
					<xsl:when test="$label='lang_ar'">Arabisch</xsl:when>
					<xsl:when test="$label='lang_de'">Duits</xsl:when>
					<xsl:when test="$label='lang_en'">Engels</xsl:when>
					<xsl:when test="$label='lang_fr'">Frans</xsl:when>
					<xsl:when test="$label='lang_ro'">Roemeens</xsl:when>
					<xsl:when test="$label='lang_pl'">Pools</xsl:when>
					<xsl:when test="$label='lang_ru'">Russisch</xsl:when>
					<xsl:when test="$label='lang_nl'">Nederlands</xsl:when>
					<xsl:when test="$label='lang_sv'">Zweeds</xsl:when>
					<xsl:when test="$label='lang_el'">Grieks</xsl:when>
					<xsl:when test="$label='lang_tr'">Turks</xsl:when>
					<xsl:when test="$label='lang_it'">Italiaans</xsl:when>
					<xsl:when test="$label='lang_da'">Deens</xsl:when>
					<xsl:when test="$label='lang_nn'">Noors</xsl:when>
					<xsl:when test="$label='lang_es'">Spaans</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgarian</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='ro'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Acas?</xsl:when>
					<xsl:when test="$label='header_browse'">Explore</xsl:when>
					<xsl:when test="$label='header_search'">C?utare</xsl:when>
					<xsl:when test="$label='header_maps'">H?r?i</xsl:when>
					<xsl:when test="$label='header_compare'">Comparativ</xsl:when>
					<xsl:when test="$label='header_language'">Limb?</xsl:when>
					<xsl:when test="$label='header_analyze'">Analiza tezaurelor</xsl:when>
					<xsl:when test="$label='header_visualize'">Vizualizarea cercet?rii</xsl:when>
					<xsl:when test="$label='display_summary'">Rezumat</xsl:when>
					<xsl:when test="$label='display_map'">Hart?</xsl:when>
					<xsl:when test="$label='display_administrative'">Administrativ</xsl:when>
					<xsl:when test="$label='display_visualization'">Vizualizare</xsl:when>
					<xsl:when test="$label='display_data-download'">Data desc?rc?rii</xsl:when>
					<xsl:when test="$label='display_quantitative'">Aniliza cantitativ?</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Analiza datelor</xsl:when>
					<xsl:when test="$label='display_contents'">Con?inut</xsl:when>
					<xsl:when test="$label='display_examples'">Exemple ale acestui tip</xsl:when>
					<xsl:when test="$label='results_all-terms'">To?i termenii</xsl:when>
					<xsl:when test="$label='results_map-results'">Rezultatele geografice</xsl:when>
					<xsl:when test="$label='results_filters'">Filtre</xsl:when>
					<xsl:when test="$label='results_keyword'">Cuvinte cheie</xsl:when>
					<xsl:when test="$label='results_clear-all'">?terge to?i termenii</xsl:when>
					<xsl:when test="$label='results_data-options'">Op?iuni asupra datelor</xsl:when>
					<xsl:when test="$label='results_refine-results'">Rafinare rezultate</xsl:when>
					<xsl:when test="$label='results_quick-search'">C?utare rapid?</xsl:when>
					<xsl:when test="$label='results_has-images'">Imagini disponibile</xsl:when>
					<xsl:when test="$label='results_refine-search'">C?utare detaliat?</xsl:when>
					<xsl:when test="$label='results_select'">Selectare din list?</xsl:when>
					<xsl:when test="$label='results_sort-results'">Clasificarea rezultatelor</xsl:when>
					<xsl:when test="$label='results_sort-category'">Sortare categorie</xsl:when>
					<xsl:when test="$label='results_ascending'">Ordine ascendent?</xsl:when>
					<xsl:when test="$label='results_descending'">Ordine descendent?</xsl:when>
					<xsl:when test="$label='results_result-desc'">Afi?are rezultate de la XX la YY din totalul de ZZ rezultate</xsl:when>
					<xsl:when test="$label='results_coin'">moned?</xsl:when>
					<xsl:when test="$label='results_coins'">monede</xsl:when>
					<xsl:when test="$label='results_hoard'">tezaur</xsl:when>
					<xsl:when test="$label='results_hoards'">tezaure</xsl:when>
					<xsl:when test="$label='results_and'">?i</xsl:when>
					<xsl:when test="$label='visualize_typological'">Analiz? tipologic?</xsl:when>
					<xsl:when test="$label='visualize_measurement'">Analiz? dimensiuni</xsl:when>
					<xsl:when test="$label='visualize_desc'">Utiliza?i selec?ia de date ?i op?iunile de vizualizare de mai jos pentru a genera harta pe baza parametrilor selecta?i. Instruc?iuni de
						utilizare pentru aceast? func?ie pot fi g?site aici.</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">Utiliza?i aceast? func?ie pentru a vizualiza procentajul sau cuantificarea urm?toarelor tipologii</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">Utiliza?i aceast? func?ie pentru a reda procentajul sau cuantificarea monedelor emise la o anumit? dat? din cadrul
						tezaurelor</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">Utiliza?i aceast? func?ie pentru a desc?rca CSV (valori separate prin virgul?) pentru cererea adresat? ?i tezaurele
						selectate</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">Selectare dimensiuni</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">Selectare tip de hart?</xsl:when>
					<xsl:when test="$label='visualize_categories'">Selectare Categorii pentru Analiz?</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">Selectare Tezaure</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">Selectare Tezaure pentru Compara?ie (op?ional)</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">Compara?ie pe Categorie</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">Compara?ie cu alte Cereri (op?ional)</xsl:when>
					<xsl:when test="$label='visualize_compare'">Comparare Categorii</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">Categorie de Compara?ie</xsl:when>
					<xsl:when test="$label='visualize_add_custom'">Ad?ugare Categorie aleatorie</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">Categorie aleatorie</xsl:when>
					<xsl:when test="$label='visualize_remove_query'">Eliminare categorie</xsl:when>
					<xsl:when test="$label='visualize_add_query'">Ad?ugare categorie</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">Ad?ugare categorii</xsl:when>
					<xsl:when test="$label='visualize_add_new'">Ad?ugare noutate</xsl:when>
					<xsl:when test="$label='visualize_query'">Categorie</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">Filtrare list?</xsl:when>
					<xsl:when test="$label='visualize_filter_query'">Filtrare categorie</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">Eliminare filtru</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">Utiliza?i meniul drop-down pentru a fomula criteriul de m?surare. Intervalul cronologic poate fi speificat doar o dat? pe
						cerere</xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">Set?ri op?ionale</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">Ascunde/arat? op?iuni</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">Pachet de op?iuni</xsl:when>
					<xsl:when test="$label='visualize_exclude_certainty_codes'">Excludere coduri de siguran??</xsl:when>
					<xsl:when test="$label='visualize_arrange'">Aranjare pe segmente (op?ional)</xsl:when>
					<xsl:when test="$label='visualize_interval'">Interval (ani)</xsl:when>
					<xsl:when test="$label='visualize_duration'">Perioad?</xsl:when>
					<xsl:when test="$label='visualize_calculate'">Calcul selec?ie</xsl:when>
					<xsl:when test="$label='visualize_generate'">Generare hart?</xsl:when>
					<xsl:when test="$label='numeric_count'">Cont</xsl:when>
					<xsl:when test="$label='numeric_percentage'">Procentaj</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">Cumulativ</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">Procentaj cumulativ</xsl:when>
					<xsl:when test="$label='chart_bar'">bar?</xsl:when>
					<xsl:when test="$label='chart_column'">coloan?</xsl:when>
					<xsl:when test="$label='chart_area'">arie</xsl:when>
					<xsl:when test="$label='chart_spline'">linie curb?</xsl:when>
					<xsl:when test="$label='chart_areaspline'">arie linie curb?</xsl:when>
					<xsl:when test="$label='chart_line'">linie</xsl:when>
					<xsl:when test="$label='visualize_alert'">Aten?ie</xsl:when>
					<xsl:when test="$label='visualize_error1'">Interval ?i perioad? sunt necesare</xsl:when>
					<xsl:when test="$label='visualize_error2'">Datarea pân? la...trebuie s? fie mai târziu decât Datare de la...</xsl:when>
					<xsl:when test="$label='visualize_error3'">Trebuie s? fie selectat? o categorie</xsl:when>
					<xsl:when test="$label='visualize_error4'">Pot fi selectate de la cel pu?in 1 tezaur pân? la maxim 8</xsl:when>
					<xsl:when test="$label='visualize_error5'">Pot fi selectate maxim 8 tezaure</xsl:when>
					<xsl:when test="$label='visualize_error6'">Pot fi selectate de la cel pu?in 1 tezaur pân? la maxim 30</xsl:when>
					<xsl:when test="$label='visualize_error7'">Pot fi selectate maxim 30 tezaure</xsl:when>
					<xsl:when test="$label='lang_ar'">Arab?</xsl:when>
					<xsl:when test="$label='lang_de'">German?</xsl:when>
					<xsl:when test="$label='lang_en'">Englez?</xsl:when>
					<xsl:when test="$label='lang_fr'">Francez?</xsl:when>
					<xsl:when test="$label='lang_ro'">Roman?</xsl:when>
					<xsl:when test="$label='lang_pl'">Polon?</xsl:when>
					<xsl:when test="$label='lang_ru'">Rus?</xsl:when>
					<xsl:when test="$label='lang_nl'">Olandez?</xsl:when>
					<xsl:when test="$label='lang_sv'">Suedez?</xsl:when>
					<xsl:when test="$label='lang_el'">Greac?</xsl:when>
					<xsl:when test="$label='lang_tr'">Turc?</xsl:when>
					<xsl:when test="$label='lang_it'">Italian?</xsl:when>
					<xsl:when test="$label='lang_da'">Danez?</xsl:when>
					<xsl:when test="$label='lang_nn'">Norvegian?</xsl:when>
					<xsl:when test="$label='lang_es'">Spaniol?</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgar?</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='ru'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">?? ???????</xsl:when>
					<xsl:when test="$label='header_browse'">?????</xsl:when>
					<xsl:when test="$label='header_search'">?????</xsl:when>
					<xsl:when test="$label='header_maps'">?????</xsl:when>
					<xsl:when test="$label='header_compare'">????????</xsl:when>
					<xsl:when test="$label='header_language'">????</xsl:when>
					<xsl:when test="$label='header_analyze'">?????? ??????</xsl:when>
					<xsl:when test="$label='header_visualize'">?????????? ???????</xsl:when>
					<xsl:when test="$label='display_summary'">??????</xsl:when>
					<xsl:when test="$label='display_map'">?????</xsl:when>
					<xsl:when test="$label='display_administrative'">?????????????????</xsl:when>
					<xsl:when test="$label='display_visualization'">???????????</xsl:when>
					<xsl:when test="$label='display_data-download'">???????? ??????</xsl:when>
					<xsl:when test="$label='display_quantitative'">?????????????? ??????</xsl:when>
					<xsl:when test="$label='display_date-analysis'">?????? ?????????</xsl:when>
					<xsl:when test="$label='display_contents'">??????????</xsl:when>
					<xsl:when test="$label='results_all-terms'">??? ????????</xsl:when>
					<xsl:when test="$label='results_map-results'">????? ???????????</xsl:when>
					<xsl:when test="$label='results_filters'">???????</xsl:when>
					<xsl:when test="$label='results_keyword'">???????? ?????</xsl:when>
					<xsl:when test="$label='results_clear-all'">???????? ??? ????????</xsl:when>
					<xsl:when test="$label='results_data-options'">???????? ?????? </xsl:when>
					<xsl:when test="$label='results_refine-results'">???????? ??????????</xsl:when>
					<xsl:when test="$label='results_quick-search'">??????? ?????</xsl:when>
					<xsl:when test="$label='results_has-images'">???????? ???????????</xsl:when>
					<xsl:when test="$label='results_refine-search'">???????? ?????</xsl:when>
					<xsl:when test="$label='results_select'">??????? ?? ??????</xsl:when>
					<xsl:when test="$label='results_sort-results'">??????????? ??????????</xsl:when>
					<xsl:when test="$label='results_sort-category'">??????????? ?????????</xsl:when>
					<xsl:when test="$label='results_ascending'">?? ???????????</xsl:when>
					<xsl:when test="$label='results_descending'">?? ????????</xsl:when>
					<xsl:when test="$label='results_result-desc'">?????????? ?????? XX ?? YY ?? ZZ ??????????? </xsl:when>
					<xsl:when test="$label='results_coin'">??????</xsl:when>
					<xsl:when test="$label='results_coins'">??????</xsl:when>
					<xsl:when test="$label='results_hoard'">????</xsl:when>
					<xsl:when test="$label='results_hoards'">?????</xsl:when>
					<xsl:when test="$label='results_and'">? </xsl:when>
					<xsl:when test="$label='lang_ar'">????????</xsl:when>
					<xsl:when test="$label='lang_de'">????????</xsl:when>
					<xsl:when test="$label='lang_en'">??????????</xsl:when>
					<xsl:when test="$label='lang_fr'">???????????</xsl:when>
					<xsl:when test="$label='lang_ro'">?????????</xsl:when>
					<xsl:when test="$label='lang_pl'">????????</xsl:when>
					<xsl:when test="$label='lang_ru'">???????</xsl:when>
					<xsl:when test="$label='lang_nl'">???????????</xsl:when>
					<xsl:when test="$label='lang_sv'">????????</xsl:when>
					<xsl:when test="$label='lang_el'">?????????</xsl:when>
					<xsl:when test="$label='lang_tr'">????????</xsl:when>
					<xsl:when test="$label='lang_it'">???????????</xsl:when>
					<xsl:when test="$label='lang_da'">???????</xsl:when>
					<xsl:when test="$label='lang_nn'">??????????</xsl:when>
					<xsl:when test="$label='lang_es'">?????????</xsl:when>
					<xsl:when test="$label='lang_bg'">??????????</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="numishare:normalizeLabel($label, 'en')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$lang='sv'">
				<xsl:choose>
					<xsl:when test="$label='header_home'">Home</xsl:when>
					<xsl:when test="$label='header_browse'">Skumma</xsl:when>
					<xsl:when test="$label='header_search'">Söka</xsl:when>
					<xsl:when test="$label='header_maps'">Kartor</xsl:when>
					<xsl:when test="$label='header_compare'">Jämföra</xsl:when>
					<xsl:when test="$label='header_language'">Språk</xsl:when>
					<xsl:when test="$label='header_analyze'">Fyndanalys</xsl:when>
					<xsl:when test="$label='header_visualize'">Visualisera sökfrågor</xsl:when>
					<xsl:when test="$label='display_summary'">Sammanfattning</xsl:when>
					<xsl:when test="$label='display_map'">Karta</xsl:when>
					<xsl:when test="$label='display_administrative'">Administrativ</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualisering</xsl:when>
					<xsl:when test="$label='display_data-download'">nerladdning av data</xsl:when>
					<xsl:when test="$label='display_quantitative'">Kvantitativ analys</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Data analys</xsl:when>
					<xsl:when test="$label='display_contents'">Innehåll</xsl:when>
					<xsl:when test="$label='results_all-terms'">Alla termer</xsl:when>
					<xsl:when test="$label='results_map-results'">Kartresultat</xsl:when>
					<xsl:when test="$label='results_filters'">Filter</xsl:when>
					<xsl:when test="$label='results_keyword'">Träfford</xsl:when>
					<xsl:when test="$label='results_clear-all'">Rensa alla termer</xsl:when>
					<xsl:when test="$label='results_data-options'">Data alternativ</xsl:when>
					<xsl:when test="$label='results_refine-results'">Filtrera resultaten</xsl:when>
					<xsl:when test="$label='results_quick-search'">Snabb sökning</xsl:when>
					<xsl:when test="$label='results_has-images'">Bilder tillgängliga</xsl:when>
					<xsl:when test="$label='results_refine-search'">Filtrera sökningen</xsl:when>
					<xsl:when test="$label='results_select'">Välja från listan</xsl:when>
					<xsl:when test="$label='results_sort-results'">Sortera resultaten</xsl:when>
					<xsl:when test="$label='results_sort-category'">Sortera kategorien</xsl:when>
					<xsl:when test="$label='results_ascending'">Stigande</xsl:when>
					<xsl:when test="$label='results_descending'">Minskande</xsl:when>
					<xsl:when test="$label='results_result-desc'">Visa poster XX till YY från ZZ resultater</xsl:when>
					<xsl:when test="$label='results_coin'">Mynt</xsl:when>
					<xsl:when test="$label='results_coins'">Mynten</xsl:when>
					<xsl:when test="$label='results_hoard'">Skattfynd</xsl:when>
					<xsl:when test="$label='results_hoards'">skattfynder</xsl:when>
					<xsl:when test="$label='results_and'">och</xsl:when>
					<xsl:when test="$label='lang_ar'">Arabiska</xsl:when>
					<xsl:when test="$label='lang_de'">Tyska</xsl:when>
					<xsl:when test="$label='lang_en'">Engelska</xsl:when>
					<xsl:when test="$label='lang_fr'">Franska</xsl:when>
					<xsl:when test="$label='lang_ro'">Rumänska</xsl:when>
					<xsl:when test="$label='lang_pl'">Polska</xsl:when>
					<xsl:when test="$label='lang_ru'">Ryska</xsl:when>
					<xsl:when test="$label='lang_nl'">Nederländska</xsl:when>
					<xsl:when test="$label='lang_sv'">Svenska</xsl:when>
					<xsl:when test="$label='lang_el'">Grekiska</xsl:when>
					<xsl:when test="$label='lang_tr'">Turkiska</xsl:when>
					<xsl:when test="$label='lang_it'">Italienska</xsl:when>
					<xsl:when test="$label='lang_da'">Danska</xsl:when>
					<xsl:when test="$label='lang_nn'">Norska</xsl:when>
					<xsl:when test="$label='lang_es'">Spanska</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgariska</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<!-- header menu labels -->
					<xsl:when test="$label='header_home'">Home</xsl:when>
					<xsl:when test="$label='header_search'">Search</xsl:when>
					<xsl:when test="$label='header_browse'">Browse</xsl:when>
					<xsl:when test="$label='header_maps'">Maps</xsl:when>
					<xsl:when test="$label='header_compare'">Compare</xsl:when>
					<xsl:when test="$label='header_analyze'">Analyze Hoards</xsl:when>
					<xsl:when test="$label='header_visualize'">Visualize Queries</xsl:when>
					<xsl:when test="$label='header_language'">Language</xsl:when>
					<xsl:when test="$label='display_summary'">Summary</xsl:when>
					<xsl:when test="$label='display_administrative'">Administrative</xsl:when>
					<xsl:when test="$label='display_commentary'">Commentary</xsl:when>
					<xsl:when test="$label='display_map'">Map</xsl:when>
					<xsl:when test="$label='display_contents'">Contents</xsl:when>
					<xsl:when test="$label='display_quantitative'">Quantitative Analysis</xsl:when>
					<xsl:when test="$label='display_visualization'">Visualization</xsl:when>
					<xsl:when test="$label='display_data-download'">Data Download</xsl:when>
					<xsl:when test="$label='display_date-analysis'">Date Analysis</xsl:when>
					<xsl:when test="$label='display_examples'">Examples of this type</xsl:when>
					<xsl:when test="$label='results_all-terms'">All Terms</xsl:when>
					<xsl:when test="$label='results_map-results'">Map Results</xsl:when>
					<xsl:when test="$label='results_filters'">Filters</xsl:when>
					<xsl:when test="$label='results_keyword'">Keyword</xsl:when>
					<xsl:when test="$label='results_clear-all'">Clear All Terms</xsl:when>
					<xsl:when test="$label='results_data-options'">Data Options</xsl:when>
					<xsl:when test="$label='results_refine-results'">Refine Results</xsl:when>
					<xsl:when test="$label='results_quick-search'">Quick Search</xsl:when>
					<xsl:when test="$label='results_has-images'">Has Images</xsl:when>
					<xsl:when test="$label='results_refine-search'">Refine Search</xsl:when>
					<xsl:when test="$label='results_select'">Select from List</xsl:when>
					<xsl:when test="$label='results_sort-results'">Sort Results</xsl:when>
					<xsl:when test="$label='results_sort-category'">Sort Category</xsl:when>
					<xsl:when test="$label='results_ascending'">Ascending</xsl:when>
					<xsl:when test="$label='results_descending'">Descending</xsl:when>
					<xsl:when test="$label='results_result-desc'">Displaying records XX to YY of ZZ total results.</xsl:when>
					<xsl:when test="$label='results_coin'">coin</xsl:when>
					<xsl:when test="$label='results_coins'">coins</xsl:when>
					<xsl:when test="$label='results_hoard'">hoard</xsl:when>
					<xsl:when test="$label='results_hoards'">hoards</xsl:when>
					<xsl:when test="$label='results_and'">and</xsl:when>
					<xsl:when test="$label='visualize_typological'">Typological Analysis</xsl:when>
					<xsl:when test="$label='visualize_measurement'">Measurement Analysis</xsl:when>
					<xsl:when test="$label='visualize_desc'">Use the data selection and visualization options below to generate a chart based on selected parameters. Instructions for using this
						feature can be found here</xsl:when>
					<xsl:when test="$label='visualize_type_desc'">Use this feature to visualize percentages or numeric occurrences of the following typologies</xsl:when>
					<xsl:when test="$label='visualize_date_desc'">Use this feature to render percentages or numeric occurrences of coins of a particular date within hoards</xsl:when>
					<xsl:when test="$label='visualize_csv_desc'">Use this feature to download a CSV for the given query and selected hoards</xsl:when>
					<xsl:when test="$label='visualize_response_type'">Select Numeric Response Type</xsl:when>
					<xsl:when test="$label='visualize_select_measurement'">Select Measurement</xsl:when>
					<xsl:when test="$label='visualize_chart_type'">Select Chart Type</xsl:when>
					<xsl:when test="$label='visualize_categories'">Select Categories for Analysis</xsl:when>
					<xsl:when test="$label='visualize_select_hoards'">Select Hoards</xsl:when>
					<xsl:when test="$label='visualize_select_hoards_optional'">Select Hoards to Compare (optional)</xsl:when>
					<xsl:when test="$label='visualize_compare'">Compare Queries</xsl:when>
					<xsl:when test="$label='visualize_compare_category'">Compare by Category</xsl:when>
					<xsl:when test="$label='visualize_filter_list'">Filter List</xsl:when>
					<xsl:when test="$label='visualize_filter_query'">Filter Query</xsl:when>
					<xsl:when test="$label='visualize_remove_filter'">Remove Filter</xsl:when>
					<xsl:when test="$label='visualize_add_custom'">Custom Queries</xsl:when>
					<xsl:when test="$label='visualize_custom_query'">Custom Query</xsl:when>
					<xsl:when test="$label='visualize_compare_optional'">Compare to other Queries (optional)</xsl:when>
					<xsl:when test="$label='visualize_comparison_query'">Comparison Query</xsl:when>
					<xsl:when test="$label='visualize_remove_query'">Remove Query</xsl:when>
					<xsl:when test="$label='visualize_query'">Query</xsl:when>
					<xsl:when test="$label='visualize_add_query'">Add Query</xsl:when>
					<xsl:when test="$label='visualize_add_queries'">Add Queries</xsl:when>
					<xsl:when test="$label='visualize_add_new'">Add New</xsl:when>
					<xsl:when test="$label='visualize_add_query_desc'">Use the drop-down menus below to formulate your measurement query. A date range can only be specified once per query.</xsl:when>
					<xsl:when test="$label='visualize_optional_settings'">Optional Settings</xsl:when>
					<xsl:when test="$label='visualize_hide-show'">Hide/Show Options</xsl:when>
					<xsl:when test="$label='visualize_stacking_options'">Stacking Options</xsl:when>
					<xsl:when test="$label='visualize_remove_certainty_codes'">Remove Certainty Codes</xsl:when>
					<xsl:when test="$label='visualize_arrange'">Arrange by Interval (optional)</xsl:when>
					<xsl:when test="$label='visualize_interval'">Interval (years)</xsl:when>
					<xsl:when test="$label='visualize_duration'">Duration</xsl:when>
					<xsl:when test="$label='visualize_calculate'">Calculate Selected</xsl:when>
					<xsl:when test="$label='visualize_generate'">Generate Chart</xsl:when>
					<xsl:when test="$label='numeric_count'">Count</xsl:when>
					<xsl:when test="$label='numeric_percentage'">Percentage</xsl:when>
					<xsl:when test="$label='numeric_cumulative'">Cumulative</xsl:when>
					<xsl:when test="$label='numeric_cumulative_percentage'">Cumulative Percentage</xsl:when>
					<xsl:when test="$label='chart_bar'">bar</xsl:when>
					<xsl:when test="$label='chart_column'">column</xsl:when>
					<xsl:when test="$label='chart_area'">area</xsl:when>
					<xsl:when test="$label='chart_spline'">spline</xsl:when>
					<xsl:when test="$label='chart_areaspline'">areaspline</xsl:when>
					<xsl:when test="$label='chart_line'">line</xsl:when>
					<xsl:when test="$label='visualize_alert'">Alert</xsl:when>
					<xsl:when test="$label='visualize_error1'">Interval and duration are required.</xsl:when>
					<xsl:when test="$label='visualize_error2'">To Date must be later than From Date.</xsl:when>
					<xsl:when test="$label='visualize_error3'">A category must be selected.</xsl:when>
					<xsl:when test="$label='visualize_error4'">At least 1 and up to 8 hoards may be selected.</xsl:when>
					<xsl:when test="$label='visualize_error5'">Up to 8 hoards may be selected.</xsl:when>
					<xsl:when test="$label='visualize_error6'">At least 1 and up to 30 hoards may be selected.</xsl:when>
					<xsl:when test="$label='visualize_errory'">Up to 30 hoards may be selected.</xsl:when>
					<xsl:when test="$label='lang_ar'">Arabic</xsl:when>
					<xsl:when test="$label='lang_bg'">Bulgarian</xsl:when>
					<xsl:when test="$label='lang_de'">German</xsl:when>
					<xsl:when test="$label='lang_en'">English</xsl:when>
					<xsl:when test="$label='lang_fr'">French</xsl:when>
					<xsl:when test="$label='lang_ro'">Romanian</xsl:when>
					<xsl:when test="$label='lang_pl'">Polish</xsl:when>
					<xsl:when test="$label='lang_ru'">Russian</xsl:when>
					<xsl:when test="$label='lang_nl'">Dutch</xsl:when>
					<xsl:when test="$label='lang_sv'">Swedish</xsl:when>
					<xsl:when test="$label='lang_el'">Greek</xsl:when>
					<xsl:when test="$label='lang_tr'">Turkish</xsl:when>
					<xsl:when test="$label='lang_it'">Italian</xsl:when>
					<xsl:when test="$label='lang_da'">Danish</xsl:when>
					<xsl:when test="$label='lang_nn'">Norwegian</xsl:when>
					<xsl:when test="$label='lang_es'">Spanish</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('[', $label, ']')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="numishare:normalizeYear">
		<xsl:param name="year" as="xs:integer"/>

		<xsl:choose>
			<xsl:when test="$year &lt; 0">
				<xsl:value-of select="abs($year)"/>
				<xsl:text> B.C.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$year &lt;=400">
					<xsl:text>A.D. </xsl:text>
				</xsl:if>
				<xsl:value-of select="$year"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="numishare:normalize_century">
		<xsl:param name="name"/>
		<xsl:variable name="cleaned" select="number(translate($name, '\', ''))"/>
		<xsl:variable name="century" select="abs($cleaned)"/>
		<xsl:variable name="suffix">
			<xsl:choose>
				<xsl:when test="$century mod 10 = 1 and $century != 11">
					<xsl:text>st</xsl:text>
				</xsl:when>
				<xsl:when test="$century mod 10 = 2 and $century != 12">
					<xsl:text>nd</xsl:text>
				</xsl:when>
				<xsl:when test="$century mod 10 = 3 and $century != 13">
					<xsl:text>rd</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>th</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="concat($century, $suffix)"/>
		<xsl:if test="$cleaned &lt; 0">
			<xsl:text> B.C.</xsl:text>
		</xsl:if>
	</xsl:function>

	<xsl:function name="numishare:getNomismaLabel">
		<xsl:param name="rdf" as="element()*"/>
		<xsl:param name="lang"/>

		<xsl:choose>
			<xsl:when test="string($lang)">
				<xsl:choose>
					<xsl:when test="$rdf/skos:prefLabel[@xml:lang=$lang][1]">
						<xsl:value-of select="$rdf/skos:prefLabel[@xml:lang=$lang][1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$rdf/skos:prefLabel[@xml:lang='en'][1]"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$rdf/skos:prefLabel[@xml:lang='en']"/>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:function>

</xsl:stylesheet>