ALTER table emp3
DISABLE TRIGGER trig_insert_and_delete;

ALTER table emp3
DISABLE TRIGGER trig_update_comm;

SELECT tgname, tgenabled
FROM pg_trigger
WHERE tgrelid = 'emp3'::regclass
AND NOT tgisinternal
ORDER BY tgname;