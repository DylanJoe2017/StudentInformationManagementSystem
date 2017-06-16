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

/*
 *版权信息：1D0A269EE660B17940D7338812A2A6E4 
 * 
 */
public partial class _Default : System.Web.UI.Page 
{
    public SqlConnection sqlCon;
    public SqlDataAdapter sqlDa;
    public DataSet ds=new DataSet();

    protected void drpInstitute_content()//获取学院名称
    {
        string strSql = "select distinct inse_name from tbl_deptmant";
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        sqlDa.Fill(ds, "institue");
        drpInstitute.DataSource = ds.Tables["institue"].DefaultView;

        drpInstitute.DataValueField = ds.Tables["institue"].Columns[0].ColumnName;
        drpInstitute.DataTextField = ds.Tables["institue"].Columns[0].ColumnName;

        drpInstitute.DataBind();
    }

    protected void drpDept_content()//获取系名称
    {
        if (IsPostBack)//如果页面是回发需要清除前一次的内容后重新绑定
        {
            drpDept.Items.Clear();
            drpDept.Items.Add("--全部--");
        }
        string strSql = "select dept_name from tbl_deptmant where inse_name='" + drpInstitute.Text + "'";
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        sqlDa.Fill(ds, "department");
        drpDept.DataSource = ds.Tables["department"].DefaultView;
        drpDept.DataValueField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataTextField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataBind();
        
    }
    protected void BindData()//为Gridiew绑定数据
    {
        string strQuery = "select * from tbl_stuinfo,tbl_deptmant  where s_inse=inse_no and s_dept=dept_no ";
        if (drpGrade.SelectedIndex != 0)
            strQuery += "and s_grade='" + drpGrade.Text + "'";
        if (drpInstitute.SelectedIndex != 0)
            strQuery += "and  inse_name='" + drpInstitute.Text + "'";
        if (drpDept.SelectedIndex != 0)
            strQuery += "and dept_name='" + drpDept.Text + "'";
        if (drpClass.SelectedIndex != 0)
            strQuery += "and s_class='" + drpClass.Text + "'";

        sqlDa = new SqlDataAdapter(strQuery, sqlCon);
        sqlDa.Fill(ds, "stuinfo");
        grvStuInfo.DataSource = ds.Tables["stuinfo"].DefaultView;
        grvStuInfo.DataBind();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["uid"] = "1998090001";　
        if (Session["uid"] == null)    //用户合法性检查
            Response.Redirect("login.aspx");
        else
        {
            string strUid = Session["uid"].ToString();
            check cls = new check();
            bool bPermit = cls.getPermit(strUid, "01");
            if (!bPermit)
                Response.Redirect("nonPermit.aspx");
        }
        
        sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        if (!IsPostBack)
        {
            drpInstitute_content();
            drpDept_content();
            BindData();
        }
      
    }

    
    protected void drpInstitute_SelectedIndexChanged(object sender, EventArgs e)
    {
       drpDept_content();//自动回发
    }


    protected void grvStuInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       //动态生成列宽
        if (e.Row.RowType == DataControlRowType.Header)
        {
           TableCellCollection cells = e.Row.Cells;
           cells[0].Width = 50;
           cells[1].Width = 50;
           cells[2].Width = 50;  
           cells[3].Width = 100;
           cells[4].Width = 100;
           cells[5].Width = 50; 
           cells[6].Width = 30;
           cells[7].Width = 30;
           cells[8].Width = 30;
        }      
    }

    protected void lbnInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("teaAddStuInfo02.aspx");//定位到添加页面
    }

    protected void grvStuInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //获得当前被删除行的学号
        string strSno = grvStuInfo.DataKeys[e.RowIndex].Values[1].ToString();//datakeynames必须有一个是主键
        //构造用于执行删除操作的SQL语句字符串
        string strSql = "delete from tbl_stuinfo where s_no='" + strSno + "'";
        sqlCon.Open();               //打开数据库连接
        //创建sqlCom对象，并用strSql变量和sqlCon对象进行实例化
        SqlCommand sqlCom = new SqlCommand(strSql, sqlCon);
        sqlCom.ExecuteNonQuery();   //执行删除操作
        sqlCon.Close();             //关闭数据库连接
        BindData();                 //重新绑定GridView 
    }

    protected void grvStuInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["sno"] = grvStuInfo.SelectedRow.Cells[0].Text;
        Response.Redirect("teaUpdateStuInfo02.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
       BindData();
    }

}
