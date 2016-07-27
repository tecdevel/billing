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

<%--
  Content for the head region of all jBilling layouts.

  @author Brian Cowdery
  @since  23-11-2010
--%>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title><g:layoutTitle default="jBilling" /></title>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/font-awesome/css', file:'font-awesome.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/simple-line-icons', file:'simple-line-icons.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/bootstrap/css', file:'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/uniform/css', file:'uniform.default.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/fullcalendar/fullcalendar', file:'fullcalendar.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/bootstrap-datepicker/css', file:'datepicker.css')}" />
<!-- END GLOBAL MANDATORY STYLES -->

<link rel="stylesheet" type="text/css" href="${resource(dir:'assets/plugins/datatables/plugins/bootstrap', file:'dataTables.bootstrap.css')}" />

<!-- BEGIN THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'style-conquer.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'style.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'style-responsive.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'plugins.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css/themes', file:'default.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'assets/css', file:'custom.css')}" />
<!-- END THEME STYLES -->

<link rel="shortcut icon" href="${resource(dir:'images', file:'favicon.ico')}" type="image/x-icon" />

<r:require modules="jquery, core, ui, input"/>

<r:script disposition='head'>
    var canReloadMessages = true;

    function renderMessages() {
        if(canReloadMessages) {
            $.ajax({
                url: "${resource(dir:'')}/messages",
                global: false,
                async: false,
                cache: false,
                success: function(data) { $("#messages").replaceWith(data); }
            });
        }
    }

    function renderBreadcrumbs() {
        $.ajax({
            url: "${resource(dir:'')}/breadcrumb",
            global: false,
            success: function(data) { $("#breadcrumbs").replaceWith(data); }
       });
    }
</r:script>

<g:if test="${ajaxListeners == null || ajaxListeners}">
<r:script disposition='head'>
    <g:render template="/layouts/includes/messageBreadCrumbListeners"/>
</r:script>
</g:if>

<r:require module="jquery-ui"/>
<r:external file="/js/jquery-ui/i18n/jquery.ui.datepicker-${session.locale.language}.js"/>

<r:require module="jquery-validate"/>
<r:external file="/js/jquery-validate/i18n/messages_${session.locale.language}.js"/>

<r:script disposition='head'>
    $(document).ready(function() {
        $.validator.setDefaults({
            errorContainer: "#error-messages",
            errorLabelContainer: "#error-messages ul",
            wrapper: "li",
            meta: "validate"
        });

        // minor bug with the filter input fields - this should happen automatically
        // but the 'keyup' event doesn't always bind correctly from the validator itself
        $('#filters-form').delegate('input', 'keyup', function() {
            $('#filters-form').valid();
        });
    })
</r:script>

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

<script src="${resource(dir:'assets/plugins/bootstrap-maxlength', file:'bootstrap-maxlength.min.js')}" type="text/javascript"></script>
<script src="${resource(dir:'assets/plugins/bootstrap-touchspin', file:'bootstrap.touchspin.js')}" type="text/javascript"></script>
<script src="${resource(dir:'assets/plugins/typeahead', file:'handlebars.min.js')}" type="text/javascript"></script>
<script src="${resource(dir:'assets/plugins/typeahead', file:'typeahead.bundle.min.js')}" type="text/javascript"></script>

<script src="${resource(dir:'assets/scripts', file:'app.js')}" type="text/javascript"></script>
<script src="${resource(dir:'assets/scripts', file:'form-components.js')}" type="text/javascript"></script>

<script>
    jQuery(document).ready(function() {
       // initiate layout and plugins
       App.init();
       FormComponents.init();
    });
</script>
