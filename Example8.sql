CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit(employeeNumber,lastname,changedat,action) values(
 OLD.employeeNumber,OLD.lastname,now(),'update');
 
 -- SET action = 'update',
  --   employeeNumber = OLD.employeeNumber,
   --  lastname = OLD.lastname,
   --  changedat = NOW();