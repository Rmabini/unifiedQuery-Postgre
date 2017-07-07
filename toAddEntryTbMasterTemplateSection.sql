CREATE OR REPLACE FUNCTION to_Add_Entry_Tb_Master_Template_Section(
p_id_master_template integer,
p_id_master_section integer,
p_section character,
p_created_by character
)
RETURNS VOID AS
$$
BEGIN
    LOOP
        -- first try to update the key
        UPDATE tb_master_template_section
        SET 
        id_master_template = p_id_master_template,
        id_master_section = p_id_master_section,
        section_name=p_section,
        created_by=p_created_by,
        changed_date=now()
        WHERE id_master_template = p_id_master_template AND
             id_master_section = p_id_master_section AND
             section_name=p_section;
            
        IF found THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
	INSERT INTO tb_master_template_section(
            id_master_template, id_master_section, section_name,  
            created_date, created_by, changed_date, changed_by)
	VALUES (p_id_master_template, p_id_master_section, p_section,  
            now(), p_created_by, now(),  p_created_by);
              EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again        
       END;
    END LOOP;
END;
$$
LANGUAGE plpgsql VOLATILE;