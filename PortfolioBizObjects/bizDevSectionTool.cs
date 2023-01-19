using CPUFramework;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevSectionTool : bizObject<bizDevSectionTool>
    {
        List<bizDevTool> lsttools = new List<bizDevTool>();
        public bizDevSectionTool()
        {

        }
    
        public int DevSectionToolId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevSectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevToolId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }

        public List<bizDevTool>ToolsList(bool refresh)
        {
            if(refresh == true || lsttools == null){
                lsttools = bizDevTool.GetList("DevSectionId", this.DevSectionId);
            }
            return lsttools;
        }
        public static List<bizDevSectionTool> Search(string criteria)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("SearchCriteria", criteria);
            return GetAllFromSproc("DevSectionToolSearch", dp);

        }
    }
}
