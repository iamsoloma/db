DO $$
DECLARE
    vStartMonth DATE := date_trunc('month', current_date);
    vStartNextMonth DATE := vStartMonth + interval '1 month';
    
    vDays SMALLINT = 0;
BEGIN

    WHILE vStartMonth < vStartNextMonth LOOP
        vStartMonth = vStartMonth + INTERVAL '1 day';
        vDays = vDays + 1;
    END LOOP;

    RAISE NOTICE 'в днях = %', vDays;
END $$;