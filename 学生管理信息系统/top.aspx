<SCRIPT  language=javascript>
<!--
function  showclock()
{if(!document.layers&&!document.all)
return
var  datetime=new Date()
var  years=datetime.getFullYear()
var  months=datetime.getMonth()+1
var  days=datetime.getDate()
var  hours=datetime.getHours()
var  minutes=datetime.getMinutes()
var  seconds=datetime.getSeconds()
var  ap="AM"
if(hours>12)
{ap="PM"
hours=hours-12
}

if(minutes<=9)
minutes="0"+minutes
if(seconds<=9)
seconds="0"+seconds

myclock=years+"年"+months+"月"+days+"日 "+hours+":"+minutes+":"+seconds+"  "+ap;
if(document.layers){
document.layers.liveclock.document.write(myclock)
document.layers.liveclock.document.close()
}else  if(document.all)
liveclock.innerHTML=myclock
setTimeout("showclock()",1000)
}
//-->
</SCRIPT>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE3 {
	font-size: 14px;
	color: #FFFFFF;
}
.STYLE4 {
	font-size: 14px;
	color: #000000;
}
.STYLE5 {color: #FFFFFF}
-->
</style>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body onload ="showclock()">
<form id="form1" runat="server">
<table width="1000" border="0" cellpadding="0" cellspacing="0" align="center">
  <!--DWLayoutTable-->
  <tr>
    <td colspan="2" rowspan="3" valign="top"><img src="images\thetype_01.jpg" width="368" height="101" /></td>
    <td height="50" colspan="2" valign="top"><img src="images\thetype_02.jpg" width="390" height="50" border="0" /></td>
    <td width="242" rowspan="3" valign="top"><img src="images\thetype_03.jpg" width="242" height="101" /></td>
  </tr>
  <tr>
    <td height="29" colspan="2" valign="top"><img src="images\thetype_04.jpg" width="390" height="29" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td height="22" colspan="2" valign="top"><img src="images\thetype_05.jpg" width="390" height="22" /></td>
  </tr>
  
  <tr>
    <td colspan="5" valign="top" style="height: 25px"><img src="images\thetype_06.jpg" width="1000" height="40" style="height: 27px" /></td>
  </tr>
  <tr class="STYLE3">
    <td width="240" height="29" align="left" valign="middle" background="images/thetype_07.jpg"><span id="liveclock" style="font-size:16px; color:White; font-style:normal;"></span></td>
    <td colspan="2" valign="top"><img src="images/single_class.jpg" width="349" height="29" /></td>
    <td colspan="2" align="left" background="images/thetype_09.jpg" style="text-align: right" class="STYLE4">
        &nbsp;用户名：<asp:Label ID="lblUser" runat="server" CssClass="STYLE4"></asp:Label>&nbsp;
    &nbsp;&nbsp;&nbsp;<asp:LinkButton  ID="lbnLogout" runat="server" OnClick="lbnLogout_Click" CssClass="STYLE4">注销</asp:LinkButton></td>
  </tr>
  <tr>
    <td height="0" style="height: 18px"><span class="STYLE5">1D0A269EE660</span></td>
    <td width="128" style="height: 18px"></td>
    <td width="221" style="height: 18px"><span class="STYLE5">B17940D7338812</span></td>
    <td width="169" style="height: 18px"><span class="STYLE5">A2A6E4</span></td>
    <td style="height: 18px"></td>
  </tr>
</table>
</form>

<map name="Map" id="Map">
<area shape="rect" coords="3,6,74,25" href="#" onClick="MM_openBrWindow('group.html','开发团队','width=815,height=434')" />
<area shape="rect" coords="83,6,154,24" href="#" onClick="MM_openBrWindow('help.html','帮助信息','width=821,height=439')" />
<area shape="rect" coords="164,7,225,23" href="#" onClick="MM_openBrWindow('ysu.html','燕山大学介绍','width=827,height=447')" />
<area shape="rect" coords="239,6,302,24" href="#" onClick="MM_openBrWindow('copyright.html','版权信息','width=826,height=463')" />
<area shape="rect" coords="314,7,377,24" href="#" onClick="MM_openBrWindow('about.html','关于产品','width=808,height=430')" />
</map>
</body>
</html>
