<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaViewExp07.aspx.cs" Inherits="add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查看履历信息内容</title>
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
<body style="width: 100%">
    <form id="form1" runat="server">
        <div align="center">
            <table style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                width: 651px; border-bottom: gray 1px solid; height: 139px; border-collapse: collapse; text-align: center;">
                <tr>
                    <td colspan="3" rowspan="1" class="bWord">
                        查看学生履历信息</td>
                </tr>
                <tr>
                    <td colspan="3" rowspan="3" valign="top" style="height: 405px">
                        <br />
                        &nbsp;<table style="width: 630px; height: 185px; border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid; border-collapse: collapse; text-align: center;">
                            <tr>
                                <td colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" style="height: 28px" class="sWord">
                                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Overline="False" Font-Underline="True" ForeColor="Crimson"></asp:Label>的履历信息<br />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" style="height: 34px; border-right: #3366cc 1px double; border-top: #3366cc 1px double; border-left: #3366cc 1px double; border-bottom: #3366cc 1px double; " valign="middle" class="sWord">
                                    &nbsp; &nbsp;学号：<asp:Label ID="Label2" runat="server" Text="Label" Font-Underline="True"></asp:Label>
                                    &nbsp;&nbsp; &nbsp;姓名：<asp:Label ID="Label7" runat="server" Text="Label" Font-Underline="True"></asp:Label>
                                    &nbsp;&nbsp; &nbsp; &nbsp;开始日期：<asp:Label
                                        ID="Label3" runat="server" Text="Label" Font-Underline="True"></asp:Label>
                                    &nbsp; &nbsp; &nbsp; &nbsp; 结束日期：<asp:Label ID="Label4" runat="server"
                                            Text="Label" Font-Underline="True"></asp:Label>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" style="height: 35px;" valign="bottom" class="sWord">
                                    内容：</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" style="border-right: #6699ff 1px double; border-top: #6699ff 1px double; border-left: #6699ff 1px double; border-bottom: #6699ff 1px double; ">
                                    <br />
                                    &nbsp; &nbsp;<asp:Label ID="Label5" runat="server" Text="Label" CssClass="sWord"></asp:Label><br /><br />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" style="height: 36px" class="sWord">
                                    类别：<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="3" style="height: 27px">
                                    <asp:Button ID="Button1" runat="server" Text="<&nbsp;关闭窗口&nbsp;>" OnClientClick ="window.close()" CssClass="button" /></td>
                            </tr>
                        </table>
                    </td>
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
