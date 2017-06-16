using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{

    
    protected void Page_Load(object sender, EventArgs e)
    {

        //从Session中获得当前登陆系统的用户名称，用于显示
        lblUser.Text = Session["uName"].ToString();

    }
    
    protected void lbnLogout_Click(object sender, EventArgs e)
    {
        //将Session中各变量置空
        Session["uName"] = null;
        Session["uid"] = null;
        Session["pwd"] = null;

        //切换到系统登陆界面
        Response.Write("<script language='javascript'>top.location='login.aspx';</script>");
        Response.End();
    }
}
