<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaAddScoesByCourse05.aspx.cs" Inherits="addScoesByCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
<style type="text/css">
<!--
a:link {
	color: #669933;
	text-decoration: none;
}
a:visited {
	color: #669933;
	text-decoration: underline;
}
a:hover {
	color: #333333;
	text-decoration: none;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	font-weight: bold;
}
a:active {
	color: #FFFFFF;
	text-decoration: none;
}
.line{ color:gray; height:1px}
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
    .button{
	border:#002D96 1px solid;
	padding:2px 0px 0px 2px;
	filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0, 
	StartColorStr=#ffffff,EndColorStr=#72B1ED);
	cursor:hand;
	color:#003366;
	font:13px;
	margin:0px 4px;
	height:24px;
}
    -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生个人成绩管理-&gt;按课程录入</span></strong><br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceScores" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT [C_no], [C_name] FROM [tbl_CourseInfo] WHERE ([C_flag] = @C_flag)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="C_flag" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStuScores" runat="server" ConnectionString="<%$ appSettings:dsn %>"
                        SelectCommand="select tbl_StuScores.Id,tbl_StuScores.S_no,tbl_StuInfo.S_name from tbl_StuScores,tbl_StuInfo where tbl_StuInfo.S_no=tbl_StuScores.S_no and tbl_StuScores.C_no=@cid">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drpCourse" Name="cid" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
        <table style="width: 732px; border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid; border-left: #e0dfe3 1px solid; border-bottom: #e0dfe3 1px solid; border-collapse: collapse; height: 1px; text-align: center;">
            <tr>
                <td style="width: 300px; background-color: #ffffff; text-align: center; height: 24px;" colspan="2">
                    <asp:Label ID="lblTop" runat="server" Text="按课程输入成绩" Width="496px" Height="16px" CssClass="bWord"></asp:Label></td>
                <td style="width: 392px; height: 24px;">
                    <asp:DropDownList ID="drpCourse" runat="server" DataSourceID="SqlDataSourceScores"
                        DataTextField="C_name" DataValueField="C_no" OnSelectedIndexChanged="drpCourse_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" CssClass="sWord">
                        <asp:ListItem>请选择课程</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 300px" colspan="2">
                    <asp:Label ID="lblWarning" runat="server" Width="492px" CssClass="aWord"></asp:Label>
                    <asp:GridView ID="gdvStuScores" runat="server" DataSourceID="SqlDataSourceStuScores"
                        Width="503px" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Font-Size="14px">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <Columns>
                            <asp:BoundField DataField="S_no" HeaderText="学号" SortExpression="S_no" >
                                <FooterStyle Width="25px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="S_name" HeaderText="姓名" SortExpression="S_name" />
                            <asp:TemplateField HeaderText="成绩">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rdvScores" runat="server" ControlToValidate="TextBox1"
                                        Display="Dynamic" ErrorMessage="成绩没有输入" SetFocusOnError="True">*</asp:RequiredFieldValidator><asp:RangeValidator ID="rvdScores" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                                        ErrorMessage="成绩必须在0～100之间" MaximumValue="100.00" MinimumValue="0.00" Type="Double">*</asp:RangeValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" Font-Italic="False" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
                    </asp:GridView>
                </td>
                <td style="width: 392px" rowspan="2">
                    <asp:ValidationSummary ID="vdsScorse" runat="server" HeaderText="错误提示" CssClass="aWord" />
                </td>
                
            </tr>
            <tr>
                <td style="width: 300px; text-align: right; height: 26px;" colspan="2">
                    &nbsp;<asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="button" />
                    <asp:HyperLink ID="hylShowStu" runat="server" NavigateUrl="~/teaShowStuInfo05.aspx" CssClass="aWord">返回查询页面</asp:HyperLink></td>
                
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
