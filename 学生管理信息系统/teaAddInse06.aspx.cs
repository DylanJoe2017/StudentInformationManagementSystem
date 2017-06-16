using System;
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
public partial class AddInse : System.Web.UI.Page
{
    private SqlConnection sqlCon;
    private SqlCommand sqlCom,sqlComCheck;
    private SqlDataReader sqlDr;
    protected void Page_Load(object sender, EventArgs e)
    {
            lblerrorInse_no.Text = "";
            lblerrorInse_name.Text = "";
            lblerrorDept_no.Text = "";
            lblerrorDept_name.Text = "";
    }
    protected void submit_ServerClick(object sender, EventArgs e)
    {
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"] .ToString());
        sqlCon.Open();
        sqlComCheck = sqlCon.CreateCommand();
        if (txtInse_no.Value == "")
        {
            lblerrorInse_no.Text = "<font color=red>学院编号不能为空</font>";
        }
        else if (txtInse_name.Value == "")
        {
            lblerrorInse_name.Text = "<font color=red>学院名称不能为空</font>";
        }
        else if (txtDept_no.Value == "")
        {
            lblerrorDept_no.Text = "<font color=red>专业编号不能为空</font>";
        }
        else if (txtDept_name.Value == "")
        {
            lblerrorDept_name.Text= "<font color=red>专业名称不能为空</font>";
        }else {
            sqlComCheck.CommandText = "select * from tbl_deptMant where Inse_no='" + txtInse_no.Value + "'";//从数据库查询学院代号相同的的数据
		        sqlDr = sqlComCheck.ExecuteReader();
                if (sqlDr.Read())
                {
                    lblerrorInse_no.Text = "<font color=red>已存在该学院编号请重新输入</font>";//假如存在相同的发出错误提示
                }
                else
                {
			        sqlDr.Close();
                    sqlComCheck.CommandText = "select * from tbl_deptMant where Inse_name='" + txtInse_name.Value + "'";//从数据库查询学院名称相同的的数据
                    sqlDr = sqlComCheck.ExecuteReader();
                    if (sqlDr.Read())
                    {
                        lblerrorInse_name.Text = "<font color=red>已存在该学院名称请重新输入</font>";//假如存在相同的发出错误提示
                    }
                    else
                    {
                        sqlDr.Close();
			            sqlCom = sqlCon.CreateCommand();
                        sqlCom.CommandText = "insert into tbl_deptMant(Inse_no,Inse_name,Dept_no,Dept_name) values('" + txtInse_no.Value + "','" + txtInse_name.Value + "','" + txtDept_no.Value + "','" + txtDept_name.Value + "')";//插入的SQL语句
                        sqlCom.ExecuteNonQuery();//执行SQL语句
                        sqlCon.Close();
                    }
                }
            }
        txtDept_name.Value = "";
        txtDept_no.Value = "";
        txtInse_name.Value = "";
        txtInse_no.Value = "";
    }
}
