<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaEditExp07.aspx.cs" Inherits="add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑学生履历信息</title>
    <style type="text/css">
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
    .Word {
	font-family: "微软雅黑";
	font-size: 13px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #000;
    }
    </style>
</head>
<body style="width: 100%">
    <form id="form1" runat="server">
        <div align="center">
            <table style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                width: 651px; border-bottom: gray 1px solid; height: 139px; border-collapse: collapse; text-align: center;">
                <tr>
                    <td colspan="3" rowspan="1" class="bWord">
                        编辑学生信息</td>
                </tr>
                <tr>
                    <td colspan="3" rowspan="3" valign="top">
                        <br />
                        <br />
                        <table border="1" cellpadding="1" cellspacing="1" style="border-right: gray 1px solid;
                            border-top: gray 1px solid; border-left: gray 1px solid; width: 651px;
                            border-bottom: gray 1px solid; border-collapse: collapse; height: 139px; text-align: center">
                            <tr>
                                <td colspan="2" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                                    height: 30px; text-align: center">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                                    姓名：&nbsp;
                                </td>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 196px; border-bottom: gray 1px solid; height: 30px; text-align: left">
                                    <asp:Label ID="stu_names" runat="server" Text="" CssClass="Word"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                                    &nbsp; 学号：</td>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 196px; border-bottom: gray 1px solid; height: 30px; text-align: left">
                                    <asp:Label ID="txtSname" runat="server" Text="" CssClass="Word"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                                    开始日期：</td>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 196px; border-bottom: gray 1px solid; height: 30px; text-align: left">
                                    <asp:TextBox ID="dat_bgain" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                                    结束日期：</td>
                                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                                    height: 30px; text-align: left">
                                    <asp:TextBox ID="dat_end" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                                    &nbsp;内容：</td>
                                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                                    height: 30px; text-align: left">
                                    <asp:TextBox ID="exp_content" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right" class="sWord">
                                    类别：</td>
                                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                                    height: 30px; text-align: left" class="sWord">
                                    &nbsp;<asp:DropDownList ID="type" runat="server" CssClass="Word" >
                                        <asp:ListItem>奖励</asp:ListItem>
                                        <asp:ListItem>惩罚</asp:ListItem>
                                        <asp:ListItem Selected="true">任命</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    width: 126px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                                </td>
                                <td colspan="1" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                    border-left: gray 1px solid; width: 196px; border-bottom: gray 1px solid;
                                    height: 30px; text-align: left">
                                    <asp:Button ID="btnOk" runat="server" Text="提交" OnClick="btnOk_Click" CssClass="button" />&nbsp;&nbsp;
                                    <asp:Button ID="Button2" runat="server" Text="添加为新项" OnClick="Bt_new" OnClientClick="return confirm('即将为该生添加一条新的履历信息！')" CssClass="button" /><asp:Button ID="Button1" runat="server" Text="返回" PostBackUrl="~/teaManExp07.aspx" CssClass="button" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
            </table>
        </div>
                        <table style="width: 756px; height: 32px;">
                            <tr>
                                <td align="right" colspan="1" rowspan="3" style="height: 33px; width: 66px;">
                                </td>
                                <td align="right" colspan="1" rowspan="3" style="height: 33px; width: 346px;">
                                    <asp:Image ID="error_image" runat="server" ImageUrl="~/images/error.gif"  Visible="false"/>
                                    <asp:Image ID="ok_image" runat="server" ImageUrl="~/images/finished.gif" Visible="false" /></td>
                                <td colspan="3" rowspan="3" align="left" style="height: 33px; width: 261px;">
                                    <asp:Label ID="Label1" runat="server" Visible="False" CssClass="aWord"></asp:Label></td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                        </table>
    </form>
</body>
</html>
