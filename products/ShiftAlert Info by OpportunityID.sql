/**************************************************************************************************************
* Script: Show ShiftAlert by OpportunityID
*
* PURPOSE: 
*      - This script will show you what shiftalerts, opportunity, shift, assignment, and profile an 
*        opportunty has been filled, canceled, closed, etc.
*      
*
* NOTES: 
*      - For this script you need to find the OpportunityID in question. If users are saying that the
*        shift alert isn't being received or updating the schedule editor. 
*
*      - Example
*        You will need to run 'select * from Opportunity order by DateOpptyCreated desc' to see the most 
*        recent opportunities on top it might help you find it easier. 
*
*		 Once you have the opportunityid put it in the script below and press F5 or Execute.
*        
*
***************************************************************************************************************/

DECLARE @OpportunityID INT

SET @Opportunityid = 87845  -- <--Put the OpportunityID Here

SELECT Opportunity.OpportunityID
	,Opportunity.DateOpptyCreated
	,Opportunity.DateOfNeed
	,Opportunity.STATUS
	,Opportunity.ProfileID
	,PROFILE.ProfileName
	,Opportunity.ShiftID
	,Shift.ShiftName
	,Shift.Abbr
	,Shift.StartTime
	,Shift.EndTime
	,Assignment.AssignID
	,Assignment.AssignName
	,Assignment.Abbr AS AssignAbbr
	,OpportunityNeed.OpportunityNeedID
	,OpportunityNeed.ModifiedBy
	,TDUser.UserName
	,OpportunityNeed.ModifiedDateTime
	,ShiftAlert.ShiftAlertID
	,ShiftAlert.ShiftexID
	,ShiftAlert.DateTimeGenerated
	,ShiftAlert.DateTimeFilled
	,ShiftAlert.DateTimeToExpire
	,ShiftAlert.STATUS AS ShiftAlertStatus
	,ShiftAlert.AddingUserID
	,ShiftAlert.CancellingUserID
	,TDUser.UserName
	,ShiftAlert.DateTimeCancelled
	,ShiftAlert.MaximumPositions
	,ShiftAlert.NumberOfPositions
FROM Opportunity
INNER JOIN Shift ON Opportunity.ShiftID = Shift.ShiftID
INNER JOIN PROFILE ON Opportunity.ProfileID = PROFILE.ProfileID
	AND Shift.ProfileID = PROFILE.ProfileID
INNER JOIN Assignment ON Shift.AssignID = Assignment.AssignID
	AND PROFILE.ProfileID = Assignment.ProfileID
INNER JOIN OpportunityNeed ON Opportunity.OpportunityID = OpportunityNeed.OpportunityID
INNER JOIN ShiftAlert ON Opportunity.OpportunityID = ShiftAlert.OpportunityID
INNER JOIN TDUser ON Opportunity.ModifiedBy = TDUser.TDUser_ID
	AND OpportunityNeed.ModifiedBy = TDUser.TDUser_ID
WHERE (Opportunity.OpportunityID = @OpportunityID)
