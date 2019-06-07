<%@ Page Title="Meds" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="HopeHealthBrigade.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Patients and Medication Lists.</h3>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Patient_ID" DataSourceID="PatientList" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Patient_ID" HeaderText="Patient_ID" InsertVisible="False" ReadOnly="True" SortExpression="Patient_ID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastNamePaternal" HeaderText="LastNamePaternal" SortExpression="LastNamePaternal" />
                <asp:BoundField DataField="Calle_Address" HeaderText="Calle_Address" SortExpression="Calle_Address" />
                <asp:BoundField DataField="Municipality" HeaderText="Municipality" SortExpression="Municipality" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                <asp:BoundField DataField="LastNameMaternal" HeaderText="LastNameMaternal" SortExpression="LastNameMaternal" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="DPI#" HeaderText="DPI#" SortExpression="DPI#" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="MaritalStatus" HeaderText="MaritalStatus" SortExpression="MaritalStatus" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="PatientList" runat="server" ConnectionString="<%$ ConnectionStrings:HOPE_WW2ConnectionString %>" SelectCommand="SELECT * FROM [Patients]"></asp:SqlDataSource>
        <asp:DropDownList ID="DDPatient" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Patient_txt" DataValueField="Patient_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HOPE_WW2ConnectionString %>" SelectCommand="FillDropBox" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
    <p>
        Use this area to provide additional information.</p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="PatientMedList">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastNamePaternal" HeaderText="LastNamePaternal" SortExpression="LastNamePaternal" />
                <asp:CheckBoxField DataField="Active_Med" HeaderText="Active_Med" SortExpression="Active_Med" />
                <asp:BoundField DataField="Med_Name" HeaderText="Med_Name" SortExpression="Med_Name" />
                <asp:BoundField DataField="Med_Strength" HeaderText="Med_Strength" SortExpression="Med_Strength" />
                <asp:BoundField DataField="Med_Unit" HeaderText="Med_Unit" SortExpression="Med_Unit" />
                <asp:BoundField DataField="Med_Amt" HeaderText="Med_Amt" SortExpression="Med_Amt" />
                <asp:BoundField DataField="Med_Amt_Unit" HeaderText="Med_Amt_Unit" SortExpression="Med_Amt_Unit" />
                <asp:BoundField DataField="Med_Route" HeaderText="Med_Route" SortExpression="Med_Route" />
                <asp:BoundField DataField="med_sched_label" HeaderText="med_sched_label" ReadOnly="True" SortExpression="med_sched_label" />
                <asp:BoundField DataField="Alt_Language" HeaderText="Alt_Language" ReadOnly="True" SortExpression="Alt_Language" />
                <asp:BoundField DataField="Med_Dispense" HeaderText="Med_Dispense" SortExpression="Med_Dispense" />
                <asp:BoundField DataField="Med_Disp_Unit" HeaderText="Med_Disp_Unit" SortExpression="Med_Disp_Unit" />
                <asp:BoundField DataField="Med_Refill" HeaderText="Med_Refill" SortExpression="Med_Refill" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PatientMedList" runat="server" ConnectionString="<%$ ConnectionStrings:HOPE_WW2ConnectionString %>" SelectCommand="Med_List" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDPatient" DefaultValue="2" Name="p1" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
