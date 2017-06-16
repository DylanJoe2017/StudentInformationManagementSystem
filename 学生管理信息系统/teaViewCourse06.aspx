<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaViewCourse06.aspx.cs" Inherits="teaViewCourse06" %>

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
    <div style="text-align: center">
        <strong><span class="bWord">查看课程详细信息<br />
        </span></strong>
        <br />
        <table style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid; width: 701px; border-bottom: gray 1px solid; border-collapse: collapse; height: 290px; text-align: center">
            <tr>
                <td style="width: 85px" class="sWord">
                    课程编号：</td>
                <td style="width: 94px; text-align: left">
                    <asp:TextBox ID="txtCno" runat="server" CssClass="sWord"></asp:TextBox></td>
                <td style="width: 47px">
                </td>
            </tr>
            <tr>
                <td style="width: 85px" class="sWord">
                    课程名称：</td>
                <td style="width: 94px; text-align: left">
                    <asp:TextBox ID="txtCname" runat="server" CssClass="sWord"></asp:TextBox></td>
                <td style="width: 47px">
                </td>
            </tr>
            <tr>
                <td style="width: 85px; height: 98px" class="sWord">
                    课程内容：</td>
                <td style="width: 94px; height: 98px">
                    <asp:TextBox ID="txtContent" runat="server" Height="103px" TextMode="MultiLine" Width="282px" CssClass="sWord" OnTextChanged="txtContent_TextChanged"></asp:TextBox></td>
                <td style="width: 47px; height: 98px">
                    <span style="color: #ff0066" class="aWord">需要加数据验证</span></td>
            </tr>
            <tr>
                <td style="width: 85px" class="sWord">
                    任课教师：</td>
                <td style="width: 94px">
                    <asp:TextBox ID="txtTeacher" runat="server" CssClass="sWord"></asp:TextBox></td>
                <td style="width: 47px">
                </td>
            </tr>
            <tr>
                <td style="width: 85px" class="sWord">
                    学时：</td>
                <td style="width: 94px">
                    <asp:TextBox ID="txtHours" runat="server" CssClass="sWord"></asp:TextBox></td>
                <td style="width: 47px">
                </td>
            </tr>
            <tr>
                <td style="width: 85px" class="sWord">
                    学分：</td>
                <td style="width: 94px">
                    <asp:TextBox ID="txtScores" runat="server" CssClass="sWord"></asp:TextBox></td>
                <td style="width: 47px">
                </td>
            </tr>
        </table>
        <br />
        &nbsp;
        <asp:LinkButton ID="lbnEdit" runat="server" OnClick="lbnEdit_Click" CssClass="aWord">编 辑</asp:LinkButton>
        <asp:LinkButton ID="lbnClose" runat="server" OnClientClick ="window.close()" CssClass="aWord">关闭页面</asp:LinkButton><br />
    
    </div>
    </form>
</body>
</html>
