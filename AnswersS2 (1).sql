--Question1--
select countries.Name, city.Name as CapitalCity,LANG_NAME as Language,GovernmentForm,countries.Population as TotalPopulation
from countries 
inner join city on countries.Code = city.CountryCode
inner join language on countries.Code = language.Code;

--Question2--
select * from countries natural join city;

select * from countries inner join city on city.CountryCode = countries.Code;

--Question 3--
select * from countries natural join language;

select * from countries inner join language on language.Code = countries.Code;

--Question4--
select * from countries left join city 
on city.CountryCode = countries.Code;

--Question5--
select * from countries left join language 
on language.Code = countries.Code;

--Question6--
select Name,Region from countries where Code in
(select city.CountryCode
from city
where city.Population > 3000000
order by city.CountryCode)
