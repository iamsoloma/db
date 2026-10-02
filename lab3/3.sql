DO $$
DECLARE
    r record;
BEGIN
    FOR r in SELECT deptno, dname, loc from emp.dept
    LOOP
        IF r.deptno <> 33 THEN
            INSERT INTO emp.newdept (deptno, dname, loc) VALUES(r.deptno, r.dname, r.loc);
        ELSE
            RAISE EXCEPTION 'найден номер отдела 33' USING ERRCODE='STOP1';
        END IF;
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Прерывание[%]:%', SQLSTATE, SQLERRM;
END;
$$