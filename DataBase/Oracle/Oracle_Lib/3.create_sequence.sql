----------------------------------
-- create sequence MEMBER_ID_SEQ--
----------------------------------
create sequence MEMBER_ID_SEQ
start with 101
increment by 1
nomaxvalue
nocache;

---------------------------------
-- create sequence TITLE_ID_SEQ--
---------------------------------
create sequence TITLE_ID_SEQ
start with 92
increment by 1
nomaxvalue
nocache;

-- check dictionary
select * from user_objects where object_type = 'SEQUENCE';
