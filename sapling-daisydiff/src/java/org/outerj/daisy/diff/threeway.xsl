<?xml version="1.0"?>
<!--
  Copyright 2004 Guy Van den Broeck

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
   <merge>
   	  <xsl:choose>
   	  	<xsl:when test="//span[contains(@class,'diff-html-conflict')]">
      		<conflict>true</conflict>
      	</xsl:when>
      	<xsl:otherwise>
      		<conflict>false</conflict>
      	</xsl:otherwise>
      </xsl:choose>
      <body>
	     <xsl:apply-templates select="diffreport/diff/node()"/>
	  </body>
   </merge>
</xsl:template>

<xsl:template match="@*|node()">
<xsl:copy>
  <xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:template>

<xsl:template match="img">
<img>
  <xsl:copy-of select="@*"/>
</img>
</xsl:template>

<xsl:template match="span[@class='diff-html-changed']">
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="span[@class='diff-html-added']">
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="span[@class='diff-html-removed']">
</xsl:template>

<xsl:template match="span[@class='diff-html-conflict-yours']">
  <xsl:if test="not(preceding::span[1][@class='diff-html-conflict-yours'])">
  	<strong class="editConflict">Edit conflict! Your version:</strong>
  </xsl:if>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template match="span[@class='diff-html-conflict-theirs']">
  <xsl:if test="not(preceding::span[1][@class='diff-html-conflict-theirs'])">
  	<strong class="editConflict">Edit conflict! Other version:</strong>
  </xsl:if>
  <xsl:apply-templates select="node()"/>
</xsl:template>

</xsl:stylesheet>
