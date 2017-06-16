<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teaManStuScore05.aspx.cs" Inherits="index08" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="font-size: 11pt; color: #fe730e; font-family: 微软雅黑">您的位置:学生信息管理-&gt;学生成绩信息管理<br />
        </span></strong><br />
        <table style="width: 459px; height: 30px; border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid; border-left: #e0dfe3 1px solid; border-bottom: #e0dfe3 1px solid; border-collapse: collapse; text-align: center;">
            <tr>
                <td style="width: 233px; height: 20px;">
                    <asp:HyperLink ID="hylScores" runat="server" NavigateUrl="~/teaShowStuInfo05.aspx" CssClass="aWord">个人成绩管理</asp:HyperLink></td>
                <td colspan="2" style="height: 20px">
                    <asp:HyperLink ID="hylScoresByCourse" runat="server" NavigateUrl="~/teaAddScoesByCourse05.aspx"
                        Width="120px" CssClass="aWord">按课程录入成绩</asp:HyperLink></td>
            </tr>
           
        </table>
    
    </div>
        <table style="width: 701px; height: 170px; border-right: #e0dfe3 1px solid; border-top: #e0dfe3 1px solid; border-left: #e0dfe3 1px solid; border-bottom: #e0dfe3 1px solid; border-collapse: collapse; text-align: center;">
            <tr>
                <td style="width: 48px; text-align: center;">
                    </td>
                    <td style="width: 436px;height:10px" align="left" class="sWord">
                        </td>
            </tr>
            <tr>
                <td style="width: 48px; text-align: center;">
                    </td>
                    <td style="width: 436px" align="left" class="sWord">
                        ·可以按学号对学生所学课程的成绩进行查询和管理,</td>
            </tr>
            <tr>
                <td style="width: 48px; text-align: center; height: 20px;">
                    </td>
                    <td style="width: 436px" align="left" class="sWord">
                        &nbsp; &nbsp; 成绩管理包括：成绩录入，成绩删除，和成绩修改;</td>
            </tr>
            <tr>
                <td style="width: 48px; height: 23px; text-align: center;">
                    </td>
                    <td style="height: 23px; width: 436px;" align="left" class="sWord">
                        ·可以按课程名称批量录入学生该课程的所有学生成绩;</td>
            </tr>
                        <tr>
                <td style="width: 48px; height: 23px; text-align: center;">
                    </td>
                    <td style="height: 23px; width: 436px;" align="left" class="sWord">
                        ·可以按逐级递进（筛选）方式查询和管理班级学生成绩信息;</td>
            </tr>
        </table>
    </form>
</body>
</html>
