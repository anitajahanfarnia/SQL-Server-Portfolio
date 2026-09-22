-- فارسی:
-- نمایش کلید کارمند، نام کامل کارمند، سال،
-- میزان کل فروش، میزان کل فروش برنامه‌ریزی‌شده
-- و اختلاف بین فروش واقعی و فروش برنامه‌ریزی‌شده.

-- English:
-- Display the employee key, employee full name, year,
-- total sales, total sales amount quota,
-- and the difference between actual and planned sales.

with Sales as
(
select e.EmployeeKey,FirstName+' '+LastName as FullName,d.calendaryear,
sum(SalesAmount) as TotalSales
from DimEmployee as e 
inner join FactResellerSales as fr
on e.EmployeeKey=fr.EmployeeKey
inner join DimDate as d
on fr.OrderDateKey=d.DateKey
group by e.EmployeeKey,FirstName+' '+LastName,d.calendaryear 
),


Quota as
(
select e.EmployeeKey,FirstName+' '+LastName as FullName,d.calendaryear,
sum(salesAmountQuota) as TotalSalesAmountQuota
from DimEmployee as e 
inner join FactSalesQuota as fq
on e.EmployeeKey=fq.EmployeeKey
inner join DimDate as d
on fq.DateKey=d.DateKey
group by e.EmployeeKey,FirstName+' '+LastName,d.calendaryear )

select s.EmployeeKey,s.FullName,s.CalendarYear,s.TotalSales,
q.TotalSalesAmountQuota,
TotalSales-TotalSalesAmountQuota as Difference
from Sales as s
inner join Quota as q
on s.EmployeeKey=q.EmployeeKey
and s.CalendarYear=q.CalendarYear

