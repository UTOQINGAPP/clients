BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "cliente" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cliente" (
    "id" bigserial PRIMARY KEY,
    "names" text NOT NULL,
    "phone" bigint NOT NULL,
    "email" text NOT NULL,
    "address" text NOT NULL,
    "registered" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR clients
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('clients', '20240629220512965', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240629220512965', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
