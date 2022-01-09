select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
	
select employee_name, monthly_salary 
	from employees E
	join employee_salary ES on E.id = ES.employee_id 
	join salary S on S.id = ES.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary 
	from employees E
	join employee_salary ES on e.id = ES.employee_id 
	join salary S on S.id = ES.salary_id
	where monthly_salary<2000;
	
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

 select employee_name, monthly_salary 
 	from employee_salary ES
 	left join employees E on ES.employee_id = E.id
 	join salary S on Es.salary_id = S.id
 	where employee_name is null;
 
 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 
select employee_name, monthly_salary 
 	from employee_salary ES
 	left join employees E on ES.employee_id = E.id
 	join salary S on Es.salary_id = S.id
 	where employee_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП

select employee_name 
   	from employee_salary ES
	right join employees E on ES.employee_id = E.id 
    	where ES.employee_id is null;

--6. Вывести всех работников с названиями их должности

select employee_name, role_name 
	from roles_employee RE
	join employees E on RE.employee_id = E.id
	join roles R on RE.role_id = R.id;
	
--7. Вывести имена и должность только Java разработчиков

select employee_name, role_name 
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id 
	where role_name like '%Java%' and not role_name like '%JavaScript%';

--8. Вывести имена и должность только Python разработчиков

select employee_name, role_name 
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id 
	where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров

select employee_name, role_name 
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id 
	where role_name like '%QA%';

 --10. Вывести имена и должность ручных QA инженеров

select employee_name, role_name 
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id 
	where role_name like '%Manual%' and role_name like '%QA%';

--11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id 
	where role_name like '%Automation%' and role_name like '%QA%';

 --12. Вывести имена и зарплаты Junior специалистов
	
select employee_name, monthly_salary, role_name 
	from employees E
	join employee_salary ES on ES.employee_id = E.id
	join salary S on ES.salary_id = S.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where role_name like '%Junior%';

 --13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary, role_name
	from employees E
	join employee_salary ES on ES.employee_id = E.id
	join salary S on ES.salary_id = S.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary, role_name
	from employees E
	join employee_salary ES on ES.employee_id = E.id
	join salary S on ES.salary_id = S.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select s.monthly_salary, r.role_name 
	from salary S
	join employee_salary ES on ES.salary_id = S.id
	join employees E on ES.employee_id = E.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id 
	where role_name like '%Java%';

--16. Вывести зарплаты Python разработчиков

select s.monthly_salary, r.role_name 
	from salary S
	join employee_salary ES on ES.salary_id = S.id
	join employees E on ES.employee_id = E.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id 
	where r.role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
	from salary S
	join employee_salary ES on ES.salary_id = S.id
	join employees E on ES.employee_id = E.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id 
	where role_name like '%Junior%' and role_name like '%Python%'

--18. Вывести имена и зарплаты Middle JS разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
	from salary S
	join employee_salary ES on ES.salary_id = S.id
	join employees E on ES.employee_id = E.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id 
	where role_name like '%Middle%' and role_name like '%JavaScript%';

 --19. Вывести имена и зарплаты Senior Java разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
	from salary S
	join employee_salary ES on ES.salary_id = S.id
	join employees E on ES.employee_id = E.id
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id 
	where role_name like '%Senior%' and role_name like '%Java%' and not role_name like '%JavaScript%';

--20. Вывести зарплаты Junior QA инженеров

select r.role_name, s.monthly_salary 
	from salary S
	join employee_salary ES on ES.salary_id = S.id 
	join employees E on ES.employee_id = E.id 
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where r.role_name like '%Junior%' and r.role_name like '%QA%' 

--21. Вывести среднюю зарплату всех Junior специалистов

select avg (s.monthly_salary) 
	from salary S
	join employee_salary ES on ES.salary_id = S.id 
	join employees E on ES.employee_id = E.id 
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where r.role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum (s.monthly_salary) 
	from salary S
	join employee_salary ES on ES.salary_id = S.id 
	join employees E on ES.employee_id = E.id 
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where r.role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select min (s.monthly_salary) 
	from salary S
	join employee_salary ES on ES.salary_id = S.id 
	join employees E on ES.employee_id = E.id 
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id 
	where r.role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max (s.monthly_salary) 
	from salary S
	join employee_salary ES on ES.salary_id = S.id 
	join employees E on ES.employee_id = E.id 
	join roles_employee RE on RE.employee_id = E.id
	join roles R on RE.role_id = R.id
	where r.role_name like '%QA%' ;

--25. Вывести количество QA инженеров

select COUNT (role_name)
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id 
	where role_name like '%QA%';

 --26. Вывести количество Middle специалистов.

select COUNT (role_name) 
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id
	where role_name like '%Middle%';

--27. Вывести количество разработчиков

select COUNT (role_name) 
	from roles_employee RE
	join employees E on RE.employee_id = E.id 
	join roles R on RE.role_id = R.id
	where role_name like '%developer%';

 --28. Вывести фонд (сумму) зарплаты разработчиков

select sum(monthly_salary) 
	from employees
	join employee_salary on employee_salary.employee_id = employees.id
	join salary on employee_salary.salary_id = salary.id
	join roles_employee on roles_employee.employee_id = employees.id
	join roles on roles_employee.role_id = roles.id
	where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
	
select e.employee_name, r.role_name, s.monthly_salary 
	from salary s
	join employee_salary es on es.salary_id = s.id 
	join employees e on es.employee_id = e.id
	left join roles_employee re on re.employee_id = e.id
	left join roles r on re.role_id = r.id
	order by monthly_salary asc;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select e.employee_name, r.role_name, s.monthly_salary 
	from salary s
	join employee_salary es on es.salary_id = s.id 
	join employees e on es.employee_id = e.id
	left join roles_employee re on re.employee_id = e.id
	left join roles r on re.role_id = r.id
	where monthly_salary between 1700 and 2300 order by monthly_salary asc;
	
 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
	
select e.employee_name, r.role_name, s.monthly_salary 
	from salary s
	join employee_salary es on es.salary_id = s.id 
	join employees e on es.employee_id = e.id
	left join roles_employee re on re.employee_id = e.id
	left join roles r on re.role_id = r.id
	where  monthly_salary <2300 order by monthly_salary asc;

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary 
	from salary s
	join employee_salary es on es.salary_id = s.id 
	join employees e on es.employee_id = e.id
	left join roles_employee re on re.employee_id = e.id
	left join roles r on re.role_id = r.id
	where  monthly_salary in (1100, 1500, 2000);
