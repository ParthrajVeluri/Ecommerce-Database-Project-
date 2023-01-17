  num_fields = len(cursor.description)
        field_names = [i[0] for i in cursor.description]
        print(field_names[0])
        df = pd.DataFrame(rows, columns=field_names, index_col = String(field_names[0]))
        print(df)  
    except: 
        print("DID NOT EXECUTE")
db.close()