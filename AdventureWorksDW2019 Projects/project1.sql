-- فارسی: نمایش کلید کارمند، نام کامل، میزان کل فروش و سال
-- فقط برای کارمندی که بیشترین فروش را در یک سال داشته است.
-- English: Display the employee key, full name, total sales, and year
-- only for the employee with the highest sales in a year.
select top 1
e.EmployeeKey,FirstName+' '+LastName as FullName,
sum(salesAmount) as TotalSales,CalendarYear
from DimEmployee as e
inner join FactResellerSales as f
on e.EmployeeKey = f.employeekey
inner join DimDate as d
on f.OrderDateKey=d.DateKey
group by e.EmployeeKey,FirstName+' '+LastName,CalendarYear
order by TotalSales desc

