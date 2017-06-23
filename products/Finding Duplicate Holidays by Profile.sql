/**************************************************************************************************************
* Script: See below - Find Duplicate Holiday for a profile
*
* PURPOSE: 
*      - Receiving an error when trying to run schedule reports about duplicate holiday
*      
*
* NOTES: 
*      - This script will Find Duplicate Holidays.
*
*      - Example
*        If find duplicate holiday(s), one needs to be deleted in order to run Schedule Reports in Clairvia Web.
*        To find the profile ID, you want to run Select * From Profile where ProfileName like '%Name%' and pull the correct Profile ID from the results.
*
*
*
*
***************************************************************************************************************/

select distinct HolidayDate, Count(HolidayDate) from HolidayDate 
where ProfileID = XXXX
Group By HolidayDate 
Order by Count(HolidayDate) desc