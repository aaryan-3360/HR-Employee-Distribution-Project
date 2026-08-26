-- Questions
-- 1. what is the gender breakdown of employees in company
select gender,count(*) as count
from hr 
where age >= 18 
group by gender;  

-- 2. what is the race/ethincity breakdown of employees in the company?
select race,count(*) as count
from hr 
where age >= 18 
group by race
order by 2 desc;  

-- 3. what is the age distribution of employees in company?
select min(age) as youngest,
max(age) as oldest
from hr 
where age>=18;

select 
case
when age >= 18 and age <=24 then '18-24'
when age >= 25 and age <=34 then '25-34'
when age >= 35 and age <=44 then '35-44'
when age >= 44 and age <=54 then '44-54'
when age >= 55 and age <=64 then '55-64'
else '65+'
end as  age_group,gender,
count(*) as count 
from hr
where age>=18
group by age_group,gender
order by age_group,gender;

-- 4.  how many employees work at headqueaters versus remote locations;
select location,count(*) as count
from hr 
where age >18 
group by location;

-- 5. how does the gender distribution vary across department and job titles?
select hr.department,hr.gender,count(*) as count
from hr  
group by hr.department,hr.gender
order by department ;

-- 6.what is the distribution of job title across the company?
select hr.jobtitle,count(*) as count 
from hr
group by hr.jobtitle
order by hr.jobtitle desc;

-- 7. what is the distribution of employees across locations by city and state?
select hr.location_state,count(*) as count
from hr 
where age>=18 
group by hr.location_state;

select hr.location_city,count(*) as count
from hr 
where age>=18 
group by hr.location_city;

-- 8.what is the tenure distribution of each department
select department,avg(datediff(termdate,hire_date)/365) as avg_tenure
from hr 
where termdate <= curdate() and age >=18
group by department;
