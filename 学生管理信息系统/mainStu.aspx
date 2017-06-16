<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="mainTea.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>S-MIS 1.0系统学生主页</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg1.jpg);
	background-repeat: repeat;
}
.bg1 {
	background-image: url(images/bg2.jpg);
	background-repeat: repeat-x;
}
.layes {
	border: 1px solid #2E6395;
}
.locations {
	position: relative;
}
body,td,th {
	font-size: 14px;
}
#Layer1 {
	position:absolute;
	left:132px;
	top:104px;
	width:142px;
	height:264px;
	z-index:1;
}
#Layer2 {
	position:absolute;
	left:132px;
	top:102px;
	width:112px;
	height:320px;
	z-index:1;
	visibility: hidden;
}
.STYLE1 {}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
}
a:active {
	text-decoration: none;
}
#Layer3 {
	position:absolute;
	left:132px;
	top:142px;
	width:113px;
	height:204px;
	z-index:1;
	visibility: hidden;
}
#Layer4 {
	position:absolute;
	left:28px;
	top:85px;
	width:102px;
	height:644px;
	z-index:1;
}
.hide { display:none
	
}
.show { display:block
	
}
-->
</style>
</head>

<body>
<table width="1000" border="0" cellpadding="0" cellspacing="0" align="center">
  <!--DWLayoutTable-->
  <tr>
    <td height="153" colspan="2" valign="top">
	<iframe name="top" src="top.aspx" height="153" width="1000" frameborder="0" scrolling="no">
	</iframe></td>
  </tr>
  <tr>
    <td width="190" height="800" valign="top">
	<iframe name="left" src="left_stu.aspx" height="800" width="190" frameborder="0" scrolling="no">
	</iframe>
	</td>
    <td width="810" valign="top">
	<iframe name="right" src="getstuinfo.aspx" height="800" width="810" frameborder="0" scrolling="no">
	</iframe>
	</td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" align="center" style="width: 1000px; height: 19px">
        <tr>
            <td rowspan="3" style="width: 190px; height: 19px;">
            <img src="images/buttom.gif" width="190px" />
            </td>
            <td align="center" style="font-size: 14px; color: white; height: 19px" valign=Top>
                CopyRight©2017
                山东师范大学 Go Big开发组 建议分辨率 1280×1024 
                <br />
            电子邮箱：dylanjoe2017@163.com

            </td>
        </tr>
</table>
</body>
</html>