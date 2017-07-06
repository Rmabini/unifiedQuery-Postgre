CREATE OR REPLACE FUNCTION getIdMasterTemplate
(type character) RETURNS INTEGER AS
$$
DECLARE
id integer;
 BEGIN
SELECT  id_master_template into id  
FROM tb_master_template 
WHERE template_name ILIKE ('%' || type || '%') limit 1;
IF FOUND  THEN
       RETURN id;
    END IF;
    RETURN 0; 
 END
$$
LANGUAGE plpgsql VOLATILE;