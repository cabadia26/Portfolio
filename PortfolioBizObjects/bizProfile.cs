﻿using CPUFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace PortfolioBizObjects

{
    public class bizProfile : bizObject<bizProfile>
    {
        public bizProfile()
        {

        }
        public int ProfileId{ get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value;}
        public string ProfileDesc { get; set; } = "";
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";
        public string PhoneNumber { get; set; } = "";
        public string EmailAddress { get; set; } = "";
        public string HasResume { get; set; } = "";
        public string GitHubAccount { get; set; } = "";

        public string FullDescription() { return this.FirstName + " " + this.LastName + " " + this.EmailAddress; }
    }
}
