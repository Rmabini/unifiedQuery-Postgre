CREATE OR REPLACE FUNCTION toAddEntryTbMasterTemplateSection(
p_id_master_template integer,
p_id_master_section integer,
p_section character,
p_created_by character
)
RETURNS VOID AS
$$
BEGIN
INSERT INTO tb_master_template_section(
            id_master_template, id_master_section, section_name,  
            created_date, created_by, changed_date, changed_by)
    VALUES (p_id_master_template, p_id_master_section, p_section,  
            now(), p_created_by, now(),  p_created_by);
END;
$$
LANGUAGE plpgsql VOLATILE;