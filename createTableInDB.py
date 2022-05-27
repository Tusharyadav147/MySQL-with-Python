import mysql.connector as connection

try:
    mybd = connection.connect(host="localhost", database = "register", user = "root", password = "Tushar0420&", use_pure=True)
    print(mybd.is_connected()) #check if connection is established
    query  = "select * from reg2;"
    cur = mybd.cursor()
    cur.execute(query)
    for i in cur.fetchall():     #fetchall fet the data
        print(i)
    mybd.close()
except Exception as e:
    mybd.close()
    print(str(e))