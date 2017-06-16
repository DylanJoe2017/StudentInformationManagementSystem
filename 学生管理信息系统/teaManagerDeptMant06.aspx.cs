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
    private SqlConnection sqlCon;
    private SqlCommand sqlCom;
    private SqlDataAdapter sqlDaDept,sqlDaInse;
    private DataSet ds=new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)    //用户合法性检查
            Response.Redirect("login.aspx");
        else
        {
            string strUid = Session["uid"].ToString();
            check cls = new check();
            bool bPermit = cls.getPermit(strUid, "08");
            if (!bPermit)
                Response.Redirect("nonPermit.aspx");
        }

        sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        if (!IsPostBack)
        {
            this.BindInse();
            this.BindDept();
        }
        if (lstDept.Rows == 1)
        {
            btnDeleteDept.OnClientClick = "return confirm('你确认删除该专业吗?'删除后该学院信息也将被删除！)";
        }
    }

    /*
     *修改时间：2008.4.16 
     *功    能：将学院信息绑定到lstInse(ListBox)上
     * 
     */
    public void BindInse()
    {
        string sql = "select distinct inse_name,inse_no from tbl_deptmant";           //从数据库中查询学院编号和名称去除重复的
        sqlDaInse = new SqlDataAdapter(sql, sqlCon);
        sqlDaInse.Fill(ds, "Inse");
        lstInse.DataSource = ds.Tables["Inse"];//将数据集表绑定到lstInse(ListBox)上
        lstInse.DataTextField = ds.Tables["Inse"].Columns["Inse_name"].ToString();　　//将表中学院名称列绑定到显示文本内容
        lstInse.DataValueField = ds.Tables["Inse"].Columns["Inse_no"].ToString();　　 //将表中学院编号列绑定到列表项提供的值
        lstInse.DataBind();                                                           //调用绑定方法
    }
    /*
     *时间： 
     *功能：将专业信息绑定到lstDept(ListBox)上
     * 
     * 
     */
    public void BindDept() {
        string strSql = "select * from tbl_deptmant where Inse_no='" + lstInse.SelectedValue + "'";//从数据库中查询专业信息按照从lstInse上选择的学院信息
        sqlDaDept = new SqlDataAdapter(strSql, sqlCon);//实例话数据适配器
        sqlDaDept.Fill(ds, "deptmant");
        this.lstDept.DataSource = ds.Tables["deptmant"];//将数据集表绑定到lstDept(ListBox)上
        lstDept.DataTextField = ds.Tables["deptmant"].Columns["Dept_name"].ToString();//将表中专业名称列绑定到显示文本内容
        lstDept.DataValueField = ds.Tables["deptmant"].Columns["Id"].ToString();//将表id列绑定到列表项提供的值
        lstDept.DataBind();
        
    }
    protected void btnDeleteInse_Click(object sender, EventArgs e)
    {
        sqlCon.Open();
        sqlCom = sqlCon.CreateCommand();//通过接口实例话SqlCommand对象
        sqlCom.CommandText = "delete from  tbl_deptmant where Inse_no='" + lstInse.SelectedValue + " '";//删除的SQL语句按照在lstInse所选中的学院的编号
        sqlCom.ExecuteNonQuery();//执行SQL语句
        lstDept.ClearSelection();
        sqlCon.Close();
        this.BindInse();//将学院信息重新绑定
        this.BindDept();//将专业信息重新绑定
    }
    protected void btnInsertInse_Click(object sender, EventArgs e)
    {
        Response.Redirect("teaAddInse06.aspx");//跳转到添加学院页面
    }
    protected void btnDeleteDept_Click(object sender, EventArgs e)
    {
        sqlCon.Open();
        sqlCom = sqlCon.CreateCommand();
        sqlCom.CommandText = "delete from  tbl_deptmant where (Id=" + int.Parse(lstDept.SelectedValue) + ")";//按照在lstDept所选中项的值（id）删除该项
        sqlCom.ExecuteNonQuery();
        sqlCon.Close();
        this.BindDept();
        this.BindInse();
    }
    protected void btnInsertDept_Click(object sender, EventArgs e)
    {


        String strInseName = lstInse.SelectedItem.Text;   //获得列表框中所选院系名称
        String strInseNo = lstInse.SelectedValue;         //获得列表框中所选院系编号
        //使用QueryString方法传递参数
        string url;                                       //包含被传递参数的URL字符串
        url = "teaAddDept06.aspx?Inse_Name=" + strInseName + "&Inse_No=" + strInseNo;
        Response.Redirect(url);                           //跳转到“添加系别”页面
    }
    protected void btnUpdateInse_Click(object sender, EventArgs e)
    {
        Session.Add("updateInse", lstInse.SelectedValue);//将要更新的学院编号存储在Session中
        Response.Redirect("teaUpdateInse06.aspx");
       
    }
    protected void btnUpdateDept_Click(object sender, EventArgs e)
    {
        Session.Add("updateDept", int.Parse(this.lstDept.SelectedValue));//将要更新的专业Id存储在Session中
        Response.Redirect("teaUpdateDept06.aspx");
    }
    protected void lstInse_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.BindDept();//在lstInse中选项改变再将lstDept重新绑定一次
    }
}         
        
