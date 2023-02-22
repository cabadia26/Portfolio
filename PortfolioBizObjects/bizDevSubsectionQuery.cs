using CPUFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevSubsectionQuery : bizObject<bizDevSubsectionQuery>
    {
        public bizDevSubsectionQuery()
        {
        }
        public int DevSubsectionQueryId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevSubsectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevSubsectionQueryCaption { get; set; } = "";
        public string DevSubsectionQueryText { get; set; } = "";
        public int DevSubsectionQuerySequence { get; set; }
    }
    
    
}