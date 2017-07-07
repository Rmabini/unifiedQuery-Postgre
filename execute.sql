TRUNCATE staging;
TRUNCATE  tb_master_question CASCADE; 
TRUNCATE tb_master_question_grade;
TRUNCATE tb_master_section_question;
TRUNCATE tb_master_template_section;

COPY staging(id_master_question,type,section,"number",question_title,question_content,question_title_chinese,question_content_chinese,question_title_bahasa,question_content_bahasa,question_title_vietnamese,question_content_vietnamese,weight,is_na,"G4","G3","G2","G0")
FROM 'D:/Test5.csv'
WITH DELIMITER ','
CSV HEADER;


SELECT * FROM staging,
-- Staging to Master QUestion
to_add_entry_tb_master_question(
    id_master_question,
    question_title,
    question_content,
    weight,'Roberto',
    is_na,
    'Roberto',
    question_title_vietnamese,
    question_content_vietnamese,
    question_title_bahasa,
    question_content_bahasa,
    question_title_chinese,
    question_content_chinese
    );

SELECT * FROM staging,
to_Delete_Entry_Tb_Master_Question_Grade(id_master_question),
-- To Grade
to_Add_Entry_To_Tb_Master_Question_Grade(id_master_question,"G4",4,'Roberto') AS G4,
to_Add_Entry_To_Tb_Master_Question_Grade(id_master_question,"G3",3,'Roberto') AS G3,
to_Add_Entry_To_Tb_Master_Question_Grade(id_master_question,"G2",2,'Roberto') AS G2,
to_Add_Entry_To_Tb_Master_Question_Grade(id_master_question,"G0",1,'Roberto') AS G0;	
-- To Grade


SELECT * FROM staging,    
-- To Delete Section
get_Id_Master_Section(type,section) as id_master_section , 
to_Add_Entry_Tb_Master_Section_Question(id_master_section,id_master_question,"number",'Roberto'),
get_Id_Master_Template(type) as id_master_template,
to_Delete_Master_Template_Section(),
to_Add_Entry_Tb_Master_Template_Section(id_master_template,id_master_section,section,'Roberto');
-- To Delete Grade


