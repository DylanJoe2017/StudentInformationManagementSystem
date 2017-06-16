<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaShowStuInfo05.aspx.cs" Inherits="showStuInfo08" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查找学生</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生成绩信息管理-&gt;个人成绩管理</span></strong><br />
        <br />
        
        <asp:SqlDataSource ID="SqlDataSourceInse" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT DISTINCT [Inse_no], [Inse_name] FROM [tbl_deptMant]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceClass" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT DISTINCT [S_class] FROM [tbl_StuInfo] WHERE (([S_grade] = @S_grade) AND ([S_Inse] = @S_Inse) AND ([S_dept] = @S_dept))">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpGrade" Name="S_grade" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="drpInse" Name="S_Inse" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="drpDept" Name="S_dept" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT DISTINCT [Dept_no], [Dept_name] FROM [tbl_deptMant] WHERE ([Inse_no] = @Inse_no)">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpInse" Name="Inse_no" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceGrade" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT DISTINCT [S_grade] FROM [tbl_StuInfo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceShowClassStu" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT [S_no], [Id], [S_name] FROM [tbl_StuInfo] WHERE (([S_grade] = @S_grade) AND ([S_Inse] = @S_Inse) AND ([S_dept] = @S_dept) AND ([S_class] = @S_class))">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpGrade" Name="S_grade" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="drpInse" Name="S_Inse" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="drpDept" Name="S_dept" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="drpClass" Name="S_class" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceOneStu" runat="server" ConnectionString="<%$ appSettings:dsn %>"
            SelectCommand="SELECT [Id], [S_no], [S_name] FROM [tbl_StuInfo] WHERE ([S_no] = @S_no)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtID" Name="S_no" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table style="width: 389px; border-right: #CCCCCC thin solid; border-top: #CCCCCC thin solid; border-left: #CCCCCC thin solid; border-bottom: #CCCCCC thin solid; text-align: center; height: 1px;">
            <tr>
                <td colspan="6"  style="width: 788px; text-align: center; background-color: #FFFFFF; position: static;" valign="middle" align="center" class="sWord">
                    <asp:Label ID="lblTop" runat="server" Text="请选择成绩录入方式" Width="781px" Height="25px"></asp:Label></td>
                
                
            </tr>
            <tr style="background-color: #ffffff">
                <td colspan="6" style="height: 26px; width: 788px;" align="left" class="sWord">
                    方式一：&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpGrade" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSourceGrade" DataTextField="S_grade" DataValueField="S_grade" CssClass="sWord">
                        <asp:ListItem>请选择年级</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpInse" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceInse" DataTextField="Inse_name" DataValueField="Inse_no" OnSelectedIndexChanged="drpInse_SelectedIndexChanged" CssClass="sWord">
                        <asp:ListItem>请选择院</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpDept" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceDept" DataTextField="Dept_name" DataValueField="Dept_no" OnSelectedIndexChanged="drpDept_SelectedIndexChanged" CssClass="sWord">
                        <asp:ListItem>请选择专业</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpClass" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceClass" DataTextField="S_class" DataValueField="S_class" OnSelectedIndexChanged="drpClass_SelectedIndexChanged" CssClass="sWord">
                        <asp:ListItem>请选择班级</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click" Text="查询" CssClass="button" /></td>
            </tr>
            <tr style="background-color: #ffffff">
                <td colspan="6" style="height: 26px; width: 788px;" align="left" class="sWord">
                    方式二：&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtID" runat="server" Width="105px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnID" runat="server" Text="按学号查询" OnClick="btnID_Click" CssClass="button" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="hylMain" runat="server" NavigateUrl="~/teaManStuScore05.aspx">返回选择页面</asp:HyperLink>&nbsp;</td>
            </tr>
            <tr style="background-color: #ffffff">
                <td colspan="6" rowspan="2" style="text-align:left; width: 788px;">
                    <asp:Label ID="lblShowResult" runat="server" Text="Label" Width="500px" CssClass="aWord"></asp:Label>&nbsp;</td>
               
            </tr>
                
               
            
            <tr>
            </tr>
            <tr>
                <td colspan="6" rowspan="1" style="text-align: center; width: 788px;">
                <asp:GridView ID="grvStu1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#0000C0" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"
                        DataSourceID="SqlDataSourceShowClassStu" GridLines="Horizontal" Width="782px" HorizontalAlign="Center" Font-Size="14px">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <Columns>
                            <asp:BoundField DataField="S_no" HeaderText="学号" InsertVisible="False" ReadOnly="True"
                                SortExpression="Id" />
                            <asp:BoundField DataField="S_name" HeaderText="姓名" SortExpression="S_name" />
                            <asp:HyperLinkField DataNavigateUrlFields="S_no" DataNavigateUrlFormatString="teaShowStuScores05.aspx?id={0}"
                                HeaderText="成绩信息" Text="管理成绩" />
                        </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:GridView ID="grvStu2" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#0000C0" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"
                        DataSourceID="SqlDataSourceOneStu" GridLines="Horizontal" Width="782px" Font-Size="14px">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <Columns>
                            <asp:BoundField DataField="S_no" HeaderText="学号" SortExpression="S_no" />
                            <asp:BoundField DataField="S_name" HeaderText="姓名" SortExpression="S_name" />
                            <asp:HyperLinkField DataNavigateUrlFields="S_no" DataNavigateUrlFormatString="teaShowStuScores05.aspx?id={0}"
                                HeaderText="成绩信息" Text="管理成绩" />
                        </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:GridView ID="grvStu" runat="server" AutoGenerateColumns="False" Width="783px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Font-Size="14px">
                    <Columns>
                        <asp:BoundField DataField="S_no" HeaderText="学号" />
                        <asp:BoundField DataField="S_name" HeaderText="姓名" />
                        <asp:HyperLinkField DataNavigateUrlFields="S_no" DataNavigateUrlFormatString="teaShowStuScores05.aspx?id={0}"
                            HeaderText="成绩信息" Text="管理成绩" />
                    </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E0DFE3" />
                <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
                </td>
            </tr>
        </table>
        
            <table style="width: 701px; height: 170px; border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid; border-left: #e0dfe3 1px solid; border-bottom: #e0dfe3 1px solid; border-collapse: collapse; text-align: center;">
            <tr>
                <td style="width: 19px; text-align: center;">
                    </td>
                    <td style="width: 436px;height:10px" align="left" class="sWord">
                        </td>
            </tr>
            <tr>
                <td style="width: 19px; text-align: center;">
                    </td>
                    <td style="width: 436px" align="left" class="sWord">
                        ·可以按逐级递进（筛选）方式查询和管理班级学生成绩信息;</td>
            </tr>
            <tr>
                <td style="width: 19px;text-align: center;">
                    </td>
                    <td style="width: 436px;" align="left" class="sWord">
                        ·可以按学号对学生所学课程的成绩进行查询和管理，</td>
            </tr>
                        <tr>
                <td style="width: 19px; text-align: center;">
                    </td>
                    <td style=" width: 436px;" align="left" class="sWord">
                        
                        &nbsp; &nbsp; 成绩管理包括：成绩录入，成绩删除，和成绩修改;</td>
            </tr>
        </table>
    </div>
  
    </form>
</body>
</html>
