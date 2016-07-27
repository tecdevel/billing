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

<%@ page import="com.sapienter.jbilling.server.user.db.CompanyDTO" %>
<head>
<meta name="layout" content="public" />

    <title><g:message code="login.page.title"/></title>

	<!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/font-awesome/css', file:'font-awesome.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/simple-line-icons', file:'simple-line-icons.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/bootstrap/css', file:'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/uniform/css', file:'uniform.default.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/fullcalendar/fullcalendar', file:'fullcalendar.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/bootstrap-datepicker/css', file:'datepicker.css')}" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'style-conquer.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'style.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'style-responsive.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'plugins.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css/themes', file:'default.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'custom.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css/pages', file:'login.css')}" />
    <!-- END THEME STYLES -->

	<r:script disposition="head">
            $(document).ready(function() {
                $('#login input[name="j_username"]').focus();

                $(document).keypress(function(e) {
                        if(e.which == 13) {

                            $(this).blur();
                            $('#login form').submit();
                        }
                    });

            });
        </r:script>
	<link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/select2', file:'select2.css')}" />
</head>

<body>

    <div class="logo">
        <a href="${resource(dir:'')}"><img src="${resource(dir:'images', file:'logo.png')}" width="180px" height="120px" /></a>
    </div>

    <div id="login">
    <div class="content">
        <form action='${postUrl}' method='POST' id='login-form' autocomplete='off'>
            <g:hiddenField name="interactive_login" value="true"/>
            <fieldset>
                <g:render template="/layouts/includes/messages"/>
                <h3 class="form-title">Login to your account</h3>
                <div class="form-group">
                    <label class="control-label">
                        <g:message code="login.prompt.username"/>
                        <content tag="label.for">username</content>
                    </label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <g:textField class="form-control" name="j_username" value="${params.userName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        <g:message code="login.prompt.password"/>
                        <content tag="label.for">password</content>
                    </label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <g:passwordField class="form-control" name="j_password"/>
                    </div>
                </div>

                <div class="form-group">
                    <g:set var="companies" value="${CompanyDTO.createCriteria().list(){eq('deleted', 0)}.sort {it.description}}"/>
                    <label class="control-label">
                        <g:message code="login.prompt.client.id"/>
                        <content tag="label.for">client_id</content>
                    </label>
                    <div class="input-icon">
                        <g:if test="${companies}" >
                            <g:select name="j_client_id"
                                  from="${companies}"
                                  optionKey="id" class="form-control"
                                  optionValue="${{it?.description}}"
                                  value="${params.companyId && !params.companyId.isEmpty() ? params.companyId as Integer : null}"/>
                        </g:if>
                        <g:else>
                            <g:select name="j_client_id"
                                  from="${companies}"
                                  optionKey="id" class="form-control"
                                  noSelection="['': message(code: 'default.no.selection')]"
                                  optionValue="description"
                                  value="${params.companyId && !params.companyId.isEmpty() ? params.companyId as Integer : null}"/>
                        </g:else>
                    </div>
                </div>
                <div class="form-actions">
                    <h5><g:link controller="resetPassword"><g:message code="login.prompt.forgotPassword" /></g:link></h5>
                    <a href="#" class="btn btn-info pull-right" onclick="$('#login form').submit();">
                        <span><g:message code="login.button.submit"/></span>
                    </a>
                </div>
            </fieldset>
	    </form>
    </div>
    </div>
    <!-- BEGIN CORE PLUGINS -->
        <script src="${resource(dir:'assets/plugins', file:'jquery-1.11.0.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins', file:'jquery-migrate-1.2.1.min.js')}" type="text/javascript"></script>
        <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
        <script src="${resource(dir:'assets/plugins/jquery-ui', file:'jquery-ui-1.10.3.custom.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins/bootstrap/js', file:'bootstrap.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins/bootstrap-hover-dropdown', file:'bootstrap-hover-dropdown.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins/jquery-slimscroll', file:'jquery.slimscroll.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins', file:'jquery.blockui.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins/uniform', file:'jquery.uniform.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins/fullcalendar/fullcalendar', file:'fullcalendar.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir:'assets/plugins/bootstrap-datepicker/js', file:'bootstrap-datepicker.js')}" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <script src="${resource(dir:'assets/scripts', file:'app.js')}" type="text/javascript"></script>

    <script>
        jQuery(document).ready(function() {
           // initiate layout and plugins
           App.init();
        });
    </script>
</body>
</html>