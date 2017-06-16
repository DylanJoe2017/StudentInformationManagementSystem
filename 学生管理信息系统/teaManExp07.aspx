<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaManExp07.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生履历信息管理</title>
    <style type="text/css">
<!--
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
    -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生履历信息管理</span></strong><br />
            
            <table id="TABLE1" cellspacing="3" style="text-align: left; border-right: lightsteelblue 1px solid; border-top: lightsteelblue 1px solid; border-left: lightsteelblue 1px solid; border-bottom: lightsteelblue 1px solid; height: 54px;">
                <tr class=sWord>
                    <td>
                        <span style="font-size: 11pt">年级：</span></td>
                    <td>
                        <span style="font-size: 11pt">学院：</span></td>
                    <td>
                        <span style="font-size: 11pt">院系：</span></td>
                    <td>
                        <span style="font-size: 11pt">班级：</span></td>
                    <td colspan="1">
                        学号：</td>
                    <td colspan="1" style="width: 42px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="drpGrade" runat="server" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                            <asp:ListItem>2004级</asp:ListItem>
                            <asp:ListItem>2005级</asp:ListItem>
                        </asp:DropDownList>&nbsp;
                    </td>
                    <td>
                        <asp:DropDownList ID="drpInstitute" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpInstitute_SelectedIndexChanged"
                            AppendDataBoundItems="True" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                        </asp:DropDownList>&nbsp;
                    </td>
                    <td>
                        <asp:DropDownList ID="drpDept" runat="server" AppendDataBoundItems="True" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                        </asp:DropDownList>&nbsp;
                    </td>
                    <td>
                        <asp:DropDownList ID="drpClass" runat="server" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                            <asp:ListItem>1班</asp:ListItem>
                            <asp:ListItem>2班</asp:ListItem>
                            <asp:ListItem>3班</asp:ListItem>
                            <asp:ListItem>4班</asp:ListItem>
                            <asp:ListItem>5班</asp:ListItem>
                            <asp:ListItem>6班</asp:ListItem>
                            <asp:ListItem>7班</asp:ListItem>
                            <asp:ListItem>8班</asp:ListItem>
                        </asp:DropDownList>&nbsp; &nbsp;</td>
                    <td colspan="1">
                        <asp:TextBox ID="stu_number" runat="server"></asp:TextBox>&nbsp;
                    </td>
                    <td colspan="1" style="width: 42px">
                        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" CssClass="button" /></td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="Gray" BorderStyle="Solid" OnRowDeleting="GridView1_RowDeleting"
                BorderWidth="1px" CellPadding="3" DataKeyNames="id,s_no" ForeColor="Black" GridLines="Vertical"
                RowStyle-HorizontalAlign="center" Width="788px" Height="1px" Font-Size="14px">
                <FooterStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="编号" InsertVisible="False" ReadOnly="True"
                        SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="S_no" HeaderText="学号" SortExpression="S_no" />
                    <asp:BoundField DataField="S_name" HeaderText="姓名" SortExpression="S_name" />
                    <asp:BoundField DataField="E_beginDate" HeaderText="开始日期" SortExpression="E_beginDate" />
                    <asp:BoundField DataField="E_endDate" HeaderText="结束日期" SortExpression="E_endDate" />
                    <asp:BoundField DataField="E_type" HeaderText="类型" SortExpression="E_type" />
                    <asp:HyperLinkField Text="查看" Target="_blank" DataNavigateUrlFields="id" DataNavigateUrlFormatString="teaViewExp07.aspx?clid={0}"
                        HeaderText="内容" />
                    <asp:HyperLinkField Text="编辑" DataNavigateUrlFields="id" DataNavigateUrlFormatString="teaEditExp07.aspx?clid={0}"
                        HeaderText="编辑" />
                    <asp:TemplateField HeaderText="删除">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="删除" OnClientClick="return confirm('是否确定删除？')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <div align="center" style="color: Red">
                        <br />
                        没有记录！</div>
                    <br />
                </EmptyDataTemplate>
            </asp:GridView>
            &nbsp;<br />
            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/teaAddExp07.aspx" CssClass="sWord">添加新履历信息</asp:HyperLink></div>
    </form>
</body>
</html>
