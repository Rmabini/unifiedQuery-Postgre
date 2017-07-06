
CREATE OR REPLACE FUNCTION toAddEntryToTbMasterQuestionGrade(
p_id_master_question integer,
p_grade integer,
p_gradeValue integer,
p_created_by character varying(250)
) RETURNS VOID AS
$$
BEGIN
IF p_grade > 0 THEN
   INSERT INTO tb_master_question_grade(
            id_master_question, id_grade, created_date, created_by)
    VALUES (p_id_master_question, p_gradeValue, now(), p_created_by);

END IF;
END
$$
LANGUAGE plpgsql VOLATILE;