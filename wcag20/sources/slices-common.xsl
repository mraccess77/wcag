<?xml version="1.0" encoding="utf-8"?>
<!--This file was created automatically by html2xhtml-->
<!--from the HTML stylesheets. Do not edit this file.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="xmlspec-wcag-howto.xsl"/>
	<xsl:param name="slices" select="1"/>
	<xsl:template name="href.target">
		<xsl:param name="target" select="."/>
		<xsl:variable name="slice" select="($target/ancestor-or-self::div1                         |$target/ancestor-or-self::inform-div1                         |$target/ancestor-or-self::spec)[last()]"/>
		<xsl:apply-templates select="$slice" mode="slice-filename"/>
		<xsl:if test="$target != $slice">
			<xsl:text>#</xsl:text>
			<xsl:choose>
				<xsl:when test="$target/@id">
					<xsl:value-of select="$target/@id"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:message terminate="yes">Generating ID for <xsl:value-of select="$target"/></xsl:message>
					<xsl:value-of select="generate-id($target)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="spec" mode="slice-filename">
		<xsl:text>Overview.html</xsl:text>
	</xsl:template>
	<xsl:template match="front/div1[@id='intro']" mode="slice-filename">
		<xsl:text>intro</xsl:text>
		<xsl:text>.html</xsl:text>
	</xsl:template>
	<xsl:template match="front/div1[@id='conformance']" mode="slice-filename">
		<xsl:text>conformance</xsl:text>
		<xsl:text>.html</xsl:text>
	</xsl:template>
	<xsl:template match="body/div1" mode="slice-filename">
		<xsl:text>guidelines.html</xsl:text>
	</xsl:template>
	<xsl:template match="back/div1 | inform-div1" mode="slice-filename">
		<xsl:variable name="docnumber">
			<xsl:number count="div1|inform-div1" level="multiple" format="A"/>
		</xsl:variable>
		<xsl:text>appendix</xsl:text>
		<xsl:value-of select="$docnumber"/>
		<xsl:text>.html</xsl:text>
	</xsl:template>
	<!-- create a separate page for the introduction -->
	<xsl:template match="front/div1">
		<xsl:variable name="prev" select="(preceding::div1| ancestor::spec)[last()]"/>
		<xsl:variable name="next" select="(following::div1|following::inform-div1)[1]"/>
		<xsl:call-template name="write.chunk">
			<xsl:with-param name="filename">
				<xsl:apply-templates select="." mode="slice-filename"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:if test="header/langusage/language">
						<xsl:attribute name="lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
						<xsl:attribute name="xml:lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
					</xsl:if>
					<head>
						<title>
							<xsl:value-of select="head"/> to Web Content Accessibility Guidelines 2.0
						</title>
						<link rel="stylesheet" type="text/css" href="slicenav.css" xmlns="http://www.w3.org/1999/xhtml"/>
						<xsl:call-template name="css"/>
					</head>
					<body>
					<xsl:if test="$show.diff.markup != 0">
          <div xmlns="http://www.w3.org/1999/xhtml">
            <p>The presentation of this document has been augmented to
            identify changes from a previous version. Three kinds of changes
            are highlighted: <span class="diff-add" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin add]</span> new, added text <span class="difftext">[end add]</span></span>,
            <span class="diff-change" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin change]</span> changed text <span class="difftext">[end change]</span></span>, and
            <span class="diff-delete" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin delete]</span> deleted text <span class="difftext">[end delete]</span></span>.</p>
            <hr/>
          </div>
        </xsl:if>
						<xsl:call-template name="navigation.top">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
						<div class="div1">
							<xsl:apply-templates/>
						</div>
						<xsl:call-template name="navigation.bottom">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
					</body>
				</html>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="body/div1" xmlns="http://www.w3.org/1999/xhtml">
		<xsl:variable name="prev" select="(preceding::div1|preceding::inform-div1)[last()]"/>
		<xsl:variable name="next" select="(following::div1|following::inform-div1)[1]"/>
		<xsl:call-template name="write.chunk">
			<xsl:with-param name="filename">
				<xsl:apply-templates select="." mode="slice-filename"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<html xml:lang="en-US" lang="en-US">
					<xsl:if test="header/langusage/language">
						<xsl:attribute name="lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
						<xsl:attribute name="xml:lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
					</xsl:if>
					<head>
						<title>
							<xsl:value-of select="head"/>
						</title>
						<link rel="stylesheet" type="text/css" href="slicenav.css"/>
						<xsl:call-template name="css"/>
					</head>
					<body>
					<xsl:if test="$show.diff.markup != 0">
          <div xmlns="http://www.w3.org/1999/xhtml">
            <p>The presentation of this document has been augmented to
            identify changes from a previous version. Three kinds of changes
            are highlighted: <span class="diff-add" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin add]</span> new, added text <span class="difftext">[end add]</span></span>,
            <span class="diff-change" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin change]</span> changed text <span class="difftext">[end change]</span></span>, and
            <span class="diff-delete" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin delete]</span> deleted text <span class="difftext">[end delete]</span></span>.</p>
            <hr/>
          </div>
        </xsl:if>
						<xsl:call-template name="navigation.top">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
						<div class="div1">
							<xsl:apply-templates/>
						</div>
						<xsl:call-template name="navigation.bottom">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
					</body>
				</html>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="back/div1 | back/inform-div1">
		<xsl:variable name="prev" select="(preceding::div1|preceding::inform-div1)[last()]"/>
		<xsl:variable name="next" select="(following::div1|following::inform-div1)[1]"/>
		<xsl:call-template name="write.chunk">
			<xsl:with-param name="filename">
				<xsl:apply-templates select="." mode="slice-filename"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:if test="header/langusage/language">
						<xsl:attribute name="lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
						<xsl:attribute name="xml:lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
					</xsl:if>
					<head>
						<title><xsl:value-of select="head"/><xsl:text> </xsl:text>
						<xsl:choose>
        <xsl:when test="@id='glossary'">to Web Content Accessibility Guidelines 2.0</xsl:when>
        <xsl:otherwise>for Web Content Accessibility Guidelines 2.0</xsl:otherwise>
      </xsl:choose>
							
						</title>
						<link rel="stylesheet" type="text/css" href="slicenav.css"/>
						<xsl:call-template name="css"/>
					</head>
					<body>
					<xsl:if test="$show.diff.markup != 0">
          <div xmlns="http://www.w3.org/1999/xhtml">
            <p>The presentation of this document has been augmented to
            identify changes from a previous version. Three kinds of changes
            are highlighted: <span class="diff-add" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin add]</span> new, added text <span class="difftext">[end add]</span></span>,
            <span class="diff-change" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin change]</span> changed text <span class="difftext">[end change]</span></span>, and
            <span class="diff-delete" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin delete]</span> deleted text <span class="difftext">[end delete]</span></span>.</p>
            <hr/>
          </div>
        </xsl:if>
						<xsl:call-template name="navigation.top">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
						<div class="div1">
							<xsl:apply-templates/>
						</div>
						<xsl:call-template name="navigation.bottom">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
					</body>
				</html>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="inform-div1">
		<xsl:variable name="prev" select="(preceding::div1|preceding::inform-div1)[last()]"/>
		<xsl:variable name="next" select="(following::div1|following::inform-div1)[1]"/>
		<xsl:call-template name="write.chunk">
			<xsl:with-param name="filename">
				<xsl:apply-templates select="." mode="slice-filename"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:if test="header/langusage/language">
						<xsl:attribute name="lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
						<xsl:attribute name="xml:lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
					</xsl:if>
					<head>
						<title>
							<xsl:value-of select="head"/>: Web Content Accessibility Guidelines 2.0
						</title>
						<link rel="stylesheet" type="text/css" href="slicenav.css"/>
						<xsl:call-template name="css"/>
					</head>
					<body>
					<xsl:if test="$show.diff.markup != 0">
          <div xmlns="http://www.w3.org/1999/xhtml">
           <p>The presentation of this document has been augmented to
            identify changes from a previous version. Three kinds of changes
            are highlighted: <span class="diff-add" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin add]</span> new, added text <span class="difftext">[end add]</span></span>,
            <span class="diff-change" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin change]</span> changed text <span class="difftext">[end change]</span></span>, and
            <span class="diff-delete" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin delete]</span> deleted text <span class="difftext">[end delete]</span></span>.</p>
            <hr/>
          </div>
        </xsl:if>
						<xsl:call-template name="navigation.top">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
						<div class="div1">
							<xsl:apply-templates/>
						</div>
						<xsl:call-template name="navigation.bottom">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
					</body>
				</html>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="spec">
		<xsl:call-template name="write.chunk">
			<xsl:with-param name="filename">
				<xsl:apply-templates select="." mode="slice-filename"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:if test="header/langusage/language">
						<xsl:attribute name="lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
						<xsl:attribute name="xml:lang"><xsl:value-of select="header/langusage/language/@id"/></xsl:attribute>
					</xsl:if>
					<head>
						<title>
							<xsl:value-of select="header/title"/>
							<xsl:if test="header/version">
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="header/version"/>
							</xsl:if>
						</title>
						<link rel="stylesheet" type="text/css" href="slicenav.css"/>
						<xsl:call-template name="css"/>
					</head>
					<body>
					<xsl:if test="$show.diff.markup != 0">
          <div xmlns="http://www.w3.org/1999/xhtml">
            <p>The presentation of this document has been augmented to
            identify changes from a previous version. Three kinds of changes
            are highlighted: <span class="diff-add" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin add]</span> new, added text <span class="difftext">[end add]</span></span>,
            <span class="diff-change" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin change]</span> changed text <span class="difftext">[end change]</span></span>, and
            <span class="diff-delete" xmlns="http://www.w3.org/1999/xhtml"><span class="difftext">[begin delete]</span> deleted text <span class="difftext">[end delete]</span></span>.</p>
            <hr/>
          </div>
        </xsl:if>
						<a name="top" xmlns="http://www.w3.org/1999/xhtml"> </a>
						<xsl:apply-templates></xsl:apply-templates>
						<xsl:if test="//footnote">
							<hr/>
							<div class="endnotes">
								<h3>
									<a name="endnotes">
										<xsl:text>End Notes</xsl:text>
									</a>
								</h3>
								<dl>
									<xsl:apply-templates select="//footnote" mode="notes"/>
								</dl>
							</div>
						</xsl:if>
						<xsl:variable name="next" select="(descendant::div1)[1]"/>
						<xsl:call-template name="navigation.bottom">
							<xsl:with-param name="next" select="$next"/>
						</xsl:call-template>
					</body>
				</html>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	

	<xsl:template name="navigation.top">
		<xsl:param name="prev" select="''"/>
		<xsl:param name="next" select="''"/>
		<a name="top" xmlns="http://www.w3.org/1999/xhtml">
			<xsl:text> </xsl:text>
		</a>
		<xsl:comment> TOP NAVIGATION BAR </xsl:comment>
		<ul id="navigation" xmlns="http://www.w3.org/1999/xhtml">
			<li>
				<a href="./#contents">Table of Contents</a>
			</li>
			<xsl:choose>
				<xsl:when test="$prev">
					<li>
						<a>
							<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="$prev"/><xsl:with-param name="just.filename" select="1"/></xsl:call-template></xsl:attribute>
							<xsl:text>Previous Section</xsl:text>
						</a>
					</li>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$next">
					<li xmlns="http://www.w3.org/1999/xhtml">
						<a>
							<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="$next"/><xsl:with-param name="just.filename" select="1"/></xsl:call-template></xsl:attribute>
							<xsl:text>Next Section</xsl:text>
						</a>
					</li>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</ul>
		<!-- quick table of contents -->
		<hr xmlns="http://www.w3.org/1999/xhtml"/>
		<strong xmlns="http://www.w3.org/1999/xhtml">Quick Table of Contents</strong>
		<hr xmlns="http://www.w3.org/1999/xhtml"/>
		<ul class="toc" xmlns="http://www.w3.org/1999/xhtml">
			<xsl:apply-templates mode="toc" select=".">
				<xsl:with-param name="just.filename" select="'0'"/>
			</xsl:apply-templates>
		</ul>
	</xsl:template>

<!-- bottom navigation template-->	
	
	<xsl:template name="navigation.bottom">
		<xsl:param name="prev" select="''"/>
		<xsl:param name="next" select="''"/>
		<xsl:comment> BOTTOM NAVIGATION BAR </xsl:comment>
		<ul id="navigationbottom" xmlns="http://www.w3.org/1999/xhtml">
			<li>
				<a href="./#contents">Table of Contents</a>
			</li>
			<xsl:choose>
				<xsl:when test="$prev">
					<li>
						<a>
							<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="$prev"/><xsl:with-param name="just.filename" select="1"/></xsl:call-template></xsl:attribute>
							<xsl:text>Previous Section</xsl:text>
						</a>
					</li>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$next">
					<li>
						<a>
							<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="$next"/><xsl:with-param name="just.filename" select="1"/></xsl:call-template></xsl:attribute>
							<xsl:text>Next Section</xsl:text>
						</a>
					</li>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<li>
				<a href="#top">Top</a>
			</li>
		</ul>
	</xsl:template>
	<!-- BBC This template generates the TOC for the guidelines pages (points to each criterion and technique) -->
	<xsl:template mode="guidelinetoc" match="div3">
		<li>
			<a>
				<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="."/></xsl:call-template></xsl:attribute>
				<xsl:apply-templates select="." mode="divnum"/>
				<xsl:choose>
					<xsl:when test="@role='extsrc'">
						<xsl:value-of select="$gl-src//item[@id=current()/@id]/p"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="short-name" mode="text"/>
						<xsl:apply-templates select="head" mode="text"/>
					</xsl:otherwise>
				</xsl:choose>
			</a>
			<xsl:if test="$toc.level &gt; 1">
				<xsl:variable name="children1">
					<xsl:value-of select="count(div3 | technique)"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$children1 = 0"/>
					<xsl:otherwise>
						<ul>
							<xsl:for-each select="div3 | technique">
								<li>
									<a>
										<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="."/></xsl:call-template></xsl:attribute>
										<xsl:apply-templates select="." mode="divnum"/>
										<xsl:choose>
											<xsl:when test="@role='extsrc'">
												<xsl:value-of select="$gl-src//item[@id=current()/@id]/p"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="short-name" mode="text"/>
												<xsl:apply-templates select="head" mode="text"/>
											</xsl:otherwise>
										</xsl:choose>
									</a>
									<xsl:if test="$toc.level &gt; 2">
										<xsl:variable name="children2">
											<xsl:value-of select="count(technique)"/>
										</xsl:variable>
										<xsl:choose>
											<xsl:when test="$children2 = 0"/>
											<xsl:otherwise>
												<ul>
													<xsl:for-each select="technique">
														<li>
															<xsl:apply-templates select="." mode="divnum"/>
															<a>
																<xsl:attribute name="href"><xsl:call-template name="href.target"><xsl:with-param name="target" select="."/></xsl:call-template></xsl:attribute>
																<xsl:value-of select="short-name"/>
															</a>
														</li>
													</xsl:for-each>
												</ul>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</li>
	</xsl:template>
	<!-- BBC override templates for divN/head so that slices have correct header nesting -->
	<xsl:template match="div1/head">
		<xsl:choose>
			<xsl:when test="../@role='principle'">
				<h1 class="principle" xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="anchor">
						<xsl:with-param name="conditional" select="0"/>
						<xsl:with-param name="node" select=".."/>
					</xsl:call-template>
					<xsl:apply-templates/>
				</h1>
			</xsl:when>
			<xsl:otherwise>
				<h1 xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="anchor">
						<xsl:with-param name="conditional" select="0"/>
						<xsl:with-param name="node" select=".."/>
					</xsl:call-template>
					<xsl:apply-templates select=".." mode="divnum"/>
					<xsl:apply-templates/>
				</h1>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

		<xsl:template match="loc">
		<xsl:choose>
			<xsl:when test="@linktype='general'">
				<a href="{$techs-src//publoc/loc[@href]}{@href}.html" xmlns="http://www.w3.org/1999/xhtml" class="tech-ref">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:when test="@linktype='html'">
				<a href="{$techs-src//publoc/loc[@href]}#{@href}" xmlns="http://www.w3.org/1999/xhtml" class="tech-ref">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:when test="@linktype='guideline'">
				<a href="{$gl-src//publoc/loc[@href]}guidelines.html#{@href}" xmlns="http://www.w3.org/1999/xhtml" class="gl-ref">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:when test="@linktype='css'">
				<a href="{$techs-src//publoc/loc[@href]}#{@href}" xmlns="http://www.w3.org/1999/xhtml" class="tech-ref">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:when test="@linktype='script'">
				<a href="{$techs-src//publoc/loc[@href]}#{@href}" xmlns="http://www.w3.org/1999/xhtml" class="tech-ref">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
					<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
					<xsl:if test="@id">
						<xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
					</xsl:if>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
