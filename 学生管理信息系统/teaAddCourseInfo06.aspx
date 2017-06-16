<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaAddCourseInfo06.aspx.cs" Inherits="AddCourseInfo" %>

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
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:系统维护-&gt;课程信息维护-&gt;添加课程<br />
        </span></strong>
        <br />
  <table width="402"  border="0" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; width: 629px; border-bottom: gray 1px solid; border-collapse: collapse; height: 289px; text-align: center" align="center">
    <tr>
      <td style="width: 94px"><asp:Label runat="server" ID="lblC_no" CssClass="sWord" >课程代号:</asp:Label></td>
      <td style="width: 300px"><input type="text" id="txtC_no" runat="server" class="sWord" />
          <asp:Label ID="lblerrorC_no" runat="server" Width="131px" CssClass="aWord"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 94px"><asp:Label ID="lblC_name" runat="server" CssClass="sWord">课程名称:</asp:Label></td>
      <td style="width: 300px"><input type="text" id="txtC_name" runat="server" class="sWord" />
          <asp:Label ID="lblerrorC_name" runat="server" Width="131px" CssClass="aWord"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 94px"><asp:Label ID="lblC_content" runat="server" CssClass="sWord">课程内容:</asp:Label></td>
      <td style="width: 300px" align="left">
          &nbsp;<asp:TextBox ID="txtC_content" runat="server" CssClass="sWord" Height="103px"
              TextMode="MultiLine" Width="282px"></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 94px; height: 26px"><asp:Label ID="lblC_teacher" runat="server" CssClass="sWord">任课老师:</asp:Label></td>
      <td style="width: 300px; height: 26px"><input type="text" id="txtC_teacher" runat="server" class="sWord" />
          <asp:Label ID="lblerrorC_teacher" runat="server" Width="131px" CssClass="aWord"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 94px; height: 26px"><asp:Label ID="lblC_hours" runat="server" CssClass="sWord">课程学时:</asp:Label></td>
      <td style="width: 300px; height: 26px"><input type="text" id="txtC_hours" runat="server" class="sWord" />
          <asp:Label ID="lblerrorC_hours" runat="server" Width="131px" CssClass="aWord"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 94px"><asp:Label ID="lblC_scores" runat="server" CssClass="sWord">课程学分:</asp:Label></td>
      <td style="width: 300px"><input type="text" id="txtC_scores" runat="server" class="sWord" />
          <asp:Label ID="lblerrorC_scores" runat="server" Width="131px" CssClass="aWord"></asp:Label></td>
    </tr>
    <tr>
      <td style="width: 94px; height: 40px;">
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
      <td style="width: 300px; height: 40px;"><input type="submit" runat="server" id="submit" onserverclick="submit_ServerClick"  value="添加" style="width: 52px" class="button"/>
          <asp:button id="btnReturn" runat="server" text="返回" PostBackUrl="teaManCourse06.aspx" Width="59px" CssClass="button" /></td>
    </tr>
  </table>
    </form>
</body>
</html>
