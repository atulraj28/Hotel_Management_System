create or replace trigger bfroom_class
before insert on room_class for each row
declare
begin
	if(:new.name is null or :new.price is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/