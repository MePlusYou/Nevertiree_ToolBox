-------------------------
-- create user WLX_303 --
-------------------------

-- create user with username WLX303 and password WLX303
create user WLX303 identified by WLX303
TEMPORARY TABLESPACE TEMP
default TABLESPACE USERS;

-- change user password if necessary.
alter user WLX303 identified by other_password;

-- grant the new user
grant connect, resource ,create view,create procedure to WLX303;

-- check whether user is created successfully.
select * from user_users;

-- switch current user and check whether new user is linked.
conn WLX303/WLX303
show user;