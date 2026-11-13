CREATE OR REPLACE FUNCTION f_trig_update_comm()
RETURNS trigger 
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO mylog( tablename, actname, operdate, trigname) 
    VALUES (TG_TABLE_NAME, 'New comm bigger then old', now(), TG_NAME);
    RETURN NULL;
END 
$$;

DROP TRIGGER IF EXISTS trig_update_comm ON emp3;

CREATE trigger trig_update_comm 
    AFTER UPDATE OF comm ON emp3
    FOR EACH ROW
    WHEN (COALESCE(NEW.comm,0) > COALESCE(OLD.comm, 0))
    EXECUTE FUNCTION f_trig_update_comm();

ALTER table emp3
ENABLE TRIGGER trig_update_comm;