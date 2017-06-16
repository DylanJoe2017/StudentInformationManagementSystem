using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// 接收查询信息，返回查到的学生信息
/// </summary>
//[WebService(Namespace = "http://localhost:1043/S-MIS1.2/getinfo.asmx/getStudentInfo")]
[WebService(Namespace = "http://tempuri.org/")]
//http://1d0a269e-e660b179-40d73388-12a2a6e4/localhost:1043
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class getinfo : System.Web.Services.WebService {

    public getinfo () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public StuInfoResponse getStudentInfo(string S_no,string pwd) {
        StuInfoResponse resp = new StuInfoResponse();

        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["dsn"]);
        sqlCon.Open();
        SqlCommand sqlCom = sqlCon.CreateCommand();
        sqlCom.CommandText = "select S_pw from tbl_StuInfo where S_no='" + S_no+"'";
        string txtpwd = (string)sqlCom.ExecuteScalar();
        if (null==txtpwd || txtpwd.Trim() != pwd)
        {
            resp.state = "Can't logon, please check your NO and password";
        }
        else
        {
            resp.infoDataSet = new DataSet();

            // 获取学生基本信息，将其填充到infoDataSet的"StuInfo"表中。
            SqlDataAdapter sqlDa = new SqlDataAdapter("select tbl_StuInfo.S_no, tbl_StuInfo.S_name, tbl_StuInfo.S_gender, tbl_StuInfo.S_birthday, tbl_StuInfo.S_party, tbl_StuInfo.S_address, tbl_deptMant.Inse_name, tbl_deptMant.dept_name, tbl_StuInfo.S_grade, tbl_StuInfo.S_class, tbl_StuInfo.S_in, tbl_StuInfo.S_out,tbl_StuInfo.S_pic " + 
                                                           "from tbl_StuInfo, tbl_deptMant "+
                                                           "where tbl_StuInfo.S_inse=tbl_deptMant.Inse_no and tbl_StuInfo.S_dept=tbl_deptMant.Dept_no and tbl_StuInfo.S_no='" + S_no + "'", sqlCon);
            sqlDa.Fill(resp.infoDataSet, "StuInfo");

            // 获取学生成绩信息，将其填充到infoDataSet的"StuScores"表中。
            sqlDa.SelectCommand.CommandText = "select tbl_CourseInfo.C_name,  tbl_CourseInfo.C_teacher, tbl_CourseInfo.C_hours, tbl_CourseInfo.C_scores, tbl_StuScores.scores from tbl_CourseInfo, tbl_StuScores where tbl_CourseInfo.C_no=tbl_StuScores.C_no and tbl_CourseInfo.C_flag=1 and tbl_StuScores.S_no='" + S_no + "'";
            sqlDa.Fill(resp.infoDataSet, "StuScores");

            // 获取学生获奖信息，将其填充到infoDataSet的"StuExpes"表中。
            sqlDa.SelectCommand.CommandText = "SELECT [E_beginDate], [E_endDate], [E_content], [E_type] FROM [tbl_StuExpe] WHERE ([S_no] = '" + S_no + "')";
            sqlDa.Fill(resp.infoDataSet, "StuExpes");

            resp.state = "successed";

        }
        sqlCon.Close();
        return resp;

    }
    
}

public class StuInfoResponse
{
    public string state = null;
    public DataSet infoDataSet = null;
}