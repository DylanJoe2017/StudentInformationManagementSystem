<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getstuinfo.aspx.cs" Inherits="getstuinfo"
    EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生查询</title>
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
    }
    .aWord {
	font-family: "微软雅黑";
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #FF0000;
    }
        .auto-style1 {
            font-family: "微软雅黑";
            font-size: 14px;
            font-style: normal;
            font-weight: bold;
            font-variant: normal;
            color: #006633;
            height: 20px;
            width: 783px;
        }
        .auto-style2 {
            margin-top: 0px;
        }
    -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="infoDiv" runat="server">
            <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息查询</span></strong><br />
            <asp:Label ID="lblErrMessage" runat="server" CssClass="aWord"></asp:Label>
            <table style="font-size:14px; width: 788px; height: 624px;">
                <tr>
                    <td style="background-color: #cccccc; " class="auto-style1" ><a id="basic" name="basic"></a>基本信息:</td>
                </tr>
                <tr>
                    <td style="width: 783px; height: 18px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 783px; height: 180px;" >
                        <table style="width: 778px" class="sWord">
                            <tr>
                                <td style="width: 124px">
                                    </td>
                                <td style="width: 112px">
                                    学 号：</td>
                                <td style="width: 214px">
                                    <asp:Label ID="lblNO" runat="server"></asp:Label></td>
                                <td style="width: 150px">
                                    政治面貌：</td>
                                <td style="width: 208px">
                                    <asp:Label ID="lblParty" runat="server"></asp:Label></td>
                                <td style="width: 126px" rowspan="4">
                                      <asp:Image ID="imgPhoto" ImageUrl="Photos\male.jpg" runat="server" />
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px">
                                </td>
                                <td style="width: 112px">
                                    姓 名：</td>
                                <td style="width: 214px">
                                    <asp:Label ID="lblName" runat="server"></asp:Label></td>
                                <td style="width: 150px">
                                    出生日期：</td>
                                <td style="width: 208px">
                                    <asp:Label ID="lblBirthday" runat="server"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px">
                                </td>
                                <td style="width: 112px">
                                    性 别：</td>
                                <td style="width: 214px">
                                    <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                                <td style="width: 150px">
                                    入学时间：</td>
                                <td style="width: 208px">
                                    <asp:Label ID="lblIn" runat="server"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px">
                                </td>
                                <td style="width: 112px">
                                    住 址：</td>
                                <td style="width: 214px">
                                    <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                                <td style="width: 150px">
                                    毕业时间：</td>
                                <td style="width: 208px">
                                    <asp:Label ID="lblOut" runat="server"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 124px; height: 25px;">
                                </td>
                                <td style="width: 112px; height: 25px;">
                                    在校信息：</td>
                                <td style="height: 25px;" colspan="4">
                                    <asp:Label ID="lblLocate" runat="server"></asp:Label></td>
                                <td style="width: 100px; height: 25px;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 20px; background-color: #cccccc; width: 783px;" class="sWord"><a id="scores" name="score"></a>
                        成绩信息 :</td>
                </tr>
                <tr>
                    <td style="height: 1px; width: 783px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 783px; height: 162px;">
                        <asp:GridView ID="gvScores" runat="server" RowStyle-HorizontalAlign="center" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="92%" Font-Size="14px" AllowPaging="True" DataKeyNames="Id1" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="C_name" HeaderText="课程名称" SortExpression="C_name" />
                                <asp:BoundField DataField="C_teacher" HeaderText="教师" SortExpression="C_teacher" />
                                <asp:BoundField DataField="C_hours" HeaderText="学时" SortExpression="C_hours" />
                                <asp:BoundField DataField="C_scores" HeaderText="学分" SortExpression="C_scores" />
                                <asp:BoundField DataField="Scores" HeaderText="成绩" SortExpression="Scores" />
                            </Columns>
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#E0DFE3" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tbl_StuScores], [tbl_CourseInfo] WHERE ([S_no] = @S_no)   and tbl_StuScores.C_no = tbl_CourseInfo.C_no">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="S_no" SessionField="uid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="height: 21px; background-color: #cccccc; width: 783px;" class="sWord"><a id="expes" name="expes"></a>履历信息:</td>
                </tr>
                <tr>
                    <td style="width: 783px; height: 18px">
                        &nbsp;&nbsp;
                        <asp:GridView ID="gvExpes" runat="server" RowStyle-HorizontalAlign="center" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="Gray" GridLines="None" Width="92%" Font-Size="14px" BackColor="White" AllowPaging="True" CssClass="auto-style2" DataKeyNames="Id" DataSourceID="SqlDataSource2" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField HeaderText="开始时间" ShowHeader="False" DataField="E_beginDate" DataFormatString="{0:yyyy年MM月dd日}" SortExpression="E_beginDate">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="结束时间" DataField="E_endDate" DataFormatString="{0:yyyy年MM月dd日}" SortExpression="E_endDate" />
                                <asp:BoundField HeaderText="内容" DataField="E_content" SortExpression="E_content" />
                                <asp:BoundField HeaderText="类型" DataField="E_type" SortExpression="E_type" />
                            </Columns>
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#E0DFE3" />
                            <RowStyle HorizontalAlign="Left" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tbl_StuExpe] WHERE ([S_no] = @S_no)">
                            <SelectParameters>
                                <asp:SessionParameter Name="S_no" SessionField="uid" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
