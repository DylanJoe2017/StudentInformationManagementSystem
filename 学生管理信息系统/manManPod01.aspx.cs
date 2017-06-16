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

public partial class manManPod01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)    //用户合法性检查
            Response.Redirect("login.aspx");
        else
        {
            string strUid = Session["uid"].ToString();
            check cls = new check();  //自定义权限检查类
            bool bPermit = cls.getPermit(strUid, "07");   //判断当前帐号是否具有操作该模块的权限
            if (!bPermit)             //Permit为False，表示当前帐号无此权限，并重定向页面
                Response.Redirect("nonPermit.aspx");
        }

        if (!IsPostBack)
        {
            SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
            sqlCon.Open();
            SqlCommand sqlComGet = new SqlCommand();
            sqlComGet.Connection = sqlCon;
            sqlComGet.CommandText = "select U_id from tbl_UserInfo";
            SqlDataReader sqlDr = sqlComGet.ExecuteReader();      //创建并实例化SqlDataReader对象
            int i = 0;
            string[] strUid = new string[10];   //定义用户帐号数组
            strUid[0] = "请选择";               //用户帐号数组的第0个元素为提示信息
            drpUid.Items.Add(new ListItem(strUid[0], strUid[0])); //初始化drpUid下拉列表
            while (sqlDr.Read())                //填充“用户帐号”下拉列表
            {
                i = i + 1;
                strUid[i] = sqlDr.GetString(0); //从数据库中获得下一个用户帐号
                drpUid.Items.Add(new ListItem(strUid[i], strUid[i]));
            }
            sqlDr.Close();
            sqlCon.Close();
            pnlUname.Enabled = false;          //使Panel不可用
            pnlLimits.Enabled = false;          
        }

    }

    protected void drpUid_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strUid = drpUid.SelectedValue;   //获取用户所选项的值
        btnCancel.Visible = false;   //设置取消按钮不可见
        btnEdit.Text = "编 辑";       //设置btnEdit按钮文本为“编 辑”
        if (strUid != "请选择")      //判断用户所选项不是“请选择”
        {
            btnEdit.Visible = true;   //显示编辑按钮
            pnlUname.Enabled = true;  //设置面板可操作
            pnlLimits.Enabled = true;
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["dsn"];
            sqlCon.Open();
            SqlCommand sqlComGet = new SqlCommand();   //创建命令对象
            sqlComGet.Connection = sqlCon;
            //按用户账号，查询满足的用户信息记录
            sqlComGet.CommandText = "select * from tbl_UserInfo where U_id='" + strUid + "'";
            //使用DataReader对象来存储返回的查询结果
            SqlDataReader sqlDr1 = sqlComGet.ExecuteReader();
            if (sqlDr1.Read())   //按行获取DataReader对象中存放数据
            {
                lblUname.Text = sqlDr1.GetString(2);   //获取U_name用户名字段值
            }
            sqlDr1.Close();                            //关闭DataReader对象
            //再次设置命令文本，按用户账号，查询满足的操作权限设置记录
            sqlComGet.CommandText = "select L_permit from tbl_LimitsMant where U_id='" + strUid + "'";
            //使用DataReader对象来存储返回的查询结果
            SqlDataReader sqlDr2 = sqlComGet.ExecuteReader();
            sqlDr2.Read();      //按行获取DataReader对象中存放数据
            chk1.Checked = sqlDr2.GetBoolean(0);  //依次获取和设置9个模块操作权限的设置（布尔型）
            chk1.Enabled = false;                 //设置完毕后，置复选框为不可用（下同）
            sqlDr2.Read();
            chk2.Checked = sqlDr2.GetBoolean(0);
            chk2.Enabled = false;
            sqlDr2.Read();
            chk3.Checked = sqlDr2.GetBoolean(0);
            chk3.Enabled = false;
            sqlDr2.Read();
            chk4.Checked = sqlDr2.GetBoolean(0);
            chk4.Enabled = false;
            sqlDr2.Read();
            chk5.Checked = sqlDr2.GetBoolean(0);
            chk5.Enabled = false;
            sqlDr2.Read();
            chk6.Checked = sqlDr2.GetBoolean(0);
            chk6.Enabled = false;
            sqlDr2.Read();
            chk7.Checked = sqlDr2.GetBoolean(0);
            chk7.Enabled = false;
            sqlDr2.Read();
            chk8.Checked = sqlDr2.GetBoolean(0);
            chk8.Enabled = false;
            sqlDr2.Read();
            chk9.Checked = sqlDr2.GetBoolean(0);
            chk9.Enabled = false;
            sqlDr2.Close();         //关闭DataReader对象
            sqlCon.Close();         //关闭数据库连接
        }
        else   //当前用户帐号还没有被分配权限，则置全部复选框为false
        {
            chk1.Checked = false;
            chk2.Checked = false;
            chk3.Checked = false;
            chk4.Checked = false;
            chk5.Checked = false;
            chk6.Checked = false;
            chk7.Checked = false;
            chk8.Checked = false;
            chk9.Checked = false;
            pnlLimits.Enabled = false;
            pnlUname.Enabled = false;
            btnEdit.Visible = false;     //“编辑”按钮不可见
            lblUname.Text = "";           
            
        }
        
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        bool[] bolChkOld = new bool[9]; //创建bool类型的数组，用于存放编辑之前的9个复选框的值
        bool[] bolChkNew = new bool[9]; //创建bool类型的数组，用于存放修改后的9个复选框的值
        //如果取消按钮不可见（btnEdit为编辑按钮），将面板pnlLimits设置为编辑状态
        if (btnCancel.Visible == false) 
        {
            btnEdit.Text = "保 存";
            btnCancel.Visible = true;  //“取消操作”按钮可见，可用于取消所做修改
            chk1.Enabled = true;       //设置面板pnlLimits中9个复选框可操作（修改）
            chk2.Enabled = true;
            chk3.Enabled = true;
            chk4.Enabled = true;
            chk5.Enabled = true;
            chk6.Enabled = true;
            chk7.Enabled = true;
            chk8.Enabled = true;
            chk9.Enabled = true;
            bolChkOld[0] = chk1.Checked;   //获取9个复选框的权限设置值（bool）
            bolChkOld[1] = chk2.Checked;
            bolChkOld[2] = chk3.Checked;
            bolChkOld[3] = chk4.Checked;
            bolChkOld[4] = chk5.Checked;
            bolChkOld[5] = chk6.Checked;
            bolChkOld[6] = chk7.Checked;
            bolChkOld[7] = chk8.Checked;
            bolChkOld[8] = chk9.Checked;
        }
        else               //取消按钮可见时，代表当前处于编辑状态，保存操作权限的修改
        {
            btnCancel.Visible = false;   //“取消”按钮隐藏，保存修改后，
            btnEdit.Text = "编 辑";      //btnEdit按钮文本设为“编 辑”
            bolChkNew[0] = chk1.Checked; //获取9个复选框的权限修改值
            bolChkNew[1] = chk2.Checked;
            bolChkNew[2] = chk3.Checked;
            bolChkNew[3] = chk4.Checked;
            bolChkNew[4] = chk5.Checked;
            bolChkNew[5] = chk6.Checked;
            bolChkNew[6] = chk7.Checked;
            bolChkNew[7] = chk8.Checked;
            bolChkNew[8] = chk9.Checked;
            SqlConnection sqlCon = new SqlConnection();
            sqlCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["dsn"];
            sqlCon.Open();
            SqlCommand sqlComSet = new SqlCommand();  //创建命令对象，用于更新数据
            sqlComSet.Connection = sqlCon;
            for (int i = 1; i <= 9; i++)
            {
                if (bolChkNew[i - 1] != bolChkOld[i - 1])   //依次比较操作权限原来设置和新的设置
                {                            //不相同时，才做更新操作，相同则没有更新必要
                    string strSet = "0";      //设置bit字段类型的初始值
                    if (bolChkNew[i - 1] == true) strSet = "1";  //1代表True，0代表False
                    else strSet = "0";
                    sqlComSet.CommandText = "Update tbl_LimitsMant set L_permit=" + strSet + " where U_id='" + drpUid.SelectedValue + "' and L_no='0" + i.ToString () + "'";
                    sqlComSet.ExecuteNonQuery();  //执行操作权限的更新
                }
            }
            sqlCon.Close();           //关闭连接
            chk1.Enabled = false;     //清空9个复选框原有的值
            chk2.Enabled = false;
            chk3.Enabled = false;
            chk4.Enabled = false;
            chk5.Enabled = false;
            chk6.Enabled = false;
            chk7.Enabled = false;
            chk8.Enabled = false;
            chk9.Enabled = false;
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        SqlConnection sqlCon = new SqlConnection();
        sqlCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["dsn"];
        sqlCon.Open();
        SqlCommand sqlComGet = new SqlCommand();    //创建命令对象
        sqlComGet.Connection = sqlCon;
        //按用户账号查询所有对应的操作权限设置记录
        sqlComGet.CommandText = "select L_permit from tbl_LimitsMant where U_id='" + drpUid .SelectedValue + "'";
        //使用DataReade对象获取查询返回结果
        SqlDataReader sqlDr = sqlComGet.ExecuteReader();
        sqlDr.Read();             //按行读取数据
        //设置复选框的值，来自数据库表中原来的设置值，清除了用户操作所作的修改值
        chk1.Checked = sqlDr.GetBoolean(0);    
        chk1.Enabled = false;     //设置复选框不可操作              
        sqlDr.Read();
        chk2.Checked = sqlDr.GetBoolean(0);
        chk2.Enabled = false;
        sqlDr.Read();
        chk3.Checked = sqlDr.GetBoolean(0);
        chk3.Enabled = false;
        sqlDr.Read();
        chk4.Checked = sqlDr.GetBoolean(0);
        chk4.Enabled = false;
        sqlDr.Read();
        chk5.Checked = sqlDr.GetBoolean(0);
        chk5.Enabled = false;
        sqlDr.Read();
        chk6.Checked = sqlDr.GetBoolean(0);
        chk6.Enabled = false;
        sqlDr.Read();
        chk7.Checked = sqlDr.GetBoolean(0);
        chk7.Enabled = false;
        sqlDr.Read();
        chk8.Checked = sqlDr.GetBoolean(0);
        chk8.Enabled = false;
        sqlDr.Read();
        chk9.Checked = sqlDr.GetBoolean(0);
        chk9.Enabled = false;
        sqlDr.Close();     //DataReader对象关闭
        sqlCon.Close();    //连接对象关闭
        btnEdit.Text = "编 辑";      //设置btnEdit按钮文本为“编 辑”
        btnCancel.Visible = false;   //取消按钮不可见，页面进入不可编辑状态
    }
}
