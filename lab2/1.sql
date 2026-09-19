DO $$
DECLARE
    avgSal NUMERIC;
BEGIN
    SELECT ROUND(AVG(sal), 0) into avgSal 
    from emp.emp 
    where deptno = 20;

    RAISE NOTICE 'Средняя зп в 20 отделе: %', avgSal;
END;
$$