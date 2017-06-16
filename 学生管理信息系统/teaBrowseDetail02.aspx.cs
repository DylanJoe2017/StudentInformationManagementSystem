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


public partial class teaBrowseDetail : System.Web.UI.Page
{
   
    public SqlConnection sqlCon;             //创建SqlConnection对象
    public SqlDataAdapter sqlDa;             //创建SqlDataAdapter对象
    public DataSet ds = new DataSet();       //创建DataSet对象并实例化

    protected void Page_Load(object sender, EventArgs e)
    {
        /*
         * SqlConnection、SqlDataAdapter和DataSet类相结合使用，这是最常见的一种组合使用方式，其中SqlConnection类
         * 负责连接数据库，SqlDataAdapter负责检索数据库并用检索的结果填充DataSet，而DataSet类则负责保持最后的检索结果，
         * 并用这些结果信息更新页面中各标签
         */
        //从Web.config文件中读取数据库连接字符串信息，并实例化sqlCon对象
        sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);

        if (!IsPostBack)
        {
            string strsno = Request.QueryString["s_no"];        //获得传递进来的“学号”参数

            strsno = "200704010021";　　　　　//临时语句，用完删除

            string strSql = "select * from tbl_stuinfo,tbl_deptmant where s_no='" + strsno + 
                "'and  s_inse=inse_no and s_dept=dept_no";      //获得该学号的学生基本信息
            sqlDa = new SqlDataAdapter(strSql, sqlCon);         //根据strSql和sqlCon实例化SqlDataAdapter对象
            sqlDa.Fill(ds, "stuinfo");                          //填充ds，并将检索的记录集命名为stuinfo

            lblhello.Text = ds.Tables["stuinfo"].Rows[0]["s_name"].ToString() + "基本资料";  //显示标题信息
            lblsno.Text = ds.Tables["stuinfo"].Rows[0]["s_no"].ToString();                   //显示学生学号
            lblsname.Text = ds.Tables["stuinfo"].Rows[0]["s_name"].ToString();               //显示学生姓名
            lblsgender.Text = ds.Tables["stuinfo"].Rows[0]["s_gender"].ToString();               //显示学生性别信息
            lblsbirthday.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["s_birthday"]).ToString("d");               //学生出生日期转换为DateTime型后显示出来
            lblsparty.Text = ds.Tables["stuinfo"].Rows[0]["s_party"].ToString();               //显示政治面貌信息
            lblsaddress.Text = ds.Tables["stuinfo"].Rows[0]["s_address"].ToString();               //显示籍贯信息
            lblsgrade.Text = ds.Tables["stuinfo"].Rows[0]["s_grade"].ToString();               //显示年级信息
            lblsdepartment.Text = ds.Tables["stuinfo"].Rows[0]["inse_name"].ToString();               //显示所在学院信息
            lblsmajor.Text = ds.Tables["stuinfo"].Rows[0]["dept_name"].ToString();               //显示系别信息
            lblsclass.Text = ds.Tables["stuinfo"].Rows[0]["s_class"].ToString();               //显示班级信息
            lblsin.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["s_in"]).ToString("d");               //显示入学日期
            lblsout.Text = ((DateTime)ds.Tables["stuinfo"].Rows[0]["s_out"]).ToString("d");               //显示毕业日期
            imgPhoto.ImageUrl = ds.Tables["stuinfo"].Rows[0]["s_pic"].ToString();               //显示照片信息
            imgPhoto.Width = 90;               //设置照片显示宽度
            imgPhoto.Height = 120;                //设置照片显示高度

        }
    }


    protected void lbtnUploadPic_Click(object sender, EventArgs e)
    {
        if (!pnlUpload.Visible) pnlUpload.Visible = true; 
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            //若没有选择照片文件则进行提示
            if (FileUpload1.PostedFile.FileName == "")
            {
                lblMessage.Text = "请选择文件！";

            }
            else
            {
                //获得学生“照片文件路径”信息
                string filepath = FileUpload1.PostedFile.FileName;
                //获得学生“照片文件名称”信息
                string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                //获得存服务器上“照片文件存放位置”信息
                string serverpath = Server.MapPath("photos/") + filename;
                //将上传的照片文件保存到服务器上
                FileUpload1.PostedFile.SaveAs(serverpath);
                
                lblMessage.Text = "上传成功！";
                //照片上传完毕后，再次隐藏上传控件
                pnlUpload.Visible = false;

                SqlCommand cmda;      //创建SqlCommand类的cmda对象
                string strSql;        
                string strsno = Request .QueryString ["s_no"];   //获得“学号”信息

                strsno = "200704010021";　　　　　//临时语句，用完删除

                //构造更新SQL语句，以便将已上传照片文件信息保存到tbl_stuinfo表中
                strSql = "update tbl_stuinfo set s_pic='" + "photos\\"+filename + "' where s_no='" + strsno + "'";
                //Response.Write(strSql);
                //sqlDa.UpdateCommand = new SqlCommand(strSql, sqlCon);
                //sqlDa.Update(ds, "stuinfo");
                sqlCon.Open();
                cmda = new SqlCommand(strSql, sqlCon); //实例化cmda对象
                cmda.ExecuteNonQuery();  //执行更新SQL语句
                sqlCon.Close();
                imgPhoto.ImageUrl = serverpath.ToString();  //在窗体上显示已上传的相片
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "上传发生错误！原因是：" + ex.ToString();
        }
    }
}
