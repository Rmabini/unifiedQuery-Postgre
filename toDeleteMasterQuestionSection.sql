CREATE OR REPLACE FUNCTION to_Delete_Master_Question_Section(p_id_master_question integer
) RETURNS VOID AS
$$
DELETE FROM  tb_master_section_question 
WHERE id_master_question=p_id_master_question
$$
LANGUAGE sql VOLATILE;

CREATE OR REPLACE FUNCTION test(p_id_master_question integer)
RETURNS TABLE(id_master_template integer, template_name text)  AS $$
BEGIN
  RETURN QUERY
    SELECT a.id_master_template,a.template_name FROM  tb_master_template a WHERE a.id_master_template=p_id_master_question;
   
  RETURN;
END;
$$ LANGUAGE plpgsql;