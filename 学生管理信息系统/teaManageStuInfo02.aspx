<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="teaManageStuInfo02.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>学生基本信息管理</title>
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
        <span class=bWord>您的位置:学生信息管理-&gt;学生基本信息管理</span>
        <table id="TABLE1" cellspacing="3" style="text-align: left; border-right: lightsteelblue 1px solid; border-top: lightsteelblue 1px solid; border-left: lightsteelblue 1px solid; border-bottom: lightsteelblue 1px solid; height: 1px; width: 700px;" >
            <tr class=sWord>
                <td style="background-color: #EFF3FB; height: 6px;" >
                    <span style="font-size: 11pt">年级:</span></td>
                <td style="background-color: #EFF3FB; height: 6px;">
                    <span style="font-size: 11pt">学院:</span></td>
                <td style="background-color: #EFF3FB; height: 6px;">
                    <span style="font-size: 11pt">系:</span></td>
                <td style="background-color: #EFF3FB; width: 85px; height: 6px;">
                    <span style="font-size: 11pt">班级:</span></td>
            </tr>
            <tr>
                <td style="width: 33px; height: 20px;">
                    <asp:DropDownList ID="drpGrade" runat="server" CssClass="sWord">
                        <asp:ListItem>--全部--</asp:ListItem>
                        <asp:ListItem>2016级</asp:ListItem>
                        <asp:ListItem>2015级</asp:ListItem>
                        <asp:ListItem>2014级</asp:ListItem>
                        <asp:ListItem>2013级</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 111px; height: 20px;">
                    <asp:DropDownList ID="drpInstitute" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpInstitute_SelectedIndexChanged" AppendDataBoundItems="True" CssClass="sWord">
                        <asp:ListItem>--全部--</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 124px; height: 20px;">
                    <asp:DropDownList ID="drpDept" runat="server" AppendDataBoundItems="True" CssClass="sWord">
                        <asp:ListItem>--全部--</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 85px; height: 20px">
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
                    </asp:DropDownList></td>
            </tr>
        </table>
    
    </div>
        <asp:Button ID="btnSearch" runat="server" Text="按条件显示" OnClick="btnSearch_Click" CssClass="button" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbnInsert" runat="server" OnClick="lbnInsert_Click" CssClass=aWord>添加</asp:LinkButton>&nbsp;<br />
        <br />
        <asp:GridView ID="grvStuInfo" runat="server" BorderColor="Gray" CellPadding="4" ForeColor="#333333" BorderWidth="1px" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="grvStuInfo_RowDataBound" OnRowDeleting="grvStuInfo_RowDeleting" DataKeyNames="id,s_no" OnSelectedIndexChanged="grvStuInfo_SelectedIndexChanged" Font-Size="14px" Width="788px" Height="1px">
            <FooterStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="s_no" HeaderText="学号" />
                <asp:BoundField DataField="s_name" HeaderText="姓名" />
                <asp:BoundField DataField="s_grade" HeaderText="年级" />
                <asp:BoundField DataField="inse_name" HeaderText="学院" />
                <asp:BoundField DataField="dept_name" HeaderText="系别" />
                <asp:BoundField DataField="s_class" HeaderText="班级" />
                <asp:HyperLinkField DataNavigateUrlFields="s_no" DataNavigateUrlFormatString="teaBrowseDetail02.aspx?s_no={0}"
                    Target="_blank" Text="详细" HeaderText="详细" />
                <asp:CommandField SelectText="修改" ShowSelectButton="True" HeaderText="修改" />
                <asp:TemplateField ShowHeader="False" HeaderText="删除">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('你确认删除该学生的基本资料信息吗 ?\n如果【确定】，该学生信息将被永久删除，否则请【取消】！')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" Font-Italic="False" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
            <EmptyDataTemplate>
                没有记录！
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView1" runat="server" BorderColor="Gray" CellPadding="4" ForeColor="#333333" BorderWidth="1px" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="grvStuInfo_RowDataBound" OnRowDeleting="grvStuInfo_RowDeleting" DataKeyNames="id,s_no" OnSelectedIndexChanged="grvStuInfo_SelectedIndexChanged" Font-Size="14px" Width="788px" Height="1px">
            <FooterStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="s_no" HeaderText="学号" />
                <asp:BoundField DataField="s_name" HeaderText="姓名" />
                <asp:BoundField DataField="s_grade" HeaderText="年级" />
                <asp:BoundField DataField="inse_name" HeaderText="学院" />
                <asp:BoundField DataField="dept_name" HeaderText="系别" />
                <asp:BoundField DataField="s_class" HeaderText="班级" />
            </Columns>
            <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
            <EmptyDataTemplate>
                没有记录！
            </EmptyDataTemplate>
            <EditRowStyle BackColor="#CCCCCC" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" Font-Italic="False" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="#E0DFE3" />
        </asp:GridView>
        &nbsp;<br />
        &nbsp;
        </form>
</body>
</html>
