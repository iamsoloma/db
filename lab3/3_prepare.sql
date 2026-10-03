ALTER TABLE emp.dept ADD COLUMN IF NOT EXISTS loc text;
UPDATE emp.dept SET loc = 'NEW YORK' WHERE deptno = 10;
UPDATE emp.dept SET loc = 'DALLAS' WHERE deptno = 20;
UPDATE emp.dept SET loc = 'CHICAGO' WHERE deptno = 30;
UPDATE emp.dept SET loc = 'BOSTON' WHERE deptno = 40;

CREATE TABLE IF NOT EXISTS emp.newdept (
    deptno integer,
    dname text,
    loc text
);

-- Разное поведение будет
INSERT INTO emp.dept (deptno, dname, loc) VALUES (33, 'SAMPLE_DEPT', 'WHERE');

DELETE FROM emp.dept WHERE deptno = 33;