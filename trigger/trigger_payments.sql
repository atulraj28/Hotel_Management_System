create or replace trigger bfpayments
before insert on payments for each row
declare
begin
	if(:new.cust_id is null or :new.type is null or :new.pay_date is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/