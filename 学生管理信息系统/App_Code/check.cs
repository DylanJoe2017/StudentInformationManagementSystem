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

/// <summary>
/// check 的摘要说明
/// </summary>
public class check
{
    public bool getPermit(string uid,string lno)
    /******************************************/
    /*
    Abstract: 该函数用于获取用户对于S-MIS系统的某个模块的操作权限
    Author: 孙胜涛
    Module Name: bool getPermit(string,string)
    Date: 2007/8/8 
    Notes: 针对教务人员，根据uid的用户帐号和lno的模块编号，查询tbl_LimitsMant获取uid用户对lno模块的操作权限。
           操作权限CP:1d0a269e-e660b179-40d73388-12a2a6e4
    Parameter: string uid教务人员登录S-MIS系统时的用户帐号
               string lnoS-MIS系统操作模块的编号
    Return Value:boolean型 
            True----该uid用户帐号有对lno编号的模块操作的权限
            False----该uid用户帐号没有对lno编号的模块操作的权限
    */
    /******************************************/
    {
        if (uid == "admin")
        {
            return true;
        }
        else
        {
            SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\StudentDB_Data.MDF;Integrated Security=True");   //创建数据库连接对象
            sqlCon.Open();
            SqlCommand sqlCom = new SqlCommand();
            sqlCom.Connection = sqlCon;
            sqlCom.CommandText = "Select L_permit from tbl_LimitsMant where U_id='" + uid + "' and L_no='" + lno + "'";
            SqlDataReader sqlDr = sqlCom.ExecuteReader();    //查询是否存在相同帐号的用户
            if (sqlDr.Read())
            {
                if (sqlDr.GetBoolean (0))
                    return true ;
                else
                    return false ;
            }
            else
                return false;
        }
	}
}
