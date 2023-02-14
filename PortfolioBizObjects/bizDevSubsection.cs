using CPUFramework;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevSubsection: bizObject<bizDevSubsection>
    {
        public bizDevSubsection()
        {

        }
        public int DevSubsectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevSectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevSectionCode { get; set; } = "";
        public string DevSubsectionCode { get; set; } = "";
        public string DevSubsectionName { get; set; } = "";
        public string DevSubsectionDesc { get; set; } = "";
        public string GitHubRepoName { get; set; } = "";
        public string URL { get; set; } = "";

        public int DevSubsectionSequence { get; set; } = 0;

        public static List<bizDevSubsection> Search(string criteria)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("SearchCriteria", criteria);
            return GetAllFromSproc("DevSubsectionSearch", dp);

        }
    }
}
