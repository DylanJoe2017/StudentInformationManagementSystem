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
public partial class teaAddStuInfo02 : System.Web.UI.Page
{
    public SqlConnection sqlCon;        //创建SqlConnection对象
    public SqlDataAdapter sqlDa;        //创建SqlDataAdapter对象
    public DataSet ds = new DataSet();  //创建并实例化DataSet对象

    protected void Page_Load(object sender, EventArgs e)
    {
        //实例化数据库连接对象，从Web.Config中读出数据库连接字符串信息
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        if (false == IsPostBack)
        {
            drpInstitute_content();
            drpDept_content();
        }
    }
    
    //从表tbl_deptMant中检索数据，用于绑定“学院”下拉列表
    protected void drpInstitute_content()
    {
        //用于查询的SQL语句字符串
        string strSql = "select distinct inse_name from tbl_deptmant";
        //执行查询语句并实例化sqlDa对象
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        //用查询结果填充ds对象，并将填充表命名为"institue"
        sqlDa.Fill(ds, "institue");
        //设置“学院”下拉列表的数据源为ds中institue表
        drpInstitute.DataSource = ds.Tables["institue"].DefaultView;
        //绑定institue表中第一列“学院名称”到“学院”下拉列表
        drpInstitute.DataValueField = ds.Tables["institue"].Columns[0].ColumnName;
        drpInstitute.DataTextField = ds.Tables["institue"].Columns[0].ColumnName;
        
        //执行绑定
        drpInstitute.DataBind();
    }

    //按条件从表tbl_deptMant中查询数据，用于绑定“系别”下拉列表
    protected void drpDept_content()
    {
        //产生用于查询的SQL语句字符串，查询的条件是已经显示的“学院名称”
        string strSql = "select dept_name from tbl_deptmant where inse_name='" + drpInstitute.Text + "'";
        //执行查询语句并实例话sqlDa对象,
        sqlDa = new SqlDataAdapter(strSql, sqlCon);
        //用查询结果填充ds对象，并将填充表命名为"department"
        sqlDa.Fill(ds, "department");
        //设置“系别”下拉列表的数据源为ds中department表
        drpDept.DataSource = ds.Tables["department"].DefaultView;
        //绑定department表中第一列“系别名称”到“系别”下拉列表
        drpDept.DataValueField = ds.Tables["department"].Columns[0].ColumnName;
        drpDept.DataTextField = ds.Tables["department"].Columns[0].ColumnName;
        //执行绑定
        drpDept.DataBind();
    }

    //保存新添加的“学生基本信息”
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlCommand sqlCom;      //创建SqlCommand对象
        SqlDataReader sqlDr;    //创建SqlDataReader对象
        
        //以下字符串变量用于获得“学生基本信息”的各项内容
        string strSql;
        string strSgender;
        string strSbirth;
        string strSparty;
        string strSgrade;
        string strSinse;
        string strSdept;
        string strSclass;
        

        strSgender = rablistSgender.SelectedItem.Text;  //获得“性别”信息
        strSparty = drpSparty.SelectedItem.Text;//获得“政治面貌”信息
        strSgrade = drpGrade.SelectedItem.Text;//获得“年级”信息

        strSinse = drpInstitute.SelectedItem.Text;//获得“学院名称”信息
        
        //根据“学院名称”查找“学院代号”
        strSql = "select * from tbl_deptmant where inse_name='" + strSinse + "'";
        sqlCon.Open();                //打开数据库连接
        sqlCom = new SqlCommand(strSql, sqlCon);     //执行查询语句
        sqlDr = sqlCom.ExecuteReader();                 //实例化SqlDataReader类的sqlDr对象
        if (sqlDr.Read()) strSinse = sqlDr["inse_no"].ToString();  //获得“学院代号”信息，如果能够找到的话
        sqlCon.Close();   //关闭数据库连接

        //根据“系别名称”查找“系别代号”
        strSdept = drpDept.SelectedItem.Text;  
        strSql = "select * from tbl_deptmant where dept_name='" + strSdept + "'";
        sqlCon.Open();
        sqlCom = new SqlCommand(strSql, sqlCon);
        sqlDr = sqlCom.ExecuteReader();
        if (sqlDr.Read()) strSdept = sqlDr["dept_no"].ToString(); //获得“系别代号”信息，如果能够找到的话
        sqlCon.Close();

        //获得“出生日期”信息
        strSbirth = Request.Form["selYear"] + "-" + Request.Form["selMonth"] + "-" + Request.Form["selDay"];
     
        strSclass = drpClass.SelectedItem.Text;   //获得“班级”信息

        //构造向数据表中插入新记录的动态SQL语句字符串
        strSql = "insert into tbl_stuinfo(s_no,s_name,s_gender,s_birthday,s_address,s_party,s_grade,s_inse,s_dept,s_class,s_in,s_out,s_pw) values('" + 
                    txtSno.Text + "','" + txtSname.Text + "','" + 
                    strSgender + "','" + strSbirth + "','" + 
                    txtSaddress.Text + "','" + strSparty + "','" + 
                    strSgrade + "','" + strSinse + "','" + 
                    strSdept + "','" + strSclass + "','" +
                    txtSin.Text + "','" + txtSout.Text + "','"+ txtSno.Text  + "')";
        sqlCon.Open();
        sqlCom = new SqlCommand(strSql, sqlCon);
        sqlCom.ExecuteNonQuery();    //执行插入操作
        sqlCon.Close();
        lblMessage.Text = "添加成功！您可以继续添加";   //在窗体中显示添加成功提示信息
    }
    
    //取消当前的添加操作
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtSno.Text = "";
        txtSname.Text = "";
        txtSaddress.Text = "";

    }
    
    //根据“学院”下拉列表选择项，更新“系别”下拉列表内容
    protected void drpInstitute_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpDept_content();
    }

    //返回上一级学生基本信息管理页面
    protected void lbnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("teaManageStuInfo02.aspx");
    }
    protected void drpDept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
