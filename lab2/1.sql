DO $$
DECLARE
    avgSal NUMERIC;
BEGIN
    SELECT AVG(sal) into avgSal 
    from emp.emp 
    where deptno = 20;

    RAISE NOTICE 'Средняя зп в 20 отделе: %', avgSal;
END;
$$