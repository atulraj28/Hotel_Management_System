create or replace trigger bfcustomer
before insert on customer for each row
declare
begin
	if(:new.cfname is null or :new.clname is null or :new.creserv is null or :new.address is null or :new.contact is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/