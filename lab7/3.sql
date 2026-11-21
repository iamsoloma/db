CREATE OR REPLACE PROCEDURE dept_report(p_include_salgrade boolean) 
LANGUAGE plpgsql
AS $$
DECLARE
    vQuery text;
    rec record;
    vTotalDepts int := 0;
    vTotalEmps int := 0;
    vTotalSal numeric := 0;
BEGIN
    vQuery := 'SELECT d.deptno, d.dname, 
                       COUNT(e.empno) as emp_count, 
                       ROUND(AVG(e.sal), 0) as avg_sal, 
                       SUM(e.sal) as total_sal';

    IF p_include_salgrade THEN
        vQuery := vQuery || ', MAX(s.grade) as max_grade';
    END IF;

    vQuery := vQuery || ' 
    FROM emp.dept d JOIN emp.emp e ON d.deptno = e.deptno';

    IF p_include_salgrade THEN
        vQuery := vQuery || ' 
        JOIN emp.salgrade s ON e.sal BETWEEN s.losal AND s.hisal';
    END IF;

    vQuery := vQuery || ' 
    GROUP BY d.deptno, d.dname';

    RAISE NOTICE 'Запрос: %', vQuery;

    FOR rec IN EXECUTE vQuery LOOP
        IF rec.emp_count = 0 THEN
            RAISE NOTICE 'Пропускаем отдел % (%), нет сотрудников.', rec.deptno, rec.dname;
        ELSE
            vTotalDepts := vTotalDepts + 1;
            vTotalEmps := vTotalEmps + rec.emp_count;
            vTotalSal := vTotalSal + rec.total_sal;

            IF p_include_salgrade THEN
                RAISE NOTICE 'Отдел % (%): Сотрудников: %, Ср. ЗП: %, Фонд: %, Макс. грейд: %', 
                             rec.deptno, rec.dname, rec.emp_count, rec.avg_sal, rec.total_sal, rec.max_grade;
            ELSE
                RAISE NOTICE 'Отдел % (%): Сотрудников: %, Ср. ЗП: %, Фонд: %', 
                             rec.deptno, rec.dname, rec.emp_count, rec.avg_sal, rec.total_sal;
            END IF;
        END IF;
    END LOOP;

    -- Вывод итогов по компании
    RAISE NOTICE '========================================';
    RAISE NOTICE 'ИТОГ ПО КОМПАНИИ:';
    RAISE NOTICE 'Отделов с сотрудниками: %', vTotalDepts;
    RAISE NOTICE 'Общее число сотрудников: %', vTotalEmps;
    RAISE NOTICE 'Общий фонд оплаты труда: %', vTotalSal;
    RAISE NOTICE '========================================';
END;
$$;