create or replace trigger bftransactions
before insert on transactions for each row
declare
begin
	if(:new.cust_id is null or :new.emp_id is null or :new.reser_id is null or :new.trans_date is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/