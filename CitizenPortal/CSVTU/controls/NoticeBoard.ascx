<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NoticeBoard.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.NoticeBoard" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('#costumModal10').modal('show');
    });


</script>
<div id="costumModal10" class="modal" data-easein="bounceIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true">

    <div class="modal-dialog" style="width: 80%; height: 80%; display: none;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="opacity: 1 !important; color: #B65838 !important; font-size: 2.4em !important;">
                    ×
                </button>
                <h4 class="modal-title"><i class="fa fa-newspaper-o fa-fw" style="font-size: 0.9em; vertical-align: middle;"></i>Notice Board
                </h4>
            </div>
            <div class="modal-body" style="width: 100%; height: 80%; overflow: auto;">
                <div class="table-responsive">
                    <table cellpadding="0" cellspacing="0" class="table table-bordered" style="max-height: 250px; width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 5px"><b>S.No.</b></th>
                                <th style="width: 100px"><b>Notice Date</b></th>
                                <th style="width: 200px"><b>Notice Type</b></th>
                                <th><b>Details</b></th>
                            </tr>
                        </thead>
                        <tbody id="divNotice" runat="server">
                            
                        </tbody>
                    </table>
                </div>
            </div>
            <%-- <div class="modal-footer text-center">
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">
                            Close
                        </button>
                    </div>--%>
        </div>
    </div>
</div>
