---------------------
-- AUTO_RETURN_BOOK--
---------------------

-- version 1
create or replace procedure AUTO_RETURN_BOOK_wlx303 as
	begin
		update TITLE_COPY_WLX303 set STATUS = 'AVAILABLE'
		where STATUS = 'RENTED'
		and exists
		(select RENTAL_WLX303.TITLE_ID,RENTAL_WLX303.COPY_ID from RENTAL_WLX303
			where RENTAL_WLX303.EXP_RET_DATE > sysdate
			and RENTAL_WLX303.TITLE_ID = TITLE_COPY_WLX303.TITLE_ID
			and RENTAL_WLX303.COPY_ID = TITLE_COPY_WLX303.COPY_ID);
		commit;
	end;

-- execute immediately
execute AUTO_RETURN_BOOK;

-- job
variable auto_return_no number;
begin
	dbms_job.submit(:auto_return_no,'AUTO_RETURN_BOOK;',sysdate,'sysdate + 1');
commit;
end;

---------------------
-- AUTO_DELETE_COPY--
---------------------

-- delete DESTROYED video copy automatically
create or replace procedure AUTO_DELETE_COPY as
	begin
		delete from TITLE_COPY where STATUS = "DESTROYED";
	end;

-- test data


-- execute immediately
execute AUTO_DELETE_COPY;