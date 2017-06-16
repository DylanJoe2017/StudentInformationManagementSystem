using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    public SqlConnection conn;
    public SqlDataAdapter cmd;
    public DataSet ds = new DataSet();

    //学院处理
    protected void drpInstitute_content()
    {

        string strSql = "select distinct inse_name from tbl_deptmant";
        cmd = new SqlDataAdapter(strSql, conn);
        cmd.Fill(ds, "institue");
        drpInstitute.DataSource = ds.Tables["institue"].DefaultView;

        drpInstitute.DataValueField = ds.Tables["institue"].Columns[0].ColumnName;
        drpInstitute.DataTextField = ds.Tables["institue"].Columns[0].ColumnName;//绑定no

        drpInstitute.DataBind();
    }

    //院系处理
    protected void drpDept_content()
    {
        if (IsPostBack)
        {
            drpDept.Items.Clear();
            drpDept.Items.Add("--全部--");
        }
        string strSql = "select dept_name from tbl_deptmant where inse_name='" + drpInstitute.Text + "'";
        cmd = new SqlDataAdapter(strSql, conn);
        cmd.Fill(ds, "department");
        drpDept.DataSource = ds.Tables["department"].DefaultView;
        drpDept.DataValueField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataTextField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataBind();

    }
    protected void BindData()
    {
        //判断按照哪种方式查询
        string numbers=stu_number.Text;

        //仅按照学号文本内容查询学号
        if (numbers != "")
        {
            string strQuery = "select distinct tbl_stuexpe.id,tbl_stuexpe.s_no ,e_begindate ,e_enddate,e_content,e_type,s_name from tbl_stuinfo,tbl_stuexpe,tbl_deptmant where s_inse=inse_no and tbl_stuexpe.s_no=tbl_stuinfo.s_no and s_dept=dept_no and tbl_stuexpe.s_no='" + stu_number.Text + "' ";
            cmd = new SqlDataAdapter(strQuery, conn);
            cmd.Fill(ds, "single");
            GridView1.DataSource = ds.Tables["single"].DefaultView;
            GridView1.DataBind();
        }
        //按照联动菜单查询
        else
        {
            string strQuery = "select distinct tbl_stuexpe.id,tbl_stuexpe.s_no ,e_begindate ,e_enddate,e_content,e_type,s_name from tbl_stuinfo,tbl_stuexpe,tbl_deptmant where s_inse=inse_no and tbl_stuexpe.s_no=tbl_stuinfo.s_no and s_dept=dept_no ";
            if (drpGrade.SelectedIndex != 0)
                strQuery += " and s_grade='" + drpGrade.Text + "'";
            if (drpInstitute.SelectedIndex != 0)
                strQuery += " and  inse_name='" + drpInstitute.Text + "'";
            if (drpDept.SelectedIndex != 0)
                strQuery += " and dept_name='" + drpDept.Text + "'";
            if (drpClass.SelectedIndex != 0)
                strQuery += " and s_class='" + drpClass.Text + "'";

            cmd = new SqlDataAdapter(strQuery, conn);
            cmd.Fill(ds, "stuexpe");
            GridView1.DataSource = ds.Tables["stuexpe"].DefaultView;
            GridView1.DataBind();
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)    //用户合法性检查
            Response.Redirect("login.aspx");
        else
        {
            string strUid = Session["uid"].ToString();
            check cls = new check();
            bool bPermit = cls.getPermit(strUid, "02");
            if (!bPermit)
                Response.Redirect("nonPermit.aspx");
        }

        conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        if (!IsPostBack)
        {
            drpInstitute_content();
            drpDept_content();
            BindData();
        }

    }


    protected void drpInstitute_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpDept_content();

    }

    protected void lbnInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("teaAddStuInfo.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
        BindData();

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strSno = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
        string strSql = "delete from tbl_stuexpe where id='" + strSno + "'";
        conn.Open();
        SqlCommand cmda = new SqlCommand(strSql, conn);
        cmda.ExecuteNonQuery();
        conn.Close();
        BindData();

    }
   
}
