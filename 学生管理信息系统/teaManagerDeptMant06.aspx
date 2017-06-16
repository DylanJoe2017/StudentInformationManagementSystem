<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="teaManagerDeptMant06.aspx.cs" Inherits="_Default" %>

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
	margin:0px 12px;
	height:24px;
	width:80px;
	}
	ul li{
	list-style:none;
	padding:5px 0;
	}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:系统维护-&gt;院系代码维护<br />
        </span></strong><br />
    <table border="0" style="width: 700px; height: 137px; border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid; border-collapse: collapse; text-align: center;">
    <tr>
      <td colspan="3" style="height: 31px" class=sWord>学院列表:</td>
      <td colspan="3" style="height: 31px" class=sWord>
          系别列表:</td>
    </tr>
    <tr>
      <td colspan="3" style="height: 352px"><asp:ListBox ID="lstInse" runat="server" AutoPostBack="True" Height="339px" Width="259px" OnSelectedIndexChanged="lstInse_SelectedIndexChanged" CssClass="sWord"></asp:ListBox>&nbsp;
      </td>
      <td colspan="3" style="height: 352px"><asp:ListBox ID="lstDept" runat="server" Height="339px" Width="251px" CssClass="sWord"></asp:ListBox></td>
    </tr>
<tr>
<td colspan="6">
<table >
    <tr>
      <td style="height: 34px"><asp:Button ID="btnInsertInse" runat="server" Text="添加" OnClick="btnInsertInse_Click" CssClass="button" /></td>
      <td style=" height: 34px;"><asp:Button ID="btnDeleteInse" runat="server" Text="删除" OnClick="btnDeleteInse_Click" OnClientClick="return confirm('你确认删除该学院吗？')" CssClass="button"/></td>
      <td style=" height: 34px;"> <asp:Button ID="btnUpdateInse" runat="server" Text="更改" OnClick="btnUpdateInse_Click" CssClass="button"/></td>
      <td style="height: 34px"><asp:Button ID="btnInsertDept" runat="server" Text="添加" OnClick="btnInsertDept_Click" CssClass="button"  /></td>
      <td style="height: 34px"><asp:Button ID="btnDeleteDept" runat="server" Text="删除" OnClick="btnDeleteDept_Click" OnClientClick="return confirm('你确认删除该专业吗？')" CssClass="button" /></td>
      <td style="height: 34px;"><asp:Button ID="btnUpdateDept" runat="server" Text="更改" OnClick="btnUpdateDept_Click" CssClass="button" /></td>
    </tr>
</table>
</td>
</tr>
  </table>
  <ul>
  <li class="sWord">·可以对“学院列表”进行学院名称的添加，删除和更改操作，</li>
  <li class="sWord">&nbsp; &nbsp; 院系名称的“添加”和“更改”操作都是在新的窗体页面中进行;</li>
  <li class="sWord">·在“学院列表”中选择某一学院名称，这时“系别列表”中显示该学院包含的所有系别名称;</li>
  <li class="sWord"> ·然后，可以对“系别列表”进行系别名称的添加，删除和更改操作，</li>
  <li class="sWord">&nbsp;&nbsp; 系别名称的“添加”和“更改”操作都是在新的窗体页面中进行;</li>
  </ul>

    </form>
</body>
</html>
