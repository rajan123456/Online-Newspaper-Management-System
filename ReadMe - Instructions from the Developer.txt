The Folder Roles contains the Online Newspaper Management System (ONMS) Web Application.
ONMS.sql is a script file to be loaded onto MS SQL Server 2012 to get the ONMS database imported.

The application uses membership and roles to restrict viewing certain web pages based on user login details.

New users registered at run-time are grouped under All Users and DO NOT HAVE ACCESS to AdminPages, JournalistPages, EditorPages
For the purpose of accessing these pages, the following test data should be used. More data can be added by selecting (in MS Visual Studio 2012)
->Project -> ASP.NET Configuration
  Click on Security
  Register a user and assign a role by checking the checkboxes to the right.
  
Test Data - Registered Users

Username      Password      Role

rawalpindi    slowbowler    User

barkha_dutt   ndtv24x7      Journalist

prannoy_roy   ndtvowner     Journalist

arnab_goswami timesnow      Editor

rajan_gupta   administrator Admin


Finally, the connection string in the web config file would need to be updated as the system and server name of the executing system would change.

The project uses two connection string, the "DefaultConnection" string would not require any updation.
The "ServerConnection" string should be updated by finding the right string by right-clicking on the database ONMS(imported from ONMS.sql) in the SQL SERVER OBJECT EXPLORER -> "YOURPCSERVERNAME" -> Datbases -> ONMS and viewing its properties to find the connection string attribute. Copy this string and replace the ServerConnection string in the project's Web.Config file to run the code properly.

Further queries, Contact RAJAN GUPTA - 8220154542