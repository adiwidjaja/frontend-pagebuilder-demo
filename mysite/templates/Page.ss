<!DOCTYPE html>
<html>
    <head>
        <% base_tag %>
        $MetaTags(false)
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="robots" content="index, follow">
        <meta charset="utf-8">
        <title>$Title - $SiteConfig.Title</title>
        <link rel="stylesheet" href="mysite/css/main.css">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="silverstripe-frontend-builder/css/sfb.css">
        <% if $EditMode %>
        <script src="silverstripe-frontend-builder/node_modules/frontend-pagebuilder/js/tinymce/tinymce.js"></script>
        <% end_if %>
    </head>
    <body class="<% if $HideNavOnStart %>body--hidenav <% end_if %><% if $CanEdit %> sfb-editmode<% end_if %>">
        <nav class="pagehead">
            <div class="pagehead_global">
                <div class="pagehead_content">
                    <ul class="headnav locationnav">
                        <li class="nav--hassubnav">
                            <% with $Level(1) %>
                            <a href="$Link"><span>Techno_Z <span class="city">$MenuTitle</span></span></a>
                            <% end_with %>
                            <ul>
                                <% loop $Menu(1) %>
                                <li><a href="$Link"><span>$MenuTitle</span></a></li>
                                <% end_loop %>
                            </ul>
                        </li>
                    </ul>
                    <a class="logo" href="">
                        <img src="mysite/images/technoz_logo.svg"/>
                    </a>
                    <a class="menubutton" href="#">
                        <div class="hamburger">
                            <span></span><span></span><span></span><span></span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="pagehead_sitenav">
                <div class="pagehead_content">
                    <ul class="headnav mainnav">
                        <% loop $Menu(2) %>
                        <li class="<% if $LinkOrSection == "section"%> active<% end_if %><% if $Children %> nav--hassubnav<% end_if %>"><a href="$Link"><span>$MenuTitle</span></a>
                            <% if $Children %>
                            <ul>
                                <% loop $Children %>
                                <li<% if $LinkOrSection == "section"%> class="active"<% end_if %>><a href="$Link"><span>$MenuTitle</span></a></li>
                                <% end_loop %>
                            </ul>
                            <% end_if %>
                        </li>
                        <% end_loop %>
                        <% if Locales %>
                        <li class="nav--hassubnav"><% with $CurrentLocaleInformation %><a href="#">$Language</a><% end_with %>
                            <ul>
                                <ul>
                                    <% loop Locales %>
                                        <% if $LinkingMode != "current" %>
                                        <li>
                                            <a href="$Link.ATT" <% if $LinkingMode != 'invalid' %>rel="alternate" hreflang="$LocaleRFC1766"<% end_if %>>$Language</a>
                                        </li>
                                        <% end_if %>
                                    <% end_loop %>
                                </ul>
                            </ul>
                        </li>
                        <% end_if %>
                    </ul>
                </div>
                <div class="sitenav_overlay"></div>
            </div>
        </nav>
        <main class="main">
            $Layout
        </main>
        <script src="mysite/js/main.js"></script>
        <% if not $CanEdit %>
        <div class="fpb sfb-login">
            <a class="sfb-logo" href="$RelativeLink(login)">
                CMS
            </a>&nbsp;
            <a href="$Link(login)">Login</a>
        </div>
        <% end_if %>
        <% if CanEdit %>
        <div class="fpb sfb-nav">
            <% if CurrentVersion == Stage %>
                <div class="sfb-stages">
                    <a class="sfb-logo" href="{$BaseAdminLink}/admin/pages/edit/show/$ID" target="_blank">
                        CMS
                    </a>&nbsp;
                    <div class="btn-group" role="group">
                        <span class="btn btn-info">Bearbeitungsversion</span>
                        <a class="btn btn-default" href="$Link?stage=Live">Liveversion</a>
                    </div>
                </div>
                <div class="sfb-tools">
                    <a class="btn btn-default" href="#" id="sfb-edit-page">Eigenschaften</a>
                    <% if $NewChildClass == "Page" %>
                        <a class="btn btn-default" href="#" id="sfb-new-page">Neue Unterseite</a>
                    <% end_if %>
                    <% if $NewChildClass == "News" %>
                        <a class="btn btn-default" href="#" id="sfb-new-page">Neue News</a>
                    <% end_if %>
                    <% if $NewChildClass == "Event" %>
                        <a class="btn btn-default" href="#" id="sfb-new-page">Neue Veranstaltung</a>
                    <% end_if %>
                </div>
                <div class="sfb-publishing">
                    <% if CurrentVersion == Stage %>
                    <div class="save-status label" id="save-status">
                    </div>
                    <a id="sfb-save-page" class="btn" href="javascript:;">Speichern</a>
                    <a id="rollback-page" class="btn" href="$Link(rollback)">Änderungen verwerfen</a>
                    <a id="publish-page" class="btn btn-primary" href="$Link(publish)">Veröffentlichen</a>
                    <% end_if %>
                </div>
            <% else %>
                <div class="btn-group" role="group">
                <a class="btn btn-default" href="$Link?stage=Stage">Bearbeitungsversion</a>
                <span class="btn btn-info">Live-Version</span>
                </div>
            <% end_if %>
        </div>
        <script src="silverstripe-frontend-builder/js/sfb.js"></script>
        <% end_if %>
    </body>
</html>