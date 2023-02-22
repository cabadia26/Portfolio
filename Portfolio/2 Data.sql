use PortfolioDB
go 

delete DevSubsectionQuery
delete DevSubsectionTool
delete DevSubsectionElement
delete DevSubSection
delete DevSectionTool
delete DevSection
delete DevTool 
delete DevToolType
delete Profile

insert Profile(FirstName, LastName, EmailAddress, PhoneNumber, GitHubAccount, ProfileDesc, HasResume)
select 'Camille', 'Abadia', 'Cabadia26@gmail.com', '347-698-9590', 'https://github.com/cabadia26', 
'I am a software developer who was trained in CPU Code School to produce top quality software. 
I am proficient in the full stack of software development, from requirements gathering to implementation of database, middle tier, and front end. 
This is done through the use of SQL Server, VB.Net, C#, ASP.Net, HTML, Bootstrap, Java Script, JQuery and more. 
Databases and websites are deployed to the cloud using Microsoft Azure. 
In fact, this website portfolio uses all the aforementioned technologies as described in each section. ', 1

insert DevToolType(DevToolTypeCode,DevToolTypeName, DevToolTypeSequence, ShowOnHomePage)
select 'language', 'My Skills', 0, 1
union select 'skill', 'My Tools and Technologies', 1, 1

;
with x as (
 select t.DevToolTypeId, t.DevToolTypeCode from DevToolType t
)
insert DevTool(DevToolName, DevToolSequence, DevToolTypeId, HasIcon)
select 'SQL Server', 1, x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'SQL', 2 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'C#', 3 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'JavaScript', 4 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'ASP.Net', 5 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'HTML', 6 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'Bootstrap', 7 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'CSS', 8 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'JQuery', 9 , x.DevToolTypeId, 1 from x where x.DevToolTypeCode = 'language'
union select 'React', 10 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'language'
union select 'Requirement Analysis', 11 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Database Schema Design', 12 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'CRUD', 13 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Stored Procedures', 14 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Desktop Apps', 15 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Unit testing', 16 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Framework', 17 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Cloud Computing', 18 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'GIT', 19 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'GitHub', 20 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Wire Framing', 21 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'
union select 'Dapper', 22 , x.DevToolTypeId, 0 from x where x.DevToolTypeCode = 'skill'

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
       'mobile', 'Mobile Apps',
       'Mobile apps created using...',
       'Mobile apps created using...',
       0, 5

insert DevSectionTool(DevSectionId, DevToolId)
--database
select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'SQL Server' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Requirement Analysis' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Relational Database Schema Design' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'CRUD' and s.DevSectionCode = 'db' 
union select s.DevSectionId, t.DevToolId from DevTool t cross join DevSection s where t.DevToolName = 'Stored Procedures' and s.DevSectionCode = 'db' 

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
    'cabadia', 1
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'recipedb',
    'Recipe', 'The Recipe Database has a list of 20 recipes, 12 different chefs, international cuisines, using a variety of ingredients, including steps of creating the recipe, meal courses, 3 cook books, and more.',
    'cabadia', 2
union select
     (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'usgovdb',
    'US Gov', 'The US Gov Database has all our 45 presidents, 52 states, presidential executive orders, US Departments, US Budget and more.',
    'cabadia', 3
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Database Schema'),  'bookstoredb',
    'Book Store', 'The Book store database consists of 6 authors, 8 genres, 10 books, many store shelves, 3 stores, and more. ',
    'cabadia', 4

--architechture
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'cpuframework',
    'Framework and Business Objects', 'When writing programs, it is essential to create and work with a framework.
     A framework is a project where common and re-usable code is stored. It is written in a way that it can be used anywhere at anytime. 
     Code such as logins, connection strings and data types are just a few of the many components written up in a framework.',
    'cabadia', 5
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'bizObject',
    'bizObject', 'Business objects are written as an inheritance of a bizObject which is written up in the framework. 
     Business Objects are what make the system blend with the data from the database. 
     For every project, a unique library of business objects is formed to work with its specific data.',
    'cabadia', 6
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'sqlutility',
    'SQLUtility', 'SQLUtility is a module where general utilites are written up so that they can be used for any program. 
     It sets up connection strings, gets a data table from a stored procedure or a sql statement, parses out the error messages from the constraints, and much more.',
    'cabadia', 7
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Framework/Business Objects'),  'bizuser',
    'bizUser', 'bizUserLogin is an inherited class of bizObject that is included in CPUFramework. It allows users to enter login.',
    'cabadia', 8
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'gametoolkit',
    'Game Toolkit', 'Game Toolkit is an architecture with objects, methods, and procedures that allows programmers to create games based on moving pieces and a player.',
    'cabadia', 9

--windows
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'tictactoe',
    'Tic-Tac-Toe', 'A game created using C#. One or two players seek in alternate turns to complete a row, a column, or a diagonal with either three O''s or three X''s drawn in the spaces of a grid of nine squares.',
    'cabadia', 10
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'memory',
    'Memory', 'A game created using C#. The player will start the game by flipping a card. Then try to find another card that has the same image as the first. If the plkayer can''t find a pair, the flipped cards will be flipped back with the face down.',
    'cabadia', 11
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'flipacoin',
    'Flip a Coin', 'A game created used to solve a dispute between two parties. 
    This is a virtual coin toss, coin virtually flips using a timer an lands on a random coin side.',
    'cabadia', 12
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Windows Projects'),  'definiciando',
    'Definiciando', 'A game created used to solve a dispute between two parties. 
    This is a virtual coin toss, coin virtually flips using a timer an lands on a random coin side.',
    'Definiciando', 13

--web 
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'portfilioweb',
    'Portfolio Website', 'This Portfolio website was created using ASP.Net, CSS, HTML styles,bootstrap, and JQuery.',
    'cabadia', 14
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'usgovweb',
    'US Gov Website', 'The U.S. Government website was created using ASP.Net, CSS, HTML styles,bootstrap, and JQuery.',
    'cabadia', 15
    
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'recipeweb',
    'Recipe Website', 'This recipe website was created using MVC, with HTML styles, and bootstrap.',
    'cabadia', 16
union select  
    (select ds.DevSectionId from DevSection ds where ds.DevSectionName = 'Web Projects'),  'tictactoeweb',
    'Tic-Tac-Toe Website', 'The Tic-Tac-Toe web game was created using HTML styles, JavaScript, and JQuery.',
    'cabadia', 17

;
with x as (
    select s.DevSectionCode, d.*
    from DevSubsection d
    join DevSection s 
    on s.DevSectionId = d.DevSectionId
    )
insert DevSubsectionElement(DevSubsectionId, DevSubsectionElementCode, ButtonText, HtmlTag, FileExtension, DevSubsectionElementPriority)
select  x.DevSubsectionId, 'dbschema', 'Schema Diagram', 'img', '.png', 1 from x where x.DevSectionCode = 'db' 
union select  x.DevSubsectionId, 'sqlscript', 'SQL Script', 'iframe', '.html', 2 from x where x.DevSectionCode = 'db'
union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x where x.DevSubsectionCode = 'tictactoe'
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 2 from x where x.DevSubsectionCode = 'tictactoe'
union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x where x.DevSubsectionCode = 'memory'
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 2 from x where x.DevSubsectionCode = 'memory'
union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x where x.DevSubsectionCode = 'flipacoin'
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 2 from x where x.DevSubsectionCode = 'flipacoin'
union select  x.DevSubsectionId, 'wireframe', 'Wireframe', 'img', '.png', 1 from x where x.DevSubsectionCode = 'definiciando'
union select  x.DevSubsectionId, 'spec', 'Spec', 'iframe', '.html', 2 from x where x.DevSubsectionCode = 'definiciando'
;

insert DevSubSectionTool(DevSubsectionId, DevToolId)
--db
select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('portfoliodb', 'usgovdb', 'recipedb', 'bookstoredb')   and t.DevtoolName in('SQL', 'CRUD', 'Requirement Analysis','Relational Database Schema Design', 'Stored Procedures') 

--architecture
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('cpuframework', 'bizObject', 'sqlutility')  and t.DevtoolName in ('Framework', 'Unit testing','Dapper')

--windows
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('gametoolkit', 'tictactoewindows', 'memorywindows', 'flipacoinwindows', 'definiciandowindows')  and t.DevtoolName in ('C#', 'ASP.Net', 'Desktop Apps', 'Wire Framing','Dapper')

--web
union select s.DevSubsectionId, t.DevToolId
from DevSubsection s 
cross join DevTool t 
where s.DevSubsectionCode in ('portfolioweb' ,'usgovweb', 'recipeweb', 'tictactoeweb')  and t.DevtoolName in ('ASP.Net', 'C#', 'HTML', 'CSS', 'JavaScript', 'JQuery', 'React', 'Bootstrap', 'Cloud Computing using Microsoft Azure','Dapper')


insert DevSubsectionQuery(DevSubsectionId, DevSubsectionQueryCaption, DevSubsectionQueryText, DevSubsectionQuerySequence) 
select s.DevSubsectionId, 'Count of Presidents', 'select count(*) from president', 0 from DevSubsection s where s.DevSubsectionCode = 'RecordkeeperDB'
union 
select s.DevSubsectionId, 'List of Presidents', 'select * from president', 1 from DevSubsection s where s.DevSubsectionCode = 'RecordkeeperDB'
union 
select s.DevSubsectionId, 'Count of Developer Tools', 'select count(*) from devtool', 0 from DevSubsection s where s.DevSubsectionCode = 'PortfolioDB'
union 
select s.DevSubsectionId, 'List of Developer Tools', 'select * from devtool', 1 from DevSubsection s where s.DevSubsectionCode = 'PortfolioDB'