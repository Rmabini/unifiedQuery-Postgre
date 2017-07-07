CREATE OR REPLACE FUNCTION get_Id_Master_Section
(type character, section character) RETURNS INTEGER AS
$$
DECLARE
id integer;
BEGIN
SELECT id_master_section into id  FROM tb_master_section
WHERE master_section_name ilike ('%' || type || '%' || section ) limit 1;
IF FOUND  THEN
       RETURN id;
    END IF;
    RETURN 0; 
 END
$$
LANGUAGE plpgsql VOLATILE;
