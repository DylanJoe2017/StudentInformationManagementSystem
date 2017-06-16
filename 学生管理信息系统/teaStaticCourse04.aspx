<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaStaticCourse04.aspx.cs"
    Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生信息管理系统</title>
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
	ul li{
	list-style:none;
	padding:5px 0;
	}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 710px;">
                <tr>
                    <td rowspan="3" valign="top" style="width: 0px">
                    </td>
                    <td valign="top" style="width: 764px; height: 1px;" class="bWord">
                        您的位置：统计功能-&gt;统计课程成绩</td>
                </tr>
                <tr>
                    <td valign="top" style="width: 764px" class="bWord">
                        请选择您要统计的课程:
                    </td>
                </tr>
                <tr>
                    <td height="32" valign="top" style="width: 764px">
                        <asp:DropDownList ID="drpCour" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem>--请选择--</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp&nbsp&nbsp&nbsp<asp:Button ID="btnSta" runat="server" OnClick="btnSta_Click"
                            Text="开始统计" CssClass="button" />
                        &nbsp&nbsp&nbsp&nbsp<asp:Label ID="lblAlarm" runat="server" CssClass="aWord" Visible="false"></asp:Label>
                        &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                    <td valign="top">
                    </td>
                </tr>
                <tr>
                    <td style="height: 136px; width: 1px;">
                    </td>
                    <td valign="top" style="width: 764px; height: 136px;">
                        <asp:GridView ID="gdvScoresInfo" runat="server" Width="783px" AutoGenerateColumns="False" Font-Size="14px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <Columns>
                                <asp:BoundField DataField="S_no" HeaderText="学号" SortExpression="S_no" />
                                <asp:BoundField DataField="S_name" HeaderText="姓名" SortExpression="S_name" />
                                <asp:BoundField DataField="S_grade" HeaderText="年级" SortExpression="S_grade" />
                                <asp:BoundField DataField="C_no" HeaderText="课程号" SortExpression="C_no" />
                                <asp:BoundField DataField="C_name" HeaderText="课程名称" SortExpression="C_name" />
                                <asp:BoundField DataField="C_teacher" HeaderText="任课教师" SortExpression="C_teacher" />
                                <asp:BoundField DataField="Scores" HeaderText="成绩" SortExpression="Scores" />
                                <asp:BoundField DataField="C_scores" HeaderText="学分" SortExpression="C_scores" />
                            </Columns>
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" Font-Italic="False" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="#E0DFE3" />
                            <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
                            <EmptyDataTemplate>
                                您选的课程暂没有记录！
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="pnlShow" runat="server" Width="784px" Visible="false">
            <table style="width: 696px;" align="center">
                <tr>
                    <td align="center" class="sWord" style="width: 222px">
                        及格人数</td>
                    <td align="center" class="sWord" style="width: 295px">
                        优秀人数</td>
                    <td align="center" class="sWord" style="width: 331px">
                        全部人数</td>
                    <td style="width: 264px" align="center" class="sWord">
                        及格率</td>
                </tr>
                <tr>
                    <td align="center" style="height: 21px; width: 222px;">
                        &nbsp;
                        <asp:LinkButton ID="sco_pass" runat="server" OnClick="stu_pass"></asp:LinkButton>
                    </td>
                    <td align="center" style="width: 295px; height: 21px">
                        &nbsp;<asp:LinkButton ID="sco_well" runat="server" OnClick="stu_good"></asp:LinkButton></td>
                    <td align="center" style="height: 21px; width: 331px;">
                        &nbsp;<asp:LinkButton ID="sco_all" runat="server" OnClick="stu_all"></asp:LinkButton></td>
                    <td style="width: 264px; height: 21px;" align="center">
                        <asp:Label ID="lblRate" runat="server" CssClass="aWord"></asp:Label></td>
                </tr>
            </table>
        </asp:Panel>
        &nbsp;&nbsp;
    </form>
      <ul>
  <li class="sWord">·显示所选择课程名称对应的所有学生的基本信息和成绩信息，</li>
      <li class="sWord">&nbsp;&nbsp; &nbsp;包括：学号、姓名、年级、课程号、课程名称、 任课教师和成绩。</li> 
  <li class="sWord">&nbsp;·统计所选择课程的及格人数、优秀人数,全部人数和及格率。</li></ul>
</body>
</html>
