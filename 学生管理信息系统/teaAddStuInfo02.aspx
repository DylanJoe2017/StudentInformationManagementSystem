<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaAddStuInfo02.aspx.cs" Inherits="teaAddStuInfo02" %>
<%@ Register Src="DateSelector.ascx" TagName="DateSelector" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>“添加学生基本信息”窗体</title>
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

<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="text-align: left" id="DIV1" runat="server">
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生基本信息管理-&gt;添加“学生信息基本信息”<br />
        </span></strong><br />
        <table border="1" cellpadding="1" cellspacing="1" style="border-right: gray 1px solid;
            border-top: gray 1px solid; border-left: gray 1px solid; width: 531px;
            border-bottom: gray 1px solid; border-collapse: collapse; height: 125px; text-align: center" align="center">
            <tr>
                <td colspan="2" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: center" class="bWord">
                    <asp:Label ID="Label1" runat="server" Text="添加学生基本信息" Width="544px" Height="17px"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    &nbsp; 学号：</td>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 513px; border-bottom: gray 1px solid; height: 30px; text-align: left">
                    <asp:TextBox ID="txtSno" runat="server"></asp:TextBox>
                    <span class="sWord">*12位数字</span></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    &nbsp; 姓名：</td>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 513px; border-bottom: gray 1px solid; height: 30px; text-align: left">
                    <asp:TextBox ID="txtSname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 10px; text-align: right" class="sWord">
                    &nbsp;性别：</td>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 513px; border-bottom: gray 1px solid; height: 10px; text-align: left" class="sWord">
                    <asp:RadioButtonList ID="rablistSgender" runat="server" Height="30px" RepeatDirection="Horizontal"
                        Width="118px">
                        <asp:ListItem Selected="True">男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    出生日期：</td>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 513px; border-bottom: gray 1px solid; height: 30px; text-align: left">
                 <uc1:DateSelector ID="dsBirth" runat="server" />    
            </td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    &nbsp;籍贯：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:TextBox ID="txtSaddress" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    政治面貌：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:DropDownList ID="drpSparty" runat="server">
                        <asp:ListItem Selected="True">党员</asp:ListItem>
                        <asp:ListItem>团员</asp:ListItem>
                        <asp:ListItem>群众</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    &nbsp;年级：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:DropDownList ID="drpGrade" runat="server">
                        <asp:ListItem>2004级</asp:ListItem>
                        <asp:ListItem>2005级</asp:ListItem>
                        <asp:ListItem>2006级</asp:ListItem>
                        <asp:ListItem>2007级</asp:ListItem>
                        <asp:ListItem>2008级</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    学院：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:DropDownList ID="drpInstitute" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpInstitute_SelectedIndexChanged">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right"  class="sWord">
                    系：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:DropDownList ID="drpDept" runat="server" OnSelectedIndexChanged="drpDept_SelectedIndexChanged">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                    &nbsp; 班级：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:DropDownList ID="drpClass" runat="server">
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
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right"  class="sWord">
                    入学日期：</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left"  class="sWord">
                    <asp:TextBox ID="txtSin" runat="server"></asp:TextBox>&nbsp;
                        如 2004-9-1</td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right"  class="sWord">
                    毕业日期：&nbsp;</td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left" class="sWord">
                    <asp:TextBox ID="txtSout" runat="server"></asp:TextBox>&nbsp;
                        如 2008-7-1</td>
            </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 226px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                </td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 513px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" CssClass="button" />
                    <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CausesValidation="False" CssClass="button" /></td>
            </tr>
        </table>
        <br />
                    <asp:RequiredFieldValidator ID="rfvSno" runat="server" ControlToValidate="txtSno" CssClass="aWord" ErrorMessage="学号不能为空"></asp:RequiredFieldValidator>&nbsp;
        <asp:RegularExpressionValidator ID="revSno" runat="server" ControlToValidate="txtSno"
            ErrorMessage="学号必须是12位数字" ValidationExpression="[0-9]{12}" CssClass="aWord"></asp:RegularExpressionValidator>&nbsp;&nbsp;<asp:CompareValidator ID="cvSin" runat="server" ControlToValidate="txtSin" ErrorMessage="入学日期无效"
            Operator="DataTypeCheck" Type="Date" CssClass="aWord"></asp:CompareValidator>&nbsp;
        <asp:CompareValidator ID="cvSout" runat="server" ControlToValidate="txtSout" ErrorMessage="毕业日期无效"
            Operator="DataTypeCheck" Type="Date" CssClass="aWord"></asp:CompareValidator>&nbsp;
        <asp:CompareValidator ID="cvComDate" runat="server" ControlToCompare="txtSin" ControlToValidate="txtSout"
            ErrorMessage="毕业时间必须迟于入学时间" Operator="GreaterThan" Type="Date" CssClass="aWord"></asp:CompareValidator><br />
        <table style="width: 702px; height: 11px">
            <tr>
                <td colspan="3" rowspan="1" style="width: 675px; height: 11px; text-align: center">
        <asp:Label ID="lblMessage" runat="server" CssClass="aWord"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3" rowspan="3" style="height: 11px; text-align:right; width: 675px;">
        <asp:LinkButton ID="lbnReturn" runat="server" OnClick="lbnReturn_Click" CausesValidation="False" CssClass="sWord">返回</asp:LinkButton></td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
