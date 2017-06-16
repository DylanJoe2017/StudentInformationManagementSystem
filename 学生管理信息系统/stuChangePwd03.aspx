<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stuChangePwd03.aspx.cs" Inherits="changepwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改密码</title>
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
	font-size: 15px;
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
<script type="text/javascript" language="javascript">
function goBack(){
    history.go(-1);
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息查询-&gt;修改学生密码</span></strong><br />
        <br />
        <br />
        <table style="width: 593px; height: 299px; border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid; border-collapse: collapse; text-align: center;" align="center">
            <tr>
                <td colspan="2" style="background-color:#cccccc;height:20px" class="sWord" align="center">
                    修改密码</td>
            </tr>
            <tr>
                <td colspan="2" style="height:6px">
                    </td>
            </tr>
            <tr>
                <td valign="middle"style="width: 106px; height: 28px;" align="right" class="sWord">
                    原密码：</td>
                <td style="height: 28px" align="left" valign="middle">
                    <asp:TextBox ID="txtOrignPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="lblErrorPassword" runat="server" CssClass="aWord"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvOrignPwd" runat="server" ControlToValidate="txtOrignPwd"
                        ErrorMessage="RequiredFieldValidator" CssClass="aWord">请输入原密码</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td valign="middle"style="width: 106px; height: 28px;" align="right" class="sWord">
                    新密码：</td>
                <td style="height: 28px" align="left" valign="middle">
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" ControlToValidate="txtNewPwd"
                        ErrorMessage="RequiredFieldValidator" CssClass="aWord">请输入新密码</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCheckPwd" runat="server" ControlToValidate="txtNewPwd"
                        ErrorMessage="RegularExpressionValidator" ValidationExpression="^([0-9a-zA-Z_]{1,16})$" CssClass="aWord">密码不符合要求</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td valign="middle" width: 106px; height: 28px;" align="right" class="sWord">
                    确认新密码：</td>
                <td style="height: 28px" align="left" valign="middle">
                    <asp:TextBox ID="txtNewPwdConfirm" runat="server" TextMode="Password"></asp:TextBox>
                     
                    <asp:CompareValidator ID="cpvConfirm" runat="server" ControlToCompare="txtNewPwd"
                        ControlToValidate="txtNewPwdConfirm" ErrorMessage="CompareValidator" CssClass="aWord">两次输入密码不一致</asp:CompareValidator></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 32px">
                    <asp:Button ID="btnChangePwd" runat="server" OnClick="btnChangePwd_Click" Text="<&nbsp;更改&nbsp;>" CssClass="button" />&nbsp;
                    <input id="btnBack" type="button" value="返回" onclick="goBack()" class="button" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
