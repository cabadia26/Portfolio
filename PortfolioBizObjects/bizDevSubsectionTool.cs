using CPUFramework;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevSubsectionTool : bizObject<bizDevSubsectionTool>
    {
        public bizDevSubsectionTool()
        {

        }
        public int DevSubsectionToolId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevSubsectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevToolId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public static List<bizDevSubsectionTool> Search(string criteria)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("SearchCriteria", criteria);
            return GetAllFromSproc("DevSubsectionToolSearch", dp);

        }
    }
}
