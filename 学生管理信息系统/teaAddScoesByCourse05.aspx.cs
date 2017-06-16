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
using System.Drawing;
using System.Data.SqlClient;
/*
 *版权信息：1D0A269EE660B17940D7338812A2A6E4 
 * 
 */
public partial class addScoesByCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.btnSave.Visible = false;
            this.lblWarning.Text = "";
           
        }

    }
   
    protected void drpCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpCourse.SelectedIndex > 0)
        {
            this.btnSave.Visible = true;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
      
        string cno = this.drpCourse.SelectedValue;　　　　//获得“课程名称”下拉列表中显示的值
        //新建并实例化数据库连接对象conn，从Web.config文件读取数据库连接信息
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["dsn"]);  
        conn.Open();
        for (int i = 0; i < gdvStuScores.Rows.Count; i++)  //循环向tbl_StuScores表中添加已录入的多个成绩信息
        {
            string sno = gdvStuScores.Rows[i].Cells[0].Text;
            //将GridView控件中成绩信息转换为浮点类型数据
            decimal score = Convert.ToDecimal(((TextBox)(gdvStuScores.Rows[i].Cells[2].Controls[1])).Text);
            string sql = "update tbl_StuScores set Scores="+ score + " where S_no='" + sno + "' and C_no='" + cno + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();     //执行数据库更新SQL语句
        }

        this.lblWarning.Text = "选修" + this.drpCourse.SelectedItem + "课程的所有学生成绩已经增加成功";
        conn.Close();　　　//关闭数据库连接
      
    }
   
}
