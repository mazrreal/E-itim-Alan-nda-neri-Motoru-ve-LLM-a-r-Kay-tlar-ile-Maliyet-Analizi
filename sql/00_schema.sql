-- Hafta 4: düz analiz tablosu (vize SQL pratiği)
DROP TABLE IF EXISTS recommendations;
CREATE TABLE recommendations (
    recommendation_id INTEGER,
    student_group TEXT,
    course_category TEXT,
    generated_at TIMESTAMP,
    has_explanation TEXT,
    total_tokens INTEGER,
    cost_usd NUMERIC(12,6),
    latency_ms INTEGER,
    was_clicked TEXT,
    data_origin TEXT
);
