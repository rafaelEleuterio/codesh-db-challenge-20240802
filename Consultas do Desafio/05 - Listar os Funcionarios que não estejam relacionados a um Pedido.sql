SELECT staffs.staff_id, staffs.first_name, staffs.last_name FROM staffs
LEFT JOIN orders ON orders.staff_id = staffs.staff_id
WHERE  staffs.staff_id NOT IN 
	(SELECT staff_id FROM orders	
		WHERE order_id = 1);