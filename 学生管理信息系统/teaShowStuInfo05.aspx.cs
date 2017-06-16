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
using System.Drawing;

/*
 *版权信息：1D0A269EE660B17940D7338812A2A6E4 
 * 
 */
public partial class showStuInfo08 : System.Web.UI.Page
{
   // private Button btnSave;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            this.lblShowResult.Text = "";
            
        }
    }
    protected void drpInse_SelectedIndexChanged(object sender, EventArgs e)
    {
        //清除上次下拉框选择的数据
        this.drpDept.Items.Clear();
        this.drpDept.Items.Add("请选择专业");
        this.drpClass.Items.Clear();
        this.drpClass.Items.Add("请选择班级");
       
      
       

    }
    protected void drpDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.drpClass.Items.Clear();
        this.drpClass.Items.Add("请选择班级");
      

    }
    protected void drpClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.txtID.Text = "";//将按ID查询方式的文本框设置为空
        this.lblShowResult.Text = this.drpGrade.SelectedItem + "-" + this.drpInse.SelectedItem + "-" + this.drpDept.SelectedItem + "-" + this.drpClass.SelectedItem + "学生名单";
        grvStu.Visible = false;
        
    }
    
    protected void btnID_Click(object sender, EventArgs e)
    {
        this.drpGrade.SelectedIndex = 0;
        this.drpInse.SelectedIndex = 0;
        this.drpDept.SelectedIndex = 0;
        this.drpClass.SelectedIndex = 0;
        grvStu.Visible = false;
        this.lblShowResult.Text = "学号为" + this.txtID.Text + "学生";

    }



    protected void btnSelect_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["dsn"]);
        string sql = "select s_no ,s_name from tbl_stuInfo where S_grade='" + drpGrade.SelectedValue + "'";

        if (drpInse.SelectedIndex != 0)
        {
            sql += " and S_Inse='" + drpInse.SelectedValue + "' ";
        }
        if (drpDept.SelectedIndex != 0)
        {
            sql += " and S_dept='" + drpDept.SelectedValue + "' ";
        }
        if (drpClass.SelectedIndex != 0)
        {
            sql += " and S_class='" + drpClass.SelectedValue + "' ";
        }
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grvStu.DataSource = ds;
        grvStu.DataBind();
      
    }
}
