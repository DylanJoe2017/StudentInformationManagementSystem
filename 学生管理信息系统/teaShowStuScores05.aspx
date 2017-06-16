<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaShowStuScores05.aspx.cs" Inherits="showStuScores08" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>学生成绩管理</title>
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
        &nbsp;<strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生个人成绩管理<br />
            <br />
        </span></strong><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ appSettings:dsn %>" 
                        OldValuesParameterFormatString="original_{0}"
                         SelectCommand="select tbl_StuScores.Id, tbl_StuScores.C_no,tbl_CourseInfo.C_name,tbl_StuScores.Scores from tbl_StuScores,tbl_CourseInfo  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=@id" 
                        UpdateCommand="UPDATE [tbl_StuScores] SET [C_no] = @C_no, [Scores] = @Scores WHERE [Id] = @original_Id AND [C_no] = @original_C_no AND [Scores] = @original_Scores" 
                        DeleteCommand="DELETE FROM [tbl_StuScores] WHERE [Id] = @original_Id AND [C_no] = @original_C_no AND [Scores] = @original_Scores" 
                        InsertCommand="INSERT INTO [tbl_StuScores] ([C_no], [Scores]) VALUES (@C_no, @Scores)" ProviderName="System.Data.SqlClient">
                        
                        <UpdateParameters>
                            <asp:Parameter Name="C_no" Type="String" />
                            <asp:Parameter Name="Scores" Type="Decimal" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_C_no" Type="String" />
                            <asp:Parameter Name="original_Scores" Type="Decimal" />
                        </UpdateParameters>
                        <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_C_no" Type="String" />
                            <asp:Parameter Name="original_Scores" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="C_no" Type="String" />
                            <asp:Parameter Name="Scores" Type="Decimal" />
                        </InsertParameters>
                    </asp:SqlDataSource>
        <table style="text-align: center; width: 670px; border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid; border-left: #e0dfe3 1px solid; border-bottom: #e0dfe3 1px solid; border-collapse: collapse; height: 161px;">
            <tr>
                <td style="width: 1067px; height: 21px;" colspan="2" align="left">
                    <asp:Label ID="lblID" runat="server" Width="332px" CssClass="sWord"></asp:Label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:HyperLink ID="hylShowStu" runat="server" NavigateUrl="~/teaShowStuInfo05.aspx" CssClass="sWord">返回查询页面</asp:HyperLink></td>
                
            </tr>
            <tr>
                <td style="width: 1067px; height: 197px;" colspan="2" align="center">
                   <asp:GridView ID="grvStuScores" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                        DataSourceID="SqlDataSource1" Width="630px" OnRowDataBound="grvStuScores_RowDataBound" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Font-Size="14px">
                        <Columns>
                            <asp:TemplateField HeaderText="课程号" SortExpression="C_no" >
                                <EditItemTemplate>
                                    &nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("C_no") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("C_no") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="课程名" SortExpression="C_name">
                                <EditItemTemplate>
                                    &nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("C_name") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("C_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="成绩" SortExpression="Scores">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Scores") %>' Columns="6"></asp:TextBox>
                                    <asp:RangeValidator ID="rgvScores" runat="server" ControlToValidate="TextBox3" ErrorMessage="成绩输入不正确"
                                        MaximumValue="100.00" MinimumValue="0.00" SetFocusOnError="True" Type="Double" Display="Dynamic">*</asp:RangeValidator><asp:RequiredFieldValidator
                                            ID="rfvScores" runat="server" ControlToValidate="TextBox3" Display="Dynamic"
                                            ErrorMessage="成绩不能为空">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Scores") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" HeaderText="操作">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="更新"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="取消"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="编辑"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:ValidationSummary ID="vdsScores" runat="server" HeaderText="错误提示" ShowMessageBox="True" Height="1px" Width="628px" CssClass="aWord" />
                    </td>
                
            </tr>
        </table>
    
    </div>
        <br />
    </form>
</body>
</html>
