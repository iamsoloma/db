DO $$
DECLARE
    vDate constant date = CURRENT_DATE;
    vYear Integer;
    vMonth INTEGER;
BEGIN
    vYear = EXTRACT(YEAR FROM vDate);
    vMonth = EXTRACT(MONTH FROM vDate);

    if vMonth < 7 THEN
        RAISE NOTICE 'Сейчас первое полугодие % года', vYear;
    else 
        RAISE NOTICE 'Сейчас второе полугодие % года', vYear;
    END IF;
END;
$$;
