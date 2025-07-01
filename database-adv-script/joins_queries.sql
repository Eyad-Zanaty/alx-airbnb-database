SELECT airbnb_table.booking, airbnb_table.users FROM airbnb_table 
INNER JOIN result_table ON airbnb_table.booking= result_table.booking;

SELECT airbnb_table.properties, airbnb_table.reviews FROM airbnb_table 
LEFT JOIN result_table ON airbnb_table.properties= result_table.properties;

SELECT airbnb_table.users, airbnb_table.booking FROM airbnb_table 
FULL OUTER JOIN result_table ON airbnb_table.users= result_table.users;
