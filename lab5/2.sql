---DROP FUNCTION IF EXISTS public.getmaxsal(odeptno numeric, OUT omaxsal numeric, OUT odname text);


CREATE OR REPLACE FUNCTION emp.GetMaxSal(oDeptNo IN NUMERIC, oMaxSal OUT NUMERIC, oDname OUT TEXT) 
LANGUAGE plpgsql AS $$
BEGIN
    SELECT ROUND(MAX(e.sal)), d.dname
    INTO oMaxSal, oDname
    FROM emp.emp as e
    JOIN emp.dept as d ON e.deptno = d.deptno
    WHERE e.deptno = oDeptNo
    GROUP BY d.dname;
END $$;

DO $$
DECLARE
    vMaxSal SMALLINT = 0;
    vDeptName TEXT = '';
BEGIN

    SELECT oMaxSal, oDname  INTO vMaxSal, vDeptName FROM emp.GetMaxSal(10);

    RAISE NOTICE 'Максимальная зарплата в отделе % = %', vDeptName, vMaxSal;
END $$;