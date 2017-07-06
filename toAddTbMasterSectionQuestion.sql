CREATE OR REPLACE FUNCTION toAddTbMasterSectionQuestion(
p_id_master_question integer,
p_id_master_section integer,
p_number integer,
p_created_by character


) RETURNS VOID AS
$$
BEGIN
 INSERT INTO tb_master_section_question(
            id_master_section, id_master_question, "number", created_date, 
            created_by, changed_date, changed_by)
    VALUES (p_id_master_section, p_id_master_question, p_number, now(), 
            p_created_by, now(), p_created_by); 
END
$$
LANGUAGE plpgsql VOLATILE;