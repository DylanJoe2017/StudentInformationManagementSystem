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
public partial class updateDept06 : System.Web.UI.Page
{
    private SqlConnection sqlCon;
    private SqlDataAdapter sqlDa;
    private DataSet ds;
    private SqlCommand sqlCom;
    private SqlDataReader sqlDr;
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings ["dsn"].ToString ());
        if (!Page.IsPostBack)
       {        
        int id = (int)Session["updateDept"]; //将要更新的专业Id从Session中取出         
        sqlCon.Open();
        string cmdtext = "select * from tbl_deptMant where (Id=" + id + ")";//到数据库按照从Session中取出的id进行数据查询
        sqlCom = new SqlCommand(cmdtext, sqlCon);
        sqlDr = sqlCom.ExecuteReader();//生成SqlDataReader对象
        sqlDr.Read();//进行数据读取
        txtDept_name.Value = sqlDr.GetString(4).ToString();//将查询结果第一行第五列的值显示到文本框
        txtDept_name.DataBind();
        txtDept_no.Value = sqlDr.GetString(3).ToString();//将查询结果第一行第四列的值显示到文本框
        txtDept_no.DataBind();
        drInse_name.Items.Add(sqlDr.GetString(2).ToString());
        drInse_name.DataBind();
        sqlCon.Close();
        string sql = "select distinct inse_name,inse_no from tbl_deptmant";
        sqlDa = new SqlDataAdapter(sql, sqlCon);
        ds = new DataSet();
        sqlDa.Fill(ds, "tbl_DeptMant");
        drInse_name.DataSource = ds.Tables["tbl_DeptMant"];//将数据绑定到下拉列表框
        drInse_name.DataTextField = ds.Tables["tbl_DeptMant"].Columns["inse_name"].ToString();
        drInse_name.DataValueField = ds.Tables["tbl_DeptMant"].Columns["inse_no"].ToString();
        drInse_name.DataBind();
        }
        
    }
    protected void submit_ServerClick(object sender, EventArgs e)
    {
        int id = (int)Session["updateDept"]; 
        sqlCon.Open();
        sqlCom = sqlCon.CreateCommand();
        sqlCom.CommandText = "update tbl_deptMant set Inse_no='" + drInse_name.SelectedValue + "',Inse_name='" + drInse_name.SelectedItem.Text + "',Dept_no='" + txtDept_no.Value + "',Dept_name='" + txtDept_name.Value + "'where Id=" + id + " ";//通过从Session中取出的id进行进行更新
        sqlCom.ExecuteNonQuery();
        sqlCon.Close();
    }
    protected void btnreturn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("teaManagerDeptMant06.aspx");
    }
}
