using CPUFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevToolType : bizObject<bizDevToolType>
    {
        public bizDevToolType()
        {

        }
        public int DevToolTypeId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevToolTypeName { get; set; } = "";
        public int DevToolTypeSequence { get; set; }
        public bool ShowOnHomePage { get; set; }
    }
}
