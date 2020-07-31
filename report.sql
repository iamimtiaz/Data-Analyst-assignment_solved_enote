USE [test]
GO

Select acc.id_person, FORMAT(trnx.transaction_date, 'MM.yyyy') as month, COUNT([transaction_amount]) as sum_of_transactions 
from dbo.transactionTable trnx
inner join dbo.account acc on acc.id_account= trnx.id_account and acc.id_person IN (345,1234)
where trnx.transaction_date between '2020/02/15' and '2020/06/06'
group by acc.id_person, FORMAT(trnx.transaction_date, 'MM.yyyy')
order by acc.id_person DESC,FORMAT(trnx.transaction_date, 'MM.yyyy') ASC