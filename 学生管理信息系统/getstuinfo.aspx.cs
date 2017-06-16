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

public partial class getstuinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (null == Session["uid"] || null==Session["pwd"])  //如果没有登录
        {
            Response.Redirect("login.aspx");                 //返回到“登录”页面
        }
        else
        {
            SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象

            sqlCon.Open();                               //打开数据库连接

            SqlCommand sqlComGet = new SqlCommand();     //创建SqlCommand对象
            sqlComGet.Connection = sqlCon;
            sqlComGet.CommandText = "select * from tbl_StuInfo where s_no='" + Session["uid"].ToString() + "' and s_pw='" + Session["pwd"].ToString() + "'";
            SqlDataReader sqlDr = sqlComGet.ExecuteReader();
            if (sqlDr.Read())
            {
                sqlComGet.CommandText = "select * from tbl_StuInfo,tbl_deptMant where tbl_StuInfo.s_no='" + Session["uid"].ToString() + "' and tbl_StuInfo.s_pw='" + Session["pwd"].ToString() + "' and tbl_StuInfo.S_Inse = tbl_deptMant.Inse_no and tbl_StuInfo.S_dept = tbl_deptMant.Dept_no";
                sqlDr.Close();
                sqlDr = sqlComGet.ExecuteReader();
            }
            infoDiv.Visible = true;
            showInfo(sqlDr);
            //if ("successed" == state)        //如果getinfo服务检索数据成功
            //{
            //    infoDiv.Visible = true;      //包含显示结果的DIV可见
            //    showInfo(resp.infoDataSet);  //显示检索的全部学生信息
            //}
            //else                             //如果getinfo服务检索数据失败
            //{
            //    infoDiv.Visible = false;     //包含显示结果的DIV不可见
            //    lblErrMessage.Text = state;  //在Web窗体上显示错误提示信息
            //}
        }
    }
    private void showInfo(SqlDataReader infoDataSet)
    {
        //获得并显示学生基本信息
        //DataRow stuInfo = infoDataSet.Tables["StuInfo"].Rows[0];
        infoDataSet.Read();
        lblNO.Text = (string)infoDataSet["S_no"];
        lblName.Text = (string)infoDataSet["S_name"];
        lblGender.Text = (string)infoDataSet["S_gender"];
        lblBirthday.Text = ((DateTime)infoDataSet["S_birthday"]).ToString("d");
        lblParty.Text = (string)infoDataSet["S_party"];
        lblLocate.Text = (string)infoDataSet["Inse_name"] + " ， " + (string)infoDataSet["dept_name"] + " ， " + (string)infoDataSet["S_grade"] + " ， " + (string)infoDataSet["S_class"];
        lblAddress.Text = (string)infoDataSet["S_address"];
        lblIn.Text = ((DateTime)infoDataSet["S_in"]).ToString("d");
        lblOut.Text = ((DateTime)infoDataSet["S_out"]).ToString("d");
        imgPhoto.ImageUrl = (string)infoDataSet["S_pic"];

        //将Table["StuScores"]设定为gvScores的数据源，并进行数据绑定。
        //gvScores.DataSource = infoDataSet.Tables["StuScores"];
        //gvScores.DataBind();

        //将Table["StuExpes"]设定为gvExpes的数据源，并进行数据绑定。
        //gvExpes.DataSource = infoDataSet.Tables["StuExpes"];
        //gvExpes.DataBind();
        
    }
}
