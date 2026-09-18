DO $$
DECLARE
    twentieth CURSOR FOR
        SELECT *
        FROM emp.emp
        WHERE deptno = 20
        ORDER BY hiredate;
    r record;

    firstFlag boolean = true;
BEGIN
    FOR r in twentieth LOOP
        RAISE NOTICE 'Имя: %', r.ename;
        if firstFlag THEN
            RAISE NOTICE 'первый в списке';
            firstFlag = false;
        END IF;
        if EXTRACT(YEAR FROM r.hiredate) = 1980 THEN
            RAISE NOTICE 'принят в год открытия отдела';
        END IF;
        if r.sal >= 3000 THEN
            RAISE NOTICE 'получает повышенную ЗП';
        END IF;
    END LOOP;
END;
$$