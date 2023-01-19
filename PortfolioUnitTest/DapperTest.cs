using CPUFramework;
using NUnit.Framework;
using PortfolioBizObjects;
using System.Data.SqlClient;
using Dapper;
using System.Data;

namespace PortfolioUnitTest
{

    internal class DapperTest
    {
        private static string connstring = "";
        int maxproid = 0;
        bool testhaspic = false;
        string newprodesc = "";

        [SetUp]
        public void Setup()
        {
            SetLocalConnectionString("Server=.\\SQLExpress;Initial Catalog=PortfolioDB;Trusted_Connection=yes;");
            DataUtility.ConnectionString = connstring;

            DataTable dt = SQLUtility.GetDataTable(connstring, "select top  1 p.ProfileId from profile p");
            maxproid = (int)dt.Rows[0]["profileid"];


            //DataTable d = SQLUtility.GetDataTable(connstring, "select top 1 ds.DevSectionId from DevSubsection dst  join DevSection ds on ds.DevSectionId = dst.DevSectionId order by DevSectionSequence");
            //devsectionwithdevsubsectionid = (int)dt.Rows[0]["DevSectionId"];
        }
        public static string SetLocalConnectionString(string conns)
        {
            connstring = conns;
            using (SqlConnection conn = new SqlConnection(connstring))
            {
                conn.Open();
            }
            return connstring;
        }

//load by primary key
        private bizProfile LoadProfile(int Id)
        {
            bizProfile p = bizProfile.Get(Id);
            return p;
        }

        [Test]
        public void TestLoadProfile()
        {
            bizProfile p = this.LoadProfile(maxproid);
            TestContext.WriteLine(p.FullDescription);
            Assert.IsTrue(p.ProfileId == maxproid);
        }

//load DevSection list
        private List<bizDevSection> LoadListDevSection()
        {
            return bizDevSection.GetAll();
        }

        [Test]
        public void TestSearchLoadListDevSection()
        {
            List<bizDevSectionTool> lst = bizDevSectionTool.Search("Database Schema");
            TestContext.WriteLine("Database Schema");
            Assert.IsTrue(lst.Any());
        }

// load DevSubsection list
        private List<bizDevSubsection> LoadListDevSubsection()
        {
            return bizDevSubsection.GetAll();
        }

        [Test]
        public void TestSearchLoadListDevSubsection()
        {
            List<bizDevSubsection> lst = bizDevSubsection.Search("bookstoredb");
            TestContext.WriteLine("bookstoredb");
            Assert.IsTrue(lst.Any());
        }
        // load DevSectionTool list
        private List<bizDevSectionTool> LoadListDevSectionTool()
        {
            return bizDevSectionTool.GetAll();
        }

        [Test]
        public void TestSearchLoadListDevSectionTool()
        {
            List<bizDevSectionTool> lst = bizDevSectionTool.Search("HTML");
            TestContext.WriteLine("HTML");
            Assert.IsTrue(lst.Any());
        }
// load DevSubsectionTool list
        private List<bizDevSubsectionTool> LoadListDevSubsectionTool()
        {
            return bizDevSubsectionTool.GetAll();
        }

        [Test]
        public void TestSearchLoadListDevSubsectionTool()
        {
            List<bizDevSubsectionTool> lst = bizDevSubsectionTool.Search("Dapper");
            TestContext.WriteLine("Dapper");
            Assert.IsTrue(lst.Any());
        }

// create/insert new
        private bizProfile InsertNewProfile()
        {
         
            bizProfile p = new bizProfile();
            p.FirstName = "Joeyy";
            p.LastName = "Shmoey";
            p.EmailAddress = "testsst@gmail.com";
            p.PhoneNumber = "000-000-0000";
            p.GitHubAccount = "test";
            p.ProfileDesc = "This is a test.";
            testhaspic = true;


            DynamicParameters dp = new DynamicParameters(p);
            dp.Output<bizProfile>(p, x => x.ProfileId);

            p.Save();

            return p;
        }

        [Test]
        public void TestInsertNewProfile()
        {
            bizProfile p = this.InsertNewProfile();
            TestContext.WriteLine("Expected ProfileId > " + (maxproid) + " Value = " + p.ProfileId);
            Assert.IsTrue(p.GitHubAccount == "test");
        }
// delete
        private int DeleteNewProfile(int Id = 0)
        {
            bizProfile p;
            if (Id == 0)
            {
                p = this.InsertNewProfile();
            }
            else
            {
                p = LoadProfile(Id);
            }
            Id = p.ProfileId;

            p.Delete();

            return Id;
        }
        [Test]
        public void TestDeleteNewProfile()
        {
            int id = this.DeleteNewProfile();
            bizProfile p = this.LoadProfile(id);
            Assert.IsTrue(p.ProfileId == 0);
        }

//update
        private void UpdateChangeProfileDesc(bizProfile p)
        {
            //bizProfile p = this.LoadProfile(maxproid);
            newprodesc = "Test I was changed using Dapper Test with function ChangeProfileDesc().";
            p.ProfileDesc = newprodesc;
            p.Save();
        }
        [Test]
        public void TestUpdateRecipe()
        {
            bizProfile p = this.LoadProfile(maxproid);
            newprodesc = "New desc" + p.ProfileDesc;
            this.UpdateChangeProfileDesc(p);
            p = this.LoadProfile(maxproid);
            Assert.IsTrue(p.ProfileDesc == newprodesc);
        }
//change existing profile phone number 
        private void ChangeProfilePhoneNum()
        {
            bizProfile p = this.LoadProfile(maxproid);
            p.PhoneNumber = "112-145-1242";
            p.Save();
        }
        [Test]
        public void TestChangeProfilePhoneNum()
        {
            CPUException? ex = Assert.Throws<CPUException>(() => this.ChangeProfilePhoneNum());
            TestContext.WriteLine(ex?.Message);
        }
    }
}

