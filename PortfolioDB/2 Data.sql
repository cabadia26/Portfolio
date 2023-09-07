

use PortfolioDB
go 

delete DevSubsectionQuery
delete DevSubsectionTool
delete DevSubsectionElement
delete DevSubSection
delete DevSection
delete DevTool 
delete DevToolType
delete Profile

insert Profile(FirstName, LastName, EmailAddress, PhoneNumber, GitHubAccount, ProfileDesc, HasResume)
select 'Camille', 'Abadia', 'Cabadia26@gmail.com', '347-698-9590', 'https://github.com/cabadia26', 
'I am a full stack software developer and produce top quality software. 
From requirements gathering to implementation of database, middle tier, and front end. 
', 1
--Databases and websites are deployed to the cloud using Microsoft Azure.

insert DevToolType(DevToolTypeCode,DevToolTypeName, DevToolTypeSequence, ShowOnHomePage)
select 'language', 'My Skills', 0, 1
union select 'skill', 'My Tech', 1, 1
union select 'devtool', 'My  Tools', 2, 1

;
with x as (
 select t.DevToolTypeId, t.DevToolTypeCode from DevToolType t
)
insert DevTool(DevToolName, DevToolSequence, DevToolTypeId, HasIcon)
select 'SQL', 1 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'C#', 2 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'Dapper', 3 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'HTML', 4 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'ASP.Net', 5 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'JavaScript', 6 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'Bootstrap', 7 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'CSS', 8 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'JQuery', 9 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'React', 10 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'SQL Server', 11, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'Requirement Analysis', 12 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Wire Framing', 13 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Database Schema Design', 14 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'CRUD with Stored Procedures', 15 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Software System Framework', 16, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Unit testing', 17 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Cloud Computing', 18 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Visual Studio', 19, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'Azure Data Studio', 20, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'SQL Server Management Studio', 21, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'Beyond Compare', 22, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'GIT', 23 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'GitHub', 24 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'

update DevTool set IconExt = 'png' where DevToolName = 'dapper'

insert DevSection(DevSectionCode, DevSectionName, DevSectionOverview, DevSectionBlurb, HasPicture, DevSectionSequence)
select 'db', 'Database Schema', 
       'Databases are the foundation of a software system. A strong database with constraints, foreign keys, functions, and stored procedures produces a system that is safe and secure.',
       'Each database is handwritten using constraints,foreign keys, functions, and stored procedures to produce a safe and secure system.', 
        0,  1
union select 
       'architecture', 'Framework/Business Objects', 
       'Creating a framework and Business Objects in a program makes the development easier, smoother and have cleaner code.',
       'Creating a framework and Business Objects in a program makes the production easier, smoother and have cleaner code.',
       0, 2
union select 
       'desktopapp', 'Windows Projects',
       'Windows programs are created using VB.Net and C#. They can be downloaded onto any computer.',
       'Windows programs are created using object VB.Net and C#.',
       0, 3
union select 
       'web', 'Web Projects',
       'Web programs are created using HTML, ASP.Net, MVC, Java Script and JQuery.',
       'Web apps are created using HTML, ASP.Net, MVC, JavaScript and JQuery.',
       0, 4
union select 
       'mobileapp', 'Mobile Apps',
       'Mobile apps created using...',
       'Mobile apps created using...',
       0, 5

insert DevSectionTool(DevSectionId, DevToolId)
--database
select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'SQL Server' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Requirement Analysis' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Relational Database Schema Design' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'CRUD and Stored Procedures' and s.DevSectionCode = 'db' 

--architecture
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'C#' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'ASP.Net' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'HTML' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Unit Testing' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Stored Procedures' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Framework' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Wire Framing' and s.DevSectionCode = 'architecture' 

union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'C#' and s.DevSectionCode = 'desktopapp' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Desktop Apps' and s.DevSectionCode = 'desktopapp' 

union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'ASP.Net' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'HTML' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Bootstrap' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'JavaScript' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'CSS' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'JQquery' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'React' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Cloud Computing using Microsoft Azure' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'GIT' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'GitHub' and s.DevSectionCode = 'web'


insert DevSubsection(DevSectionId, DevSubsectionCode, DevSubsectionName, DevSubsectionDesc, GitHubRepoName, DevSubsectionSequence)
    select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'portfoliodb',
    'Portfolio', 'This database drives this site! It was created in a way that allows the website to be a completely data driven software. ',
    'Portfolio', 1
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'recipedb',
    'Recipe', 'The Recipe Database has a list of 20 recipes, 12 different chefs, international cuisines, using a variety of ingredients, including steps of creating the recipe, meal courses, 3 cook books, and more.',
    'Recipe', 2
union select
     (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'usgovdb',
    'US Gov', 'The US Gov Database has all our 45 presidents, 52 states, presidential executive orders, US Departments, US Budget and more.',
    'RecordKeeper', 3
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'bookstoredb',
    'Book Store', 'The Book store database consists of 6 authors, 8 genres, 10 books, many store shelves, 3 stores, and more. ',
    'Bookstore', 4

--architechture
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'cpuframework',
    'CPUFramework', 'When writing programs, it is essential to create and work with a framework.
     A framework is a project where common and re-usable code is stored. It is written in a way that it can be used anywhere at anytime. 
     Code such as logins, connection strings and data types are just a few of the many components written up in a framework.',
    'CPUFramework', 5
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'cpuexception',
    'CPUException', 'bizUserLogin is an inherited class of bizObject that is included in CPUFramework. It allows users to enter login.',
    'CPUFramework', 6
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'sqlutility',
    'SQLUtility', 'SQLUtility is a module where general utilites are written up so that they can be used for any program. 
     It sets up connection strings, gets a data table from a stored procedure or a sql statement, parses out the error messages from the constraints, and much more.',
    'CPUFramework', 7
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'bizObject',
    'bizObject', 'Business objects are written as an inheritance of a bizObject which is written up in the framework. 
     Business Objects are what make the system blend with the data from the database. 
     For every project, a unique library of business objects is formed to work with its specific data.',
    'CPUFramework', 8
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'bizuser',
    'bizUser', 'bizUserLogin is an inherited class of bizObject that is included in CPUFramework. It allows users to enter login.',
    'CPUFramework', 9

--windows
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'gametoolkit',
    'Game Toolkit', 'Game Toolkit is an architecture with objects, methods, and procedures that allows programmers to create games based on moving pieces and a player.',
    'cabadia', 10
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'tictactoe',
    'Tic-Tac-Toe', 'A game created using C#. One or two players seek in alternate turns to complete a row, a column, or a diagonal with either three O''s or three X''s drawn in the spaces of a grid of nine squares.',
    'TicTacToeApp', 11
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'memory',
    'Memory', 'A game created using C#. The player will start the game by flipping a card. Then try to find another card that has the same image as the first. If the plkayer can''t find a pair, the flipped cards will be flipped back with the face down.',
    'MemoryGame', 12
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'flipacoin',
    'Flip a Coin', 'A game created used to solve a dispute between two parties. 
    This is a virtual coin toss, coin virtually flips using a timer an lands on a random coin side.',
    'HeadsTails', 13
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'definiciando',
    'Definiciando', 'A game created used to solve a dispute between two parties. 
    This is a virtual coin toss, coin virtually flips using a timer an lands on a random coin side.',
    'Definiciando', 14

--web 
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'portfolioweb',
    'Portfolio Website', 'This Portfolio website was created using ASP.Net, CSS, HTML styles,bootstrap, and JQuery.',
    'Portfolio', 15
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'usgovweb',
    'US Gov Website', 'The U.S. Government website was created using ASP.Net, CSS, HTML styles,bootstrap, and JQuery.',
    'RecordKeeper', 16
    
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'recipeweb',
    'Recipe Website', 'This recipe website was created using MVC, with HTML styles, and bootstrap.',
    'Recipe', 17
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'tictactoeweb',
    'Tic-Tac-Toe Website', 'The Tic-Tac-Toe web game was created using HTML styles, JavaScript, and JQuery.',
    'TicTacToeApp', 18
    
--mobileapp
--union
--select d.DevSectionId, 'Record Keeper App', 'recordkeeperapp', 'The record keeper app front end gives users the ability to view, edit and maintain information about the US Federal government. This was implemented using the CPU Framework architecture and business objects.', 1 from DevSection d where d.DevSectionCode = 'mobileapp'
--union
--select d.DevSectionId, 'Recipe App', 'recipeapp', 'The recipe app front end gives users the ability to view, edit and maintain recipe information. This was implemented using the CPU Framework architecture and business objects.', 2 from DevSection d where d.DevSectionCode = 'mobileapp'

;
with x as (
    select s.DevSectionCode, d.*
    from DevSubsection d
    join DevSection s 
    on s.DevSectionId = d.DevSectionId
    )
insert DevSubsectionElement(DevSubsectionId, DevSubsectionElementCode, ButtonText, HtmlTag, FileExtension, DevSubsectionElementPriority)
select  x.DevSubsectionId, 'dbschema', 'Schema Diagram', 'img', '.png', 3 from x where x.DevSectionCode = 'db' 
union select  x.DevSubsectionId, 'scriptsql', 'SQL Script', 'iframe', '.html', 2 from x where x.DevSectionCode = 'db'
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'db'

union select x.DevSubsectionId, 'trysql', 'Try Sql', 'trysql', '', 4 from x where x.DevSectionCode = 'db'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x where x.DevSectionCode = 'architecture' 

union select  x.DevSubsectionId, 'scriptcsharp', 'See Code', 'iframe', '.html', 2 from x where x.DevSectionCode = 'architecture' and x.DevSubsectionCode <> 'cpuframework'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x  where x.DevSectionCode = 'desktopapp' 
union select  x.DevSubsectionId, 'download', 'Download and Run App', 'zip', '.zip', 2 from x where x.DevSectionCode = 'desktopapp'
union select x.DevSubsectionId, 'video', 'Watch Video', 'video', '.mp4', 2 from x where x.DevSectionCode = 'desktopapp'

union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'desktopapp'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 2 from x where x.DevSectionCode = 'web' 
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'web'
union select  x.DevSubsectionId, 'website', 'View Website', 'web', 'a', 3 from x where x.DevSectionCode = 'web'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 2 from x where x.DevSectionCode = 'mobileapp' 
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'mobileapp'
union select  x.DevSubsectionId, 'app', 'Open App', 'app', 'a', 3 from x where x.DevSectionCode = 'mobileapp'
;

insert DevSubSectionTool(DevSubsectionId, DevToolId)
--db
select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('portfoliodb', 'usgovdb', 'recipedb', 'bookstoredb')   and t.DevtoolName in('CRUD with Stored Procedures', 'Database Schema Design', 'Requirement Analysis', 'SQL', 'SQL Server', 'Git', 'GitHub') 

--architecture
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('cpuframework', 'bizObject', 'sqlutility', 'cpuexception', 'bizuser')  and t.DevtoolName in ('Framework', 'Unit Testing','Dapper','C#', 'Git', 'GitHub')

--windows
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('gametoolkit', 'tictactoe', 'memory', 'flipacoin', 'definiciando')  and t.DevtoolName in ('C#', 'Git', 'GitHub', 'Wire Framing', 'Desktop Apps', 'Cloud Computing')

--web
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('portfolioweb' ,'usgovweb', 'recipeweb', 'tictactoeweb')  and t.DevtoolName in ('HTML','CSS','JQuery', 'ASP.Net', 'Bootstrap', 'C#', 'React', 'JavaScript', 'Stored Procedures', 'Cloud Computing', 'Git', 'GitHub', 'Wire Framing', 'Dapper', 'Framework')

insert DevSubsectionQuery(DevSubsectionId, DevSubsectionQueryCaption, DevSubsectionQueryText, DevSubsectionQuerySequence)
select s.DevSubsectionId, 'count of presidents', 'select count(*) from president', 0 from DevSubsection s where s.DevSubsectionCode = 'RecordKeeperDB'
union 
select s.DevSubsectionId, 'list of presidents', 'select * from president', 1 from DevSubsection s where s.DevSubsectionCode = 'RecordKeeperDB'
union 
select s.DevSubsectionId, 'count of dev tools', 'select count(*) from DevTool', 0 from DevSubsection s where s.DevSubsectionCode = 'PortfolioDB'
union 
select s.DevSubsectionId, 'list tools', 'select * from DevTool', 1 from DevSubsection s where s.DevSubsectionCode = 'PortfolioDB'















































































































































































































































use PortfolioDB
go 

delete DevSubsectionQuery
delete DevSubsectionTool
delete DevSubsectionElement
delete DevSubSection
delete DevSection
delete DevTool 
delete DevToolType
delete Profile

insert Profile(FirstName, LastName, EmailAddress, PhoneNumber, GitHubAccount, ProfileDesc, HasResume)
select 'Camille', 'Abadia', 'Cabadia26@gmail.com', '347-698-9590', 'https://github.com/cabadia26', 
'I am a full stack software developer and produce top quality software. 
From requirements gathering to implementation of database, middle tier, and front end. 
', 1
--Databases and websites are deployed to the cloud using Microsoft Azure.

insert DevToolType(DevToolTypeCode,DevToolTypeName, DevToolTypeSequence, ShowOnHomePage)
select 'language', 'My Skills', 0, 1
union select 'skill', 'My Tech', 1, 1
union select 'devtool', 'My  Tools', 2, 1

;
with x as (
 select t.DevToolTypeId, t.DevToolTypeCode from DevToolType t
)
insert DevTool(DevToolName, DevToolSequence, DevToolTypeId, HasIcon)
select 'SQL', 1 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'C#', 2 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'Dapper', 3 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'HTML', 4 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'ASP.Net', 5 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'JavaScript', 6 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'Bootstrap', 7 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'CSS', 8 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'JQuery', 9 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'React', 10 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'SQL Server', 11, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'Requirement Analysis', 12 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Wire Framing', 13 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Database Schema Design', 14 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'CRUD with Stored Procedures', 15 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Software System Framework', 16, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Unit testing', 17 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Cloud Computing', 18 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Visual Studio', 19, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'Azure Data Studio', 20, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'SQL Server Management Studio', 21, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'Beyond Compare', 22, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'GIT', 23 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'
union select 'GitHub', 24 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'devtool'

update DevTool set IconExt = 'png' where DevToolName = 'dapper'

insert DevSection(DevSectionCode, DevSectionName, DevSectionOverview, DevSectionBlurb, HasPicture, DevSectionSequence)
select 'db', 'Database Schema', 
       'Databases are the foundation of a software system. A strong database with constraints, foreign keys, functions, and stored procedures produces a system that is safe and secure.',
       'Each database is handwritten using constraints,foreign keys, functions, and stored procedures to produce a safe and secure system.', 
        0,  1
union select 
       'architecture', 'Framework/Business Objects', 
       'Creating a framework and Business Objects in a program makes the development easier, smoother and have cleaner code.',
       'Creating a framework and Business Objects in a program makes the production easier, smoother and have cleaner code.',
       0, 2
union select 
       'desktopapp', 'Windows Projects',
       'Windows programs are created using VB.Net and C#. They can be downloaded onto any computer.',
       'Windows programs are created using object VB.Net and C#.',
       0, 3
union select 
       'web', 'Web Projects',
       'Web programs are created using HTML, ASP.Net, MVC, Java Script and JQuery.',
       'Web apps are created using HTML, ASP.Net, MVC, JavaScript and JQuery.',
       0, 4
union select 
       'mobileapp', 'Mobile Apps',
       'Mobile apps created using...',
       'Mobile apps created using...',
       0, 5

insert DevSectionTool(DevSectionId, DevToolId)
--database
select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'SQL Server' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Requirement Analysis' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Relational Database Schema Design' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'CRUD and Stored Procedures' and s.DevSectionCode = 'db' 

--architecture
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'C#' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'ASP.Net' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'HTML' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Unit Testing' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Stored Procedures' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Framework' and s.DevSectionCode = 'architecture' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Wire Framing' and s.DevSectionCode = 'architecture' 

union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'C#' and s.DevSectionCode = 'desktopapp' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Desktop Apps' and s.DevSectionCode = 'desktopapp' 

union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'ASP.Net' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'HTML' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Bootstrap' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'JavaScript' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'CSS' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'JQquery' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'React' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Cloud Computing using Microsoft Azure' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'GIT' and s.DevSectionCode = 'web' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'GitHub' and s.DevSectionCode = 'web'


insert DevSubsection(DevSectionId, DevSubsectionCode, DevSubsectionName, DevSubsectionDesc, GitHubRepoName, DevSubsectionSequence)
    select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'portfoliodb',
    'Portfolio', 'This database drives this site! It was created in a way that allows the website to be a completely data driven software. ',
    'Portfolio', 1
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'recipedb',
    'Recipe', 'The Recipe Database has a list of 20 recipes, 12 different chefs, international cuisines, using a variety of ingredients, including steps of creating the recipe, meal courses, 3 cook books, and more.',
    'Recipe', 2
union select
     (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'usgovdb',
    'US Gov', 'The US Gov Database has all our 45 presidents, 52 states, presidential executive orders, US Departments, US Budget and more.',
    'RecordKeeper', 3
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'bookstoredb',
    'Book Store', 'The Book store database consists of 6 authors, 8 genres, 10 books, many store shelves, 3 stores, and more. ',
    'Bookstore', 4

--architechture
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'cpuframework',
    'CPUFramework', 'When writing programs, it is essential to create and work with a framework.
     A framework is a project where common and re-usable code is stored. It is written in a way that it can be used anywhere at anytime. 
     Code such as logins, connection strings and data types are just a few of the many components written up in a framework.',
    'CPUFramework', 5
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'cpuexception',
    'CPUException', 'bizUserLogin is an inherited class of bizObject that is included in CPUFramework. It allows users to enter login.',
    'CPUFramework', 6
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'sqlutility',
    'SQLUtility', 'SQLUtility is a module where general utilites are written up so that they can be used for any program. 
     It sets up connection strings, gets a data table from a stored procedure or a sql statement, parses out the error messages from the constraints, and much more.',
    'CPUFramework', 7
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'bizObject',
    'bizObject', 'Business objects are written as an inheritance of a bizObject which is written up in the framework. 
     Business Objects are what make the system blend with the data from the database. 
     For every project, a unique library of business objects is formed to work with its specific data.',
    'CPUFramework', 8
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'bizuser',
    'bizUser', 'bizUserLogin is an inherited class of bizObject that is included in CPUFramework. It allows users to enter login.',
    'CPUFramework', 9

--windows
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'gametoolkit',
    'Game Toolkit', 'Game Toolkit is an architecture with objects, methods, and procedures that allows programmers to create games based on moving pieces and a player.',
    'cabadia', 10
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'tictactoe',
    'Tic-Tac-Toe', 'A game created using C#. One or two players seek in alternate turns to complete a row, a column, or a diagonal with either three O''s or three X''s drawn in the spaces of a grid of nine squares.',
    'TicTacToeApp', 11
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'memory',
    'Memory', 'A game created using C#. The player will start the game by flipping a card. Then try to find another card that has the same image as the first. If the plkayer can''t find a pair, the flipped cards will be flipped back with the face down.',
    'MemoryGame', 12
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'flipacoin',
    'Flip a Coin', 'A game created used to solve a dispute between two parties. 
    This is a virtual coin toss, coin virtually flips using a timer an lands on a random coin side.',
    'HeadsTails', 13
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'definiciando',
    'Definiciando', 'A game created used to solve a dispute between two parties. 
    This is a virtual coin toss, coin virtually flips using a timer an lands on a random coin side.',
    'Definiciando', 14

--web 
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'portfolioweb',
    'Portfolio Website', 'This Portfolio website was created using ASP.Net, CSS, HTML styles,bootstrap, and JQuery.',
    'Portfolio', 15
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'usgovweb',
    'US Gov Website', 'The U.S. Government website was created using ASP.Net, CSS, HTML styles,bootstrap, and JQuery.',
    'RecordKeeper', 16
    
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'recipeweb',
    'Recipe Website', 'This recipe website was created using MVC, with HTML styles, and bootstrap.',
    'Recipe', 17
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'tictactoeweb',
    'Tic-Tac-Toe Website', 'The Tic-Tac-Toe web game was created using HTML styles, JavaScript, and JQuery.',
    'TicTacToeApp', 18
    
--mobileapp
--union
--select d.DevSectionId, 'Record Keeper App', 'recordkeeperapp', 'The record keeper app front end gives users the ability to view, edit and maintain information about the US Federal government. This was implemented using the CPU Framework architecture and business objects.', 1 from DevSection d where d.DevSectionCode = 'mobileapp'
--union
--select d.DevSectionId, 'Recipe App', 'recipeapp', 'The recipe app front end gives users the ability to view, edit and maintain recipe information. This was implemented using the CPU Framework architecture and business objects.', 2 from DevSection d where d.DevSectionCode = 'mobileapp'

;
with x as (
    select s.DevSectionCode, d.*
    from DevSubsection d
    join DevSection s 
    on s.DevSectionId = d.DevSectionId
    )
insert DevSubsectionElement(DevSubsectionId, DevSubsectionElementCode, ButtonText, HtmlTag, FileExtension, DevSubsectionElementPriority)
select  x.DevSubsectionId, 'dbschema', 'Schema Diagram', 'img', '.png', 3 from x where x.DevSectionCode = 'db' 
union select  x.DevSubsectionId, 'scriptsql', 'SQL Script', 'iframe', '.html', 2 from x where x.DevSectionCode = 'db'
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'db'

union select x.DevSubsectionId, 'trysql', 'Try Sql', 'trysql', '', 4 from x where x.DevSectionCode = 'db'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x where x.DevSectionCode = 'architecture' 

union select  x.DevSubsectionId, 'scriptcsharp', 'See Code', 'iframe', '.html', 2 from x where x.DevSectionCode = 'architecture' and x.DevSubsectionCode <> 'cpuframework'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x  where x.DevSectionCode = 'desktopapp' 
union select  x.DevSubsectionId, 'download', 'Download and Run App', 'zip', '.zip', 2 from x where x.DevSectionCode = 'desktopapp'
union select x.DevSubsectionId, 'video', 'Watch Video', 'video', '.mp4', 2 from x where x.DevSectionCode = 'desktopapp'

union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'desktopapp'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 2 from x where x.DevSectionCode = 'web' 
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'web'
union select  x.DevSubsectionId, 'website', 'View Website', 'web', 'a', 3 from x where x.DevSectionCode = 'web'

union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 2 from x where x.DevSectionCode = 'mobileapp' 
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 1 from x where x.DevSectionCode = 'mobileapp'
union select  x.DevSubsectionId, 'app', 'Open App', 'app', 'a', 3 from x where x.DevSectionCode = 'mobileapp'
;

insert DevSubSectionTool(DevSubsectionId, DevToolId)
--db
select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('portfoliodb', 'usgovdb', 'recipedb', 'bookstoredb')   and t.DevtoolName in('CRUD with Stored Procedures', 'Database Schema Design', 'Requirement Analysis', 'SQL', 'SQL Server', 'Git', 'GitHub') 

--architecture
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('cpuframework', 'bizObject', 'sqlutility', 'cpuexception', 'bizuser')  and t.DevtoolName in ('Framework', 'Unit Testing','Dapper','C#', 'Git', 'GitHub')

--windows
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('gametoolkit', 'tictactoe', 'memory', 'flipacoin', 'definiciando')  and t.DevtoolName in ('C#', 'Git', 'GitHub', 'Wire Framing', 'Desktop Apps', 'Cloud Computing')

--web
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('portfolioweb' ,'usgovweb', 'recipeweb', 'tictactoeweb')  and t.DevtoolName in ('HTML','CSS','JQuery', 'ASP.Net', 'Bootstrap', 'C#', 'React', 'JavaScript', 'Stored Procedures', 'Cloud Computing', 'Git', 'GitHub', 'Wire Framing', 'Dapper', 'Framework')

insert DevSubsectionQuery(DevSubsectionId, DevSubsectionQueryCaption, DevSubsectionQueryText, DevSubsectionQuerySequence)
select s.DevSubsectionId, 'count of presidents', 'select count(*) from president', 0 from DevSubsection s where s.DevSubsectionCode = 'RecordKeeperDB'
union 
select s.DevSubsectionId, 'list of presidents', 'select * from president', 1 from DevSubsection s where s.DevSubsectionCode = 'RecordKeeperDB'
union 
select s.DevSubsectionId, 'count of dev tools', 'select count(*) from DevTool', 0 from DevSubsection s where s.DevSubsectionCode = 'PortfolioDB'
union 
select s.DevSubsectionId, 'list tools', 'select * from DevTool', 1 from DevSubsection s where s.DevSubsectionCode = 'PortfolioDB'
