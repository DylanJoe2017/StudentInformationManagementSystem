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
public partial class AddDept : System.Web.UI.Page
{
    private SqlConnection sqlCon;
    private SqlDataAdapter sqlDa;
    private DataSet ds;
    private SqlCommand sqlCom,sqlComCheck;
    private SqlDataReader sqlDr;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql= "select distinct inse_name,inse_no from tbl_deptmant";//从数据库中查询学院编号和名称去除重复的
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings ["dsn"].ToString());
        sqlDa = new SqlDataAdapter(sql, sqlCon);
        ds = new DataSet();//实例话数据集                 
        sqlDa.Fill(ds, "tbl_DeptMant");//填充数据集
        drInse_name.DataSource = ds.Tables["tbl_DeptMant"];//将数据集表绑定到下拉列表框
        drInse_name.DataTextField = ds.Tables["tbl_DeptMant"].Columns["inse_name"].ToString();//将表中学院名称列绑定到显示文本内容
        drInse_name.DataValueField = ds.Tables["tbl_DeptMant"].Columns["inse_no"].ToString();//将表中学院编号列绑定到列表项提供的值
        drInse_name.DataBind();//调用绑定方法
        lblerrorDept_no.Text = "";
        lblerrorDept_name.Text = "";
    }
    protected void submit_ServerClick(object sender, EventArgs e)
    {
        sqlCon.Open();//打开数据库连接
        sqlComCheck = sqlCon.CreateCommand();//进行一般验证
        if(txtDept_no.Value==""){
            lblerrorDept_no.Text = "<font color=red>专业编号不能为空!</font>";
        }
        else if (txtDept_name.Value == "")
        {
            lblerrorDept_name.Text = "<font color=red>专业名称不能为空!</font>";
        }
        else {
            sqlComCheck.CommandText = "select * from tbl_deptmant where Dept_no='" + txtDept_no.Value + "'and Inse_no='" + drInse_name.SelectedValue + "' ";//从数据库查询是同一学院专业编号相同的的数据
		    sqlDr = sqlComCheck.ExecuteReader();
            if (sqlDr.Read())
            {
                lblerrorDept_no.Text = "<font color=red>已存在该专业编号!</font>";
            }
            else
            {
		        sqlDr.Close();
                sqlComCheck.CommandText = "select * from tbl_deptmant where Dept_name='" + txtDept_name.Value + "'and Inse_no='" + drInse_name.SelectedValue + "' ";//从数据库查询是同一学院专业名称相同的的数据
		        sqlDr = sqlComCheck.ExecuteReader();
                if (sqlDr.Read())
                {
                    lblerrorDept_name.Text = "<font color=red>已存在该专业名称!</font>";
                }
                else
                {
                    sqlDr.Close();//关闭SqlDataReader 对象
                    sqlCom = sqlCon.CreateCommand();
                    sqlCom.CommandText = "insert into tbl_deptMant(Inse_no,Inse_name,Dept_no,Dept_name) values('" + drInse_name.SelectedValue + "','" + drInse_name.SelectedItem.Text + "','" + txtDept_no.Value + "','" + txtDept_name.Value + "')";//插入的SQL语句
                    sqlCom.ExecuteNonQuery();
                    sqlCon.Close();//关闭数据库连接
                }
            } 
        }
           txtDept_name.Value = "";
           txtDept_no.Value = "";
    }
    protected void btnreturn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("teaManagerDeptMant06.aspx");
    }
}
