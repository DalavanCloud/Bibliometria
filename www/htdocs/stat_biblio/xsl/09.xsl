<?xml version="1.0" encoding="iso-8859-1" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="xsl/common.xsl" />	

    <xsl:variable name="selected_option">
        <xsl:copy-of select="//selection_list/selection[@name='journal']/option_list/option[@issn=$issn]"/>
    </xsl:variable>

	<xsl:template match="*" mode="html-body">
		<xsl:comment>
	
		**** File: 9.xsl
		template match="*" mode="html-body"
		
		</xsl:comment>
		<body>
			<form>
				<xsl:attribute name="action">
					<xsl:value-of select="'index.php'" />
				</xsl:attribute>
				<xsl:attribute name="Xmethod">
					<xsl:value-of select="'post'" />
				</xsl:attribute>
				<xsl:attribute name="onsubmit">javascript: return validate_9(this)</xsl:attribute>
				<input>
					<xsl:attribute name="type">
						<xsl:value-of select="'hidden'" />
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="'state'" />
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$root/form/state" />
					</xsl:attribute>
				</input>
				<!--input>
					<xsl:attribute name="type">
						<xsl:value-of select="'hidden'" />
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="'server_action'" />
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$server_action" />
					</xsl:attribute>
				</input-->
				<input>
					<xsl:attribute name="type">
						<xsl:value-of select="'hidden'" />
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="'lang'" />
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$lang" />
					</xsl:attribute>
				</input>
				<input>
					<xsl:attribute name="type">
						<xsl:value-of select="'hidden'" />
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="'country'" />
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$country" />
					</xsl:attribute>
				</input>				
				<!-- 
				<input>
					<xsl:attribute name="type">
						<xsl:value-of select="'hidden'" />
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="'debug'" />
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="'xml'" />
					</xsl:attribute>
				</input>
				-->
				<input type="hidden" name="ng" value="b"/>
                <xsl:if test="$issn != ''">
                    <input type="hidden" name="issn" value="{$issn}"/>
                </xsl:if>                
                <xsl:apply-templates select="$selected_option/option/value" mode="cited-hidden"/>
                
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td width="20%">
							<p align="center">
                                    
        								<xsl:call-template name="logo"/>
                                  
							</p>
						</td>
						<td align="center" width="80%">
							<blockquote>
								<p align="left">
									<font size="+1" color="#000080">
                                        <xsl:choose>
                                            <xsl:when test="$selected_option/*"><xsl:value-of select="$selected_option/option/label_list/label[@lang = $lang]" /></xsl:when>
                                            <xsl:otherwise><xsl:value-of select="$root/title_list/title[@lang = $lang]" /></xsl:otherwise>
                                        </xsl:choose>
									</font>
                                    <xsl:if test="$selected_option/*">
                                        <br/><font class="nomodel" color="#000080">ISSN <xsl:value-of select="$issn"/></font>
                                    </xsl:if>
								</p>
							</blockquote>
						</td>
					</tr>
					<tr>
						<td>&#160;</td>
						<td>
							<blockquote>
								<p>
									<font color="#800000">
										<xsl:value-of select="$root/subtitle_list/subtitle[@lang = $lang]" />
									</font>
								</p>
							</blockquote>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<table border="0" cellpadding="2" cellspacing="2" align="center" width="90%">							
								<tr>
									<td width="30%" valign="top" align="right">
										<p align="right">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='year_cited']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='year_cited']">
											<xsl:with-param name="size" select="'8'"></xsl:with-param>
										</xsl:apply-templates>
									</td>
									<td width="1%">&#160;</td>
									<td width="69%" align="left">
                                        <xsl:if test="not($selected_option/*)">                                    
    										<!--p align="left">
    											<font color="#000080">
    												<xsl:value-of select="$root/selection_list/selection[@name='journal']/label_list/label[@lang = $lang]" />
    											</font>
    										</p-->
    										<xsl:apply-templates select="$root/selection_list/selection[@name='journal']">
    											<xsl:with-param name="size" select="'10'"></xsl:with-param>
    										</xsl:apply-templates>
                                            <p>
                                            <xsl:variable name="nao_agrupado" select="$server_action"/>
                                            <xsl:variable name="agrupado" select="$root/form/action2"/>
<!--                                        
                                            <input type="checkbox" onclick="toggleServerAction(this, '{$not_chk_action}', '{$chk_action}')">
                                                <font color="#000080">&#160;<xsl:value-of select="$texts/text[find='AGRUPAR_RESULTADOS']/replace"/></font>
                                            </input>
-->                                        
                                            <!--input type="radio" checked="true" name="result_selector" onclick="javascript:this.form.server_action.value='{$nao_agrupado}';"-->
                                            <input type="radio" checked="true" name="result_selector"  onclick="javascript:this.form.ng.value='b';">
                                                        
                                                <font color="#000080">
                                                    <xsl:value-of select="$texts/text[find='RESULTADOS_SEPARADOS']/replace"/>
                                                </font>
                                            </input>&#160;&#160;&#160;
                                            <!--input type="radio" name="result_selector" onclick="javascript:this.form.server_action.value='{$agrupado}';"-->
                                            <input type="radio" name="result_selector" onclick="javascript:this.form.ng.value='';">
                                                <font color="#000080">
                                                    <xsl:value-of select="$texts/text[find='AGRUPAR_RESULTADOS']/replace"/>
                                                </font>
                                            </input>
                                            </p>
                                        </xsl:if>
                                        &#160;                                        
									</td>
								</tr>
								
								<tr>
									<td colspan="3">&#160;</td>
								</tr>
								
								<tr>
									<td width="30%" align="right" valign="top">
										<p align="right">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='year_source']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='year_source']">
											<xsl:with-param name="size" select="'8'"></xsl:with-param>
										</xsl:apply-templates>
									</td>
									<td width="1%">&#160;</td>
									<td width="69%" align="left">
										<p align="left">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='top_citation']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='top_citation']">
											<xsl:with-param name="size" select="'8'"></xsl:with-param>
										</xsl:apply-templates>

									</td>
								</tr>								
							</table>
<!--
							<table border="0" cellpadding="2" cellspacing="2" align="center" width="90%">
							
								<tr>
									<td colspan="5" width="100%" align="center">
										<p align="left">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='journal']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='journal']">
											<xsl:with-param name="size" select="'10'"></xsl:with-param>
										</xsl:apply-templates>
									</td>
								</tr>
								
								<tr>
									<td colspan="5">&#160;</td>
								</tr>
								
								<tr>
									<td width="22%" align="right">
										<p align="right">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='year_source']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='year_source']">
											<xsl:with-param name="size" select="'8'"></xsl:with-param>
										</xsl:apply-templates>
									</td>
									<td width="1%">&#160;</td>

									<td width="22%" align="center">
										<p align="center">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='year_cited']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='year_cited']">
											<xsl:with-param name="size" select="'8'"></xsl:with-param>
										</xsl:apply-templates>
									</td>
									<td width="1%">&#160;</td>
									<td width="22%" align="left">
										<p align="left">
											<font color="#000080">
												<xsl:value-of select="$root/selection_list/selection[@name='top_citation']/label_list/label[@lang = $lang]" />
											</font>
										</p>
										<xsl:apply-templates select="$root/selection_list/selection[@name='top_citation']">
											<xsl:with-param name="size" select="'8'"></xsl:with-param>
										</xsl:apply-templates>
									</td>
								</tr>								
							</table>
-->
						</td>
					</tr>
					<tr>
						<td colspan="2">&#160;</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input>
								<xsl:attribute name="type">
									<xsl:value-of select="'submit'" />
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:value-of select="$texts/text[find='SEND']/replace" />
								</xsl:attribute>
							</input>
							&#160;&#160;&#160;
							<input>
                                                                <xsl:attribute name="type">
                                                                        <xsl:value-of select="'reset'" />
                                                                </xsl:attribute>
								<xsl:attribute name="value">
									<xsl:value-of select="$texts/text[find='CLEAN']/replace" />
								</xsl:attribute>
							</input>
						</td>
					</tr>
				</table>
			</form>
            <form name="formMessages">
                <input type="hidden" name="js_yed_msg" value="{$texts/text[find='YED_REQUIRED']/replace}"/>
                <input type="hidden" name="js_cited_msg" value="{$texts/text[find='CITED_REQUIRED']/replace}"/>
                <input type="hidden" name="js_yng_msg" value="{$texts/text[find='YNG_REQUIRED']/replace}"/>
                <input type="hidden" name="js_count_sci_msg" value="{$texts/text[find='COUNT_SCI_REQUIRED']/replace}"/>
                <input type="hidden" name="js_max_selection" value="{$texts/text[find='MAX_SELECTION']/replace} {$max_selection}"/>
            </form>
			<xsl:call-template name="footer"></xsl:call-template>
		</body>
	</xsl:template>

    <xsl:template match="* | text()" mode="cited-hidden">
        <input type="hidden" name="CITED[]" value="{.}"/>
    </xsl:template>

</xsl:stylesheet>