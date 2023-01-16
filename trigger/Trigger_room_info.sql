create or replace trigger bfroom_info
before insert on room_info for each row
declare
begin
	if(:new.room_type is null) then
		raise_application_error(-20001,'Please input value in all fields');
	end if;
end;
/