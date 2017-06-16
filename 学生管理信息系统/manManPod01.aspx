<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manManPod01.aspx.cs" Inherits="manManPod01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>S-MIS系统用户权限管理</title>
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
        <strong><span style="font-size: 24pt"><span style="font-size: 11pt; color: #fe730e;
            font-family: 微软雅黑">您的位置:用户管理-&gt;用户权限管理</span><br />
        </span></strong>
        <br />
        <span class="sWord">用户帐号:</span>
        <asp:DropDownList ID="drpUid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpUid_SelectedIndexChanged" CssClass="sWord">
        </asp:DropDownList><br />
        <br />
        <asp:Panel ID="pnlUname" runat="server" BackColor="#CCCCCC" Height="19px" Width="213px">
            <span class="sWord">用户姓名：</span><asp:Label ID="lblUname" runat="server" Width="92px" CssClass="sWord"></asp:Label></asp:Panel>
        <asp:Panel ID="pnlLimits" runat="server" BackColor="#CCCCCC" Height="138px" Width="531px">
            <span style="font-size: 2pt">
                <br />
            </span>
            <table align="center" style="height: 259px; width: 528px; clip: rect(auto auto auto auto); text-align: left;" border="0" cellpadding="0" cellspacing="0" class="sWord">
                <tr height =20px>
                    <td style="background-color: #e7e7ff; width: 69px; height: 20px;">
                        &nbsp; 
                        <asp:CheckBox ID="chk1" runat="server" /></td>
                    <td style="background-color: #e7e7ff; width: 164px; height: 20px;">
                        <span style="color: #4A3C8C">01-管理学生基本信息</span> </td>
                    <td style="background-color: #e7e7ff; width: 74px; height: 20px;">
                        &nbsp;<asp:CheckBox ID="chk2" runat="server" /></td>
                    <td style="background-color: #e7e7ff; width: 176px; height: 20px;">
                        <span style="color: #4A3C8C">02-管理学生履历信息</span> </td>
                </tr>
                <tr>
                    <td style="background-color: #f7f7f7; width: 69px;">
                        &nbsp;
                        <asp:CheckBox ID="chk3" runat="server" /></td>
                    <td style="background-color: #f7f7f7; width: 164px;">
                        <span style="color: #4A3C8C">
                        03-管理学生成绩信息</span></td>
                    <td style="background-color: #f7f7f7; width: 74px;">
                        &nbsp;<asp:CheckBox ID="chk4" runat="server" /></td>
                    <td style="background-color: #f7f7f7; width: 176px;">
                        <span style="color: #4A3C8C">
                        04-统计功能</span></td>
                </tr>
                <tr>
                    <td style="background-color: #e7e7ff; width: 69px;">
                        &nbsp; 
                        <asp:CheckBox ID="chk5" runat="server" /></td>
                    <td style="background-color: #e7e7ff; width: 164px;">
                        <span style="color: #4A3C8C">
                        05-学生查询功能</span></td>
                    <td style="background-color: #e7e7ff; width: 74px;">
                        &nbsp;<asp:CheckBox ID="chk6" runat="server" /></td>
                    <td style="background-color: #e7e7ff; width: 176px;">
                        <span style="color: #4A3C8C">
                        06-用户基本信息管理</span></td>
                </tr>
                <tr>
                    <td style="background-color: #f7f7f7; width: 69px;">
                        &nbsp; 
                        <asp:CheckBox ID="chk7" runat="server" /></td>
                    <td style="background-color: #f7f7f7; width: 164px;">
                        <span style="color: #4A3C8C">
                        07-用户操作权限管理</span></td>
                    <td style="background-color: #f7f7f7; width: 74px;">
                        &nbsp;<asp:CheckBox ID="chk8" runat="server" /></td>
                    <td style="background-color: #f7f7f7; width: 176px;">
                        <span style="color: #4A3C8C">
                        08-院系代码维护</span></td>
                </tr>
                <tr>
                    <td style="background-color: #e7e7ff; width: 69px; height: 17px;">
                        &nbsp;
                        <asp:CheckBox ID="chk9" runat="server" /></td>
                    <td style="background-color: #e7e7ff; height: 17px; width: 164px;">
                        <span style="color: #4A3C8C">
                        09-课程信息维护</span></td>
                    <td style="background-color: #e7e7ff; height: 10px; width: 74px;">
                    </td>
                    <td style="background-color: #e7e7ff; width: 176px; height: 17px;">
                    </td>
                </tr>
            </table>
            <hr>
            <span class="aWord">以上是系统用户对该系统中各模块操作的权限设置</span></asp:Panel>
        <br />
        <asp:Button ID="btnEdit" runat="server" Text="编 辑" OnClick="btnEdit_Click" Visible="False" CssClass="button" />
        <asp:Button ID="btnCancel" runat="server" Text="取 消" Visible="False" OnClick="btnCancel_Click" CssClass="button" /></div>
    </form>
</body>
</html>
