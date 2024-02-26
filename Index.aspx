<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CarServiceApp.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <section class="row">
            <form>
                <div class="form-row align-items-center">
                    <div class="card border-dark mb-3">
                        <div class="card-header">Filter</div>
                        <div class="card-body text-dark card-filter col-lg-12">
                            <div class="col-lg-12 col-md-12 my-1">
                                <div class="input-group">
                                    <input type="text" id="txtVIN" class="form-control wd-max" placeholder="VIN #">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 my-1 btn-filter">
                                <button type="button" class="btn btn-primary" id="btnSearch"><i class="fa fa-search"></i>&nbsp Search</button>
                                <button type="button" class="btn btn-secondary" id="btnClear"><i class="fa fa-remove"></i>&nbsp Clear</button>
                                <button type="button" class="btn btn-success" id="btnNew"><i class="fa fa-add"></i>&nbsp New</button>
                            </div>
                        </div>
                    </div>


                </div>
            </form>
        </section>
        <section class="row">
            <form>
                <div class="form-row align-items-center">
                    <div class="card border-dark mb-3">
                        <div class="card-header">Results</div>
                        <div class="card-body text-dark" id="results-data" style="overflow-x: auto">
                            <table id="myDataTable">
                            </table>
                        </div>
                    </div>


                </div>
            </form>
        </section>
    </main>


    <%--Data Table--%>
    <link href="Plugins/dataTables.dataTables.css" rel="stylesheet" />
    <script src="Plugins/dataTables.js"></script>
    <script src="Scripts/Index.js"></script>
</asp:Content>
