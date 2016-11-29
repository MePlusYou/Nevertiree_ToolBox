---------------------
-- AUTO_RETURN_BOOK--
---------------------

-- version 1
create or replace procedure AUTO_RETURN_BOOK as
begin
	update TITLE_COPY set STATUS = 'AVAILABLE'
	where STATUS = 'RENTED'
	and exists
	(select RENTAL.TITLE_ID,RENTAL.COPY_ID from RENTAL
		where RENTAL.EXP_RET_DATE < sysdate
		and RENTAL.TITLE_ID = TITLE_COPY.TITLE_ID
		and RENTAL.COPY_ID = TITLE_COPY.COPY_ID);
end;

-- version 2
create or replace procedure AUTO_RETURN_BOOK as
begin
	update TITLE_COPY set STATUS = 'AVAILABLE'
	where STATUS = 'RENTED'
	and TITLE_COPY.TITLE_ID =
		(select RENTAL.TITLE_ID, from RENTAL where RENTAL.EXP_RET_DATE < sysdate)
	and TITLE_COPY.COPY_ID =
		(select RENTAL.COPY_ID from RENTAL where RENTAL.EXP_RET_DATE < sysdate);
end;


-- job
variable auto_return_no number;
begin
	dbms_job.submit(:auto_return_no,'AUTO_RETURN_BOOK;',sysdate,'sysdate + 1');
commit;
end;

-- execute immediately
execute AUTO_RETURN_BOOK;