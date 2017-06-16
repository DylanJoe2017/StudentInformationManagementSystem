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

public partial class teaViewCourse06 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string cno = Request.QueryString["c_no"];
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["dsn"];
            sqlCon.Open();
            SqlCommand sqlComDel = new SqlCommand();
            sqlComDel.Connection = sqlCon;
            sqlComDel.CommandText = "select * from tbl_CourseInfo where c_no='" + cno + "'";
            SqlDataReader sqlDr=sqlComDel.ExecuteReader();
            if (sqlDr.Read())
            {
                txtCno.Text = sqlDr.GetString(1);
                txtCno.Enabled = false;
                txtCname.Text = sqlDr.GetString(2);
                txtCname.Enabled = false;
                txtContent.Text = sqlDr.GetString(3);
                txtContent.Enabled = false;
                txtTeacher.Text = sqlDr.GetString(4);
                txtTeacher.Enabled = false;
                txtHours.Text = sqlDr.GetValue(5).ToString();
                txtHours.Enabled = false;
                txtScores.Text = sqlDr.GetValue (6).ToString ();
                txtScores.Enabled = false;
            }
            sqlCon.Close();
        }
    }
    protected void lbnEdit_Click(object sender, EventArgs e)
    {
        if (lbnEdit.Text == "编 辑")
        {
            txtContent.Enabled = true;
            txtTeacher.Enabled = true;
            txtHours.Enabled = true;
            txtScores.Enabled = true;
            lbnEdit.Text = "更 新";
        }
        else
        {
            string strCno = txtCno.Text;
            string strContent = txtContent.Text;
            string strTeacher = txtTeacher.Text;
            string strHours = txtHours.Text;
            string strScores = txtScores.Text;

            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["dsn"];
            sqlCon.Open();
            SqlCommand sqlComDel = new SqlCommand();
            sqlComDel.Connection = sqlCon;
            sqlComDel.CommandText = "update tbl_CourseInfo set c_content=@cont,c_teacher=@tea,c_hours=@hou,c_scores=@sco where c_no=@cno";
            sqlComDel.Parameters.Add("cno", SqlDbType.VarChar);
            sqlComDel.Parameters.Add("cont", SqlDbType.VarChar);
            sqlComDel.Parameters.Add("tea", SqlDbType.VarChar);
            sqlComDel.Parameters.Add("hou", SqlDbType.Int);
            sqlComDel.Parameters.Add("sco", SqlDbType.Decimal);
            sqlComDel.Parameters[0].Value = strCno;
            sqlComDel.Parameters[1].Value = strContent;
            sqlComDel.Parameters[2].Value = strTeacher;
            sqlComDel.Parameters[3].Value = Convert.ToInt16(strHours);
            sqlComDel.Parameters[4].Value = Convert.ToDecimal(strScores);
            sqlComDel.ExecuteNonQuery();
            sqlCon.Close();
            lbnEdit.Text = "编 辑";
            txtContent.Enabled = false;
            txtTeacher.Enabled = false;
            txtHours.Enabled = false;
            txtScores.Enabled = false;
        }
    }

    protected void txtContent_TextChanged(object sender, EventArgs e)
    {

    }
}
