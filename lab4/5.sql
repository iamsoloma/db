DO $$
DECLARE

    --Отдел - Сотрудник - ЗП
    vEMP jsonb := '{
        "SALES": {"7900":950},
        "RESEARCH": {"736":800,"7876":1100},
        "ACCOUNTING": {"7934":1300}
    }';

    vDept record;
    vEmpl record;
BEGIN
    FOR vDept IN SELECT key, value FROM jsonb_each(vEMP) LOOP
        FOR vEMPL IN SELECT key, value FROM jsonb_each_text(vDept.VALUE) LOOP
            RAISE NOTICE 'Сотрудник номер % работает в отделе % и получает %', vEmpl.KEY, vDept.KEY, vEmpl.VALUE;
        END LOOP;
    END LOOP;
END $$;