import cx_Oracle
import pandas as pd
from tkinter import *
import tkinter as tk

def dropTables(cursor):
    filename = r"C:\Users\parth\OneDrive\Desktop\School Files\Oracle_CPS_Project\Lab9\DropTables.sql"
    f = open(filename)
    queries = f.read()
    newQ = queries.replace('\n', '').split(';')[:-1]
    output = ""
    for q in newQ:
        try: 
            output += q + "\n"
            cursor.execute(q)
            output += "\n\n"
        except: 
            output += "DID NOT EXECUTE\n\n"
    return output

def createTables(cursor):
    filename = r"C:\Users\parth\OneDrive\Desktop\School Files\Oracle_CPS_Project\Lab9\CreateTables.sql"
    f = open(filename)
    queries = f.read()
    newQ = queries.replace('\n', '').split(';')[:-1]
    output = ""
    for q in newQ:
        try: 
            output += q + "\n"
            cursor.execute(q)
            output += "\n\n"
        except: 
            output += "DID NOT EXECUTE\n\n"
    return output

def insertTables(cursor):
    filename = r"C:\Users\parth\OneDrive\Desktop\School Files\Oracle_CPS_Project\Lab9\InsertTables.sql"
    f = open(filename)
    queries = f.read()
    newQ = queries.replace('\n', '').split(';')[:-1]
    output = ""
    for q in newQ:
        try: 
            output += q + "\n"
            cursor.execute(q)
            output += "\n\n"
        except: 
            output += "DID NOT EXECUTE\n"
    return output
    
def viewTables(cursor):
    filename = r"C:\Users\parth\OneDrive\Desktop\School Files\Oracle_CPS_Project\Lab9\ViewTables.sql"
    f = open(filename)
    queries = f.read()
    newQ = queries.replace('\n', '').split(';')[:-1]
    output = ""
    for q in newQ:
        try: 
            output += q + "\n"
            cursor.execute(q)
            
            rows=cursor.fetchall()

            field_names = [i[0] for i in cursor.description]
            df = pd.DataFrame(rows, columns=field_names)
            output += df.to_string() + "\n\n"
        except cx_Oracle.InterfaceError:
            output += "Not a Select Statement\n\n"
        except:
            output += "DID NOT EXECUTE\n\n"
    return output

cx_Oracle.init_oracle_client(lib_dir=r"C:\Oracle")
print("oracle version " + cx_Oracle.version)
print(cx_Oracle.clientversion())

host = "oracle.scs.ryerson.ca"
port = 1521
sid = 'orcl'
dsn_tns = cx_Oracle.makedsn(host,port,sid)
db = cx_Oracle.connect("user", "pass", dsn_tns)
print("connection version: " + db.version)
cursor = db.cursor()    

root = tk.Tk()
root.title("SQL QUERY APP")
HEIGHT = 800
WIDTH = 1000 
canvas = tk.Canvas(root, height = HEIGHT, width = WIDTH)
canvas.pack()

display_frame = tk.Frame(root)
display_frame.place(relwidth = 0.8, relheight = 0.8, relx = 0.01, rely = 0.1)

out = tk.Text(display_frame, wrap = tk.WORD)
out.place(relwidth = 1, relheight = 1)

drop_btn = tk.Button(root, text = "Drop Tables", command = lambda: [out.delete(1.0, "end"), out.insert(1.0, dropTables(cursor))])
drop_btn.place(relx = 0.9, rely = 0.1, anchor= 'n')

create_btn = tk.Button(root, text = "Create Tables", command = lambda: [out.delete(1.0, "end"), out.insert(1.0, createTables(cursor))])
create_btn.place(relx = 0.9, rely = 0.2, anchor= 'n')

populate_btn = tk.Button(root, text = "Populate Tables", command = lambda: [out.delete(1.0, "end"), out.insert(1.0, insertTables(cursor))])
populate_btn.place(relx = 0.9, rely = 0.3, anchor= 'n')

query_btn = tk.Button(root, text = "Query Tables",  command = lambda: [out.delete(1.0, "end"), out.insert(1.0, viewTables(cursor))])
query_btn.place(relx = 0.9, rely = 0.4, anchor= 'n')

root.mainloop()

db.close()