use capstone_1;
show tables;
desc credit_data;
select * from credit_data;

-- Group the customers based on their income type and find the average of their annual income.
select Ind_Id,Type_income,avg(Annual_income) from credit_data group by Ind_id,Type_income ;

-- Find the female owners of cars and property.
with female_cte as (select Ind_ID,GENDER,Car_Owner,Propert_Owner from credit_data where Car_Owner ='yes' and Propert_Owner='yes')
select * from female_cte where GENDER='female';


-- Find the male customers who are staying with their families.
with male_cte as ( select Ind_ID,GENDER,Housing_type from credit_data where Housing_type='With parents')
select * from male_cte where GENDER='male';


-- Please list the top five people having the highest income.
select Ind_ID , GENDER ,Annual_income, dense_rank() over(order by Annual_income desc) from credit_data limit 5;

-- How many married people are having bad credit?
with bad_credit_cte as ( select * from credit_data where GENDER='female')
select * from bad_credit_cte where label = 'Not approved' ;

-- What is the highest education level and what is the total count?
select distinct(EDUCATION) from credit_data;  -- From this we can see that higher education is the highest education level.
select EDUCATION,count(*) as COUNT  from credit_data group by EDUCATION having EDUCATION='Higher education';


-- Between married males and females, who is having more bad credit? 
select label,GENDER,count(*) as Number_in_total from credit_data group by label,GENDER having label='Not approved'; -- From this we can see that female are more in number in terms of bad credit.

