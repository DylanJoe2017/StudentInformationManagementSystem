<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaUpdateInse06.aspx.cs" Inherits="updateInse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
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
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:系统维护-&gt;院系代码维护-&gt;修改学院<br />
        </span></strong><br />
<table  border="0" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; width: 557px; border-bottom: gray 1px solid; border-collapse: collapse; height: 161px; text-align: center" align="center">
  <tr>
    <td style="width: 171px"><asp:Label ID="lblInse_no" runat="server" CssClass="sWord">学院代号:</asp:Label></td>
    <td style="width: 289px">
        <asp:Label ID="lbloutputInse_no" runat="server" Width="155px" CssClass="sWord"></asp:Label></td>
  </tr>
  <tr>
    <td style="width: 171px"><asp:Label ID="lblInse_name" runat="server" CssClass="sWord">学院名称:</asp:Label></td>
    <td style="width: 289px"><input type="text" runat="server" id="txtInse_name" class="sWord" /></td>
  </tr>
    <tr>
    <td style="width: 171px"></td>
    <td style="width: 289px"><input type="submit" id="submit" runat="server" onserverclick="submit_ServerClick" style="width: 83px" value="提交" class="button" />
        <asp:button runat="server" id="btnReturn" text="返回" style="width: 83px" PostBackUrl="~/teaManagerDeptMant06.aspx" CssClass="button"/></td>
  </tr>
  </table>
    </form>
</body>
</html>
