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
public partial class Default2 : System.Web.UI.Page
{
    //定义数据库操作对象
    public SqlConnection conn;
    public SqlDataAdapter daad;
    public DataSet ds;

  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)    //用户合法性检查
            Response.Redirect("login.aspx");
        else
        {
            string strUid = Session["uid"].ToString();
            check cls = new check();
            bool bPermit = cls.getPermit(strUid, "04");
            if (!bPermit)
                Response.Redirect("nonPermit.aspx");
        }
            
        conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        if (!IsPostBack)
        {
            drpCour_content();
        }
    }
    
    //按钮触发统计事件
    protected void btnSta_Click(object sender, EventArgs e)
    {
        
        if (drpCour.SelectedIndex <= 0)
        {
            lblAlarm.Visible = true;
            lblAlarm.Text="请选择您要统计的课程!";
        }
        else
        {
            lblAlarm.Visible = false;
            BindData();
            Cour_all();
            Cour_past();
            Cour_rate();
            Cour_good();
            pnlShow.Visible = true;
        }
    }
    
    //绑定DropDownList
    public void drpCour_content()
    {
        string strSql = "SELECT DISTINCT C_name FROM tbl_CourseInfo where C_flag=1";
        daad = new SqlDataAdapter(strSql, conn);
        ds= new DataSet();
        daad.Fill(ds, "Course");
        drpCour.DataSource = ds.Tables["Course"].DefaultView;
        drpCour.DataValueField = ds.Tables["Course"].Columns[0].ColumnName;
        drpCour.DataTextField = ds.Tables["Course"].Columns[0].ColumnName;
        drpCour.DataBind();
    }
    
    //绑定GridView
    public void BindData()
    {
        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "StuInfo");
        gdvScoresInfo.DataSource = ds.Tables["StuInfo"].DefaultView;
        gdvScoresInfo.DataBind();
    }

    //获得修该门课程的全部人数
    public int Cour_all()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";
        
        ds= new DataSet();
        int irowcount;
        daad = new SqlDataAdapter(strQuery, conn);
        conn.Open();
        daad.Fill(ds);
        irowcount = ds.Tables[0].Rows.Count;
        conn.Close();
        int rowsum;
        rowsum = Convert.ToInt32(irowcount);
        //Response.Write(rowsum);//可以显示全部人数
        return (rowsum);
    }

    //获得修该门课程的及格人数
    public int Cour_past()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores >= 60";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";

        ds = new DataSet();
        int irowcount;
        daad = new SqlDataAdapter(strQuery, conn);
        conn.Open();
        daad.Fill(ds);
        irowcount = ds.Tables[0].Rows.Count;
        conn.Close();
        int rowsum;
        rowsum = Convert.ToInt32(irowcount);
        //Response.Write(rowsum);//可以显示及格人数
        return (rowsum);
    }

    //获得修该门课程的优秀人数
    public int Cour_good()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores >= 90";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";

        ds = new DataSet();
        int irowcount;
        daad = new SqlDataAdapter(strQuery, conn);
        conn.Open();
        daad.Fill(ds);
        irowcount = ds.Tables[0].Rows.Count;
        conn.Close();
        int irowsum;
        irowsum = Convert.ToInt32(irowcount);
        //Response.Write(rowsum);//可以显示优秀人数
        sco_well.Text = irowsum.ToString();
        return (irowsum);
    }

    public void stu_pass(object sender, EventArgs e)
    {
        
        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores>60";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stupass");
        gdvScoresInfo.DataSource = ds.Tables["stupass"].DefaultView;
        gdvScoresInfo.DataBind();
    }

    public void stu_good(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 90 AND 100";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stugood");
        gdvScoresInfo.DataSource = ds.Tables["stugood"].DefaultView;
        gdvScoresInfo.DataBind();
    }

    public void stu_all(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stuall");
        gdvScoresInfo.DataSource = ds.Tables["stuall"].DefaultView;
        gdvScoresInfo.DataBind();
    }

    

    //获得及格率
    public void Cour_rate()
    {
        double dcourRate;
        int icourPast = Cour_past();
        int icourAll = Cour_all();
        if (icourAll <= 0)
        {
            dcourRate = 0;
        }
        else
        {
            dcourRate = icourPast*1.0 / icourAll*100;
        }
        lblRate.Text=dcourRate.ToString()+"%";
        sco_pass.Text = icourPast.ToString();
        sco_all.Text = icourAll.ToString();
        
    }
}
