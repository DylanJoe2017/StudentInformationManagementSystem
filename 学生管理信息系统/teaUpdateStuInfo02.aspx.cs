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
public partial class teaUpdateStuInfo : System.Web.UI.Page
{
    public SqlConnection sqlCon;   //创建SqlConnection对象
    public SqlDataAdapter sqlDa;//创建SqlDataAdapter对象
    public DataSet ds = new DataSet();//创建并实例化DataSet对象
   
    protected void drpInstitute_content()
    {

        string strSql = "select distinct inse_name from tbl_deptmant";
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        sqlDa.Fill(ds, "institue");
        drpInstitute.DataSource = ds.Tables["institue"].DefaultView;
        drpInstitute.DataValueField = ds.Tables["institue"].Columns[0].ColumnName;
        drpInstitute.DataTextField = ds.Tables["institue"].Columns[0].ColumnName;
        drpInstitute.DataBind();
    }

    protected void drpDept_content()
    {

        string strSql = "select dept_name from tbl_deptmant where inse_name='" + drpInstitute.Text + "'";
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        sqlDa.Fill(ds, "department");
        drpDept.DataSource = ds.Tables["department"].DefaultView;
        drpDept.DataValueField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataTextField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataBind();
    }

    //初始化窗体显示内容
    protected void init_content()
    {
        //从stuinfo表中获得“学号”和“姓名”信息
        lblsno.Text = ds.Tables["stuinfo"].Rows[0]["s_no"].ToString();
        txtSname.Text = ds.Tables["stuinfo"].Rows[0]["s_name"].ToString();

        //从stuinfo表中获得“性别”信息，并在窗体中显示
        if (ds.Tables["stuinfo"].Rows[0]["s_gender"].ToString() == "男")
            rablistSgender.SelectedValue = "男";
        else
            rablistSgender.SelectedValue = "女";

        //获得并显示“出生日期”信息
        txtSbirthday.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["s_birthday"]).ToString("d");
        //获得并显示“籍贯”信息
        txtSaddress.Text = ds.Tables["stuinfo"].Rows[0]["s_address"].ToString();

        //获得并显示“政治面貌”信息
        drpSparty.SelectedValue = ds.Tables["stuinfo"].Rows[0]["s_party"].ToString();
        //获得并显示“年级”信息
        drpGrade.SelectedValue = ds.Tables["stuinfo"].Rows[0]["s_grade"].ToString();
        
        drpInstitute_content();     //初始化“学院”下拉列表
        //获得并显示“学院”信息
        drpInstitute.SelectedValue = ds.Tables["stuinfo"].Rows[0]["Inse_name"].ToString();
        
        drpDept_content();    //初始化“系别”下拉列表
        //获得并显示“系别”信息
        drpDept.SelectedValue = ds.Tables["stuinfo"].Rows[0]["dept_name"].ToString();
        //获得并显示“年级”信息
        drpClass.SelectedValue = ds.Tables["stuinfo"].Rows[0]["s_class"].ToString();
        //获得并显示“入学日期”信息
        txtSin.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["s_in"]).ToString("d");
        //获得并显示“毕业日期”信息
        txtSout.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["s_out"]).ToString("d");
    }

    //将学生基本信息在窗体上显示出来
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["sno"] = "200704010021";　   //初始化Session变量，不需先运行登录页面

        //实例化数据库连接对象，从Web.Config中读出数据库连接字符串信息
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        //从Session变量"sno"中获得被传递过来的学号信息
        string strsno = Session["sno"].ToString();
        //根据学号构造用于查询的SQL语句字符串
        string strSql = "select s_no ,s_name ,s_gender,s_birthday,s_party,s_address,s_grade,inse_name,dept_name,s_class,s_pic,s_in,s_out from tbl_stuinfo,tbl_deptmant where s_no='" + strsno + "'and  s_inse=inse_no and s_dept=dept_no";
        //执行查询语句并实例化sqlDa对象
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        //用查询结果填充ds对象，并将填充表命名为"stuinfo"
        sqlDa.Fill(ds, "stuinfo");

        //如果是第一次加载窗体则调用init_content()方法
        if (!IsPostBack)
        {
            init_content();
        }


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        init_content();
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        string strsno = Session["sno"].ToString();    //从Session中得到当前修改的学号
        SqlCommand sqlCom;      //创建SqlCommand对象
        SqlDataReader sqlDr;//创建SqlDataReader对象
        string strSql;//SQL语句字符串变量

        string strSgender = rablistSgender.SelectedItem.Text;//性别
        string strSparty = drpSparty.SelectedItem.Text; ;//政治面貌
        string strSgrade = drpGrade.SelectedItem.Text;//年级
        string strSinse = drpInstitute.SelectedItem.Text;//先保存“学院名称”，在保存“学院代号”
        string strSdept = drpDept.SelectedItem.Text;//先保存“系别名称”，在保存“系别代号”
        string strSclass = drpClass.SelectedItem.Text; //班级

        //sqlCon.Open();  //打开数据库连接
        /*
         * 根据学院名称获得学院代号
         */
        strSql = "select distinct inse_no from tbl_deptmant where inse_name='" + strSinse + "'";
        sqlCon.Open();
        sqlCom = new SqlCommand(strSql, sqlCon);
        sqlDr = sqlCom.ExecuteReader();
        if (sqlDr.Read()) strSinse = sqlDr["inse_no"].ToString();
        sqlCon.Close();

        /*
         * 根据系别名称获得系别代号
         */        
        strSql = "select dept_no from tbl_deptmant where dept_name='" + strSdept + "'";
        sqlCon.Open();
        sqlCom = new SqlCommand(strSql, sqlCon);
        sqlDr.Close();
        sqlDr = sqlCom.ExecuteReader();
        if (sqlDr.Read()) strSdept = sqlDr["dept_no"].ToString();
        sqlCon.Close();

        //用于更新修改后的学生基本信息的SQL语句字符串
        strSql = "update tbl_stuinfo set s_name='" + txtSname.Text + "',s_gender='" + strSgender + 
            "',s_birthday='" + txtSbirthday.Text + "',s_address='" + txtSaddress.Text + 
            "',s_party='" + strSparty + "',s_grade='" + strSgrade + "',s_inse='" + strSinse + 
            "',s_dept='" + strSdept + "',s_class='" + strSclass + "',s_in='" + txtSin.Text + 
            "',s_out='" + txtSout.Text + "' where s_no='" + Session["sno"].ToString()+"'";
        sqlCon.Open();
        sqlCom = new SqlCommand(strSql, sqlCon);//创建并实例话sqlCom对象，用于执行更新操作
        sqlCom.ExecuteNonQuery();//更新修改后的“学生基本信息”
        sqlCon.Close();//关闭数据库
        lblMessage.Text = "修改成功！";   //显示“修改成功”提示信息
    }
    protected void lbnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("teaManageStuInfo02.aspx");
    }
    protected void drpInstitute_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpDept_content();
    }
}
