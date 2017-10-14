<% if $Form %>
            <section class="section section--text">
                <div class="section_content">
                    <h1>$Title</h1>
                    <div class="section_content_text">
                        $Content
                        $Form
                    </div>
                </div>
            </section>
<% else %>
    <% if $EditMode %>
    <script>
    var content = $JsonContent;
    var baseurl = "$Link";
    var editmode = true;
    </script>
    <% else %>
    <% if $CanEdit %>
        <script>
        var content = $JsonContent;
        var baseurl = "$Link";
        </script>
    <% end_if %>
    $RenderContent
    <% end_if %>
<% end_if %>