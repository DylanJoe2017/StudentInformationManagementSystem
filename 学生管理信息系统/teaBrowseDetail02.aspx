<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaBrowseDetail02.aspx.cs" Inherits="teaBrowseDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>学生基本信息查看</title>
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
<body>
    <form id="form1" runat="server">
    <div style="text-align: left">
        <br />
        <table border="1" cellpadding="1" cellspacing="1" style="border-right: gray 1px solid;
            border-top: gray 1px solid; border-left: gray 1px solid; width: 531px;
            border-bottom: gray 1px solid; border-collapse: collapse; height: 125px; text-align: center">
<tr>
                <td colspan="3" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: center">
                    <asp:Label CssClass="bWord" ID="lblhello" runat="server" Width="263px"></asp:Label></td>
            </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp; 学号：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 84px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:Label ID="lblsno" runat="server"></asp:Label></td>
          <td rowspan="4" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Image ID="imgPhoto" runat="server" ImageUrl="Photos\gongjibing.jpg" /></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp; 姓名：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 84px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:Label ID="lblsname" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;性别：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 84px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:Label ID="lblsgender" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    出生日期：</td>
          <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 84px; border-bottom: gray 1px solid; height: 30px; text-align: left">
            <asp:Label ID="lblsbirthday" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;籍贯：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsaddress" runat="server" Width="191px"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    政治面貌：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsparty" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;年级：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsgrade" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    院系：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsdepartment" runat="server" Width="192px"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    专业：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsmajor" runat="server" Width="191px"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp; 班级：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsclass" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    入学时间：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsin" runat="server"></asp:Label></td>
          </tr>
            <tr>
                <td class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                    width: 89px; border-bottom: gray 1px solid; height: 30px; text-align: right">
                    &nbsp;毕业时间：</td>
          <td colspan="2" class="sWord" style="border-right: gray 1px solid; border-top: gray 1px solid;
                    border-left: gray 1px solid; width: 84px; border-bottom: gray 1px solid;
                    height: 30px; text-align: left">
            <asp:Label ID="lblsout" runat="server"></asp:Label></td>
          </tr>
        </table>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  <asp:LinkButton ID="lbtnUploadPic" runat="server" CausesValidation="False" OnClick="lbtnUploadPic_Click" CssClass="sWord">上传照片</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick ="window.close()" CssClass="sWord" >关闭窗口</asp:LinkButton><br />
        <asp:Panel ID="pnlUpload" runat="server" Height="50px" Visible="False" Width="439px">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" Height="24px" runat="server" />
            <asp:Button  ID="btnUpload" runat="server" Text="上传" Height="24px" OnClick="btnUpload_Click" />
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblMessage" runat="server" CssClass="aWord"></asp:Label>&nbsp;
        </asp:Panel>
        &nbsp;</div>
    </form>
</body>
</html>
