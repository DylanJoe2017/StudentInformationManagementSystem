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
public partial class updateInse : System.Web.UI.Page
{
    private SqlCommand sqlCom,sqlComUpdate;
    private SqlConnection sqlCon;
    private SqlDataReader sqlDr;
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"].ToString());
        if (!Page.IsPostBack)
        {
            string updateInse = (string)Session["updateInse"];//将要更新的学院编号从Session中取出
            string sql = "select * from tbl_deptMant where Inse_no='" + updateInse.ToString() + "'";//到数据库按照从Session中取出的学院编号进行数据查询
            sqlCom = new SqlCommand(sql, sqlCon);
            sqlCon.Open();
            sqlDr = sqlCom.ExecuteReader();
            sqlDr.Read();//生成SqlDataReader对象
            lbloutputInse_no.Text = sqlDr.GetString(1).ToString();//将查询结果第一行第二列的值显示到标签
            txtInse_name.Value = sqlDr.GetString(2).ToString();//将查询结果第一行第三列的值显示到文本框
            txtInse_name.DataBind();
            sqlCon.Close();
        }
    }
    protected void submit_ServerClick(object sender, EventArgs e)
    {
        sqlCon.Open();
        sqlComUpdate = sqlCon.CreateCommand();
        sqlComUpdate.CommandText = "update tbl_deptMant set Inse_name='" + txtInse_name.Value + "' where Inse_no='" + lbloutputInse_no.Text + "'";//通过学院编号进行更新
        sqlComUpdate.ExecuteNonQuery();
        sqlCon.Close();
    }
    protected void btnReturn_ServerClick1(object sender, EventArgs e)
    {
        Response .Redirect ("teaManagerDeptMant06.aspx");
    }
}
