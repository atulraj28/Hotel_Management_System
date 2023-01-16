create or replace trigger bfemployee
before insert on employee for each row
declare
begin
	if(:new.fname is null or :new.lname is null or :new.job_dept is null or :new.address is null or :new.contact is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/