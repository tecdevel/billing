%{--
     jBilling - The Enterprise Open Source Billing System
   Copyright (C) 2003-2011 Enterprise jBilling Software Ltd. and Emiliano Conde

   This file is part of jbilling.
   
   jbilling is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   jbilling is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.
   
   You should have received a copy of the GNU Affero General Public License
   along with jbilling.  If not, see <http://www.gnu.org/licenses/>.

 This source was modified by Web Data Technologies LLP (www.webdatatechnologies.in) since 15 Nov 2015.
You may download the latest source from webdataconsulting.github.io.

 
  --}%

<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils; com.sapienter.jbilling.common.CommonConstants; jbilling.SearchType; com.sapienter.jbilling.server.user.db.CompanyDTO; com.sapienter.jbilling.server.user.db.CompanyDAS" %>

<%--
  Page header for all common jBilling layouts.

  This contains the jBilling top-navigation bar, search form and main navigation menu.

  @author Brian Cowdery
  @since  23-11-2010
--%>
<%
	def company = CompanyDTO.load(session['company_id'])
	def childEntities = CompanyDTO.findAllByParent(company)
%>
<script type="text/javascript">
	function clearPlaceHolder(src)
	{
		var str = src.placeholder;
		str = str != null ? str.replace("${message(code:'search.title')}", "") : str;
		$('#id').attr('placeholder', str); 
	}
	
	function setPlaceHolder()
	{
		var str = '${message(code:'search.title')}';
		$('#id').attr('placeholder', str);
	}
    function updateTips( t ) {
        tips.text( t ).addClass( "ui-state-error" );
    }
    
	$(document).ready(function() {
    	setImpersonationUser();
    	
    	$( "#impersonation-dialogue" ).dialog({
			autoOpen: ${flash.errorAuthToFail != null} ? true : false,
			height: 200,
			width: 	480,
			modal: 	true
		});
	
		$('#impersonation-dialogue').on('dialogclose', function(event) {
			$("#authEventFail").remove();
		});
	
		$( "#impersonate" ).click(function() {
		$( "#impersonation-dialogue" ).dialog( "open" );
		});
	});
    
    function checkLength( o, n, min, max ) {
        if ( o.val().length > max || o.val().length < min ) {
            o.addClass( "ui-state-error" );
            updateTips( "Length of " + n + " must be between " + min + " and " + max + "." );
            return false;
        } else {
            return true;
        }
    }

    function showImp() {
    	$( "#impersonation-dialogue" ).dialog({
			autoOpen: ${flash.errorAuthToFail != null} ? true : false,
			height: 200,
			width: 	480,
			modal: 	true
		});
		
		$('#impersonation-dialogue').on('dialogclose', function(event) {
				$("#authEventFail").remove();
		});
		
		$( "#impersonation-dialogue" ).show();
		$( "#impersonation-dialogue" ).dialog( "open" );
   }
    function setImpersonationUser() {
		$.ajax({
            url: '${createLink(action: 'getUserByCompany', controller: 'user')}',
            type: 'POST',
            data: { entityId: $( "#impersonation-select" ).val() },
            success: function (result) {
				$('input[name = j_username]').val(result.name);
            }
        });
    }

  	//Following function added to fix #7338 - Tabs are not properly located on page in case of large number of tabs on screen.



	$(document).ready(function() {

        if ('${params.showAssetUploadTemplate}') {
            $("#uploadAsset").click();
        }
	});

	$(document).ready(function() {
	    $("#menu\\.link\\.customers i").addClass("fa fa-user");
	    $("#menu\\.link\\.partners i").addClass("fa fa-users");
	    $("#menu\\.link\\.invoices i").addClass("fa fa-file-text-o");
	    $("#menu\\.link\\.payments\\.refunds i").addClass("fa fa-money");
	    $("#menu\\.link\\.orders i").addClass("fa fa-cart-arrow-down");
	    $("#menu\\.link\\.billing i").addClass("fa fa-files-o");
	    $("#menu\\.link\\.mediation i").addClass("fa fa-circle-o-notch");
	    $("#menu\\.link\\.reports i").addClass("fa fa-bar-chart");
	    $("#menu\\.link\\.discounts i").addClass("fa fa-plus-square-o");
	    $("#menu\\.link\\.products i").addClass("fa fa-shopping-bag");
	    $("#menu\\.link\\.pricing i").addClass("fa fa-usd");
	    $("#menu\\.link\\.plans i").addClass("fa fa-user");
	    $("#menu\\.link\\.configuration i").addClass("fa fa-cogs");
        $(".sidebar-toggler").click(function() {
            $(".page-sidebar-wrapper").toggleClass("page-sidebar-wrapper2");
            $(".sub-menu").toggleClass("sub-menu2");
            $(".title1").toggleClass("title5");
            $(".footer").toggleClass("footer1");
        });
        $("#process-false").each(function() {
             $("div #process-false").append('<img src="${resource(dir:'images', file:'icon_red.png')}" />');
        });
        $("#process-true").each(function() {
            $("div #process-true").append('<img src="${resource(dir:'images', file:'icon_green.png')}" />');
        });
        if($("body").hasClass("page-sidebar-closed")){
            //do nothing
        }else{
            $("body").addClass("page-sidebar-closed")
        }
	});

</script>
<style>
    #process-true, #process-false{
        margin: 5px 0 0 10px;
        float:left;
    }
</style>

<!-- header -->
<div id="" class="header navbar navbar-fixed-top">
	<div class="header-inner">

		<!-- Start Logo -->
        <div class="page-logo" style="background-color:#878484;box-shadow: 0px 0px 10px #000000">
            <a href="${resource(dir:'')}"><img src="${resource(dir:'images', file:'logo.png')}" width="90px" height="50px" style="margin: -2px 0 0 35px;" /></a>
        </div>
		<!-- End Logo-->

        <!-- Start Searching -->
	    <g:form controller="search" class="search-form search-form-header" name="search-form">
            <fieldset>
                <div class="input-icon right">
                    <i class="icon-magnifier" onclick="$('#search-form').submit()"></i>
                    <g:textField name="id" placeholder="Search for" class="form-control input-sm" style="background-color:white" onkeydown="setPlaceHolder();" />
                </div>

            </fieldset>
        </g:form>
        <ul class="nav navbar-nav pull-left">
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <sec:access url="/customer/list">
                            <a><g:radio id="customers" name="type" value="CUSTOMERS" checked="${!cmd || cmd?.type?.toString() == 'CUSTOMERS'}"/>
                            <label for="customers"><g:message code="search.option.customers"/></label></a>
                        </sec:access>
                    </li>
                    <li>
                        <sec:access url="/order/list">
                            <a><g:radio id="orders" name="type" value="ORDERS" checked="${cmd?.type?.toString() == 'ORDERS'}"/>
                            <label for="orders"><g:message code="search.option.orders"/></label></a>
                        </sec:access>
                    </li>
                    <li>
                        <sec:access url="/invoice/list">
                            <a><g:radio id="invoices" name="type" value="INVOICES" checked="${cmd?.type?.toString() == 'INVOICES'}"/>
                            <label for="invoices"><g:message code="search.option.invoices"/></label></a>
                        </sec:access>
                    </li>
                    <li>
                        <sec:access url="/payment/list">
                            <a><g:radio id="payments" name="type" value="PAYMENTS" checked="${cmd?.type?.toString() == 'PAYMENTS'}"/>
                            <label for="payments"><g:message code="search.option.payments"/></label></a>
                        </sec:access>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- End Searching -->

        <!-- Side DropDowns -->
        <ul class="nav navbar-nav pull-right">
	        <sec:ifSwitched>
                <g:set var="switchedUserOriginalUsername" value="${SpringSecurityUtils.switchedUserOriginalUsername}"/>
                <g:if test="${switchedUserOriginalUsername?.substring(switchedUserOriginalUsername.indexOf(';') + 1, switchedUserOriginalUsername.length()).equals(session['company_id'].toString())}">
                    <li>
                        <g:message code="switch.user.working.as"/> <sec:loggedInUserInfo field="greetingName"/>
                    </li>
                    <li>
                        <a href="${request.contextPath}/j_spring_security_exit_user">
                            <g:set var="plainUsername" value="${switchedUserOriginalUsername?.substring(0, switchedUserOriginalUsername.indexOf(';'))}"/>
                            <g:message code="switch.user.resume.session.as"/> ${plainUsername}
                        </a>
                    </li>
                </g:if>
            </sec:ifSwitched>

            <li class="dropdown user" style="background-color: #5A5A5A;box-shadow: 0px 0px 62px #000000;">
        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
        			<span class="username" style="margin-top:-9px;">
        				<sec:ifNotSwitched>
        				    <g:message code="topnav.greeting"/> <sec:loggedInUserInfo field="greetingName"/> !
        				</sec:ifNotSwitched><br>
        				<sec:ifNotSwitched>
                            <!-- <i class="fa fa-industry fa-4x" ></i> --><%=company.getDescription()%>
                        </sec:ifNotSwitched>
        			</span>
        			<i class="fa fa-angle-down"></i>
        		</a>
        		<ul class="dropdown-menu">
        		    <g:if test="${CompanyDTO.get(session['company_id'])?.parent == null || (childEntities != null && childEntities.size() > 0)}">
                        <sec:ifSwitched>
                            <g:set var="switchedUserOriginalUsername" value="${SpringSecurityUtils.switchedUserOriginalUsername}"/>
                            <g:if test="${!switchedUserOriginalUsername?.substring(switchedUserOriginalUsername.indexOf(';') + 1, switchedUserOriginalUsername.length()).equals(session['company_id'].toString())}">
                                    <li>
                                        <li>
                                            <g:message code="switch.user.working.as"/> <sec:loggedInUserInfo field="plainUsername"/>
                                        </li>

                                        <a href="${request.contextPath}/j_spring_security_exit_user" class="dissimulate">
                                            ${CompanyDTO.get(session['company_id'].toInteger())?.description}
                                        </a>
                                    </li>
                            </g:if>
                        </sec:ifSwitched>

                        <sec:ifNotSwitched>
                            <li>
                                <a id="impersonate" onclick="showImp()"><i class="fa fa-industry" style="margin-right:6px"></i><g:message code="topnav.link.impersonate"/></a>
                            </li>
                        </sec:ifNotSwitched>
                    </g:if>
                    <g:else>
                        <sec:ifSwitched>
                            <g:set var="switchedUserOriginalUsername" value="${SpringSecurityUtils.switchedUserOriginalUsername}"/>
                            <g:if test="${!switchedUserOriginalUsername?.substring(switchedUserOriginalUsername.indexOf(';') + 1, switchedUserOriginalUsername.length()).equals(session['company_id'].toString())}">
                                <li>
                                    <li>
                                        <g:message code="switch.user.working.as"/> <sec:loggedInUserInfo field="plainUsername"/>
                                        </li>

                                    <a href="${request.contextPath}/j_spring_security_exit_user" class="dissimulate">
                                        ${CompanyDTO.get(session['company_id'].toInteger())?.description}
                                    </a>
                                </li>
                            </g:if>
                        </sec:ifSwitched>
                    </g:else>

                    <sec:ifAnyGranted roles="MY_ACCOUNT_160,MY_ACCOUNT_161,MY_ACCOUNT_162,ROLE_SUPER_USER">
                        <li>
                            <g:link controller="myAccount" class="account">
                            <i class="fa fa-user" style="margin-right:6px"></i><g:message code="topnav.link.account"/>
                            </g:link>
                        </li>
                    </sec:ifAnyGranted>

                    <li>
                        <a href="http://www.webdatatechnologies.in/training.html" class="training">
                            <i class="fa fa-cog" style="margin-right:6px"></i><g:message code="topnav.link.training"/>
                        </a>
                    </li>
                    <li>
                        <a href="${resource(dir:'manual', file: 'index.html')}" class="help">
                            <i class="fa fa-question-circle" style="margin-right:6px"></i><g:message code="topnav.link.help"/>
                        </a>
                    </li>
                    <li>
                        <g:link controller='logout' class="logout">
                            <i class="fa fa-arrow-left" style="margin-right:6px"></i><g:message code="topnav.link.logout"/>
                        </g:link>
                    </li>
        		</ul>
        	</li>
        </ul>
        <!-- End Side DropDowns-->
    </div>
</div>
<div id="impersonation-dialogue" title="Impersonate" style="display:none">
    <g:if test = "${childEntities.size() > 0}">
        <form id="impersonation-form" action="${request.contextPath}/j_spring_security_switch_user" method="POST">
            <g:hiddenField id="security_username"  name="j_username"/>
            <div id="impersonation-text">Please select a child entity to impersonate:</div>
            <g:if test="${flash.errorAuthToFail}">
                <div id="authEventFail" class="msg-box error">
                    <g:message code="${flash.errorAuthToFail}"/>
                </div>
            </g:if>

            <div>
                <g:select id="impersonation-select" name="entityId"
                      from="${childEntities}"
                      optionKey="id"
                      optionValue="${{it?.description}}"
                      value="${entityId}"
                      onChange="setImpersonationUser();"
                      />
            </div>
            <div>
                <a id="impersonation-button" onclick="$('#impersonation-form').submit()" class="submit select"><span><g:message code="button.select"/></span></a>
            </div>
        </form>
     </g:if>
     <g:else>
        <strong>This Company does not have any child company!</strong>
     </g:else>
</div>
<div class="clearfix"></div>
<div class="page-header-fixed">
    <div class="page-container">
        <!-- Begin Side Bar -->
        <div class="page-sidebar-wrapper page-sidebar-wrapper2">
            <div class="page-sidebar navbar-collapse collapse">
                %{
                    def hiddenTabs = []
                }%
                <%-- select the current menu item based on the controller name --%>
                <ul class="page-sidebar-menu">
                    <li class="sidebar-toggler-wrapper">
                        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                        <div class="sidebar-toggler"></div>
                        <div class="clearfix"></div>
                        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    </li>
                    <g:each in="${session['user_tabs'].tabConfigurationTabs}" var="tabConfig">
                        <jB:userCanAccessTab tab="${tabConfig.tab}">
                            %{
                                def isActive = (tabConfig.tab.controllerName == 'config') ?
                                    controllerName == 'config' ||
                                            controllerName == 'contactFieldConfig' ||
                                            controllerName == 'billingconfiguration' ||
                                            controllerName == 'blacklist' ||
                                            controllerName == 'notifications' ||
                                            controllerName == 'orderPeriod' ||
                                            controllerName == 'plugin' ||
                                            controllerName == 'user' ||
                                            controllerName == 'enumerations' ||
                                            controllerName == 'route' ||
                                            controllerName == 'routeBasedRateCard' ||
                                            controllerName == 'rateCard'  ||
                                            controllerName == 'role' ||
                                            controllerName == 'accountType' ||
                                            controllerName == 'metaFields' ||
                                            controllerName == 'metaFieldGroup' ||
                                            controllerName == 'mediationConfig' ||
                                            controllerName == 'paymentMethodType'
                                        :   (tabConfig.tab.controllerName == 'plan') ? (controllerName == 'plan' || controllerName == 'planBuilder')
                                        :   (tabConfig.tab.controllerName == 'order') ? (controllerName == 'order' || controllerName == 'orderBuilder')
                                        :   controllerName == tabConfig.tab.controllerName
                            }%

                            <g:if test="${tabConfig.visible || isActive}">
                                <li class="${isActive ? 'active' : ''}" id="${tabConfig.tab.messageCode}">
                                    <g:if test="${tabConfig.tab.messageCode == 'menu.link.configuration'}">
                                    <div class="show">
                                        <a href="javascript:;"><i></i><span class="title1 title5"><g:message code="${tabConfig.tab.messageCode}"/></span><span class="arrow "></span></a>
                                        <ul class="sub-menu sub-menu2">
                                            <g:render template="/layouts/includes/configMenu"/>
                                        </ul>
                                    </div>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="${tabConfig.tab.controllerName}"><i></i><span class="title"><g:message code="${tabConfig.tab.messageCode}"/></span><em></em></g:link>
                                    </g:else>
                                </li>
                            </g:if>
                            <g:else>
                                %{
                                    hiddenTabs.add(tabConfig.tab)
                                }%
                            </g:else>
                        </jB:userCanAccessTab>
                    </g:each>
                    <g:if test="${hiddenTabs.size() > 0}">
                        <li><a><span>+</span></a>
                            <ul>
                                <g:each var="tab" in="${hiddenTabs}">
                                    <li>
                                        <g:link controller="${tab.controllerName}"><span><g:message code="${tab.messageCode}"/></span><em></em></g:link>
                                    </li>
                                </g:each>
                            </ul>
                        </li>
                    </g:if>
                </ul>
            </div>
        </div>

        <!-- End Side Bar -->
        <div class="page-content-wrapper">
            <div class="page-content" style="min-height:849px">
                <g:render template="/layouts/includes/breadcrumbs"/>
                <g:render template="/layouts/includes/messages"/>
                <g:render template="/layouts/includes/errors"/>
            <!-- Remaining Closing Div are closed in main.gsp -->
