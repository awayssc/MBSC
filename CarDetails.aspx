<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="CarServiceApp.CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row">
            <form>
                <div class="form-row align-items-center">
                    <div class="card border-dark mb-3">
                        <div class="card-header">Details</div>
                        <div class="card-body text-dark card-details">
                            <div class="col-lg-12 col-md-12 my-1 form-group">
                                <div class="input-group">
                                    <label for="" class="col-lg-12">
                                        VIN Number <span class="lbl-required">*</span>
                                        <input type="text" id="txtVin" class="form-control wd-max" placeholder=""></label>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 my-1 form-group">
                                <div class="input-group">
                                    <label for="" class="col-lg-12">
                                        Plate Number 
                                        <input type="text" id="txtPlate" class="form-control wd-max" placeholder=""></label>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 my-1 form-group">
                                <div class="input-group">
                                    <label for="" class="col-lg-12">
                                        Date <span class="lbl-required">*</span>
                                        <input type="date" id="dtDate" class="form-control wd-max" placeholder=""></label>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 my-1 form-group">
                                <div class="input-group">
                                    <label for="" class="col-lg-12">
                                        Worker Name <span class="lbl-required">*</span>
                                        <input type="text" id="txtWorker" class="form-control wd-max" placeholder=""></label>
                                </div>
                            </div>

                            <hr />
                            <div class="col-lg-2 col-md-2 my-1">
                                <button type="button" class="btn btn-success" id="btnNew"><i class="fa fa-add"></i>&nbsp New</button>
                            </div>
                            <table id="repairsTable">
                                <thead>
                                    <tr>
                                        <th class="hidden">Record Guid</th>
                                        <th>Description</th>
                                        <th>Price USD</th>
                                        <td>Delete</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                            <hr />
                            <p id="total">Total: <span id="total-repairs"></span></p>
                            <hr />
                            <div class="col-lg-12 col-md-12 my-1 save-form">
                                <button type="button" class="btn btn-success" id="btnSavePrint"><i class="fa fa-save"></i>&nbsp Save & Print</button>
                                <button type="button" class="btn btn-primary" id="btnSave"><i class="fa fa-save"></i>&nbsp Save</button>
                                <button type="button" class="btn btn-secondary" id="btnCancel"><i class="fa fa-multiply"></i>&nbsp Cancel</button>
                            </div>
                        </div>
                    </div>


                </div>
            </form>
        </section>
    </main>

    <div class="modal fade" data-bs-backdrop='static' id="repairsModal" tabindex="-1" role="dialog" aria-labelledby="repairsModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="repairsModalLabel">Repair Details</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="repair-desc" class="col-form-label">Description: <span class="lbl-required">*</span></label>
                            <input type="text" class="form-control wd-max" id="repair-desc">
                        </div>
                        <div class="form-group">
                            <label for="repair-price" class="col-form-label">Price USD: <span class="lbl-required">*</span></label>
                            <input type="number" class="form-control wd-max" id="repair-price">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="btnCloseModal"><i class="fa fa-multiply"></i>&nbsp Close</button>
                    <button type="button" class="btn btn-primary" id="btnSaveModal"><i class="fa fa-save"></i>&nbsp Save</button>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/InfoDetails.js"></script>
</asp:Content>
