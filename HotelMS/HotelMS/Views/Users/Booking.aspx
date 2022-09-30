<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Users/UserMaster.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="HotelMS.Views.Users.WebForm2" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        
        <div class="row">

        <div class="col">

            <div class="row">
                <div class="col-4">
                    <div class="mb-3">
                        <label for="RoomTb" class="form-label">Rooms</label>
                        <input type="text" class="form-control" id="RoomTb" runat="server" />
                    </div>
                   
                    <div class="mb-3">
                        <label for="AmountTb" class="form-label">Amount</label>
                        <input type="text" class="form-control" id="AmountTb" runat="server" />
                    </div>
                    </div>
                    <div class="col-4">
                         <div class="mb-3">
                            <label for="DateInTb" class="form-label">Date In</label>
                            <input type="date" class="form-control" id="DateInTb" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="DateOutTb" class="form-label">Date Out</label>
                            <input type="date" class="form-control" id="DateOutTb" runat="server" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label id="errMsg" runat="server" class="text-danger"></label>
                            <asp:Button ID="BoookBtn" runat="server" Text="Book Room" class="btn btn-warning" OnClick="BoookBtn_Click" />
                            <asp:Button ID="ResetBtn" runat="server" Text="Reset" class="btn btn-danger"/>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col mt-3">
                <h3 class="text-primary">Bookings</h3>
             <asp:GridView ID="BookingGV" runat="server" class="table" CellPadding="2" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>

        </div>

        <div class="col-6">
            <h3 class="text-primary">Rooms</h3>
            <asp:GridView ID="RoomsGV" runat="server" class="table" CellPadding="2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="RoomsGV_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>

        

        </div>

</asp:Content>
