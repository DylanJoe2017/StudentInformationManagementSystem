<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaAddExp07.aspx.cs" Inherits="manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加新履历信息</title>
    <style type="text/css">
.input {
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-bottom-color: #666666;
    }
#instruction {
    }
.show { 
    display:block
    }
.hide {
     display:none
    }

.colors { 
    color:red
    }
a:link {
	color: #669933;
	text-decoration: none;
    }
a:visited {
	color: #669933;
	text-decoration: none;
    }
a:hover {
	color: #333333;
	text-decoration: none;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
    }
a:active {
	color: #FFFFFF;
	text-decoration: none;
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
	font-size: 15px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #FF0000;
    }
</style>

    <script type="text/javascript">

function onandoff(way1,way2)

{
way1.className="show";
way2.className="hide";


}


function TABLE2_onclick() {

}

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑"><strong>您的位置:学生信息管理-&gt;学生个人信息管理-&gt;添加学生履历</strong><strong>信息</strong></span><br />
            &nbsp;
            <table border="1" cellpadding="1" cellspacing="1" style="border-right: #E0DFE3 1px solid;
                border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid; width: 673px;
                border-bottom: #E0DFE3 1px solid; border-collapse: collapse; text-align: center;
                height: 1px;" align="center">
                <tr>
                    <td class="sWord" colspan="2" style="height: 8px">
                        <table width="100%">
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td style="width: 475px">
                                </td>
                                <td style="width: 475px" align="right">
                                    <asp:Label ID="nonsence2" runat="server" ForeColor="White" Visible="False"></asp:Label>
                                    <asp:Label ForeColor="White" ID="nonsence" runat="server" Visible="False"></asp:Label><a
                                        href="javascript:;" onclick="instruction.className='show'">帮助</a></td>
                            </tr>
                            <tr>
                                <td style="border-right: #6699ff 1px solid; border-top: #6699ff 1px solid; border-left: #6699ff 1px solid;
                                    border-bottom: #6699ff 1px solid; background-color: #ffffff; height: 89px;" align="left" colspan="4"
                                    rowspan="2">
                                    <span class="hide" id="instruction"><span style="font-weight: bold; color:red">使用“输入姓名检索”出现重名时:</span><br />
                                        请从检索结果中找到正确的学生学号并复制粘贴到“直接输入学号”文本框中<br />
                                        并点击检索,即可解决重名问题。</span></td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" class="sWord" style="border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid;
                        border-left: #e0dfe3 1px solid; width: 119px; border-bottom: #e0dfe3 1px solid;
                        text-align: right;">
                        学号：</td>
                    <td class="sWord" style="width: 582px">
                        <table id="TABLE1" align="center" style="width: 390px; text-align: center">
                            <tr>
                                <td align="left" style="width: 403px">
                                    <span onclick="onandoff(names,direct)">
                                        <img src="images/names.jpg" style="width: 110px; height: 25px" /></span></td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 403px">
                                    <div id="names" class="hide">
                                        <asp:Panel ID="Panel1" runat="server" BackColor="#C0C0FF" BorderColor="Silver" BorderStyle="None"
                                            Font-Size="12px" Height="27px" HorizontalAlign="Center" Width="400px">
                                            <span style="font-size: 10pt">姓名：</span><asp:TextBox ID="stu_name" runat="server"
                                                Width="170px" Height="17px"></asp:TextBox>
                                            &nbsp;<asp:Button ID="Button2" OnClick="check_num_name" runat="server" Text="<&nbsp;检测&nbsp;>"
                                                CssClass="button"></asp:Button></asp:Panel>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="19" valign="bottom">
                                    <span onclick="onandoff(direct,names)">
                                        <img src="images/number.jpg" style="width: 110px; height: 25px" /></span></td>
                            </tr>
                            <tr>
                                <td align="left" colspan="19" valign="middle">
                                    <div id="direct" class="hide">
                                        <asp:Panel ID="pnlNew" runat="server" BackColor="#C0C0FF" BorderColor="Silver" BorderStyle="None"
                                            Font-Size="12px" Height="27px" HorizontalAlign="Center" Width="400px">
                                            <span style="font-size: 10pt">学号：</span><asp:TextBox ID="num_enter" runat="server"
                                                Width="170px" Height="17px"></asp:TextBox>
                                            &nbsp;<asp:Button ID="Button1" OnClick="check_num" runat="server" Text="<&nbsp;检测&nbsp;>"
                                                CssClass="button"></asp:Button></asp:Panel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="23" colspan="3" align="center">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                            Width="100%" Font-Size="14px">
                            <Columns>
                                <asp:BoundField DataField="s_no" HeaderText="学号">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField DataField="s_name" HeaderText="姓名">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField DataField="inse_name" HeaderText="学院">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dept_name" HeaderText="院系">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField DataField="s_class" HeaderText="班级">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                没有找到符合该条件的学生信息，不能为该学生添加履历信息！
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="Tan" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#C0C0FF" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        </asp:GridView>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td height="23" align="right" class="sWord" style="border-right: #E0DFE3 1px solid;
                        border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid; width: 119px;
                        border-bottom: #E0DFE3 1px solid; text-align: right">
                        开始时间：</td>
                    <td style="border-right: #E0DFE3 1px solid; border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid;
                        border-bottom: #E0DFE3 1px solid; text-align: left; width: 442px;" colspan="2">
                        <asp:TextBox ID="dat_begain" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td height="23" align="right" class="sWord" style="border-right: #E0DFE3 1px solid;
                        border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid; width: 119px;
                        border-bottom: #E0DFE3 1px solid; text-align: right">
                        结束时间：</td>
                    <td style="border-right: #E0DFE3 1px solid; border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid;
                        border-bottom: #E0DFE3 1px solid; text-align: left; width: 442px;" colspan="2">
                        <asp:TextBox ID="dat_end" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td height="33" align="right" class="sWord" style="border-right: #E0DFE3 1px solid;
                        border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid; width: 119px;
                        border-bottom: #E0DFE3 1px solid; text-align: right">
                        内容：</td>
                    <td colspan="2" style="border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid;
                        border-left: #e0dfe3 1px solid; border-bottom: #e0dfe3 1px solid; text-align: left;
                        width: 442px;">
                        <asp:TextBox ID="exp_content" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td height="23" align="right" class="sWord" style="border-right: #E0DFE3 1px solid;
                        border-top: #E0DFE3 1px solid; border-left: #E0DFE3 1px solid; width: 119px;
                        border-bottom: #E0DFE3 1px solid; text-align: right">
                        类型：</td>
                    <td colspan="2" style="border-right: #E0DFE3 1px solid; border-top: #E0DFE3 1px solid;
                        border-left: #E0DFE3 1px solid; border-bottom: #E0DFE3 1px solid; text-align: left;
                        width: 442px;" class="sWord">
                        <asp:DropDownList ID="type" runat="server">
                            <asp:ListItem>惩罚</asp:ListItem>
                            <asp:ListItem>任命</asp:ListItem>
                            <asp:ListItem Selected="true">奖励</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td height="30" align="right" style="border-right: #E0DFE3 1px solid; border-top: #E0DFE3 1px solid;
                        border-left: #E0DFE3 1px solid; width: 119px; border-bottom: #E0DFE3 1px solid;
                        text-align: right">
                    </td>
                    <td colspan="2" style="border-right: #E0DFE3 1px solid; border-top: #E0DFE3 1px solid;
                        border-left: #E0DFE3 1px solid; border-bottom: #E0DFE3 1px solid; text-align: left;
                        width: 442px;">
                        &nbsp;
                        <asp:Button ID="Btnin" runat="server" Text="确定" OnClick="check_info" CssClass="button" />
                        <input id="Reset1" type="reset" value="重置" class="button" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/teaManExp07.aspx" CssClass="sWord">返回</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table style="width: 70%; height: 34px;" align="center">
                <tr>
                    <td align="right" colspan="1" rowspan="3" valign="bottom" style="width: 150px;">
                        <asp:Image ID="error_img" runat="server" ImageUrl="~/images/error.gif" Visible="false" Height="21px" Width="21px" />
                        <asp:Image ID="ok_img" runat="server" ImageUrl="~/images/finished.gif" Visible="false" Height="21px" Width="21px"  /></td>
                    <td colspan="4" rowspan="3" align="left" valign="top" style="width: 448px;">
                        <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="aWord"></asp:Label></td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
            </table>
        </div>
        <div align="center">
            &nbsp;<br />
            &nbsp;</div>
    </form>
</body>
</html>
