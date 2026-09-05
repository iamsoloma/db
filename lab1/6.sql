DO $$
DECLARE
    vStroke VARCHAR(11) := 'Hello work!';
BEGIN
    if vStroke is NULL THEN
        RAISE NOTICE 'Переменная не содержит никаких значений';
    ELSE
        RAISE NOTICE 'Переменная содержит значение: %', vStroke;
    END IF;
END;
$$;