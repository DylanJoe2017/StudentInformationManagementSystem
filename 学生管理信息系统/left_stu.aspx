<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left_stu.aspx.cs" Inherits="left" %>

<html>
<head>
    <style type="text/css"> 
    BODY 
    { BACKGROUND: #cccccc; MARGIN: 0px; FONT: 12px 宋体 } 
    TABLE { BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px } 
    TD { FONT: 12px 宋体 } IMG { BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px } 
    A { FONT: 12px 宋体; COLOR: #215dc6; TEXT-DECORATION: none } 
    A:hover { COLOR: #428eff } 
    .menu_title { } .menu_title SPAN { FONT-WEIGHT: bold; LEFT: 8px; COLOR: #215dc6; POSITION: relative; TOP: 2px } 
    .menu_title2 { }
    .menu_title2 SPAN { FONT-WEIGHT: bold; LEFT: 8px; COLOR: #428eff; POSITION: relative; TOP: 2px } 
    .ddd {
	color: #000000;
	font-size: 15px;
	font-weight: bold;
	font-family: "微软雅黑";
}
    .sss{
	color: #000000;
	font-size: 14px;
	font-weight: bold;
	
}
    .STYLE1 {color: #CCCCCC}
    </style>

<script type="text/javascript" language="javascript">

function proLoadimg()
{
	var i=new Image;
	i.src='images/student_info2.jpg';
}
proLoadimg();
function TABLE1_onclick() {

}

function IMG1_onclick() {

}

</script>

</head>
<body style="text-align: center">
    <table cellpadding="0" cellspacing="0" width="158" align="center">
        <tr>
            <td valign="bottom" style="width: 158px; height: 42px;">
                <img src="images/thetype_10.jpg" /><a href="admin_main.html" target="_top"></a></td>
        </tr>
        <tr height="25">
            <td background="../pic/admin_title_bg_quit.gif" style="width: 158px; height: 25px;">
                <a href="javascript:;"><span onClick="on_off()">
                    <img src="images/stu_check.jpg" /></span></a></td>
        </tr>
    </table>
    <span class="STYLE1">1D0A269EE660B17940D7338812A2A6E4    </span>
    <table style="width: 208px; height: 25px" align="center" border="0" cellpadding="0"
        cellspacing="0" id="TABLE1" onClick="return TABLE1_onclick()">
    </table>
    <table cellpadding="0" cellspacing="0" align="center" width="208">
        <tr style="height: 1px">
            <td>
            </td>
        </tr>
        <tr style="cursor: hand">
            <td style="width: 159px; text-align: justify; height: 25px;">
                    <img src="images/stu_.jpg" /></td>
        </tr>
        <tr>
            <td style="background-color: #cccccc">
                <div style=" background-color: #cccccc" id="stu_info">
                    <table style="width: 200px; height: 137px">
                        <tr>
                            <td align="right" colspan="3" style="height: 3px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40px" align="right">
                                <img src="images/small_logo_left.gif" />
                            </td>
                            <td colspan="2" style="width: 152px">
                                <asp:HyperLink ID="HyperLink1" runat="server" Target="right" NavigateUrl="~/getstuinfo.aspx#basic" > <span style="font-size: 15px"><b>基本信息</b></span></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td style="width: 40px; height: 24px;" align="right">
                                <img src="images/small_logo_left.gif">
                            </td>
                            <td colspan="2" style="height: 24px; width: 152px;">
                                <asp:HyperLink ID="HyperLink2" runat="server" Target="right" NavigateUrl="~/getstuinfo.aspx#scores"> <span style="font-size: 15px"><b>成绩信息</b></span></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td style="width: 40px" align="right">
                                <img src="images/small_logo_left.gif">
                            </td>
                            <td colspan="2" style="width: 152px">
                                <asp:HyperLink ID="HyperLink3" runat="server" Target="right" NavigateUrl="~/getstuinfo.aspx#expes"> <span style="font-size: 15px"><b>履历信息</b></span></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 40px">
                                <img src="images/small_logo_left.gif"></td>
                            <td colspan="2" style="width: 152px">
                                <asp:HyperLink ID="HyperLink4" runat="server" Target="right" NavigateUrl="~/stuChangePwd03.aspx"> <span style="font-size: 15px"><b>修改密码</b></span></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" style="height: 3px">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <div>
    </div>
    <br />
</body>
</html>
