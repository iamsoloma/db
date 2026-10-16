SELECT emp.empno,
       emp.job,
       emp.sal,
       dept.dname
FROM emp.emp INNER JOIN emp.dept ON emp.deptno = dept.deptno
WHERE emp.job = 'CLERK'
LIMIT 1000;