/**************************************************************************************************************
* Script: Show Profile Mapping
*
* PURPOSE: 
*      - This script will show all of the mapping across all of the profiles within the database.
*      
*
* NOTES: 
*      - Simply copy and paste the script into a query window and run it. No need to modify the statement.
*
*
***************************************************************************************************************/



select FD.InternalFacilityID AS FacilityID, FD.Name AS FacilityName, FD.HL7Name, P.ProfileID, P.Abbr as ProfileAbbr, LD.ID AS LocationID, LD.DisplayName AS LocationName, UD.InternalUnitID AS UnitID, UD.Name AS UnitName,* from Profile P
    inner join MapProfileLocation MPL ON P.ProfileID = MPL.ProfileID
    inner join LocationDefinitions LD on MPL.LocationID = LD.ID
    inner join UnitDefinitions UD ON UD.LocationID = LD.ID 
    inner join FacilityDefinitions FD on UD.InternalFacilityID = FD.InternalFacilityID
ORDER BY P.Abbr, UD.Name