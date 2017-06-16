<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaManCourse06.aspx.cs" Inherits="manManUser01" %>

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
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑;">您的位置:系统维护-&gt;课程信息管理<br />
            <br />
        </span></strong><asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [tbl_CourseInfo]">
        </asp:SqlDataSource>
        <asp:GridView ID="grvCourseInfo" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="788px" Height="1px" GridLines="Horizontal" Font-Size="14px" EnableModelValidation="True">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="C_no" HeaderText="课程编号" SortExpression="C_no" />
                <asp:BoundField DataField="C_name" HeaderText="课程名称" SortExpression="C_name" />
                <asp:BoundField DataField="C_teacher" HeaderText="任课教师" SortExpression="C_teacher" />
                <asp:BoundField DataField="C_hours" HeaderText="学时" SortExpression="C_hours" />
                <asp:BoundField DataField="C_scores" HeaderText="学分" SortExpression="C_scores" />
                <asp:TemplateField ShowHeader="False" HeaderText="删除">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除" OnClientClick ="return confirm('你是否确认删除该课程？')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="c_no"　DataNavigateUrlFormatString="teaViewCourse06.aspx?c_no={0}" Target="_blank" Text="详细" HeaderText="详细" />
            </Columns>
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#E0DFE3" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        
        &nbsp;&nbsp;
        <span style="font-size: 7pt">
            <br />
        </span>
        <asp:LinkButton ID="lbnInsUser" runat="server" Height="25px" PostBackUrl="~/teaAddCourseInfo06.aspx" CssClass="sWord">添加新课程</asp:LinkButton></div>
    </form>
</body>
</html>
