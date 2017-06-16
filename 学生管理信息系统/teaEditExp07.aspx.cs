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
public partial class add : System.Web.UI.Page
{
    public SqlConnection conn;
    public SqlDataAdapter cmd;
    public DataSet ds = new DataSet(); 


    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request["clid"].ToString();
        conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        string strSql = "select tbl_stuexpe.s_no ,tbl_stuinfo.s_name,e_begindate,e_enddate,e_content,e_type  from tbl_stuexpe,tbl_stuinfo where tbl_stuexpe.id LIKE '%" + id + "%' and tbl_stuexpe.s_no=tbl_stuinfo.s_no";
        cmd = new SqlDataAdapter(strSql, conn);
        cmd.Fill(ds, "stuinfo");

        if (!IsPostBack)
        {

            init_content();
        }
    }

    //设置初始化值
    protected void init_content()
    {
        stu_names.Text = ds.Tables["stuinfo"].Rows[0]["s_name"].ToString();
        txtSname.Text = ds.Tables["stuinfo"].Rows[0]["s_no"].ToString();
        dat_bgain.Text = ds.Tables["stuinfo"].Rows[0]["e_begindate"].ToString();
        dat_end.Text = ds.Tables["stuinfo"].Rows[0]["e_enddate"].ToString();
        exp_content.Text = ds.Tables["stuinfo"].Rows[0]["e_content"].ToString();
        type.SelectedItem.Text = ds.Tables["stuinfo"].Rows[0]["e_type"].ToString();
    }


    
    //修改学生履历信息
    protected void btnOk_Click(object sender, EventArgs e)
    {
        string start_time = dat_bgain.Text;
        string end_time = dat_end.Text;
        string contents = exp_content.Text;
        if (start_time == "" || end_time == "" || contents == "")
        {
            error_image.Visible = true;
            ok_image.Visible = false;
            Label1.Visible = true;
            Label1.Text = "<br />无法提交！可能是部分信息没有填写。请更正后重试！<br />";
        }
        else
        {
            SqlCommand cmda;
            SqlDataReader dra;
            string strSql;

            string strSparty;

            string strSinse;
            string strSdept;

            strSparty = type.SelectedItem.Text;

            string id = Request["clid"].ToString();
            strSql = "SELECT * FROM [tbl_StuExpe]";
            conn.Open();
            cmda = new SqlCommand(strSql, conn);
            dra = cmda.ExecuteReader();
            if (dra.Read()) strSinse = dra["id"].ToString();
            conn.Close();

            strSql = "SELECT * FROM [tbl_StuExpe]";
            conn.Open();
            cmda = new SqlCommand(strSql, conn);
            dra = cmda.ExecuteReader();
            if (dra.Read()) strSdept = dra["id"].ToString();
            conn.Close();

            strSql = "update tbl_stuexpe set e_begindate='" + dat_bgain.Text + "',e_enddate='" + dat_end.Text + "',e_content='" + exp_content.Text + "',e_type='" + strSparty + "' where id LIKE '%" + id + "%'";
            conn.Open();
            cmda = new SqlCommand(strSql, conn);
            cmda.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("default.aspx");
        }
    }


　　//添加为新项
    protected void Bt_new(object sender, EventArgs e)
    {
        string start_time = dat_bgain.Text;
        string end_time = dat_end.Text;
        string contents = exp_content.Text;
        if (start_time == "" || end_time == "" || contents == "")
        {
            error_image.Visible = true;
            ok_image.Visible = false;
            Label1.Visible = true;
            Label1.Text = "<br />无法提交！可能是部分信息没有填写。请更正后重试！<br />";
        }
        else
        {
            SqlCommand cmda;
            SqlDataReader dra;
            string strSql;
            string strSinse;
            string strSdept;
            string strSparty;
            strSparty = type.SelectedItem.Text;
            strSql = "SELECT * FROM [tbl_StuExpe]";
            conn.Open();
            cmda = new SqlCommand(strSql, conn);
            dra = cmda.ExecuteReader();
            if (dra.Read()) strSinse = dra["S_no"].ToString();
            conn.Close();

            strSql = "SELECT * FROM [tbl_StuExpe]";
            conn.Open();
            cmda = new SqlCommand(strSql, conn);
            dra = cmda.ExecuteReader();
            if (dra.Read()) strSdept = dra["S_no"].ToString();
            conn.Close();


            strSql = "INSERT INTO [tbl_StuExpe] ([S_no], [E_beginDate], [E_endDate], [E_content], [E_type]) values('" + txtSname.Text + "','" + dat_bgain.Text + "','" + dat_end.Text + "','" + exp_content.Text + "','" + strSparty + "')";
            conn.Open();
            cmda = new SqlCommand(strSql, conn);
            cmda.ExecuteNonQuery();
            conn.Close();
            Label1.Visible = true;
            error_image.Visible = false;
            ok_image.Visible = true;
            Label1.Text = "<br />添加成功！您可以继续添加。<br />";
        }
    }






   
}
