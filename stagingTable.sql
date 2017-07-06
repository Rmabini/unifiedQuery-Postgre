CREATE TABLE staging
(
  id_master_question serial NOT NULL,
  type character varying(255),
  section character(50),
  "number" integer,
  question_title character varying(255),
  question_content text,
  weight integer,
  is_na boolean,
  "G4" integer,
  "G3" integer,
  "G2" integer,
  "G0" integer,
  question_title_vietnamese character varying(255),
  question_content_vietnamese text,
  question_title_bahasa character varying(255),
  question_content_bahasa text,
  question_title_chinese character varying(255),
  question_content_chinese text,
  CONSTRAINT staging_pkey PRIMARY KEY (id_master_question)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE staging
  OWNER TO postgres;