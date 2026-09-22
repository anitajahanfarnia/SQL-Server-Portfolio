-- نمایش نام کامل، جنسیت، مدرک تحصیلی
-- و مجموع تعداد سفارشات ۵ مشتری با بیشترین تعداد سفارشات،
-- با مدرک تحصیلی Bachelors، نامی که با A یا M شروع شود
-- و درآمد سالانه بین ۵۰٬۰۰۰ تا ۷۰٬۰۰۰ دلار

-- Display the full name, gender, education level,
-- and total order quantity of the top 5 customers with the highest number of orders,
-- whose education level is Bachelors, whose first name starts with A or M,
-- and whose annual income is between $50,000 and $70,000.
select top 5
FirstName + ' ' + LastName as FullName,
Gender,
englisheducation,
sum(orderQuantity) as TotalQuantity
from DimCustomer as c
inner join factinternetsales as f
on c.CustomerKey=f.CustomerKey
where EnglishEducation='bachelors' and
FirstName like '[A,M]%' and
yearlyincome between 50000 and 70000
group by 
FirstName + ' ' + LastName,
Gender,
englisheducation
order by TotalQuantity desc