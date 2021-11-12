-------------------------------------------------------------------------------------------------
			drop table Meat_user;
			create table Meat_user(
			id number(10) primary key,
			user_name varchar2(30) not null,
			mail_id varchar2(50) unique not null,
			user_password varchar2(20) not null,
			user_address varchar2(50),
			user_phone varchar2(20),
			file_name varchar2(50),
			file_data blob,
			Order_status varchar2(10),
			User_Query varchar2(200),
			role varchar2(20)
			);
			truncate table Meat_user;
			insert into Meat_user (id,user_name,mail_id,user_password,role)values((select nvl(max(id),0)+1 from Meat_user),'raghv','raghvp672@gmail.com','123','user');
			
			commit;
			select id,user_name,mail_id,user_password,role from Meat_user;
			update Meat_user set user_password='1234' where mail_id='raghvp672@gmail.com';
			commit;
			select id,user_name,mail_id,user_password,role from Meat_user where mail_id='raghvp672@gmail.com' and user_password='1234';
			
			-------------------------------------------------------------------------------------------------
			
			create table Meat_Shop(
			shop_id number(10) primary key,
			shop_name varchar2(100)unique not null,
			shop_address varchar2(200),
			shop_file_name varchar2(200),
			shop_file_data blob, 
			shop_details varchar2(500)
			);
			
			truncate table Meat_Shop;
			
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'Al-Taha egg center
			','near Railway junction,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'Sahu Chicken Center
			','In front of post office,jai stambh chowk,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'boycee chicken center
			','near anupam garden,samta colony,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'Bonchon Chicken
			','tatyapara chowk,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'Chicken on the Rough
			','near amanaka police station,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'Khan Mutton
			','near AIIMS gate no.2, mahoba bazaar,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Shop),'Asifa prawns
			','near Nalanda parisar,amanaka,raipur','7000844859');
			insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details)values((select nvl(max(shop_id),0)+1 from Meat_Meat_Shop),'Crabs house
			','ghadi chowk,raipur','7000844859');
			commit;
			
			
			select shop_id,shop_name,shop_details from Meat_Shop;
			update Meat_Shop set shop_name='sahu chicken' where shop_id=1;
			commit;
			select shop_id,shop_name ,shop_details from Meat_Shop;
			
			
			drop table Meat_Shop;
			
			-------------------------------------------------------------------------------------------------
			create table Meat_Item(
			item_id number(10) primary key,
			item_name varchar2(100) not null,
			item_price number(10,2),
			shop_id number(10),
			item_quantity number(10),
			item_file_name varchar2(200),
			item_file_data blob
			);
				insert into Meat_Item(item_id,item_name,item_price,shop_id,item_quantity)
				values((select nvl(max(item_id),0)+1 from Meat_Item),'egg',7,5,1);
				
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Brown KadakNath Egg',15,1,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Natural Hen Egg',5,1,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Frozen Prawns',350,7,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Mantis Shrimp',500,7,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'White Prawn',400,7,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Broiler Chicken',140,2,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'KadakNath',500,2,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Vanaraja Chicken',320,2,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Broiler Chicken',140,3,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'KadakNath',500,3,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Vanaraja Chicken',320,3,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Broiler Chicken',140,4,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'KadakNath',500,4,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Vanaraja Chicken',320,4,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Frozen Red Crab',300,8,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Live Crab',400,8,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Maryland Crab',500,8,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Mud Crab',430,8,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Sea Crab',350,8,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Goat Meat',500,6,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Lean Mutton',580,6,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Broiler Chicken',140,6,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'KadakNath',500,6,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,	
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Vanaraja Chicken',320,6,1);
			
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Broiler Chicken',140,5,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'KadakNath',500,5,1);
					
					insert into Meat_Item(
					item_id,
					item_name,
					item_price,
					shop_id,
					item_quantity)
					values((select nvl(max(item_id),0)+1 from Meat_Item),'Vanaraja Chicken',320,5,1);
			-------------------------------------------------------------------------------------------------
					create table Meat_User_Order(
					id number(10) unique ,
					order_mail_id varchar2(50),
					order_shop_id number(10),
					user_item_quantity number(5),
					price number(10,2) default 0.0,
					dop timestamp  primary key, 
					user_status varchar2(10),
					coupon_id varchar2(10) ,
					constraint ksfkk1 foreign key (order_shop_id) references Meat_Shop(shop_id),
					constraint ksfkk2 foreign key (order_mail_id) references Meat_user(mail_id)
					);
					
					insert into Meat_User_Order(id,order_mail_id,order_shop_id,user_item_quantity,price,dop,user_status,coupon_id)values((select nvl(max(id),0)+1 from Meat_User_Order),'raghvp672@gmail.com',9,3,1250,'23-JUN-20','yes','fresh50');
					
			-------------------------------------------------------------------------------------------------
					create table Meat_User_Order_item(
					i_id number(10) primary key,
					User_mail_id varchar2(50),
					item_id number(10), 
					item_quantity number(5),
					price number(10,2) default 0.0,
					Order_dop timestamp , 
					constraint first foreign key (User_mail_id) references Meat_user(mail_id),
					constraint second foreign key (item_id) references Meat_Item(item_id),
					constraint third foreign key (Order_dop) references Meat_User_Order(dop)
					);
					insert into Meat_User_Order_item
					(i_id,user_mail_id,item_id,item_quantity,price,Order_dop)
					values((select nvl(max(i_id),0)+1 from Meat_User_Order_item),'raghvp672@gmail.com',4,1,350,'23-JUN-20');
					
					insert into Meat_User_Order_item
					(i_id,user_mail_id,item_id,item_quantity,price,Order_dop)
					values((select nvl(max(i_id),0)+1 from Meat_User_Order_item),'raghvp672@gmail.com',5,1,500,'23-JUN-20');
					
					insert into Meat_User_Order_item
					(i_id,user_mail_id,item_id,item_quantity,price,Order_dop)
					values((select nvl(max(i_id),0)+1 from Meat_User_Order_item),'raghvp672@gmail.com',6,1,400,'23-JUN-20');
					
					_________________________________________
					Fetch particular one Order Record:-
					(First Way)--
					select i_id,user_mail_id,item_id,item_quantity,price from Meat_User_Order_item where Order_dop=(
					select 	dop from Meat_User_Order where order_mail_id='raghvp672@gmail.com');			
					(Second Way)
					
					_______________________________
					truncate table Meat_User_Order_item;
			-------------------------------------------------------------------------------------------------
				create table Meat_User_Cart(
				cart_id number(10)primary key,
				mail_id varchar2(50),
				dop timestamp not null, 
				item_id number(10),
				shop_id number(10),
				item_quantity_no number(10)
				);
				insert into Meat_User_Cart(cart_id,mail_id,dop,item_id,
				shop_id,item_quantity_no)values((select nvl(max(cart_id),0)+1 from Meat_User_Cart)
				,'raghvp672@gmail.com',sysdate,2,3,1);
				
				
				
				Cart view Query:
				select cv.dop,cv.item_id,cv.item_price,cv.item_quantity
				
				truncate table Meat_User_Cart;
			------------------------------------------------------------------------------------------------------------//end 

			//for Coupon Meat_Code db
			create table Meat_Code(
			id number(10) ,
			coupon_value number(20),
			range number(20),
			Meat_Code_name varchar2(4000),
			max_value number(10),
			constraint Meat_Code_pk1 primary key (id)
			);
			insert into Meat_Code(id,coupon_value,range,Meat_Code_name,max_value)values((select nvl(max(id),0)+1 from Meat_Code),25,200,'fresh25',50);
			insert into Meat_Code(id,coupon_value,range,Meat_Code_name,max_value)values((select nvl(max(id),0)+1 from Meat_Code),50,500,'fresh20',100);
			insert into Meat_Code(id,coupon_value,range,Meat_Code_name,max_value)values((select nvl(max(id),0)+1 from Meat_Code),50,1000,'fresh50',250);
			commit;
			
			truncate table Meat_Code;
			------------------------------------------------------------------------------------------------------------//end 
			
			for query for Recent Order
			(1)   select muo.id, s.shop_id, s.shop_name,s.shop_address,s.shop_details ,muo.price,muo.user_status,muo.coupon_id,muo.dop from Meat_User_Order muo ,Meat_Shop s where muo.order_shop_id=s.shop_id and muo.order_mail_id='raghvp672@gmail.com';
			(2)  select muoi.item_id,muoi.item_quantity,muoi.price,mi.item_name from MEAT_USER_ORDER_ITEM muoi,Meat_item mi where mi.item_id=muoi.item_id and ORDER_DOP=? and  user_mail_id=?
			