TRUNCATE mylog;
TRUNCATE emp3;

INSERT INTO emp3
(empno, ename, job, mgr,hiredate, sal, comm, deptno)
VALUES 
(1, 'Петя', 'FOUNDER', NULL, '2026-01-31', 50000, 0, 1),
(2, 'Саня', 'Manager', 1, '2026-05-10', 10000, 500, 1),
(3, 'Ваня', 'Cleaner', 2, '2026-07-22', 5000, 5000, 1),
(4, 'Миша', 'Cleaner', 2, '2026-07-22', 5000, NULL, 1);

DELETE FROM emp3 WHERE empno = 2;

UPDATE emp3 SET comm = 1000;

SELECT * FROM mylog;
SELECT * FROM emp3;