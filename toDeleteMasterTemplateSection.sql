CREATE OR REPLACE FUNCTION toDeleteMasterTemplateSection(
p_id_master_section integer
)RETURNS VOID AS
$$
DELETE FROM  tb_master_template_section 
WHERE id_master_section=p_id_master_section
$$
LANGUAGE sql VOLATILE;