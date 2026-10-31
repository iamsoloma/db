DROP FUNCTION IF EXISTS CountOfWorkers(SMALLINT, SMALLINT, SMALLINT);

CREATE OR REPLACE FUNCTION CountOfWorkers(dept IN SMALLINT, countOfEmp OUT SMALLINT, deptsFounded INOUT SMALLINT) --RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE 
BEGIN
    SELECT COUNT(*) INTO countOfEmp
    FROM emp.emp as e 
    WHERE e.deptno = dept;

    IF countOfEmp != 0 THEN
         deptsFounded = deptsFounded + 1;
    END IF;

    --return counter;
END $$;

DO $$
DECLARE
    vRes TEXT = '';
    vFoundDepts SMALLINT = 0;
    vEmpCount SMALLINT = 0;
BEGIN
    FOR i in 20..40 by 10 LOOP
        
        SELECT countOfEmp, deptsFounded 
        INTO vEmpCount, vFoundDepts
        FROM CountOfWorkers(i, vFoundDepts);

        vRes = vRes || format('в отделе %s работает/ют %s сотрудника/ов,%s', i, vEmpCount, E'\n');
    END LOOP;


    RAISE NOTICE 'Найдено в % отделах/е', vFoundDepts;
    RAISE NOTICE '%', vRes;
END $$;