CREATE UNIQUE INDEX IF NOT EXISTS idx_deptno on emp.newdept(deptno);
DROP INDEX IF EXISTS emp.idx_deptno;

DELETE FROM emp.newdept WHERE deptno = 60;