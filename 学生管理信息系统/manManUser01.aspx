<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manManUser01.aspx.cs" Inherits="manManUser01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>S-MIS系统用户信息管理</title>
<style type="text/css">
    body {
	margin-left: 10px;
	margin-top: 10px;
	margin-right: 0px;
	margin-bottom: 0px;
    }
    .bWord {
	font-family: "微软雅黑";
	font-size: 15px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #FE730E;
    }
    .sWord {
	font-family: "微软雅黑";
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #006633;
    }
    .aWord {
	font-family: "微软雅黑";
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #FF0000;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="font-size: 24pt"><span style="font-size: 11pt; color: #fe730e;
            font-family: 微软雅黑">您的位置:用户管理-&gt;用户信息管理</span><br />
        </span></strong>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        InsertCommand="INSERT INTO [tbl_UserInfo] ([U_id], [U_name], [U_password]) VALUES (@U_id, @U_name, @U_password)" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [tbl_UserInfo]">
            <InsertParameters>
                <asp:Parameter Name="U_id" Type="String" />
                <asp:Parameter Name="U_name" Type="String" />
                <asp:Parameter Name="U_password" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="gdvUserInfo" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
        AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        OnRowDeleting="gdvUserInfo_RowDeleting" OnRowCancelingEdit="gdvUserInfo_RowCancelingEdit" OnRowEditing="gdvUserInfo_RowEditing" OnRowUpdated="gdvUserInfo_RowUpdated" OnRowUpdating="gdvUserInfo_RowUpdating"  Font-Size="14px" Height="11px" Width="601px" AllowPaging="True" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="编号" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="U_id" HeaderText="用户帐号" SortExpression="U_id" ReadOnly="True" />
                <asp:BoundField DataField="U_name" HeaderText="用户姓名" SortExpression="U_name" >
                    <ControlStyle Width="64px" />
                </asp:BoundField>
                <asp:BoundField DataField="U_password" HeaderText="用户密码" >
                    <ControlStyle Width="72px" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.gif" EditImageUrl="~/images/edit.gif"
                    ShowEditButton="True" UpdateImageUrl="~/images/update.gif" HeaderText="编辑" >
                    <ItemStyle Width="60px" />
                </asp:CommandField>    
                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" AlternateText="删除" 
                            ImageUrl="~/images/delete.gif" OnClientClick="return confirm('你确认删除该用户信息吗 ?\n\n该用户所关联的操作权限记录信息也将同时删除 ！')"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" />
            <EmptyDataTemplate>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <img src="images/info.bmp" style="width: 22px; height: 20px" />
                &nbsp; <strong><span style="color: #0000ff">没有记录<span style="font-family: 宋体">！</span></span></strong>
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:Panel ID="pnlNew" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="None"
            Height="28px" Width="599px" Font-Size="12px" HorizontalAlign="Center" Visible="False">
            <span class="sWord">用户帐号: </span><asp:TextBox ID="txtUid" runat="server"
                Height="14px" Width="72px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="rfvUid" runat="server" ControlToValidate="txtUid"
                ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator><asp:CustomValidator
                    ID="ctvUid" runat="server" ControlToValidate="txtUid" ErrorMessage="CustomValidator"
                    OnServerValidate="ctvUid_ServerValidate">*</asp:CustomValidator>
            &nbsp; &nbsp;&nbsp;
            <span class="sWord">用户姓名: </span><asp:TextBox ID="txtUname"
                        runat="server" Height="14px" Width="64px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtUname"
                ErrorMessage="RequiredFieldValidator" Display="Dynamic">*</asp:RequiredFieldValidator><asp:CustomValidator
                    ID="ctvUname" runat="server" ControlToValidate="txtUname" ErrorMessage="CustomValidator"
                    OnServerValidate="ctvUname_ServerValidate">*</asp:CustomValidator><span style="font-size: 10pt"></span></asp:Panel>
        <span style="font-size: 7pt">
            <br />
        </span>
        <asp:LinkButton ID="lbnInsUser" runat="server" OnClick="lbnInsUser_Click" Height="25px" CssClass="sWord">添加新用户</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lbnCancel" runat="server" Height="25px" OnClick="lbnCancel_Click"
            Visible="False" CausesValidation="False" EnableViewState="False" CssClass="sWord">取消</asp:LinkButton><br />
        <asp:Label ID="lblMess" runat="server" CssClass="aWord"></asp:Label>
    
    </div>
    </form>
</body>
</html>
