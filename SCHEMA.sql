CREATE DATABASE Message_records

USE Message_records
GO

CREATE SCHEMA Message_records
GO	

CREATE TABLE Message_records.user_data
(
	user_id int PRIMARY KEY ,
	group_id int NOT NULL , 
	user_name nvarchar(255) NOT NULL,
	user_age int NOT NULL,
	user_reg_email nvarchar(255) NOT NULL, 
	gender nvchar(50) NOT NULL,
	first_joined_at TIMESTAMP NOT NULL,
	starred_message_id int 	
)

CREATE TABLE Message_records.group_data
(
	group_id int PRIMARY KEY ,
	group_name varchar(255) NOT NULL,
	group_members_count int NOT NULL,
	user_id int NOT NULL,
	joined_at TIMESTAMP NOT NULL,
	PRIMARY KEY (group_id, user_id),
	FOREIGN KEY (group_id) REFERENCES Message_records.user_data(group_id)
)

CREATE TABLE Message_records.messages 
(
    message_id INT PRIMARY KEY,
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    message_text nvarchar(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (group_id) REFERENCES Message_records.group_data(group_id),
    FOREIGN KEY (user_id) REFERENCES Message_records.user_data(user_id)
	
);
