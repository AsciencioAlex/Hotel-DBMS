-- Creating Hotel Table-->

CREATE TABLE Hotel (
Hotel_id int NOT NULL,
Name varchar(50),
Location varchar(50),
    Phone_Number int,
    CONSTRAINT PK_Hotel PRIMARY KEY (Hotel_id)
);

-- Creating Customer Table-->

CREATE TABLE Customer(
Customer_id int NOT NULL,
Name varchar(50),
Address varchar(50),
    Contact_No int,

Age int,

Zip_code int,

CONSTRAINT PK_Customer PRIMARY KEY (Customer_id)

);

-- Creating Employee Table-->

CREATE TABLE EMployee(
Employee_id int NOT NULL,
Name varchar(50),
Address varchar(50),
    Contact_No int,

Hotel_id int,
    CONSTRAINT PK_Hotel PRIMARY KEY (Employee_id),
 FOREIGN KEY(Hotel_id) REFERENCES Hotel(Hotel_id)
);

--  Creating Room Table-->
CREATE TABLE Room(
Room_id int NOT NULL,

Room_type int,

Hotel_id int,
Room_image varchar(50),
Address varchar(50),
Room_description varchar(50),

    CONSTRAINT PK_Room PRIMARY KEY (Room_id),

FOREIGN KEY(Room_type) REFERENCES Room_type(Room_type),

FOREIGN KEY(Hotel_id) REFERENCES Hotel(Hotel_id)
);

--  Creating Room_type Table-->

CREATE TABLE Room_type(
Room_type int NOT NULL,
Room_price int,
Room_amenities varchar(50),
    Room_name varchar(50),
    CONSTRAINT PK_Room_type PRIMARY KEY (Room_type)
);

--  Creating Payment_type Table-->

CREATE TABLE Payment_type(
Payment_type int NOT NULL,
Creadit_card_no int,
Expiry_date int,
    Card_holder_name varchar(50),
    CONSTRAINT PK_Payment_type PRIMARY KEY (Payment_type)
);

--  Creating Payment Table-->
CREATE TABLE payment(
Payment_id int NOT NULL,

Customer_id int,

Payment_type int,
Room_charge int,
Payment_date date,
CONSTRAINT PK_Payment PRIMARY KEY (Payment_id),

FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id),

FOREIGN KEY(Payment_type) REFERENCES Payment_type(Payment_type)
);

--   Creating Service Table-->

CREATE TABLE Services(
Service_id int NOT NULL,
Reservation_no int,
Service_name varchar(50),
    Sevice_charge int,
    CONSTRAINT PK_Services PRIMARY KEY (Service_id),

 FOREIGN KEY(Reservation_no) REFERENCES Reservation(Reservation_no)
);

--  Creating Bill Details Table-->

CREATE TABLE Bill_deatils(
 Bill_id int NOT NULL,

Service_id int,

Customer_id int,
Amount int,
Date date,
    Service_details varchar(50),
 
     CONSTRAINT PK_Bill_deatils PRIMARY KEY (Bill_id),

FOREIGN KEY(Service_id) REFERENCES Services(Service_id),

FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id)
);

-- Creating Reservation Table-->

CREATE TABLE Reservation(
Reservation_no int NOT NULL,

Customer_id int,

Room_id int,
Check_in_date date,
Check_out_date date,
    Status varchar(50),

Period varchar(50),

    CONSTRAINT PK_Reservation PRIMARY KEY (Reservation_no),

 FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id),

FOREIGN KEY(Room_id) REFERENCES Room(Room_id)
);
