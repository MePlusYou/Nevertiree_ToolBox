----------------------------------
-- create sequence MEMBER_ID_SEQ--
----------------------------------
create sequence MEMBER_ID_SEQ_WLX303
start with 101
increment by 1
nomaxvalue
nocache;

---------------------------------
-- create sequence TITLE_ID_SEQ--
---------------------------------
create sequence TITLE_ID_SEQ_WLX303
start with 92
increment by 1
nomaxvalue
nocache;

create sequence COPY_ID_SEQ_WLX303
start with 1
increment by 1
nomaxvalue
nocache;

-- check dictionary
select * from user_objects where object_type = 'SEQUENCE';
