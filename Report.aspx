<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="CarServiceApp.Report" %>

<!DOCTYPE html>
<html lang="en" moznomarginboxes mozdisallowselectionprint>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Mercedes-Benz Service Center</title>

    <!-- Favicon -->
    <link href="Assets/Images/mercedes_logo_svg_DRt_icon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Assets/Css/report.css" rel="stylesheet" />
    <!-- Invoice styling -->
    <style>
      
    </style>
</head>

<body class="bg-gray">
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
    </form>
    <div id="invoice-box" class="invoice-box bg-white">
        <table>
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                <img src="Assets/Images/Mercedes-Logo.svg.png" alt="Company logo" style="width: 20%; max-width: 300px" />

                            </td>

                            <td>Mercedes Benz <span style="color: red">Service Center</span><br />
                                Date: <span id="rpt-date"></span><br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>Garage Ahmad Ways<br />
                                03-030790<br />
                                Beirut - Gabriel El Murr Street
                            </td>

                        </tr>
                    </table>
                </td>
            </tr>

            <tr class="heading" style="back">
                <td>Car Details</td>

                <td></td>
            </tr>

            <tr class="details">
                <td>VIN: <span id="rpt-vin"></span><ap</td>

                <td></td>
            </tr>

            <tr class="heading" id="repairs-header">
                <td>Description</td>
                <td>Price</td>
            </tr>


            <tr class="total">
                <td></td>

                <td>Total: <span id="rpt-total"></span></td>
            </tr>
        </table>
    </div>
    <script>
        function getParameterByName(name, url = window.location.href) {
            name = name.replace(/[\[\]]/g, '\\$&');
            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return 0;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }

        var pageRecordGuid = getParameterByName('i') == 0 ? uuidv4() : getParameterByName('i');
        var vn = getParameterByName('v') == 0 ? 0 : getParameterByName('v');

        $(document).ready(function () {

            Load();
        });

        function Load() {
            $.ajax({
                url: '/Handlers/DetailHandler.ashx?a=get&g=' + pageRecordGuid + '&v=' + vn,
                type: 'POST',
                data: "",
                success: function (data) {
                    var parsed = JSON.parse(data);
                    $('#rpt-date').text(formatDate(parsed.Date));
                    $('#rpt-vin').text(parsed.VinNumber);
                    $('#rpt-total').text((parsed.TotalUSD + "$"));
                    buildRepairs(parsed.Repairs);

                    printDiv();
                    //$("#invoice-box").print();
                },
                error: function (errorText) {
                    alert("Something went wrong!");
                }
            });
        }

        function printDiv() {

            var divToPrint = document.getElementById('invoice-box');

            var newWin = window.open('', 'Print-Window');

            newWin.document.open();

            var html = '<html><head><link href="Assets/Css/report.css" rel="stylesheet" /></head>';
            html += '<body onload="window.print()"><div id="invoice-box" class="invoice-box print bg-white">' + divToPrint.innerHTML + '</div></body></html>';
            newWin.document.write(html);
            newWin.document.close();
            setTimeout(function () { newWin.close(); }, 10);

        }




        function buildRepairs(repairs) {
            var html = '';
            $.each(repairs, function (i, item) {
                if (i == (repairs.length - 1)) {
                    html += '<tr class="item-last item-row-repairs">'
                    html += '<td>' + item.Description + '</td>'
                    html += '<td>' + item.PriceUSD + '$</td>'
                    html += '</tr>'
                }
                else {
                    html += '<tr class="item item-row-repairs">'
                    html += '<td>' + item.Description + '</td>'
                    html += '<td>' + item.PriceUSD + '$</td>'
                    html += '</tr>'
                }
            })

            $('.item-row-repairs').remove();
            $('#repairs-header').after(html);
        }

        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2)
                month = '0' + month;
            if (day.length < 2)
                day = '0' + day;

            return [day, month, year].join('-');
        }

        //$(window).bind("beforeprint", function () {
        //    $(".fieldset:gt(0)").slideDown("fast");
        //});
    </script>
</body>
</html>
