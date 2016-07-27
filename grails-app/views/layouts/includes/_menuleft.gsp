<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--[if lt IE 7]>      <html xmlns="http://www.w3.org/1999/xhtml" class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html xmlns="http://www.w3.org/1999/xhtml" class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html xmlns="http://www.w3.org/1999/xhtml" class="lt-ie9"> <![endif]-->
<!--[if IE 9]>         <html xmlns="http://www.w3.org/1999/xhtml" class="ie9"> <![endif]-->
<!--[if gt IE 9]><!--> <html xmlns="http://www.w3.org/1999/xhtml" > <!--<![endif]-->
<head>

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


    <g:render template="/layouts/includes/head"/>

    <r:script disposition='head'>
        function renderRecentItems() {
            $.ajax({
                url: "${resource(dir:'')}/recentItem",
                global: false,
                success: function(data) { $("#recent-items").replaceWith(data) }
            });
        }

        $(document).ajaxSuccess(function(e, xhr, settings) {
            renderRecentItems();
        });

        /*
            Highlight clicked rows in the configuration side menu
         */
        $(document).ready(function() {
            $('#left-column ul.list li').click(function() {
                $(this).parents('ul.list').find('li.active').removeClass('active');
                $(this).addClass('active');
            });
        });
    </r:script>

    <r:require module="panels"/>

    <r:layoutResources/>
    <g:layoutHead/>
    <style>
    	.list li img{
    		width:10px;
    		float:right;!important
    	}
    	.process-true, .process-false{
    	    margin: 5px 0 0 10px;
    	    float:left;
    	}
    </style>
</head>
<body class="page-sidebar-closed">
<div id="wrapper">
    <g:render template="/layouts/includes/header"/>

    <div id="main" style="padding:10px 0 0 0">
        <div id="left-column">
            <!-- configuration menu -->

        </div>

        <!-- content columns -->
        <div class="columns-holder">
            <g:render template="/layouts/includes/messages"/>
            <g:render template="/layouts/includes/errors"/>

            <!-- viewport of visible columns -->
            <div id="viewport">
                <div class="column panel ${pageProperty(name: 'page.column.size') == 'double' ? 'column-double' : ''}">
                    <div id="column1" class="column-hold">
                        <g:pageProperty name="page.column1"/>
                    </div>
                </div>

                <div class="column panel ${pageProperty(name: 'page.column.size') == 'double' ? 'column-double' : ''}">
                    <div id="column2" class="column-hold">
                        <g:pageProperty name="page.column2"/>
                    </div>
                </div>
            </div>

            <!-- template for new column-->
            <div id="panel-template" class="column panel">
                <div class="column-hold"></div>
            </div>
        </div>
    </div>
</div>
<div class="footer footer1">
    <div class="footer-inner">
         Web Data Technologies LLP - Version - community-4.1.2
    </div>
    <div class="footer-tools">
        <span class="go-top">
        <i class="fa fa-angle-up"></i>
        </span>
    </div>
</div>
<r:layoutResources/>
</body>

</html>
