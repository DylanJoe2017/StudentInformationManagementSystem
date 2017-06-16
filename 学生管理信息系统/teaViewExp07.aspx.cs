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

public partial class add : System.Web.UI.Page
{
    public SqlConnection conn;
    public SqlDataAdapter cmd;
    public DataSet ds = new DataSet(); 
    protected void Page_Load(object sender, EventArgs e)
    {

        string id = Request["clid"].ToString();
        conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        string strSql = "select tbl_stuexpe.s_no ,e_begindate,e_enddate,e_content,e_type,s_name from tbl_stuexpe ,tbl_stuinfo where tbl_stuexpe.id LIKE '%"+ id +"%' and tbl_stuexpe.s_no=tbl_stuinfo.s_no";
        cmd = new SqlDataAdapter(strSql, conn);
        cmd.Fill(ds, "stuinfo");

        if (!IsPostBack)
        {

            init_content();
        }
    }
    protected void init_content()
    {

        Label1.Text = ds.Tables["stuinfo"].Rows[0]["s_name"].ToString();
        Label2.Text = ds.Tables["stuinfo"].Rows[0]["s_no"].ToString();
        Label3.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["e_begindate"]).ToString("d");
        Label4.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["e_enddate"]).ToString("d");
        Label5.Text = ds.Tables["stuinfo"].Rows[0]["e_content"].ToString();
        Label6.Text = ds.Tables["stuinfo"].Rows[0]["e_type"].ToString();
        Label7.Text = ds.Tables["stuinfo"].Rows[0]["s_name"].ToString();
    }

    


   
}
