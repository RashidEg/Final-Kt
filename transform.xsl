<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Рекурсивный шаблон для подсчёта суммы -->
  <xsl:template name="sum">
    <xsl:param name="current"/>  <!-- текущее число -->
    <xsl:param name="to"/>       <!-- конечное число -->
    <xsl:param name="acc" select="0"/>  <!-- накопитель суммы -->

    <xsl:choose>
      <!-- Если текущее число больше конечного — возвращаем накопленную сумму -->
      <xsl:when test="$current > $to">
        <xsl:value-of select="$acc"/>
      </xsl:when>
      <!-- Иначе — прибавляем текущее число и вызываем шаблон снова -->
      <xsl:otherwise>
        <xsl:call-template name="sum">
          <xsl:with-param name="current" select="$current + 1"/>
          <xsl:with-param name="to"      select="$to"/>
          <xsl:with-param name="acc"     select="$acc + $current"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">
    <xsl:call-template name="sum">
      <xsl:with-param name="current" select="sum-of-sequence/from"/>
      <xsl:with-param name="to"      select="sum-of-sequence/to"/>
      <xsl:with-param name="acc"     select="0"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
