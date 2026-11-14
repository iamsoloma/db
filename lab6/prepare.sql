CREATE TABLE IF NOT EXISTS mylog (
    tablename VARCHAR(30),
    actname VARCHAR(30),
    operdate TIMESTAMP,
    trigname VARCHAR(30)
)

CREATE TABLE IF NOT EXISTS emp3 (
    empno integer NOT NULL,
    ename text NOT null,
    job text NOT null,
    mgr integer,
    hiredate date,
    sal integer NOT NULL,
    comm integer,
    deptno integer NOT NULL
);