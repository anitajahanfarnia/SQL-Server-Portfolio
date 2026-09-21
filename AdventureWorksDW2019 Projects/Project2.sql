-- فارسی:
-- نمایش کلید کارمند، نام کامل کارمند، سال
-- و مجموع میزان فروش برنامه‌ریزی‌شده
-- بدون اعمال شرط و مرتب‌سازی بر اساس مجموع فروش برنامه‌ریزی‌شده به صورت نزولی

-- English:
-- Display the employee key, full name, year,
-- and total sales amount quota
-- without applying any filter, 
--ordered by total sales amount quota in descending order.

select e.EmployeeKey,FirstName+' '+LastName
as FullName,
d.CalendarYear,sum(salesamountquota)as
TotalSalesAmountQuota
from DimEmployee as e
inner join FactSalesQuota as f
on e.EmployeeKey=f.EmployeeKey
inner join DimDate as d
on f.DateKey=d.DateKey
group by e.EmployeeKey,
FirstName+' '+LastName,
d.CalendarYear
order by TotalSalesAmountQuota desc