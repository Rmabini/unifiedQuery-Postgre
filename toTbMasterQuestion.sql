CREATE OR REPLACE FUNCTION toDeleteEntryTbMasterQuestionGrade(
p_id_master_question integer integer
) RETURNS VOID AS
$$
BEGIN
END;
$$
LANGUAGE sql STABLE;


CREATE OR REPLACE FUNCTION toTbMasterQuestion(
  p_id_master_question integer,
  p_question_title text ,
  p_question_content text,
  p_weight integer,
  p_created_by character ,
  p_is_na boolean,
  p_changed_by character,
  p_question_title_vietnamese character,
  p_question_content_vietnamese text,
  p_question_title_bahasa character,
  p_question_content_bahasa text,
  p_question_title_chinese character,
  p_question_content_chinese text
  

) RETURNS VOID AS
$$
BEGIN
    LOOP
        -- first try to update the key
	UPDATE tb_master_question
	SET question_title=p_question_title, 
	    question_content=p_question_content,
	    weight=p_weight,
	    created_by=p_created_by,
	    is_na=p_is_na,
	    changed_by=p_changed_by,
	    question_title_vietnamese=p_question_title_vietnamese ,
            question_content_vietnamese=p_question_content_vietnamese,
            question_title_bahasa=p_question_title_bahasa,
            question_content_bahasa=p_question_content_bahasa ,
            question_title_chinese=p_question_title_chinese,
            question_content_chinese=p_question_content_chinese,
            changed_date=now()  
	WHERE 
	id_master_question=p_id_master_question;
        IF found THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO tb_master_question(
            id_master_question, question_title, question_content,weight,created_by,is_na,changed_by,
            question_title_vietnamese,
            question_content_vietnamese,
            question_title_bahasa,
            question_content_bahasa,
            question_title_chinese,
            question_content_chinese,
            changed_date )
            VALUES (p_id_master_question, p_question_title, p_question_content,p_weight,p_created_by,p_is_na,p_changed_by,
            p_question_title_vietnamese,
            p_question_content_vietnamese,
            p_question_title_bahasa,
            p_question_content_bahasa,
            p_question_title_chinese,
            p_question_content_chinese, 
            now());
            RETURN;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$
LANGUAGE plpgsql STABLE;

Select * from staging, totbmasterquestion(
    id_master_question,
    question_title,
    question_content,
    weight,'1#&#0#&#Administrator#&#sa',is_na,'1#&#0#&#Administrator#&#sa',
    question_title_vietnamese,
    question_content_vietnamese,
    question_title_bahasa,
    question_content_bahasa,
    question_title_chinese,
    question_content_chinese
    );

Select * from now();

COPY staging
FROM 'D:/Test3.csv'
WITH DELIMITER ','
CSV HEADER