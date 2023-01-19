/*
Profile
    pk
    FirstName varchar (35)
    LastName varchar (35)
    email address varchar (50)
    phone number varchar (14)
    github account varchar (100)
    ProfileDesc varchar (1000)
    HasResume bit

DevTools
    pk
    DevToolName varchar (25)
    Sequence int 

DevSection
    pk
    DevSectionCode unique varchar (25)
    DevSectionName unique varchar (35)
    DevSectionOverview varchar (500)
    DevSectionDesc varchar (500)
    DevSectionBlurb  varchar (250)
    HasPicture bit
    Sequence int 

DevSectionTool
    pk int 
    DevSectionId int
    DevToolId int 

DevSubSection
    pk int 
    DevSectionId int 
    DevSubsectionCode varchar (25)
    DevSubsectionName varchar (35)
    DevSubsectionDesc varchar (500)
    GitHubRepoName varchar (25)
    HasIcon bit
    HasPicture bit
    HasVideo bit
    HasSpec bit
    HasWireframe bit
    
DevSubsectionElement
    pk int 
    fk to DevSubsection
    code
    ButtonText varchar(25)
    HtmlTag
    FileExtention varchar(4))



DevSubSectionTool
    pk int 
    DevSubsectionId int 
    DevToolId int
*/



