"""import mysql.connector as connector
try:
    mydb = connector.connect(host="localhost", user = "root", password = "Tushar0420&", use_pure = True)
    #check if the connection established
    query = "SHOW DATABASES"

    cursor = mydb.cursor() #create a cursor to execute queries
    cursor.execute(query)
    print(cursor.fetchall())
except Exception as e:
    mydb.close()
    print(str(e))"""

#fetching data from database

"""import mysql.connector as connection
conn = connection.connect(host="localhost", user = "root", password = "Tushar0420&", use_pure = True)
cur = conn.cursor()
cur.execute("show databases")
#print(cur.fetchall())
res = cur.fetchall()
for i in res:
    print(i[0])"""

#create a new databases

"""import mysql.connector as connection
conn = connection.connect(host="localhost", user = "root", password = "Tushar0420&", use_pure = True)
cur = conn.cursor()
cur.execute("create database tushar1")"""

#inside a databases create a table

"""import mysql.connector as connection

try:
    mybd = connection.connect(host="localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mybd.is_connected()) #check if connection is established
    query  = "create table test(x1 INT(5) , x2 VARCHAR(20), x3 DATE)"
    cur = mybd.cursor()
    cur.execute(query)
    print("Table Created!")
    mybd.close()
except Exception as e:
    mybd.close()
    print(str(e))"""

#insert to table

"""import mysql.connector as connection

try:
    mydb = connection.connect(host="localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mydb.is_connected()) #check if connection is established
    query  = "insert into test values(4548, 'sonp', '2021-05-15')"   #yyyy-mm-dd is the only formate for date & always use '' in the values block
    cur = mydb.cursor()
    cur.execute(query)
    print("Value inserted into the table!!")
    mydb.commit()
    query = "insert  into test values(0420,'Tushar','2000-04-20')"
    cur.execute(query)       #how many no. of time we execute query data upload that times
    mydb.commit()            #without commit statment data is not inserted
    mydb.close()
except Exception as e:
    mydb.close()
    print(str(e))"""

#select from database

"""import mysql.connector as connection

try:
    mybd = connection.connect(host="localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mybd.is_connected()) #check if connection is established
    query  = "select * from test;"
    cur = mybd.cursor()
    cur.execute(query)
    for i in cur.fetchall():     #fetchall fet the data
        print(i)
    query  = "select x1,x2 from test;"
    cur = mybd.cursor()
    cur.execute(query)
    for i in cur.fetchall():     #this time date is not be fetched
        print(i)
    mybd.close()
except Exception as e:
    mybd.close()
    print(str(e))"""

#select into dataframe

"""import mysql.connector as connection
import pandas as pd

try:
    mydb = connection.connect(host="localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mydb.is_connected())
    query = "select * from tushar1.test"      # * means all the available block in the dataset
    result = pd.read_sql(query,mydb)
    print(result)
    result.to_csv("mydata.csv")      #make a csv file and write the data init.
    mydb.close()

except Exception as e:
    mydb.close()
    print(str(e))"""

#insert from a file in sql
"""import mysql.connector as connection
import pandas as pd

try:
    mydb = connection.connect(host= "localhost", database = "tushar1", user= "root", password = "Tushar0420&", use_pure=True)
    print(mydb.is_connected())
    cur = mydb.cursor()
    cur.execute("create table mydata1(n0 int(20), n1 int(20), n2 varchar(20), n3 date)")
    data = pd.read_csv("mydata.csv")
    print(data)
    data1 = pd.read_sql("select*from test",mydb)
    print(data1)
    data.to_sql("mydata1", mydb)
except Exception as e:
    mydb.close()
    print(str(e))"""

#insert data in bulk from file to sql

#with 2 for loop
"""import mysql.connector as connection
import pandas as pd
import csv
try:
    mydb  =  connection.connect(host="localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mydb.is_connected())
    query = "CREATE TABLE test3(index_num INT(10), name INT(20), percentage float(10,5), number INT(10), class float(10,5), section float(10,5) )"
    cur = mydb.cursor()
    cur.execute(query)
    with open('mydata.data', 'r') as data:
        next(data)
        data_csv = csv.reader(data, delimiter="\n")  # use to read other file in csv formate
        print(data_csv)
        for i in enumerate(data_csv):      #this is for converting list into string
            print(i)
            print(type(i))
            for j in data_csv:
               print(type(j))
               print(j)
               cur.execute("insert into test3 values({data})".format(data=(j)))
        print("all the data inserted")
    mydb.commit()
    mydb.close()
except Exception as e:
    mydb.close()
    print(str(e))"""

#with one for loop
"""import mysql.connector as connection
import pandas as pd
import csv
try:
    mydb  =  connection.connect(host="localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mydb.is_connected())
    query = "CREATE TABLE test3(index_num INT(10), name INT(20), percentage float(10,5), number INT(10), class float(10,5), section float(10,5) )"
    cur = mydb.cursor()
    cur.execute(query)
    with open('mydata.data', 'r') as data:
        next(data)
        data_csv = csv.reader(data, delimiter="\n")  # use to read other file in csv formate
        print(data_csv)
        for j in data_csv:
            print(type(j))
            print(j)
            cur.execute("insert into test3 values({data})".format(data=(str(j[0]))))      #here str function convert list into string
        print("all the data inserted")
    mydb.commit()
    mydb.close()
except Exception as e:
    mydb.close()
    print(str(e))"""

#delete some details into databases

"""import mysql.connector as connection

try:
    mydb = connection.connect(host= "localhost", database = "tushar1", user = "root", password = "Tushar0420&", use_pure=True)
    print(mydb.is_connected())
    query = "DELETE FROM test3 WHERE number = 133526"    
    cur = mydb.cursor()
    cur.execute(query)
    mydb.commit()
    mydb.close()
    
except Exception as e:
    print(str(e))
    mydb.close()"""

#update table
"""import mysql.connector as connection

try:
    mydb = connection.connect(host="localhost", database="tushar1", user="root", password="Tushar0420&", use_pure=True)
    print(mydb.is_connected())
    query = "UPDATE test3 SET number = 56532653, class= 56, name = 545"
    cur = mydb.cursor()
    cur.execute(query)
    mydb.commit()
    mydb.close()

except Exception as e:
    print(str(e))
    mydb.close()"""
