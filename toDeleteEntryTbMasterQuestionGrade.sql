CREATE OR REPLACE FUNCTION toDeleteEntryTbMasterQuestionGrade(
p_id_master_question integer ) RETURNS VOID AS
$$
 Delete From tb_master_question_grade where id_master_question = $1;
$$
LANGUAGE sql VOLATILE;