/**************************************************************************************************************
* Script: Shows Count Assign for specific profile.
*
* PURPOSE: 
*      - This script will show you the count assign of the provided profile ID. 
*      
*
* NOTES: 
*      - Change the XX in RED with the profile you are needing to check the count assign messages for. 
*        The last 2 profile ID's should be the same. 
*
*        Correction to Count Assign problem occured in 8.3.0.8:
*        CVIA-4049: When a user attempts to open Schedule Editor for a particular profile for any date 
*        on or before June 25, 2013, the application terminates with the error message Clairvia.exe has 
*        stopped working.
*        
*        
*      - Example:
*
*        
*
***************************************************************************************************************/


select * from CountAssign 
where EmployeeID not in(select EmployeeID 
from EmployeeProfile where StartDateTime<= GETDATE() 
and EndDateTime>GETDATE() 
and TypeCode<>'TERM' 
and IsPrimary = 1 
and ProfileID = XX)  --enter profileid for profile that is failing 
and profileid = XX  --enter profileid for profile that is failing

--The last two ProfileID rows need to be the same number

