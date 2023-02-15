using CPUFramework;
using Microsoft.AspNetCore.Mvc;
using PortfolioBizObjects;
using System.Data;
using Newtonsoft.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PortfolioWeb.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProfileController : ControllerBase
    {
        // GET: api/<ProfileController>
        [HttpGet]
        public bizProfile Get()
        {
            bizProfile profile = new();
            var lst = bizProfile.GetAll();
            if(lst.Count() > 0)
            {
                profile = lst[0];
            }
            return profile;
        }

        [HttpGet("devsections")]
        public List<bizDevSection> DevSectionGet()
        {
            var lst = bizDevSection.GetAll();
            return lst;
        }

        [HttpGet("devsubsections")]
        public List<bizDevSubsection> DevSubsectionGet()
        {
            var lst = bizDevSubsection.GetAll();
            return lst;
        }
        [HttpGet("devsubsectionelements")]
        public List<bizDevSubsectionElement> DevSubsectionElementGet()
        {
            var lst = bizDevSubsectionElement.GetAll();
            return lst;
        }
        [HttpGet("devtools")]
        public List<bizDevTool> DevToolGet()
        {
            var lst = bizDevTool.GetAll();
            return lst;
        }
        [HttpGet("devtooltypes")]
        public List<bizDevToolType> DevToolTypeGet()
        {
            return bizDevToolType.GetAll();
        }
        [HttpGet("devtoolsforsubsection")]
        public List<bizDevTool> DevToolGetForSubsection(string DevSubsectionCode)
        {

            List<bizDevTool> lst = bizDevTool.GetList("DevSubsectionCode", DevSubsectionCode);
            return lst;
        }
        [HttpGet("trysql")]
        public IActionResult TrySQL(string dbname, string sql)
        {
            string connstring = DataUtility.ConnectionString;

            connstring = connstring.Replace("PortfolioDB", dbname);

            try
            {
                DataTable dt = SQLUtility.GetDataTable(connstring, sql);
                if (dt.Rows.Count == 0)
                {
                    foreach (DataColumn c in dt.Columns)
                    {
                        c.AllowDBNull = true;
                    }
                    dt.Rows.Add();
                }

                return Ok(JsonConvert.SerializeObject(dt));
            }
            catch(Exception ex)
            {
                return Ok(new {errormsg=ex.Message});
            }
        }
    }
}
