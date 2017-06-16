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
public partial class AddCourseInfo : System.Web.UI.Page
{
    private SqlCommand sqlCom,sqlComCheck;
    private SqlConnection sqlCon;
    private SqlDataReader sqlDr;
    protected void Page_Load(object sender, EventArgs e)
    {
            lblerrorC_no.Text = "";         //用于清空错误提示
            lblerrorC_name.Text = "";
            lblerrorC_teacher.Text = "";
            lblerrorC_hours.Text = "";
            lblerrorC_scores.Text = "";
    }

    protected void submit_ServerClick(object sender, EventArgs e)
    {

        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings ["dsn"].ToString());
        sqlCon.Open();
        sqlComCheck = sqlCon.CreateCommand();//对添加作基本验证

        //对输入数据进行有效性判断
        if (txtC_no.Value == "")
        {
            lblerrorC_no.Text = "<font color=red>课程编号不能为空!</font>";
            return;
        }
        
        if (txtC_no.Value.Length != 12)
        {
            lblerrorC_no.Text = "<font color=red>课程编号必须为12位!</font>";
            return;
        }
        
        if (txtC_name.Value == "")
        {
            lblerrorC_name.Text = "<font color=red>课程名称不能为空!</font>";
            return;
        }
        
        if (txtC_teacher.Value == "")
        {
            lblerrorC_teacher.Text = "<font color=red>授课老师不能为空!</font>";
            return;
        }
        //int  i =  int.Parse(txtC_hours.Value);
        
        if (txtC_hours.Value == "")
        {
            lblerrorC_hours.Text = "<font color=red>课程学时不能为空!</font>";
            return;
        }
        
        if (txtC_scores.Value == "")
        {
            lblerrorC_scores.Text = "<font color=red>课程学分不能为空!</font>";
            return;
        }

        sqlComCheck.CommandText = "select * from tbl_CourseInfo where C_no='" + txtC_no.Value + "'";     //从数据库查询是否有课程代号相同的的数据
        sqlDr = sqlComCheck.ExecuteReader();  //生成SqlDataReader对象
        if (sqlDr.Read())
        {
            lblerrorC_no.Text = "<font color=red>该课程编号已存在请重新输入!</font>";
            return;
         }

         sqlDr.Close();                        //关闭SqlDataReader对象实例
         sqlComCheck.CommandText = "select * from tbl_CourseInfo where C_name='" + txtC_name.Value + "'";//从数据库查询是否有课程名称相同的的数据
         sqlDr = sqlComCheck.ExecuteReader();  //生成SqlDataReader对象
         if (sqlDr.Read())
         {
             lblerrorC_name.Text = "<font color=red>该课程名称已存在请重新输入!</font>";
             return;
          }

          sqlDr.Close();
          sqlCom = sqlCon.CreateCommand();

          //用于插入课程信息记录的SQL语句字符串
          sqlCom.CommandText = "insert into tbl_CourseInfo(C_no,C_name,C_content,C_teacher,C_hours,C_scores,C_flag) values(" +
                                          "'" + txtC_no.Value + "',"+
                                          "'" + txtC_name.Value + "',"+
                                          "'" + txtC_content.Text + "',"+
                                          "'" + txtC_teacher.Value + "'," +
                                                txtC_hours.Value.Trim() +　","　+
                                                txtC_scores.Value.Trim() + "," + "'0')";

          sqlCom.ExecuteNonQuery();             //执行SQL语句
          sqlCon.Close();                       //关闭数据库连接对象        

          Response.Write("<script javascript>alert(" + "'添加课程数据成功！'" + ")</script>");  

          //Response.Redirect("teaManCourse06.aspx");

    }

    protected void btnReturn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("teaManagerDeptMant06.aspx");
    }
}
