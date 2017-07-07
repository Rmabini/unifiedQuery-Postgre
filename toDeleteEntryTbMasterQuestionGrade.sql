CREATE OR REPLACE FUNCTION to_Delete_Entry_Tb_Master_Question_Grade(
p_id_master_question integer ) RETURNS VOID AS
$$
 Delete From tb_master_question_grade where id_master_question = $1;
$$
LANGUAGE sql VOLATILE;