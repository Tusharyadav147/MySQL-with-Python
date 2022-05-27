import mysql.connector as connector

try:
    #check if connection is established
    mydb = connector.connect(host='localhost', user ='root', password = "Tushar0420&", use_pure=True)
    query = "SHOW DATABASES"

    #create a cursor to execute a queries
    cursor = mydb.cursor()
    cursor.execute(query)
    #print(cursor.fetchall())
    res = cursor.fetchall()
    print(res[1])

except Exception as e:
    mydb.close()
    print(str(e))
