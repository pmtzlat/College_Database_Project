-- Script name: inserts.sql
-- Author:      Pablo Martinez
-- Purpose:     insert sample data to test the integrity of this database system
   
-- the database used to insert the data into.

USE CollegeDB; 
SET SQL_SAFE_UPDATES = 0;
-- the inserts


INSERT INTO Venue(name, capacity) VALUES ("SuperStadium", 85000),("SandArena",100000),("ForestShack", 10);
INSERT INTO Event(name,date,venue,category, description) VALUES ("Loolapalooza", '2018-10-20', 1, "Music", "A famous music festival"), ("Super Bowl 2020", '2020-06-14',2,  "Sport", "A football match"), ("El Clasico", '2019-03-27',3, "Sport", "A football match");
INSERT INTO User(password, name, surname, gender, DOB, age) VALUES ("user1", "user1", "user1", "male", '2001-05-14', 20), ("user2", "user2", "user2", "female", '2001-06-14', 20),("user3", "user3", "user3", "male", '2001-07-14', 20), ("user4", "user4", "user4", "female", '2001-08-14', 20), ("user5", "user5", "user5", "female", '2001-09-14', 20), ("user6", "user6", "user6", "male", '2000-07-14', 21), ("user7", "user7", "user7", "female", '2001-01-14', 20), ("user8", "user8", "user8", "male", '2001-07-17', 20), ("user9", "user9", "user9", "female", '2001-07-24', 20), ("user10", "user10", "user10", "male", '2001-07-17', 20), ("user11", "user11", "user11", "female", '2001-07-04', 20), ("user12", "user12", "user12", "male", '2001-07-19', 20);
INSERT INTO Professor(user,salary) VALUES (4,70000.00), (5,50000.00), (6,88000.00);
INSERT INTO Department(category, head) VALUES ("Science", 1), ("Engineering",1), ("Arts",2);
INSERT INTO Degree(description) VALUES ("Computer science"), ("Music Production"), ("Film");
INSERT INTO Action(description) VALUES ("Delete User"), ("Delete section"), ("Delete Degree");
INSERT INTO Address(country, city, street, apartment) VALUES ("USA", "Los Angeles", "234 Baller Boulevard", NULL), ("Spain", "Madrid", "Avenida de Valdemarin 150", "Bajo C"), ("Brazil", "Sao Paulo", "Rua de Bolsonaro",NULL);
INSERT INTO Admin(user) VALUES (1), (2), (3);
INSERT INTO Attends(user, event, ticketprice, tickettier) VALUES (2,1,125.49, "Tier 2"), (2, 2, 22.33, "1-day entry"), (3, 1, 335.00, "VIP");
INSERT INTO BelongsTo(department, degree) VALUES (1,1), (1,2), (2,3);
INSERT INTO Cafeteria(name, opening_hours, closing_hours) VALUES ("VIPS", "09:00", "23:00"),("Wendys", "08:00", "00:00"), ("Ginos", "12:00", "21:00");
INSERT INTO CafeteriaAddress(cafeteria, address) VALUES (1,1), (1,2), (2,3);
INSERT INTO Class(time_slot_begin,time_slot_end) VALUES ('19:00', '21:45'), ('11:00', '12:15'), ('17:00', '18:30');
INSERT INTO Classroom(purpose,capacity) VALUES ("presentations", 300), ("Standard classroom", 100), ("Study room", 35);
INSERT INTO Club(name, description, email) VALUES ("Chess Club Pros", "Chess club with the highest honors", "chessclub@gmail.com"), ("Film Actors Guild", "People who act out in their interest", "actors@gmail.com"), ("Chads", "Absolute alphas", "chad@gmail.com");
INSERT INTO ClubCategory(club, category) VALUES (1,2), (1,1), (2,1);
INSERT INTO Division(sport,name) VALUES ("Football","Local Top League"),( "Voleyball","California Valoeyball League"),("Basketball", "College NBA");
INSERT INTO ClubMember(user, club, role, info) VALUES (7,1,"head","Director of the club."), (8, 2, "head", "Director of the club."), (9,1, "New Member", "Newbie.");
INSERT INTO Team(name, division) VALUES ("Steelers", 1),("Feelers",1),("Healers", 1);
INSERT INTO Competition(division, number_of_teams, reward) VALUES (1,15, 100000), (1, 22, 25000000), (2, 9, 15000);
INSERT INTO Competes(team, competition, win,season) VALUES (1,1,NULL, "2021-2022"), (1,2,1,"1999-2000"),(2,3,NULL, "2021-2022");
INSERT INTO Student(user,average_grade, enrollment_year) VALUES (7,0.00,'2021'),(8,77.66,'2019'),(9,0.00,'2021');
INSERT INTO StudentJob(name,wage,employer,requisites,description) VALUES ("assistant", 20.00, "Willis Jr", "previous experience", "helping around"), ("Waiter", 17.50, "Chillis", NULL, "be a waiter"), ("Security", 30.00, "Jeggies Mall", NULL, NULL);
INSERT INTO Contract(student, job) VALUES (1,2), (1,1), (2,1);
INSERT INTO Course(description) VALUES ("Computer Networks"), ("Intro To Database Systems"), ("Analysis of algorithms");
INSERT INTO Semester(year,period) VALUES ('2021', "Fall"), ('2022', "Spring"), ('2021', "Spring");

INSERT INTO ForeignUniversity(universityname, campus, country, city, language, specialty) VALUES ("UC3M", "Leganes", "Spain", "Madrid", "Spanish", "Engineering"), ("UEA Amsterdam", "Amsterdam", "Amsterdam", "Netherlands", "English", "Arts"), ("Tohoku University","Sendai", "Sendai", "Japan", "Japanese", "Medicine");
INSERT INTO ForeignDegree(description, foreignUni) VALUES ("CompSci", 1), ("Music", 2) , ("Visual Effects", 2);
INSERT INTO Section(course) VALUES (1),(2),(3);
INSERT INTO Enrolls(student, section,semester,grade) VALUES (1,1,1, NULL), (2,2,2,"A"), (3,3,3, "C+");
INSERT INTO Equivalent(degree, foreign_degree) VALUES (1,1), (2,2), (2,3);

INSERT INTO Fraternity(name, founding_date, closing_date) VALUES ("Kappa Chi", '1987-03-11', NULL), ("Sigma Epsilon", '2005-09-01', NULL), ("Alpha Beta", '1977-01-23','1999-03-11');
INSERT INTO FratAddress(fraternity, address) VALUES (1,1), (2,1), (3,1);

INSERT INTO FratMember(frat, student,status, date_of_entry, date_of_exit) VALUES (1, 1, "Head", '2017-06-14', NULL), (2, 2, "Rush", '2013-09-01', '2014-01-29'), (1,3,"Brother", '2020-11-22', NULL);
INSERT INTO Gym(name, capacity, sports_facilities) VALUES ("David LLoyd Club", 150, "Tennis court, Football field, Swimming pool"), ("Mashouf Wellness Center", 200, "Weight room, Basketball Court"), ("PhisiCool", 50, "Yoga room, Track and Field, Voleyball");
INSERT INTO GymAddress(gym, address) VALUES (1,2),(2,3),(3,1);
INSERT INTO GymMembership(gym,user,monthly_price,type,description,expedition,expiration) VALUES (1,4,60.24, "Regular", "Normal membership.", '2019-09-30',NULL),(2,5,25.33,"Basic", "Includes basic package", '2021-03-04', NULL), (3, 6, 40.50, "Yoga Tier", "Includes weekly yoga sessions", '2021-09-20',NULL);

INSERT INTO Insurance(company,money_available, cost_per_month) VALUES ("VitaHealth", 200000.00, 50.50),("VitaDeath", 100000.00, 25.20),("ObamaCare", 500000.00, 75.00);
INSERT INTO IsPartOf(course, degree) VALUES (1,1),(2,1),(3,1);
INSERT INTO Laboratory(category,capacity,equipment) VALUES ("Biology", 25, "Microscopes"), ("Physics", 30, "Hydraulic press"), ("Chemistry", 20, "Bunsen burner");
INSERT INTO Match1(team1,team2,date,competition) VALUES (1,2,'2021-12-01',1),(2,3,'2021-05-22', 1), (1,3, '2022-01-12',2);
INSERT INTO Hosting(match1,venue) VALUES (1,1),(2,2),(3,3);
INSERT INTO Menu(appetizer, main_course, dessert, drink, price) VALUES (NULL, "Caesar Salad", "Chocolate mousse", NULL, 10.25), ("Mozzarella sticks", "Impossible burger", "Ice cream", "Pepsi", 20.15), ("Mango", "Fried Chicken", "Cereal", "Eggnog", 5.00);
INSERT INTO Offers(cafeteria, menu, time_begin, time_end) VALUES (1, 1, '09:00','23:00'), (2,2,NULL,NULL), (3,3, '10:30','21:00');
INSERT INTO Permissions(user,action) VALUES (1,1),(1,2),(1,3);
INSERT INTO Phone(number, prefix) VALUES (123456789,"+1"), (656559808, "+34"), (987654321, "+21");
INSERT INTO Plan(student, insurance, date_bought) VALUES (1,1,'2020-05-06'),(2,1,'2021-08-10'),(3,2,'2019-02-18');
INSERT INTO Product(name, price, weight,height, category, description) VALUES ("tennis ball", 2.05, 0.5, 10.44, "sports", "A tennis ball"), ("T-shirt", 9.99, 0.4, 60, "clothing","A t-shirt"),("Hat", 5.35, 0.5, 20, "clothing", "A hat");

INSERT INTO Rector(user,salary) VALUES (10,200000.00), (11,500000.00), (12,235000.00);
INSERT INTO Scholarship(company,sum) VALUES ("Apple", 250000.00),("CalGrants", 50000.00),("BassProShops", 10000.00);

INSERT INTO Store(address,name,opening_hours,closing_hours) VALUES (1,"Crazy Johnnie's", '08:00','09:00'),(2,"Ralph's", '09:00','22:00'),(3,"Willie's", '10:00','17:00');
INSERT INTO Sells(store,product,stock) VALUES (1,1,50),(2,2,15),(3,3,300);

INSERT INTO Studies(student,degree, year_start, year_end) VALUES (1, 1, '2017', '2021'), (2,2,'2020' ,NULL), (3,3,'2021', NULL);
INSERT INTO Takes(section, class) VALUES (1,1),(2,1),(3,3);
INSERT INTO TakesClassIn(class,place) VALUES (1,1),(2,2),(3,3);
INSERT INTO TakesLabIn(class,place) VALUES (1,1),(2,1),(3,3);
INSERT INTO Teaches(professor, section, semester) VALUES (1, 1, 1), (2,2,2), (3,3,3);

INSERT INTO TeamMember(student, team, position, extra_info, number, season) VALUES (1, 1, "benchwarmer", "not very good", NULL, NULL), (2,2, "kicker", NULL, "7", NULL), (3,3, NULL, NULL, NULL, NULL);
INSERT INTO UserAdress(user, address) VALUES (1,1), (2,2), (3,3);
INSERT INTO UserPhones(user, phone) VALUES (4,123456789),(5,656559808),(6,987654321);

INSERT INTO VenueAddress(venue,address) VALUES (1,1),(2,2),(3,3);
INSERT INTO Winner(student,scholarship) VALUES (1,1), (2,2), (3,3);








