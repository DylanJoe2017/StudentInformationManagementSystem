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

/*
 *版权信息：1D0A269EE660B17940D7338812A2A6E4 
 * 
 */
public partial class changepwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (null == Session["uid"])
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        string s_no = Session["uid"].ToString();
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        sqlCon.Open();
        SqlCommand sqlCom = sqlCon.CreateCommand();
        sqlCom.CommandText = "select S_pw from tbl_StuInfo where S_no=" + s_no;
        string txtpwd = (string)sqlCom.ExecuteScalar();
        if (txtpwd.Trim() != txtOrignPwd.Text)
        {
            lblErrorPassword.Text = "密码错误！";
            sqlCon.Close(); // 关闭链接
        }
        else
        {
            string newPwd = txtNewPwd.Text;
            sqlCom.CommandText = "update tbl_StuInfo set S_pw='" + newPwd + "' where S_no=" + s_no;
            sqlCom.ExecuteNonQuery();
            sqlCon.Close(); // 关闭链接
            Response.Write("<script language='javascript'>alert('修改成功');location='getstuinfo.aspx';</script>");
        }
        
    }
}
