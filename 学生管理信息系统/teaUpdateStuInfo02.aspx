<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaUpdateStuInfo02.aspx.cs" Inherits="teaUpdateStuInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改学生基本信息</title>
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
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生基本信息管理-&gt;修改学生基本信息<br />
        </span></strong><br />
        <table border="1" cellpadding="1" cellspacing="1" style="border-right: gray 1px solid;
            border-top: gray 1px solid; border-left: gray 1px solid; width: 531px;
            border-bottom: gray 1px solid; border-collapse: collapse; height: 125px; text-align: center" align="left">
<tr>
                <td colspan="2" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; border-bottom: gray 1px solid;
                     text-align: center; height: 24px;" class="bWord">
                    修改学生基本信息
                </td>
            </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp; 学号：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 196px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:Label ID="lblsno" runat="server" Width="191px"></asp:Label></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp; 姓名：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 196px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:TextBox ID="txtSname" runat="server"></asp:TextBox></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 10px; text-align: right">
                    &nbsp;性别：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 196px; border-bottom: gray 1px solid; height: 10px; text-align: left">
  <asp:RadioButtonList ID="rablistSgender" runat="server" Height="30px" RepeatDirection="Horizontal"
                        Width="118px">
                        <asp:ListItem Selected="True">男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:RadioButtonList></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    出生日期：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 196px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:TextBox ID="txtSbirthday" runat="server"></asp:TextBox></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;籍贯：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:TextBox ID="txtSaddress" runat="server"></asp:TextBox></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    政治面貌：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
  <asp:DropDownList ID="drpSparty" runat="server">
                        <asp:ListItem Selected="True">党员</asp:ListItem>
                        <asp:ListItem>团员</asp:ListItem>
                        <asp:ListItem>群众</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;年级：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
  <asp:DropDownList ID="drpGrade" runat="server">
                        <asp:ListItem>2004级</asp:ListItem>
                        <asp:ListItem>2005级</asp:ListItem>
      <asp:ListItem>2005级</asp:ListItem>
      <asp:ListItem>2006级</asp:ListItem>
      <asp:ListItem>2007级</asp:ListItem>
      <asp:ListItem>2008级</asp:ListItem>
                    </asp:DropDownList></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    学院：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
      <asp:DropDownList ID="drpInstitute" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpInstitute_SelectedIndexChanged">
                    </asp:DropDownList></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    系：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
      <asp:DropDownList ID="drpDept" runat="server">
                    </asp:DropDownList></td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp; 班级：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
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
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    入学时间：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:TextBox ID="txtSin" runat="server"></asp:TextBox>&nbsp; 如2004-9-1</td>
          </tr>
            <tr>
                <td align="right" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;毕业时间：</td>
          <td colspan="1" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:TextBox ID="txtSout" runat="server"></asp:TextBox>&nbsp; 如 2008-7-1</td>
          </tr>
            <tr>
                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 86px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                </td>
                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
                    <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="确定" CssClass="button" />
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="取消" CssClass="button" /></td>
            </tr>
        </table>
<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 535px">
            <tr>
                <td colspan="3" rowspan="3" align="center" style="width: 553px; height: 19px">
        <asp:Label ID="lblMessage" runat="server" CssClass="aWord"></asp:Label></td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="3" rowspan="1" align="right" style="width: 553px">
        <asp:LinkButton ID="lbnReturn" runat="server" OnClick="lbnReturn_Click" CssClass="sWord">返回</asp:LinkButton></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
