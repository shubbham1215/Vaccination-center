SELECT * FROM society_maintenance.member;
SELECT * FROM society_maintenance.renter;
SELECT * FROM society_maintenance.premise_types;
SELECT * FROM society_maintenance.premise;
SELECT * FROM society_maintenance.ledger;
SELECT * FROM society_maintenance.transaction;

#findledgerDetailsByMember
SELECT m.id,m.firstName,m.lastName,l.dueAmount,l.dueDate
from society_maintenance.ledger l
inner join society_maintenance.member m on l.memberId=m.id
where l.memberId=17;

#findPendingDuesAllMembers
SELECT l.id,m.firstName,m.lastName,m.phone,l.dueAmount,l.dueDate
FROM society_maintenance.ledger l
INNER JOIN society_maintenance.member m on l.memberId=m.id
WHERE IF(DATEDIFF(l.dueDate,CURDATE()) >=  0, null , l.memberId) is not null;

#updateDueDate for 1 Month
update society_maintenance.ledger
set dueDate= dueDate + INTERVAL 1 MONTH
where memberId=17;

#updateDueDateByOneYear for 1 Year
update society_maintenance.ledger
set dueDate= dueDate + INTERVAL 1 YEAR
where memberId=17;

#updateDueAmount After member has paid dues
update society_maintenance.ledger l
inner join society_maintenance.member m  on l.memberId=m.id
inner join society_maintenance.premise p on p.memberId=m.id
inner join society_maintenance.premise_types pt on p.premiseTypeId=pt.id
set l.dueAmount=CASE WHEN  ( p.renterId is null) Then pt.maintenanceFee
					ELSE  pt.maintenanceFee + 500 
				END
where l.memberId=17;

#createTransaction
INSERT INTO society_maintenance.transaction(amount,memberId) 
select dueAmount,memberId
from society_maintenance.ledger
where memberId =17;

#findMembersAndPremises
select m.*,p.premiseNo
from society_maintenance.premise p
inner join society_maintenance.member m on p.memberId=m.id;

#ownerExists
SELECT memberId FROM society_maintenance.premise where id=2 and memberId is not null ;


#Trigger to make an entry in ledger when member is linked to premise or increment dueAmount of renter when a renter is linked
delimiter //
	CREATE DEFINER=`root`@`localhost` TRIGGER `premise_AFTER_UPDATE` AFTER UPDATE ON `premise` FOR EACH ROW BEGIN

	IF (NEW.renterId IS NULL) THEN

	INSERT INTO society_maintenance.ledger(memberId)
	select NEW.memberId;

	select max(id) into @maxid from  society_maintenance.ledger;

	-- Update dueAmount

	update society_maintenance.ledger l
	inner join society_maintenance.member m  on l.memberId=m.id
	inner join society_maintenance.premise p on p.memberId=m.id
	inner join society_maintenance.premise_types pt on p.premiseTypeId=pt.id
	set l.dueAmount=pt.maintenanceFee
	where l.id=@maxid;
    
	-- Update dueDate
    
	select day(createdOn) into @day
	from society_maintenance.ledger l
	where id=@maxid;

	select year(CURDATE()),month(CURDATE()) into @year, @month;

	SELECT DATEDIFF(CONCAT( @year,"-",@month,"-10"),CURDATE()) into @DATEDIFF;

    -- If DATEDIFF is positive due to date is for 10th of this month else due date in on 10th of next month
	SELECT IF(@DATEDIFF >  1, CONCAT( @year,"-",@month,"-10"), cast(NOW() as date) + INTERVAL 1 MONTH + INTERVAL @DATEDIFF Day) into @dueDate;

	update society_maintenance.ledger
	set dueDate= @dueDate
	where id=@maxid;
    
    ELSE
		update society_maintenance.ledger
		set dueAmount=dueAmount+500
		where memberid=NEW.memberId;
	END IF;
END
 delimiter ;


 
#SP  updatePendingDues which should be scheduled daily to update due amount if not paid till 10th   
delimiter //      
  
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePendingDues`()
BEGIN

	-- If DATEDIFF is negative add 1.5% interest daily to existing dueAmount
    
	update society_maintenance.ledger
	set dueAmount=IF(DATEDIFF(dueDate,CURDATE()) >=  0, dueAmount, dueAmount +(dueAmount*0.015 ));
    
END      

delimiter ;  



SELECT DATEDIFF(dueDate,CURDATE())
FROM society_maintenance.ledger l
inner join society_maintenance.member m on l.memberId=m.id
where IF(DATEDIFF(l.dueDate,CURDATE()) >=  0, null , l.memberId) is not null;

select m.*,p.premiseNo
from society_maintenance.premise p
inner join society_maintenance.member m on p.memberId=m.id;
