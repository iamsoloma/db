DO $$
DECLARE
    vNum1 INTEGER = NULL;
    vNum2 INTEGER = 2;
    diff INTEGER;
BEGIN
    diff = ABS(coalesce(vNum2, 0) - coalesce(vNum1,0));
    RAISE NOTICE 'Разность 2 и 1 = %', diff;
END;
$$;
