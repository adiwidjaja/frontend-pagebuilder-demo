<% if $Form %>
            <section class="section section--intro">
                <div class="section_content">
                    <h1>$Title</h1>
                    <div class="section_content_text">
                        $Content
                        $Form
                    </div>
                </div>
            </section>
<% end_if %>
 <div class="fpb-content" <% if $EditMode %>data-fpb-content <% end_if %>>
     <% if $EditMode %>
    <script>
    var content = $JsonContent;
    var baseurl = "$Link";
    var editmode = true;
    </script>
    <% else %>
        <script>
        var content = $JsonContent;
        var baseurl = "$Link";
        var editmode = false;
        </script>
    $RenderContent
    <% end_if %>
</div>