# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
from prettytable import PrettyTable


db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

# your code here
"""
Business Rules:

1. For each course, find the number of sections with more than 10 students.
2. For each gym, find if it is at full capacity.
3. For each team, find the number of competitions they have won.
4. For any two teams, find their soonest upcoming match.
5. Find the percentage of students who failed a course for a given semester.
6. Find the top 5 most used venues (venues with the most events) during a given month.
7. Find the most popular category of products in stock in all stores. 
8. For all courses, find the average number of classes all the sections have. 
              (for example, if a course has 3 sections with 3,2, and 1 weekly classes each, 
                the average number of weekly classes that course would be 2) 

Bot commands:

1. /getnumsections <course> 
2. /at-capacity
3. /num-wins <team>
4. /next-match <team1> <team2>
5. /percentage-fails <semester> <course>
6. /top-venues <month>
7. /pop-category
8. /avg-classes <course>"""

def get_response(msg):
  data = msg.split()
  errors = []
  command = data[0]
  
  
  if "/getnumsections" in command:
    if len(data)<2:
      return "You are missing the first argument"
    else:
      course = data[1]
      print(course)
      response = getnumsections(course)
      return response

  elif "/at-capacity" in command:
    response = at_capacity()
    return response

  elif "/num-wins" in command:
    if len(data)<2:
      return "You are missing the first argument"
    else:
      team = data[1]
      response = num_wins(team)
      return response

  elif "/next-match" in command:
    if len(data)<2:
      return "You are missing the first argument"
    else:
      team1 = data[1]
      if len(data)<3:
        return "You are missing the first argument"
      else:
        team2 = data[2]
        response = next_match(team1,team2)
        return response

  elif "/percentage-fails" in command:
    if len(data)<2:
      return "You are missing the first argument"
      
    else:
        semester = data[1]
        response = percentage_fails(semester)
        return response

  elif "/top-venues" in command:
    if len(data)<2:
      return "You are missing the first argument"
    else:
      month = data[1]
      response = top_venues(month)
      return response

  elif "/pop-category" in command:
    response = pop_category()
    return response

  elif "/avg-classes" in command:
    print("hello")
    if len(data)<2:
      return "You are missing the first argument"
    else:
      print("here")
      course = data[1]
      response = avg_classes(course)
      return response
  
    

      
def getnumsections(course):

  rows = []
  headers = ["Section", "Students"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """select idsection as Section,sum(number_of_students) as 
                Students from section
                where number_of_students>=10 and course=%s
                group by course,idsection;"""
    variable = course
    cursor.execute(query , variable)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        section=course_data['Section']
        students = course_data['Students']
        row.append(section)
        row.append(students)
        
        rows.append(row)
      output = format_data(headers,rows)
      conn.close()
      return output
    conn.close()
    return "There are no sections with more than 10 students for that course, or the course you inputted doesn't exist"

def at_capacity():
  rows = []
  headers = ["Name", "Capacity", "Number of members"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """
select *  from  gym  g inner  join  (select count(gm.gym)  as gym_members,g.name  from  gym  g inner join  gymmembership  gm on  gm.gym=g.idgym group  by  capacity,name )  a  on  g.name=a.name  and  a.gym_members>=g.capacity;"""
    cursor.execute(query)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        name = course_data['name']
        capacity = course_data['capacity']
        nummembers = course_data['gym_members']
        row.append(name)
        row.append(capacity)
        row.append(nummembers)
        
        rows.append(row)
      output = format_data(headers,rows)
      conn.close()
      return output
    conn.close()
    return "There are no gyms at capacity"
 

def num_wins(team):
  rows = []
  headers = ["Competition", "Season"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """SELECT c.competition,c.season FROM team t
inner join competes c
on c.team=t.idteam
where c.team=%s && c.win=1;"""
    variable = team
    cursor.execute(query, variable)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        competition = course_data['competition']
        season = course_data['season']
        row.append(competition)
        row.append(season)
        
        rows.append(row)
      output = format_data(headers,rows)
      conn.close()
      return output
    conn.close()
    return "That team doesn't exist or it hasn't won any competitions."
  return

def next_match(team1,team2):
  rows = []
  headers = ["Competition", "Date", "Venue ID"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """select competition,date1, venue
from match1
where team1=%s and team2=%s and date1>CURRENT_TIMESTAMP
order by date1 asc
limit 1
;"""
    variable = (team1, team2)
    cursor.execute(query, variable)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        competition = course_data['competition']
        date1 = course_data['date1']
        venue = course_data['venue']
        row.append(competition)
        row.append(date1)
        row.append(venue)
        
        rows.append(row)
      output = format_data(headers,rows)
      conn.close()
      return output
    else:
      variable = (team2, team1)
      cursor.execute(query, variable)
      data=cursor.fetchall()
      if data:
        for course_data in data:
          row = []
          competition = course_data['competition']
          date1 = course_data['date1']
          venue = course_data['venue']
          row.append(competition)
          row.append(date1)
          row.append(venue)
          
          rows.append(row)
        output = format_data(headers,rows)
        conn.close()
        return output

    conn.close()
    return "No match for those two teams, or those teams dont exist"
  return
  return

def percentage_fails(semester):
  return "I was unable to implement this query"

def top_venues(month):
  rows = []
  headers = ["Venue ID", "Number of events"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """select Event1.venue, count(*)
from Event1 
where month(Event1.date1) = %s
group by event1.venue
limit 1;"""
    variable = month
    cursor.execute(query, variable)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        venue = course_data['venue']
        count = course_data['count(*)']
        row.append(venue)
        row.append(count)
        
        rows.append(row)
      output = format_data(headers,rows)
      conn.close()
      return output
    conn.close()
    return "That month doesn't exist or there have been no events during that month."
  return

def pop_category():
  rows = []
  headers = ["Product", "Category"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """
select *  from  product  where  idproduct  in( select product  from  sells where  stock=(select  max(stock)  from  sells) );"""
    cursor.execute(query)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        product = course_data['name']
        category = course_data['category']
        row.append(product)
        row.append(category)
        
        rows.append(row)
      output = format_data(headers,rows)
      conn.close()
      return output
    conn.close()
    return "There are no products sold in stores."
 
  return

def avg_classes(course):
  print("start")
  rows = []
  headers = ["Course ID", "Average number of classes/section"]
  output = None
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """select s.course,(count(t.class)/a.counts) as "Classes_per_section" from takes t 
inner join section s
on t.section=s.idsection
inner join (select course,count(idsection) as "counts" from section where course=%s group by course ) a 
on a.course=s.course
group by s.course 
;"""
    variable = course
    cursor.execute(query, variable)
    data=cursor.fetchall()
    if data:
      for course_data in data:
        row = []
        course = course_data['course']
        classes_per_section = course_data['Classes_per_section']
        row.append(course)
        row.append(classes_per_section)
        
        rows.append(row)
      output = format_data(headers,rows)
      print("wow")
      conn.close()
      return output
    print("wow2")
    conn.close()

    return "That course doesn't exist or there are no classes for its sections."
  print("waw")
  return
  


def format_data(headers, rows):
  table = PrettyTable()
  table.field_names = headers
  for row in rows:
    table.add_row(row)
  return table
  
