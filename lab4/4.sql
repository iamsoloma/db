DO $$
DECLARE
    vDepts emp.dept[];
    vRec emp.dept;
BEGIN
    SELECT array_agg(d ORDER by d.deptno) INTO vDepts FROM emp.dept AS d;

    FOREACH vRec IN ARRAY vDepts LOOP
        RAISE NOTICE 'Номер отдела: %. Название отдела: %. Город: %', vRec.deptno, vRec.dname, vRec.loc;
    END LOOP;
END $$;
