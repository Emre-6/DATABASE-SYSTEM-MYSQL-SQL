DELIMITER //
CREATE PROCEDURE FindEmployeeOffice(
out output text
)
BEGIN
declare counter int default 0;
declare OutputValues text default '';
declare temp int;
while counter < 10 do
select officeCode
into temp
from employees limit 1;
set counter = counter + 1;
set OutputValues = concat(OutputValues,' ',temp);   
end while;
set output = OutputValues;
END
DELIMITER ;