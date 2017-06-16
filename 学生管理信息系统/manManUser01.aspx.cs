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

public partial class manManUser01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)    //用户合法性检查
            Response.Redirect("login.aspx");
        else
        {
            string strUid = Session["uid"].ToString();
            check cls = new check();
            bool bPermit = cls.getPermit(strUid, "06");
            if (!bPermit)
                Response.Redirect("nonPermit.aspx");
        }
    }
    protected void gdvUserInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strIndex = e.Values["U_id"].ToString();   //获取删除记录所在行用户帐号信息
        SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
        sqlCon.Open();
        SqlCommand sqlComDel = new SqlCommand();
        sqlComDel.Connection = sqlCon;
        sqlComDel.CommandText = "delete from tbl_LimitsMant where U_id='" + strIndex + "'";  //按用户帐号U_id删除tbl_LimitsMant表中关联的记录
        sqlComDel.ExecuteNonQuery();
        lblMess.Text = "用户信息和该用户操作权限信息已全部删除成功 ！";   //显示完成后的结果
        sqlCon.Close();
        pnlNew.Visible = false;
        lbnInsUser.Text = "添加新用户";
        txtUid.Text = "";
        txtUname.Text = "";
    }
    protected void lbnInsUser_Click(object sender, EventArgs e)
    {
        
            if (!this.pnlNew.Visible)   //判断此时面板的显示状态，确定按钮的不同显示
            {                               //当面板不可见时
                pnlNew.Visible = true;      //设置面板显示
                lbnInsUser.Text = "添加";    //改变“添加新用户”按钮文本为“添加”
                lbnCancel.Visible = true;    //显示“取消”按钮
                lblMess.Text = "";
            }
            else if (IsValid)
            {       //当面板可见（已经点击“添加新用户”按钮）时
                string strUid = txtUid.Text;
                string strUname = txtUname.Text;
                SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
            sqlCon.Open();
                SqlCommand sqlCom = new SqlCommand();
                sqlCom.Connection = sqlCon;
                sqlCom.CommandText = "Select * from tbl_UserInfo where U_id='" + strUid + "'";
                SqlDataReader sqlDr = sqlCom.ExecuteReader();    //查询是否存在相同帐号的用户
                if (sqlDr.Read())
                {
                    lblMess.Text = "<font color=red>该用户帐号已存在！\n请选用其它帐号！</font>";
                    lbnCancel.Visible = true;
                    sqlDr.Close();
                }
                else      //不存在相同帐号的用户信息时
                {
                    sqlDr.Close();
                    sqlCom.CommandText = "Insert into tbl_UserInfo(U_id,U_name,U_password) values('" + strUid + "','" + strUname + "','" + strUid + "')";
                    sqlCom.ExecuteNonQuery();     //在tbl_UserInfo表中，添加该用户信息
                    string[] strLimits = new string[] { "管理学生基本信息", "管理学生履历信息", "管理学生成绩信息", "统计功能", "学生查询功能", "用户基本信息管理", "用户操作权限管理", "院系代码维护", "课程信息维护" };  //权限信息数组初始化
                    for (int i = 1; i <= 9; i++)
                    {
                        sqlCom.CommandText = "Insert into tbl_LimitsMant(U_id,L_name,L_no,L_Permit) values('" + strUid + "','" + strLimits[i - 1] + "','0" + i.ToString() + "',0)";
                        sqlCom.ExecuteNonQuery();   //在tbl_LimitsMant表中，分别添加该用户权限信息的9条记录
                    }
                    sqlCon.Close();

                    Response.Redirect("manManUser01.aspx");     //添加完成后，重新打开该页面查看
                }
            }
        }
    protected void lbnCancel_Click(object sender, EventArgs e)
    {
        
        pnlNew.Visible = false;    //设置面板不可见
        lbnCancel.Visible = false;    //设置“取消”链接按钮不可见
        txtUid.Text = "";             //清空已填写的用户帐号、姓名和密码信息
        txtUname.Text = "";
        lbnInsUser.Text = "添加新用户";   //改变“添加”按钮文本为“添加新用户”
        lblMess.Text = "";
    }

    protected void gdvUserInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (e.NewValues[0]==null | e.NewValues [1]==null)
        {   //所在编辑记录行中，填写用户姓名或用户密码的TextBox为空时
            lblMess.Text = "<font color=red>用户名或密码不能为空！</font>";
            e.Cancel = true;   //取消Update动作
        }
        else
        {
            string strNewUname = e.NewValues[0].ToString();  //获取文本框中用户姓名和用户密码信息
            string strNewPwd = e.NewValues[1].ToString();
            if (strNewUname.Length > 5)
            {   //用户名长度大于5个汉字时
                lblMess.Text = "<font color=red>用户姓名不能超过5个汉字！</font>";
                e.Cancel = true;   //
            }
            if (strNewPwd.Length > 10)
            {   //用户密码长度大于10个字符时
                lblMess.Text = "<font color=red>用户密码不能超过10个字符！</font>";
                e.Cancel = true;   //取消Update动作
            }
         }
    }
    protected void gdvUserInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lblMess.Text = "";    //取消编辑时，清空标签文本
    }
    protected void gdvUserInfo_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        lblMess.Text = "用户信息修改成功";   //用户信息修改成功时，显示反馈信息
    }
    protected void gdvUserInfo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lblMess.Text = "";               //编辑行时，清空标签文本
        pnlNew.Visible = false;          //编辑行时，添加新用户面板隐藏
        lbnCancel.Visible = false;       //编辑行时，取消按钮隐藏
        lbnInsUser.Text = "添加新用户";  //编辑行时，btnInsUser按钮文本变为“添加新用户”

    }
    protected void ctvUid_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string strUid=args.Value;
        if (strUid.Length != 10)
        {
            args.IsValid = false;
            lblMess.Text = "<font color=red>用户帐号要求是10位数字！</font>";
            lbnCancel.Visible = true;
        }
        else
            args.IsValid = true;
    }
    protected void ctvUname_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string strUname = args.Value;
        if (strUname.Length > 5)
        {
            args.IsValid = false;
            lblMess.Text = "<font color=red>用户姓名不能超过5个汉字！</font>";
            lbnCancel.Visible = true;
        }
        else
            args.IsValid = true;
    }
}
