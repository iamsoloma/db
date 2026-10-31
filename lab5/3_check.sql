TRUNCATE table emp.messages;

CALL GetBonus(10, CURRENT_DATE);

SELECT m.numcol1 AS empno, e.sal AS old_sal, m.numcol2 AS new_sal
FROM emp.messages as m
JOIN emp.emp e ON m.numcol1 = e.empno;