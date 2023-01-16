create or replace trigger bfreservation
before insert on reservation for each row
declare
begin
	if(:new.cust_id is null or :new.room_id is null or :new.reser_date is null or :new.date_in is null or :new.date_out is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/