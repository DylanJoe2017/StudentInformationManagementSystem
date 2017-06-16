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
public partial class showStuScores08 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Request.QueryString["id"]);
        
        string id = Request.QueryString["id"].ToString();
        string name = null;
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["dsn"]);
        string sql = "select S_name from tbl_StuInfo where S_no='" + id + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            name = sdr.GetString(0).ToString(); 
        }
        conn.Close();
        this.lblID.Text = "学号-" + id + "-姓名-"+name +"-的学生成绩：";
        
    }

    protected void grvStuScores_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //用与将不及格的学生成绩用红色突出显示
        //判断当前行是否是dataRow类型的行,因为象gridview中的headerrow,footerrow等行，并不包含实际的数据
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //得到当前行的成绩
            double score = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Scores"));
            if (score < 60)
            {
                e.Row.BackColor = Color.Red; //不及格将用红色凸显
                e.Row.ForeColor = Color.White;
            }
        }
    }
}
