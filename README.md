# Car workshop database

### Database structure

![Database structure](https://i.ibb.co/v4zQKnz/scheme.png)

### Tasks

#### piroba 1-  ქუთაისში შემოსული შეკვეთები
```sql
SELECT  count(orders.customer_id) AS orders_number, location.city
FROM location
JOIN branches ON branches.city_id = location.id
JOIN orders ON branches.id = orders.branches_id
WHERE location.city = "kutaisi"
GROUP BY orders.branches_id 
```

#### piroba 2- ქუთაისში შემოსული შეკვეთების ჯამი(ფასი) 
```sql
SELECT SUM(orders.cost)
FROM orders
JOIN branches ON branches.id = orders.branches_id
JOIN location ON branches.city_id = location.id
WHERE location.city = "kutaisi"
```

#### piroba 3-  ქუთაისში x პიროვნებამ რამდენი შეკვეთა გააკეთა და რა ფასების
```sql
SELECT employees.name ,  orders.cost
FROM orders
JOIN branches ON branches.id = orders.branches_id
JOIN location ON branches.city_id = location.id
JOIN employees ON employees.branches_id = location.id
WHERE location.city = "kutaisi" AND employees.name  = "ramaz"
```

#### piroba 4- ბათუმის x ბრენჩის შეკვეთების საერთო ჯამი
```sql
SELECT branches.name AS branches_name,  sum(orders.cost) AS order_costs
FROM orders
JOIN branches ON branches.id = orders.branches_id
JOIN location ON branches.city_id = location.id
WHERE location.city = "batumi" AND branches.id = "12"
```

#### piroba 5- რამდენი შეკვეთა გააფორმა x ოპერატორმა 
```sql
SELECT  concat(employees.name, ' ' , employees.surname) AS operator, count(orders.id) order_number
FROM orders
JOIN employees ON orders.operator_id= employees.id
WHERE employees.id = "14"
```


#### piroba 6- რამდენი მანქანა გააკეთა x თანამშრომელმა 
```sql

SELECT concat(employees.name, ' ' , employees.surname) AS employees , COUNT(order_details.order_id) AS order_number
FROM order_details
JOIN employees ON order_details.employee_id = employees.id
WHERE employees.id = 11
```

#### piroba 7- რამდენი შეკვეთა ჰქონდა ხადავშიკებს, ელექტრიკებს, ჟეშტიანჩიკებს 
```sql

SELECT workers_type.`type`, concat(employees.name, ' ' , employees.surname) AS employees , count(order_details.order_id) orders_number
FROM order_details
JOIN employees ON order_details.employee_id = employees.id
JOIN employees_quality ON employees_quality.employee_id = employees.id
JOIN workers_type ON employees_quality.type_id = workers_type.id
WHERE workers_type.`type` = "Electrician"
GROUP BY order_details.employee_id
```


#### piroba 8- ელექტრიკების შეკვეთების ჯამი ქუთაისში
```sql

SELECT workers_type.`type`, concat(employees.name, ' ' , employees.surname) AS employees , count(order_details.order_id) orders_number,  location.city
FROM orders
JOIN order_details ON order_details.order_id = orders.id
JOIN employees ON order_details.employee_id = employees.id
JOIN employees_quality ON employees_quality.employee_id = employees.id
JOIN workers_type ON employees_quality.type_id = workers_type.id
JOIN branches ON orders.branches_id = branches.id
JOIN location ON branches.city_id = location.id

WHERE workers_type.id = 2 and branches.city_id = 2
GROUP BY order_details.employee_id

```



#### piroba 9- ქუთაისის თანამშრომლები
```sql
SELECT CONCAT (employees.name, ' ' , employees.surname) AS employee
FROM employees
JOIN branches ON branches.id = employees.branches_id
JOIN location ON branches.city_id = location.id

WHERE location.city = "kutaisi"
```

#### piroba 10 - თანამშრომლები თბილისის X ფილიალში
```sql
SELECT CONCAT (employees.name, ' ' , employees.surname) AS employee , location.city, branches.name branches_name
FROM employees
JOIN branches ON branches.id = employees.branches_id
JOIN location ON branches.city_id = location.id
WHERE branches.name = "digomi"
```

#### piroba 11 - ოპერატორები რომლებიც მუშაობენ ბათუმში
```sql
SELECT CONCAT (employees.name, ' ' , employees.surname) AS operators , location.city
FROM employees
JOIN employees_quality ON employees.id = employees_quality.employee_id
JOIN workers_type ON workers_type.id = employees_quality.type_id
JOIN branches ON branches.id = employees.branches_id
JOIN location ON branches.city_id = location.id
WHERE location.city = "batumi" AND workers_type.id = 1


```

#### piroba 12 - ხადავშიკები ან ელექტრიკები, რომლებიც მუშაობენ თბილისში
```sql
SELECT CONCAT (employees.name, ' ' , employees.surname) AS employee , location.city , workers_type.`type`
FROM employees
JOIN employees_quality ON employees.id = employees_quality.employee_id
JOIN workers_type ON workers_type.id = employees_quality.type_id
JOIN branches ON branches.id = employees.branches_id
JOIN location ON branches.city_id = location.id
WHERE location.city = "kutaisi" AND (workers_type.id = 4 OR workers_type.id = 2)
ORDER BY workers_type.`type`
```




