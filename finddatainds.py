import mysql.connector as connection

try:
    mybd = connection.connect(host="localhost", database = "register", user = "root", password = "Tushar0420&", use_pure=True)
    print(mybd.is_connected()) #check if connection is established
    query  = "select*from reg2 where user = 'tarun';"
    cur = mybd.cursor()
    cur.execute(query)
    print(cur.fetchall())
except Exception as e:
    mybd.close()
    print(str(e))