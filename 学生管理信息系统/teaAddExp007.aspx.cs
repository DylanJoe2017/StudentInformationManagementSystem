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
public partial class manage : System.Web.UI.Page
{
    public SqlConnection conn;
    public SqlDataAdapter cmd;
    public DataSet ds = new DataSet(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        if (!IsPostBack)
        {
            
        }
    }

    //提交函数
    protected void update_expe()
    {
        SqlCommand cmda;
        string strSql;
        string strSparty;
        strSparty = type.SelectedItem.Text;
        if (nonsence.Visible)
            strSql = "INSERT INTO [tbl_StuExpe] ([S_no], [E_beginDate], [E_endDate], [E_content], [E_type]) values('" + num_enter.Text + "','" + dat_begain.Text + "','" + dat_end.Text + "','" + exp_content.Text + "','" + strSparty + "')";
        else
            strSql = "INSERT INTO [tbl_StuExpe] ([S_no], [E_beginDate], [E_endDate], [E_content], [E_type]) values( '" + nonsence2.Text + "','" + dat_begain.Text + "','" + dat_end.Text + "','" + exp_content.Text + "','" + strSparty + "')";
        conn.Open();
        cmda = new SqlCommand(strSql, conn);
        cmda.ExecuteNonQuery();
        conn.Close();
        error_img.Visible = false;
        ok_img.Visible = true;
        lblMessage.Visible = true;
        lblMessage.Text = "<br />已为该生成功添加一条新的履历信息！您可以继续添加<br />";
    }


    //检测填写信息
    protected void check_info(object sender, EventArgs e)
    {


        string start_time = dat_begain.Text;
        string end_time = dat_end.Text;
        string contents = exp_content.Text;
        string nonsence_info = nonsence.Text;
        string nonsence2_info = nonsence2.Text;
        if (nonsence.Visible)
            if (nonsence_info == "没有检测到" || nonsence_info == "")
            {
                error_img.Visible = true;
                lblMessage.Visible = true;
                lblMessage.Text = "<br />无法提交！学号检测不合法或没有提交任何学号信息！<br />";
            }
            else
            {
                update_expe();
            }
        if (nonsence2.Visible)
            if (nonsence2_info == "没有检测到" || nonsence2_info == "")
            {
                error_img.Visible = true;
                lblMessage.Visible = true;
                lblMessage.Text = "<br />无法提交！学号检测不合法或没有提交任何学号信息！<br />";
            }
            else
            {
                update_expe();
            }

    }

    //输入姓名检索
    protected void check_num_name(object sender, EventArgs e)
    {

        string strQuery = "select tbl_stuinfo.s_no ,s_name ,s_grade,inse_name,dept_name,s_class from tbl_stuinfo,tbl_deptmant where s_name='" + stu_name.Text + "'and s_inse=inse_no and s_dept=dept_no ";
        cmd = new SqlDataAdapter(strQuery, conn);
        cmd.Fill(ds, "mmm");
        GridView1.DataSource = ds.Tables["mmm"].DefaultView;
        GridView1.DataBind();
        nonsence2.Visible = true;
        nonsence.Visible = false;
        string sqlconnectionstring = System.Configuration.ConfigurationManager.AppSettings["dsn"];
        SqlConnection con;
        con = new SqlConnection(sqlconnectionstring);
        con.Open();
        SqlCommand cmdd = new SqlCommand("select tbl_stuinfo.s_no ,s_name ,s_grade,inse_name,dept_name,s_class from tbl_stuinfo,tbl_deptmant where s_name='" + stu_name.Text + "'and s_inse=inse_no and s_dept=dept_no", con);
        SqlDataReader checks_ = cmdd.ExecuteReader();
        if (checks_.Read())
        nonsence2.Text = ds.Tables["mmm"].Rows[0]["s_no"].ToString();
        else
        nonsence2.Text = "没有检测到";
    }

    //直接输入学号
    protected void check_num(object sender, EventArgs e)
    {

        string strQuery = "select tbl_stuinfo.s_no ,s_name ,s_grade,inse_name,dept_name,s_class from tbl_stuinfo,tbl_deptmant where s_no='" + num_enter.Text + "'and s_inse=inse_no and s_dept=dept_no ";
        cmd = new SqlDataAdapter(strQuery, conn);
        cmd.Fill(ds, "ddd");
        GridView1.DataSource = ds.Tables["ddd"].DefaultView;
        GridView1.DataBind();
        nonsence2.Visible = false;
        nonsence.Visible = true;
        string sqlconnectionstring = System.Configuration.ConfigurationManager.AppSettings["dsn"];
        SqlConnection cnn;
        cnn=new SqlConnection( sqlconnectionstring);
        cnn.Open();
        SqlCommand cmmd=new SqlCommand("select tbl_stuinfo.s_no ,s_name ,s_grade,inse_name,dept_name,s_class from tbl_stuinfo,tbl_deptmant where s_no='" + num_enter.Text + "'and s_inse=inse_no and s_dept=dept_no",cnn);
        SqlDataReader checks = cmmd.ExecuteReader();
        if (checks.Read())
            nonsence.Text = ds.Tables["ddd"].Rows[0]["s_no"].ToString();
        else
            nonsence.Text = "没有检测到";

    }

  

}
