CREATE OR REPLACE FUNCTION f_trig_insert_and_delete()
RETURNS trigger 
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO mylog( tablename, actname, operdate, trigname) 
        VALUES (TG_TABLE_NAME, TG_OP, now(), TG_NAME);
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO mylog( tablename, actname, operdate, trigname) 
        VALUES (TG_TABLE_NAME, TG_OP, now(), TG_NAME);
    END IF;
    RETURN NULL;
END 
$$;

DROP TRIGGER IF EXISTS trig_insert_and_delete ON emp3;

CREATE trigger trig_insert_and_delete 
    AFTER INSERT or DELETE ON emp3
    FOR EACH STATEMENT
    EXECUTE FUNCTION f_trig_insert_and_delete();

ALTER table emp3
ENABLE TRIGGER trig_insert_and_delete;