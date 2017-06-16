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


public partial class Default2 : System.Web.UI.Page
{
    //定义数据库操作对象
    public SqlConnection conn;
    public SqlDataAdapter daad;
    public DataSet ds = new DataSet();

    //绑定DropDownList中的学院
    protected void drpInstitute_content()
    {
        string strSql = "select distinct inse_name from tbl_deptmant";
        daad = new SqlDataAdapter(strSql, conn);
        daad.Fill(ds, "institue");
        drpInstitute.DataSource = ds.Tables["institue"].DefaultView;
        drpInstitute.DataValueField = ds.Tables["institue"].Columns[0].ColumnName;//绑定学院代码
        drpInstitute.DataTextField = ds.Tables["institue"].Columns[0].ColumnName;
        drpInstitute.DataBind();
    }

    //绑定DropDownList中的系
    protected void drpDept_content()
    {
        if (IsPostBack)
        {
            drpDept.Items.Clear();
            drpDept.Items.Add("--全部--");
        }
        string strSql = "select dept_name from tbl_deptmant where inse_name='" + drpInstitute.Text + "'";
        daad = new SqlDataAdapter(strSql, conn);
        daad.Fill(ds, "department");
        drpDept.DataSource = ds.Tables["department"].DefaultView;
        drpDept.DataValueField = ds.Tables["department"].Columns[0].ColumnName;//绑定系代码
        drpDept.DataTextField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataBind();

    }

    //绑定DropDownList中的课程
    public void drpCour_content()
    {
        string strSql = "SELECT DISTINCT C_name FROM tbl_CourseInfo where C_flag=1";
        daad = new SqlDataAdapter(strSql, conn);
        daad.Fill(ds, "Course");
        drpCour.DataSource = ds.Tables["Course"].DefaultView;
        drpCour.DataValueField = ds.Tables["Course"].Columns[0].ColumnName;
        drpCour.DataTextField = ds.Tables["Course"].Columns[0].ColumnName;
        drpCour.DataBind();
    }

    //绑定GridView
    protected void BindData()
    {
       string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no";  
        if (drpGrade.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.S_class='" + drpClass.Text + "'";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";
        daad = new SqlDataAdapter(strQuery, conn);
        daad.Fill(ds,"StuInfo");
        gdvScoresInfo.DataSource = ds.Tables["StuInfo"].DefaultView;
        gdvScoresInfo.DataBind();
    }

    //自动回发绑定系
    protected void drpInstitute_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpDept_content();//自动回发
        if(!IsPostBack)
        drpCour_content();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)            //用户合法性检查
            Response.Redirect("login.aspx");   //用户不合法则重定向到登录页面
        else                                   //合法用户
        {
            string strUid = Session["uid"].ToString();   //将帐号保存到Session变量中
            check cls = new check();
            bool bPermit = cls.getPermit(strUid, "04");
            if (!bPermit)
                Response.Redirect("nonPermit.aspx");
        }

        //连接数据库，为初始化窗体显示信息做准备
        conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        if (!IsPostBack)                       //如果是第一次加载该页面
        {
            drpInstitute_content();            //初始化“学院名称”下拉列表
            drpDept_content();                 //初始化“系别名称”下拉列表
            drpCour_content();                 //初始化“课程名称”下拉列表
        }
    }

    //获得及格人数
    public int Cour_past()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 90 AND 100";
        if (drpGrade.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.S_class='" + drpClass.Text + "'";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";
        conn.Open();
        ds = new DataSet();
        int irowcount;
        daad = new SqlDataAdapter(strQuery, conn);
        daad.Fill(ds);
        irowcount = ds.Tables[0].Rows.Count;
        conn.Close();
        int rowsum;
        rowsum = Convert.ToInt32(irowcount);
        //Response.Write(rowsum);//可以显示及格人数
        sco_pass.Text = rowsum.ToString();

        return (rowsum);
        
    }

    //获得全部人数
    public int Cour_all()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no";
        if (drpGrade.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.S_class='" + drpClass.Text + "'";
        if (drpCour.SelectedIndex != 0)
            strQuery += " and C_name='" + drpCour.Text + "'";
        conn.Open();
        ds = new DataSet();
        int irowcount;
        daad = new SqlDataAdapter(strQuery, conn);
        daad.Fill(ds);
        irowcount = ds.Tables[0].Rows.Count;
        conn.Close();
        int rowsum;
        rowsum = Convert.ToInt32(irowcount);
        //Response.Write(rowsum);//可以显示及格人数
        sco_all.Text = rowsum.ToString();
      
        return (rowsum);
    }

    //获得优秀人数
    public int Cour_good()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 90 AND 100";
        if (drpGrade.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.S_class='" + drpClass.Text + "'";
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
        sco_good.Text = irowsum.ToString();
        
        return (irowsum);
    }

    //获得良好人数
    public int Cour_cgood()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 80 AND 89";
        if (drpGrade.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.S_class='" + drpClass.Text + "'";
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
        //Response.Write(rowsum);//可以显示良好人数
        sco_ok.Text = irowsum.ToString();
        
        return (irowsum);
    }

    //获得中等人数
    public int Cour_Middle()
    {
        string strQuery = "select tbl_StuScores.C_no,C_name,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 70 AND 79";
        if (drpGrade.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += " and tbl_deptmant.dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += " and tbl_StuInfo.S_class='" + drpClass.Text + "'";
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
        //Response.Write(rowsum);//可以显示中等人数
        sco_middle.Text = irowsum.ToString();
       
        return (irowsum);
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
            dcourRate = icourPast * 1.0 / icourAll * 100;
        }
        lblrate.Text = dcourRate.ToString() + "%";
    }

    //获得优秀率
    public void Cour_rateg()
    {
        double dcourRate;
        int icourgood = Cour_good();
        int icourAll = Cour_all();
        if (icourAll <= 0)
        {
            dcourRate = 0;
        }
        else
        {
            dcourRate = icourgood * 1.0 / icourAll * 100;
        }
        lblRateg.Text = dcourRate.ToString() + "%";
    }

    //获得中等率
    public void Cour_ratem()
    {
        double dcourRate;
        int icourmiddle = Cour_Middle();
        int icourAll = Cour_all();
        if (icourAll <= 0)
        {
            dcourRate = 0;
        }
        else
        {
            dcourRate = icourmiddle * 1.0 / icourAll * 100;
        }
        lblRatem.Text = dcourRate.ToString() + "%";
    }

    //获得良好率
    public void Cour_ratec()
    {
        double dcourRate;
        int icourcgood = Cour_cgood();
        int icourAll = Cour_all();
        if (icourAll <= 0)
        {
            dcourRate = 0;
        }
        else
        {
            dcourRate = icourcgood * 1.0 / icourAll * 100;
        }
        lblRatec.Text = dcourRate.ToString() + "%";
    }


    //优秀
    public void stu_good(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 90 AND 100";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stugood");
        gdvScoresInfo.DataSource = ds.Tables["stugood"].DefaultView;
        gdvScoresInfo.DataBind();
    }


    //良好
    public void stu_ok(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 80 AND 89";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stuok");
        gdvScoresInfo.DataSource = ds.Tables["stuok"].DefaultView;
        gdvScoresInfo.DataBind();
    }


    //中等
    public void stu_middle(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores BETWEEN 70 AND 79";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stumiddle");
        gdvScoresInfo.DataSource = ds.Tables["stumiddle"].DefaultView;
        gdvScoresInfo.DataBind();
    }


    //及格
    public void stu_pass(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no and tbl_StuScores.Scores>=60";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stupass");
        gdvScoresInfo.DataSource = ds.Tables["stupass"].DefaultView;
        gdvScoresInfo.DataBind();
    }


    //全部
    public void stu_all(object sender, EventArgs e)
    {

        string strQuery = "select distinct tbl_StuScores.C_no,C_name,C_teacher,Scores,C_scores,tbl_StuScores.s_no ,s_name ,tbl_StuInfo.s_grade from tbl_StuScores,tbl_CourseInfo,tbl_StuInfo,tbl_deptmant  where tbl_StuScores.C_no=tbl_CourseInfo.C_no and tbl_StuScores.S_no=tbl_StuInfo.S_no and c_name='" + drpCour.Text + "' and s_inse=inse_no and s_dept=dept_no";
        daad = new SqlDataAdapter(strQuery, conn);
        ds = new DataSet();
        daad.Fill(ds, "stuall");
        gdvScoresInfo.DataSource = ds.Tables["stuall"].DefaultView;
        gdvScoresInfo.DataBind();
    }

    protected void btnSta_Click(object sender, EventArgs e)
    {
        if (drpCour.SelectedIndex <= 0)
        {
            lblAlarm.Visible = true;
            lblAlarm.Text = "请选择您要统计的课程!";
        }
        else
        {
            lblAlarm.Visible = false;
            BindData();
            Cour_all();
            Cour_past();
            Cour_rate();
            Cour_good();
            Cour_cgood();
            Cour_Middle();
            Cour_ratec();
            Cour_rateg();
            Cour_ratem();
            pnlShow.Visible = true;
        }
    }
}