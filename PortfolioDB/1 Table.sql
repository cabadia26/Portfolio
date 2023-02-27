use PortfolioDB
go 

drop table if exists DevSubsectionQuery
drop table if exists DevSubsectionElement 
drop table if exists DevSubSectionTool
drop table if exists DevSubSection
drop table if exists DevSectionTool
drop table if exists DevSection
drop table if exists DevTool 
drop table if exists DevToolType
drop table if exists Profile


create table dbo.Profile(
    ProfileId int not null identity primary key,
    FirstName varchar (35) not null 
        constraint ck_Profile_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar (35) not null 
        constraint ck_Profile_LastName_cannot_be_blank check(LastName <> ''),  
    EmailAddress varchar (50) not null 
        constraint ck_Profile_EmailAddress_cannot_be_blank check(EmailAddress <> ''),
    PhoneNumber varchar (14) not null, 
    GitHubAccount varchar (100) not null
        constraint ck_Profile_GitHubAccount_cannot_be_blank check(GitHubAccount <> ''),
    ProfileDesc varchar (1000) not null 
        constraint ck_Profile_ProfileDesc_cannot_be_blank check(ProfileDesc <> ''),
    HasResume bit not null default 1
    constraint u_FirstName_LastName_EmailAddress unique(FirstName, LastName, EmailAddress)
)
go 
 
create table dbo.DevToolType(
    DevToolTypeId int not null identity primary key,
    DevToolTypeCode varchar(25) not null
        constraint u_DevToolType_DevToolTypeCode unique,
    DevToolTypeName varchar(100) not null 
        constraint u_DevToolType_Name unique,
    DevToolTypeSequence int not null,
    ShowOnHomePage bit not null
)

go

create table dbo.DevTool(
    DevToolId int not null identity primary key,
    DevToolTypeId int not null 
        constraint f_DevToolType_DevTool foreign key references DevToolType(DevToolTypeId), 
    DevToolCode as replace(replace(replace(lower(DevToolName),' ',''),'.',''),'#','') 
        constraint u_DevTool_DevToolCode unique,
    DevToolName varchar (45) not null 
        constraint ck_DevTool_DevToolName_cannot_be_blank check(DevToolName <> '')
        constraint u_DevTool_DevToolName unique,
    DevToolSequence int not null,
    HasIcon bit not null default 0,
    IconExt varchar (3) not null default 'svg'

)
go

create table dbo.DevSection(
    DevSectionId int not null identity primary key,
    DevSectionCode varchar (25) not null 
        constraint ck_DevSection_DevSectionCode_cannot_be_blank check(DevSectionCode <> '')
        constraint u_DevSection_DevSectionCode unique,
    DevSectionName varchar (35) not null 
        constraint ck_DevSection_DevSectionName_cannot_be_blank check(DevSectionName <> '')
        constraint u_DevSection_DevSectionName unique,
    DevSectionOverview varchar (500) not null 
        constraint ck_DevSection_DevSectionOverview_cannot_be_blank check(DevSectionOverview <> ''),
    DevSectionBlurb  varchar (500) not null 
        constraint ck_DevSection_DevSectionBlurb_cannot_be_blank check(DevSectionBlurb <> ''),
    HasPicture bit not null default 1,
    DevSectionSequence int not null
)
go

create table dbo.DevSectionTool(
   DevSectionToolId int not null identity primary key,
   DevSectionId int not null 
       constraint f_DevSection_DevSectionTool foreign key references DevSection(DevSectionId),
   DevToolId int not null 
       constraint f_DevTools_DevSectionTool foreign key references DevTool(DevToolId), 
   constraint u_DevSection_DevTool_DevSectionTool unique(DevSectionId, DevToolId)
)
go

create table dbo.DevSubsection(
    DevSubsectionId int not null identity primary key,
    DevSectionId int not null 
        constraint f_DevSection_DevSubSection foreign key references DevSection(DevSectionId),
    DevSubsectionCode varchar (25) not null 
        constraint ck_DevSubsection_DevSubsectionCode_cannot_be_blank check(DevSubsectionCode <> '')
        constraint u_DevSubsection_DevSubsectionCode unique,
    DevSubsectionName varchar (35) not null 
        constraint ck_DevSubsection_DevSubsectionName_cannot_be_blank check(DevSubsectionName <> '')
        constraint u_DevSubsection_DevSubsectionName unique,
    DevSubsectionDesc varchar (500) not null 
        constraint ck_DevSubsection_DevSubsectionDesc_cannot_be_blank check(DevSubsectionDesc <> ''), 
    GitHubRepoName varchar (25),
    URL varchar (250) not null default '',
        --constraint u_DevSubsection_GitHubRepoName unique,
    DevSubsectionSequence int not null default 0
    constraint u_DevSubsectionId_DevSubsectionCode unique(DevSubsectionId, DevSubsectionCode)
)
go

create table dbo.DevSubsectionElement(
    DevSubsectionElementId int not null identity primary key, 
    DevSubsectionId int not null 
        constraint f_DevSubsection_DevSubsectionElement foreign key references DevSubsection(DevSubsectionId),
    DevSubSectionElementCode varchar(25) not null 
        constraint ck_DevSubsectionElement_DevSubsectionElementCode_cannot_be_blank check(DevSubsectionElementCode <> ''),
    ButtonText varchar(25) not null,
        constraint ck_DevSubsectionElement_ButtonText_cannot_be_blank check(ButtonText <> ''),
    HtmlTag varchar(10) not null,
        constraint ck_DevSubsectionElement_HtmlTag_cannot_be_blank check(HtmlTag <> ''),
    FileExtension varchar(5) not null ,
        --constraint ck_DevSubsectionElement_FileExtention_cannot_be_blank check(FileExtension <> ''),
    DevSubsectionElementPriority int not null default 0
    constraint u_DevSubsectionElementId_DevSubSectionElementCode unique(DevSubsectionElementId, DevSubSectionElementCode)

)
go 

create table dbo.DevSubsectionTool(
   DevSubsectionToolId int not null identity primary key,
   DevSubsectionId int not null 
       constraint f_DevSubsection_DevSubsectionTool foreign key references DevSubsection(DevSubsectionId),
   DevToolId int not null 
       constraint f_DevTools_DevSubsectionTool foreign key references DevTool(DevToolId), 
   constraint u_DevSubsectionTool_DevSubsection_DevTool unique(DevSubsectionId, DevToolId)
)
go

create table dbo.DevSubsectionQuery(
  DevSubsectionQueryId int not null identity primary key,
  DevSubsectionId int not null 
       constraint f_DevSubsection_DevSubsectionQuery foreign key references DevSubsection(DevSubsectionId),
  DevSubsectionQueryCaption varchar(50) not null,
  DevSubsectionQueryText varchar(1000) not null,
  DevSubsectionQuerySequence int not null default 0,
  constraint u_DevSubsectionQuery_DevSubsectionId_DevSubsectionQueryId unique(DevSubsectionId, DevSubsectionQueryId) 
)
go