DO $$
    DECLARE
    BEGIN
        CALL emp.increaseSal(10, 2, 'emp','emp', 'sal');
         CALL emp.increaseSal(20, 20, 'emp','emp', 'sal');
END $$;

UPDATE emp.emp
SET sal = CASE empno
    WHEN 7839 THEN 5000
    WHEN 7782 THEN 2450
    WHEN 7934 THEN 1300
END
WHERE empno IN (7839, 7782, 7934);

UPDATE emp.emp
SET sal = CASE empno
    WHEN 7902 THEN 3000
    WHEN 736 THEN 800
    WHEN 7788 THEN 3000
    WHEN 7876 THEN 1100
END
WHERE empno IN (7902, 736, 7788, 7876);
