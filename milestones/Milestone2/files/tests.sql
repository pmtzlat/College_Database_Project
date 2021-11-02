-- Script name: inserts.sql
-- Author:      Pablo Martinez
-- Purpose:     test sample data to test the integrity of this database system
   
-- the database used to test the data into.

USE CollegeDB; 
SET SQL_SAFE_UPDATES = 0;
-- the tests

-- testing  table: Club
UPDATE Club SET idclub = 4 WHERE name= "Film Actors Guild";
delete from Club WHERE idclub = 1;

-- testing table: Cafeteria
update Cafeteria set name= "In-N-Out Burger" where idcafeteria = 1;
delete from Cafeteria where opening_hours = '08:00';

-- testing table: Menu

update Menu set appetizer = "Bread Sticks" where idmenu = 1;
delete from Menu where drink = 'Eggnog';

-- testing table: User
update User set name = "Jocko" where name = "user6";
delete from User where age = 20;

-- testing table: Address
update Address set country='China' where idaddress=2;
delete from Address where street = 'Rua de Bolsonaro';

-- testing  table: Phone
update Phone set prefix = '+71' where prefix = '+1';
delete from Phone where number= 656559808;

-- testing table: Gym
update Gym set idgym = 8 where capacity=50;
delete from Gym where name = 'David Lloyd Club';

-- testing table: Division
update Division set idDivision = 14 where sport = 'Football';
delete from Division where sport = 'Basketball';

-- testing table: Venue
update Venue set capacity = 30 where idvenue = 1;
delete from Venue where name = 'ForestShack';

-- testing table: Fraternity
update Fraternity set idfraternity=7 where name = 'Kappa Chi';
delete from Fraternity where idfraternity = 2;

-- testing table: StudentJob
update StudentJob set employer = 'Bruce Willis' where idstudentJob = 1;
delete from StudentJob where idstudentJob = 2;

-- testing table: Insurance
update Insurance set idinsurance= 5 where company = 'Obamacare';
delete from Insurance where idinsurance = 1;

-- testing table: Scholarship
update Scholarship set idscholarship = 123456789 where company = 'Apple';
delete from Scholarship where idscholarship = 3;

-- testing tabel: Product
update Product set weight = 1.00 where name= 'tennis ball';
delete from Product where idproduct = 2;

-- testig table: Degree
update Degree set iddegree = 23432 where description = 'Computer Science';
delete from Degree where description= 'Film';

-- testing table: Laboratory
update Laboratory set capacity=50 where category = 'Biology';
delete from Laboratory where idlaboratory = 3;

-- testing table: Classroom
update Classroom set capacity = 100 where purpose = 'presentations';
delete from Classroom where idclassroom = 2;

-- testing table: ForeignUniversity
update ForeignUniversity set universityname = 'UFV' where idforeignUniversity = 1;
delete from ForeignUniversity where universityname = 'Tohoku University';

-- testing table: Actions
update Action set idaction = 5 where description= 'Delete Degree';
delete from Action where idaction = 2;

-- testing table: Event
update Event set idevent = 25 where name = 'El Clasico';
delete from Event where venue = NULL;






