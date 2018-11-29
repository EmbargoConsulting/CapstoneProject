<%@ Page Title="Simple Report" Language="C#" MasterPageFile="~/Child.master" %>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        simpleReport.Visible = !simpleReport.Visible;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">
    <div id="simpleReport" runat="server" class="tab-pane fade in active">
        <div class='tableauPlaceholder' id='viz1542148111720' style='position: relative'>
            <noscript>
                <a href='#'>
                    <img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Pr&#47;ProjectReports_0&#47;SimpleReport&#47;1_rss.png' style='border: none' /></a>
            </noscript>
            <object class='tableauViz' style='display: none;'>
                <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
                <param name='embed_code_version' value='3' />
                <param name='site_root' value='' />
                <param name='name' value='ProjectReports_0&#47;SimpleReport' />
                <param name='tabs' value='no' />
                <param name='toolbar' value='yes' />
                <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Pr&#47;ProjectReports_0&#47;SimpleReport&#47;1.png' />
                <param name='animate_transition' value='yes' />
                <param name='display_static_image' value='yes' />
                <param name='display_spinner' value='yes' />
                <param name='display_overlay' value='yes' />
                <param name='display_count' value='yes' />
                <param name='filter' value='publish=yes' />
            </object>
        </div>
        <script type='text/javascript'>
            var divElement = document.getElementById('viz1542148111720');
            var vizElement = divElement.getElementsByTagName('object')[0];
            vizElement.style.width = '100%';
            vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
            var scriptElement = document.createElement('script');
            scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
            vizElement.parentNode.insertBefore(scriptElement, vizElement);
        </script>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Toggle Tableau" OnClick="Button1_Click" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

