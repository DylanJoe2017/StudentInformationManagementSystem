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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string uid = this.txtUid.Text;                //得到登陆帐号
        string pwd = this.txtPwd.Text;                //得到登陆密码

        SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        
        //初始化该对象的连接字串
        
        sqlCon.Open();                               //打开数据库连接
        
        SqlCommand sqlComGet = new SqlCommand();     //创建SqlCommand对象
        sqlComGet.Connection = sqlCon;               //用sqlCon初始化SqlCommand对象

        if (rbTea.Checked)                           //以教务人员身份登陆
        {
            sqlComGet.CommandText = "select * from tbl_UserInfo where u_id='" + uid + "' and u_password='" + pwd + "'";
        }
        
        if (rbStu.Checked)                           //以学生身份登陆
        {
            sqlComGet.CommandText = "select * from tbl_StuInfo where s_no='" + uid + "' and s_pw='" + pwd + "'";
        }


        SqlDataReader sqlDr = sqlComGet.ExecuteReader();   //创建SqlDataReader对象
        
        if (sqlDr.Read())                                  //帐号和密码正确
        {
            Session["uid"] = uid;
            if (rbTea.Checked == true)
            {
                Session["uid"] = uid;                      //用Session记录教务人员帐号
                Session["uName"] = sqlDr["U_name"];        //用Session记录教务人员姓名

                Response.Redirect("mainTea.aspx");
            }
            if (rbStu.Checked == true)
            {
                Session["uid"] = uid;                      //用Session记录学生帐号 
                Session["uName"] = sqlDr["S_name"];        //用Session记录学生姓名
                Session["pwd"] = pwd;                      //用Session记录学生密码

                Response.Redirect("mainStu.aspx");
            }
        }
        else                                              //帐号或密码错误
        {
            Response.Redirect("error.aspx");
        }
        sqlCon.Close();                                   //在读取数据结束后才能关闭数据库                    
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        txtUid.Text = "";
        txtPwd.Text = "";
    }
}
