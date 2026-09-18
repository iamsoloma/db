DO $$
DECLARE
    bests CURSOR FOR
        SELECT empno, ename, sal
        FROM emp.emp
        ORDER BY sal DESC
        LIMIT 5;
    r record;
BEGIN
    FOR r in bests LOOP
        /*RAISE NOTICE '% % %', r.empno, r.ename, r.sal;*/
        INSERT INTO emp.messages (numcol1, charcol1, numcol2)
        VALUES (r.empno, r.ename, r.sal);
    END LOOP;
END;
$$