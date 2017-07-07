
CREATE OR REPLACE FUNCTION to_Add_Entry_To_Tb_Master_Question_Grade(
p_id_master_question integer,
p_grade integer,
p_gradeValue integer,
p_created_by character varying(250)
) RETURNS VOID AS
$$
BEGIN
IF p_grade > 0 THEN
   

        BEGIN
         INSERT INTO tb_master_question_grade(
            id_master_question, id_grade, created_date, created_by)
         VALUES (p_id_master_question, p_gradeValue, now(), p_created_by);

        EXCEPTION WHEN unique_violation THEN
  
   END;


END IF;
END
$$
LANGUAGE plpgsql VOLATILE;