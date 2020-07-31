import pandas as pd
import pyodbc
import os, sys

serverName = 'P01153782'
dbName = 'test'

person = ['id_person','name','surname','zip','city','country','email','phone_number','birth_date']
account= ['id_account','id_person','account_type']
transaction = ['id_transaction','id_account','transaction_type','transaction_date','transaction_amount']

personStatement = '''INSERT INTO {}.dbo.person (id_person, name, surname, zip, city, country, email, phone_number, birth_date) VALUES (?,?,?,?,?,?,?,?,?)'''.format(dbName)
accountStatement = '''INSERT INTO {}.dbo.account (id_account, id_person, account_type) VALUES (?,?,?)'''.format(dbName)
transactionStatement = '''INSERT INTO {}.dbo.transactionTable (id_transaction, id_account, transaction_type, transaction_date, transaction_amount) VALUES (?,?,?,?,?)'''.format(dbName)

def makeDataframe(fileName, columnList):
    data = pd.read_csv (os.path.join(sys.path[0], "{0}.csv".format(fileName)), low_memory=False)
    return pd.DataFrame(data, columns=columnList ).dropna(how='all').fillna(value=0)

def insertIntoTable(dfName, sqlStatement):
    for row in dfName.itertuples():
        try:
            cursor.execute(sqlStatement,
                        row)                                  
        except Exception as e:
            # print(e) 
            continue           
        
    cnxn.commit()

df_person = makeDataframe("BI_assignment_person", person)
df_person.set_index('id_person', inplace=True)
df_account = makeDataframe("BI_assignment_account", account)
df_account.set_index('id_account', inplace=True)
df_transaction = makeDataframe("BI_assignment_transaction", transaction)
df_transaction.set_index('id_transaction', inplace=True)


cnxn = pyodbc.connect("Driver={SQL Server Native Client 11.0};"
                      "Server=P01153782;"
                      "Database=test;"
                      "Trusted_Connection=yes;")
cursor = cnxn.cursor()
insertIntoTable(df_person, personStatement)
insertIntoTable(df_account, accountStatement)
insertIntoTable(df_transaction, transactionStatement)

