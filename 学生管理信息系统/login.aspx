<%@ Page Language="C#" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>山东师范大学 学生管理信息系统</title>
    <!--运行时该窗口最大化-->
    <script language="javascript" type="text/javascript">
        this.moveTo(0,0)
        this.resizeTo(screen.width,screen.height)
    </script>
    
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12px;
	color: #333333;
}
.STYLE14 {color: #FFFFFF}
#Layer2 {
	position:absolute;
	left:0px;
	top:689px;
	width:1024px;
	height:80px;
	z-index:1;
	background-image: url(allimages/homepage_down.gif);
}
#Layer3 {
	position:absolute;
	left:0px;
	top:621px;
	width:1024px;
	height:62px;
	z-index:1;
	background-color: #FFFFFF;
}
.bWord {
	font-family: "微软雅黑";
	font-size: 15px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #000000;
}
.button{
	border:#002D96 1px solid;
	padding:2px 0px 0px 2px;
	filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0, 
	StartColorStr=#ffffff,EndColorStr=#72B1ED);
	color:#003366;
	font:13px;
	margin:0px 4px;
	height:24px;
}
        .auto-style1 {
            width: 64px;
        }
        .auto-style2 {
            font-family: "微软雅黑";
            font-size: 15px;
            font-style: normal;
            font-weight: bold;
            font-variant: normal;
            color: #000000;
            height: 24px;
            width: 64px;
        }
        .auto-style3 {
            font-family: "微软雅黑";
            font-size: 15px;
            font-style: normal;
            font-weight: bold;
            font-variant: normal;
            color: #000000;
            height: 26px;
            width: 64px;
        }
-->
</style>
</head>
<body>
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="top" style="width: 1089px">
                <table width="1024" height="73%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 582px; background-image: url(images/homepage.jpg)">
                            <table style="width: 1024px" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="585" style="height: 292px">
                                        &nbsp;</td>
                                    <td width="268" style="height: 292px">
                                        &nbsp;</td>
                                    <td width="171" style="height: 292px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="height: 134px">
                                        &nbsp;</td>
                                    <td align="left" valign="top" style="height: 134px">
                                        <form id="f1" runat="server">
                                            <table style="background-color: #FF9900; width: 259px;" border="0" cellspacing="0"
                                                cellpadding="0">
                                                <tr>
                                                    <td class="auto-style1">
                                                        &nbsp;</td>
                                                    <td width="183">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="auto-style2">
                                                        学工号：</td>
                                                    <td style="height: 24px">
                                                        &nbsp;<asp:TextBox ID="txtUid" runat="server" Width="150px" MaxLength="15"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="auto-style3">
                                                        密码<span style="font-size: 14pt"><strong>：</strong></span></td>
                                                    <td style="height: 26px">
                                                        &nbsp;<asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                                                </tr>
                                                <tr style="height: 5px">
                                                    <td colspan="2">
                                                    </td>
                                                </tr>
                                                <tr style="background-color: Black">
                                                    <td colspan="2" style="background-color: Black; vertical-align: middle; height: 39px;
                                                        text-align: center;" valign="top">
                                                        <asp:RadioButton ID="rbTea" runat="server" ForeColor="#FFFF80" Text="教务人员" Width="92px"
                                                            BorderStyle="None" Font-Size="12pt" GroupName="login" Checked="True" CssClass="bWord" />&nbsp;
                                                        &nbsp;
                                                        <asp:RadioButton ID="rbStu" runat="server" ForeColor="#FFFF80" Text="学生" Width="61px"
                                                            BorderStyle="None" Font-Size="12pt" GroupName="login" CssClass="bWord" />
                                                        <br />
                                                        <asp:Button ID="btnSubmit" runat="server" Height="25px" Text="登 录" Width="51px" OnClick="btnSubmit_Click" CssClass="button" />&nbsp;
                                                        <asp:Button ID="Button1" runat="server" Height="25px" OnClick="Button1_Click" Text="重置" Width="51px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </td>
                                    <td style="height: 134px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="height: 57px">
                                        &nbsp;</td>
                                    <td style="height: 57px">
                                        &nbsp;</td>
                                    <td style="height: 57px">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
