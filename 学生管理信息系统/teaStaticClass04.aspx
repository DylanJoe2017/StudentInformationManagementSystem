<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaStaticClass04.aspx.cs"
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
            <table style="width: 800px" border="0">
                <tr style="width: 800px; height: 20px">
                    <td class="bWord" colspan="4" style="height: 20px">
                        您的位置:统计功能-&gt;统计班级成绩</td>
                    <td class="bWord" colspan="1" style="width: 81px; height: 20px">
                    </td>
                </tr>
                <tr style="width: 800px; height: 20px;">
                    <td colspan="4" style="height: 20px" class="bWord">
                        请选择你要统计的课程:</td>
                    <td class="bWord" colspan="1" style="height: 20px; width: 81px;">
                    </td>
                </tr>
                <tr style="width: 800px; height: 20px;">
                    <td style="height: 20px; width: 478px;" class="sWord">
                        年级:<asp:DropDownList ID="drpGrade" runat="server" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                            <asp:ListItem>2004级</asp:ListItem>
                            <asp:ListItem>2005级</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="height: 20px; width: 906px;" class="sWord">
                        学院:<asp:DropDownList ID="drpInstitute" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpInstitute_SelectedIndexChanged"
                            AppendDataBoundItems="True" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="height: 20px; width: 1116px;" class="sWord">
                        专业:<asp:DropDownList ID="drpDept" runat="server" AppendDataBoundItems="True" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="sWord" style="width: 417px; height: 20px">
                        班级:<asp:DropDownList ID="drpClass" runat="server" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                            <asp:ListItem>1班</asp:ListItem>
                            <asp:ListItem>2班</asp:ListItem>
                            <asp:ListItem>3班</asp:ListItem>
                            <asp:ListItem>4班</asp:ListItem>
                            <asp:ListItem>5班</asp:ListItem>
                            <asp:ListItem>6班</asp:ListItem>
                            <asp:ListItem>7班</asp:ListItem>
                            <asp:ListItem>8班</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="sWord" style="height: 20px; width: 81px;">
                        <asp:Button ID="btnSta" runat="server" Text="开始统计" OnClick="btnSta_Click" CssClass="button" />
                    </td>
                </tr>
                <tr style="width: 800px; height: 20px;">
                    <td style="height: 20px; width: 478px;" class="sWord">
                        课程:<asp:DropDownList ID="drpCour" runat="server" AppendDataBoundItems="True" CssClass="sWord">
                            <asp:ListItem>--全部--</asp:ListItem>
                        </asp:DropDownList></td>
                    <td colspan="4" style="height: 20px">
                        <asp:Label ID="lblAlarm" runat="server" CssClass="aWord"></asp:Label></td>
                </tr>
                <tr style="width: 800px">
                    <td colspan="5">
                        <asp:GridView ID="gdvScoresInfo" runat="server" AutoGenerateColumns="False" Height="1px"
                            Width="797px" Font-Size="14px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Italic="False"
                                HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
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
                            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#E0DFE3" />
                            <RowStyle HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                您选的课程暂没有记录！
                            </EmptyDataTemplate>
                        </asp:GridView>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="pnlShow" runat="server" Visible="false">
            <table border="0" cellspacing="1" style="width: 801px; height: 26px">
                <tr>
                    <td class="sWord" style="width: 124px; height: 2px">
                    </td>
                    <td class="sWord" style="width: 124px; height: 2px">
                        优秀</td>
                    <td class="sWord" style="width: 124px; height: 2px">
                        良好</td>
                    <td class="sWord" style="width: 124px; height: 2px">
                        中等</td>
                    <td style="height: 2px; width: 124px;" class="sWord">
                        及格</td>
                </tr>
                <tr>
                    <td style="width: 124px; height: 21px" class="sWord" align="left">
                        人数</td>
                    <td style="width: 124px; height: 21px">
                        <asp:LinkButton ID="sco_good" runat="server" OnClick="stu_good"></asp:LinkButton></td>
                    <td style="width: 124px; height: 21px">
                        <asp:LinkButton ID="sco_ok" runat="server" OnClick="stu_ok"></asp:LinkButton></td>
                    <td style="width: 124px; height: 21px">
                        <asp:LinkButton ID="sco_middle" runat="server" OnClick="stu_middle"></asp:LinkButton></td>
                    <td style="width: 124px; height: 21px;">
                        <asp:LinkButton ID="sco_pass" runat="server" OnClick="stu_pass"></asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 124px; height: 21px" class="sWord" align="left">
                        百分比</td>
                    <td style="width: 124px; height: 21px" class="sWord">
                        <asp:Label ID="lblRateg" runat="server"></asp:Label></td>
                    <td style="width: 124px; height: 21px" class="sWord">
                        <asp:Label ID="lblRatec" runat="server"></asp:Label></td>
                    <td style="width: 124px; height: 21px" class="sWord">
                        <asp:Label ID="lblRatem" runat="server"></asp:Label></td>
                    <td style="width: 124px; height: 21px">
                        <asp:Label ID="lblrate" runat="server" CssClass="sWord"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" class="sWord" style="width: 124px; height: 21px">
                        全部人数</td>
                    <td colspan="4" style="height: 21px" class="aWord">
                        <asp:LinkButton ID="sco_all" runat="server" OnClick="stu_all"></asp:LinkButton></td>
                </tr>
            </table>

        </asp:Panel>
    </form>
                  <ul>
  <li class="sWord">·可以按逐级递进（筛选）方式查询某个班级所有学生的个人信息和成绩信息，</li>
                      <li class="sWord">&nbsp; &nbsp; 查询结果显示的信息包括：学号，姓名，年级，课程号，课程名称，任课教师，成绩，学分; </li>
  <li class="sWord">·可以通过选择课程名称来查看学习该课程的所有学生的所有学生个人信息和成绩信息，</li>
                      <li class="sWord">&nbsp; &nbsp; 查询结果显示的信息包括：学号，姓名，年级，课程号，课程名称，任课教师，成绩，学分; </li>
  <li class="sWord"> ·统计所选课程的：及格人数，优秀人数，全部人数，及格率。</li><li class="sWord">&nbsp;&nbsp; &nbsp;还给出每个成绩等级的人数，对应比率和所学该课程的总人数，
  </li>
                      <li class="sWord">&nbsp; &nbsp; 该功能是对“统计课程信息”功能的补充和完善; </li>
                      <li class="sWord">。特别说明：可以通过点击每个等级“人数”超链，细化显示该等级所有学生的个人信息和成绩信息。</li>
  </ul>
</body>
</html>
