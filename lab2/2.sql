DO $$
DECLARE
    sals CURSOR FOR
        SELECT deptno, AVG(sal) as avgSal
        from emp.emp
        GROUP BY emp.deptno
        ORDER BY emp.deptno;
    r record;
BEGIN
    FOR r in sals LOOP
        /*RAISE NOTICE 'Отдел %: %', r.deptno, r.avgSal;*/
        INSERT INTO emp.messages (numcol1, numcol2)
        VALUES (r.deptno, r.avgSal);
    END LOOP;
END;
$$

-- Явный курсор
DO $$
DECLARE
    sals CURSOR FOR
        SELECT deptno, AVG(sal) as avgSal
        from emp.emp
        GROUP BY emp.deptno
        ORDER BY emp.deptno;
    vDeptNo Numeric;
    vAvgSal Numeric;
BEGIN
    OPEN sals;
    LOOP
        FETCH sals INTO vDeptNo, vAvgSal;
            EXIT WHEN NOT FOUND;
            /*RAISE NOTICE 'Отдел %: %', vDeptNo, vAvgSal;*/
            INSERT INTO emp.messages (numcol1, numcol2)
            VALUES (vDeptNo, vAvgSal);
        END LOOP;
    CLOSE sals;
END;
$$