COMMENT ON TABLE person_discounts IS 'Таблица для управления персонализированными скидками для частных лиц и пиццерий.';

COMMENT ON COLUMN person_discounts.id IS 'Основной идентификатор записи.';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор человека.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии.';
COMMENT ON COLUMN person_discounts.discount IS 'Процентная скидка применяется к посетителю указанной пиццерии.';
