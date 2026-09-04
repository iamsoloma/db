DO $$
DECLARE
    vStroke constant VARCHAR(8) := 'Сентябрь'; 
    vFlag BOOLEAN := false;
BEGIN
    if vStroke LIKE '%е%' THEN
      vFlag = true;
    END IF;

    if vFlag THEN
        RAISE NOTICE 'Слово % содержит букву е', vStroke;
    ELSE
        RAISE NOTICE 'Слово % не содержит букву е', vStroke;
    END IF;
END;
$$;
