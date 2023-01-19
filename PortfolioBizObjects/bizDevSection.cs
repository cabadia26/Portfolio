using CPUFramework;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevSection : bizObject<bizDevSection>
    {
        public bizDevSection()
        {

        }
        public int DevSectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }

        public string DevSectionCode { get; set; } = "";

        public string DevSectionName { get; set; } = "";

        public string DevSectionOverview { get; set; } = "";
        public string DevSectionBlurb { get; set; } = "";
        public bool HasIcon { get; set; } 
        public bool HasPicture { get; set; }
        public bool HasVideo { get; set; }
        public bool HasSpec { get; set; }
        public bool HasWireframe { get; set; } 

        public int DevSectionSequence { get; set; } = 0;

        public static List<bizDevSection> Search(string criteria)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("SearchCriteria", criteria);
            return GetAllFromSproc("DevSectionSearch", dp);

        }
    }
}
