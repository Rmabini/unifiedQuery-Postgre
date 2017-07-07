CREATE OR REPLACE FUNCTION to_Delete_Master_Template_Section()RETURNS VOID AS
$$
DELETE FROM  tb_master_template_section 
$$
LANGUAGE sql VOLATILE;