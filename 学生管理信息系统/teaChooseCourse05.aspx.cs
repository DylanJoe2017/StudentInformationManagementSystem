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
public partial class chooseCourse : System.Web.UI.Page
{
    string id = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            this.lblTop.Text = "";
            
        }
       

    }
    protected void btnAddCourse_Click(object sender, EventArgs e)
    {
        if (this.drpCourse.SelectedIndex != 0)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
            string sql = "insert into tbl_StuScores(S_no,C_no,Scores) values('" + id + "','" + this.drpCourse.SelectedValue + "',0)";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            this.lblTop.Text = this.drpCourse.SelectedItem + "已经选定";
        }
        else
        {
            this.lblTop.Text = "你没有选择课程";
        }
        this.grvHasChoCourse.DataBind();
        
    }
}
