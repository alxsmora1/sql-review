CREATE TABLE t1 (
    actor_id INTEGER,
    a_very_loooooooooong_column_name TEXT NOT NULL DEFAULT ''
);

ALTER TABLE ONLY public.t1
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);