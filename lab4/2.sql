DO $$
DECLARE
    vCounter SMALLINT;
    vEditions SMALLINT := 0;
BEGIN
    FOR i IN 1..10 LOOP

    UPDATE emp.messages set numcol2 = i * 10 
    WHERE numcol1 = i;

    GET DIAGNOSTICS vCounter = ROW_COUNT;
    vEditions = vEditions + vCounter;
    RAISE NOTICE '[%]: % обновлений', i, vCounter;
    EXIT WHEN vCounter = 0;

    END LOOP;

    RAISE NOTICE '% обновлений', vEditions;
END $$;