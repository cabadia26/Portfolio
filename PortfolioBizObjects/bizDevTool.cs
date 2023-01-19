using CPUFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortfolioBizObjects
{
    public class bizDevTool : bizObject<bizDevTool>
    {
        public bizDevTool()
        {

        }
        public int DevToolId {get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevToolTypeName { get; set; } = "";
        public string DevToolCode { get; set; } = "";
        public string DevToolTypeCode { get; set; } = "";
        public string DevToolName { get; set; } = "";
        public bool HasIcon { get; set; }
        public int DevToolSequence { get; set; } = 0;
    }
}
