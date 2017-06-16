<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaChooseCourse05.aspx.cs" Inherits="chooseCourse" %>

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
    <form id="form1" runat="server" >
    <div>
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生个人成绩管理-&gt;按课程录入</span></strong><br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceCoures" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT [C_no], [C_name] FROM [tbl_CourseInfo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceHasChoCoures" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ appSettings:dsn %>"
            DeleteCommand="DELETE FROM [tbl_StuScores] WHERE [Id] = @original_Id AND [C_no] = @original_C_no"
            InsertCommand="INSERT INTO [tbl_StuScores] ([C_no]) VALUES (@C_no)"
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT tbl_StuScores.Id, tbl_StuScores.C_no,tbl_CourseInfo.C_name FROM tbl_StuScores,tbl_CourseInfo WHERE (([S_no] = @S_no) AND ([Scores] = @Scores) and tbl_StuScores.C_no=tbl_CourseInfo.C_no)"
            UpdateCommand="UPDATE [tbl_StuScores] SET [C_no] = @C_no WHERE [Id] = @original_Id AND [C_no] = @original_C_no">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_C_no" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="C_no" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_C_no" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="S_no" QueryStringField="id" Type="String" />
                <asp:Parameter DefaultValue="0" Name="Scores" Type="Decimal" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="C_no" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStuInfo" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT [S_no], [S_name], [S_Inse], [S_dept], [S_class] FROM [tbl_StuInfo] WHERE ([S_no] = @S_no)">
            <SelectParameters>
                <asp:QueryStringParameter Name="S_no" QueryStringField="id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table style="border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid; border-left: #e0dfe3 1px solid; width: 701px; border-bottom: #e0dfe3 1px solid; border-collapse: collapse; height: 170px; text-align: center">
            <tr>
                <td style="width: 164px; background-color: #ffffff;" colspan="3" align="center" class="sWord">
                    选择选修课</td>
                
            </tr>
            <tr><td colspan="2" align="left">
                <asp:Label ID="lblTop" runat="server" Text="Label" CssClass="aWord"></asp:Label></td>
            <td style="width: 269px">
                    <asp:DropDownList ID="drpCourse" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSourceCoures"
                        DataTextField="C_name" DataValueField="C_no" CssClass="sWord">
                        <asp:ListItem>请选择课程</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 164px" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSourceStuInfo"
                        GridLines="Horizontal" Width="519px" Font-Size="14px">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <Columns>
                            <asp:BoundField DataField="S_no" HeaderText="学号" SortExpression="S_no" />
                            <asp:BoundField DataField="S_name" HeaderText="姓名" SortExpression="S_name" />
                            <asp:BoundField DataField="S_Inse" HeaderText="学院" SortExpression="S_Inse" />
                            <asp:BoundField DataField="S_dept" HeaderText="专业" SortExpression="S_dept" />
                            <asp:BoundField DataField="S_class" HeaderText="班级" SortExpression="S_class" />
                        </Columns>
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" Font-Italic="False" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
                    </asp:GridView>
                </td>
                <td style="width: 269px">
                    &nbsp;<asp:Label ID="lblHasChoose" runat="server" Text="你已经选修的课程" Width="242px" CssClass="aWord"></asp:Label>
                    <asp:GridView ID="grvHasChoCourse" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                        DataSourceID="SqlDataSourceHasChoCoures" Width="268px" Font-Size="14px">
                        <Columns>
                            <asp:BoundField DataField="C_no" HeaderText="课程号" SortExpression="C_no" />
                            <asp:BoundField DataField="C_name" HeaderText="课程名" SortExpression="C_name" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
                
            </tr>
            <tr>
                <td style="width: 164px; height: 21px;">
                </td>
                <td style="width: 340px; height: 21px; text-align: center;">
                    <asp:Button ID="btnAddCourse" runat="server" Text="增加" OnClick="btnAddCourse_Click" CssClass="button" />
                    <asp:HyperLink ID="hylShowStu" runat="server" NavigateUrl="~/teaShowStuInfo05.aspx" CssClass="sWord">返回查询页面</asp:HyperLink></td>
                <td style="width: 269px; height: 21px;">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
