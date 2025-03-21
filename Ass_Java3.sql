CREATE DATABASE Java3_ASM
GO
USE Java3_ASM
GO
CREATE TABLE USERS (
    id VARCHAR(50) PRIMARY KEY,       
    [password] VARCHAR(255) NOT NULL,  
    fullname NVARCHAR(255) NOT NULL,   
    birthday DATE,                  
    gender BIT,                    
    mobile VARCHAR(10),              
    email VARCHAR(100) NOT NULL,   
    [role] BIT NOT NULL DEFAULT 0        
);
GO
CREATE TABLE CATEGORIES (
    id VARCHAR(50) PRIMARY KEY,      
    [name] NVARCHAR(255) NOT NULL       
);
SELECT * FROM	dbo.NEWS ORDER BY posted_date DESC
GO
CREATE TABLE NEWS (
    id VARCHAR(50) PRIMARY KEY,			
    title NVARCHAR(255) NOT NULL,		
    content NVARCHAR(MAX) NOT NULL,			          
    [image] VARCHAR(MAX),               
    posted_date DATE NOT NULL,          
    author VARCHAR(50) NOT NULL,      
    view_count INT DEFAULT 0,
    category_id VARCHAR(50),           
    Home BIT DEFAULT 0,               
    FOREIGN KEY (Author) REFERENCES USERS(id),
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(id)
);
GO
CREATE TABLE NEWSLETTERS (
    Email VARCHAR(50) PRIMARY KEY,   
    [enabled] BIT NOT NULL DEFAULT 1  
);

INSERT INTO USERS (id, [password], fullname, birthday, gender, mobile, email, [role])
VALUES ('admin', 'admin', 'tran xuan thang dzhihi', '2005-01-01', 1, '0123123123', 'admin@gmail.com', 1);

SELECT * FROM dbo.CATEGORIES
SELECT * FROM dbo.NEWS
SELECT * FROM dbo.NEWSLETTERS
SELECT * FROM dbo.USERS
SELECT * FROM News WHERE Home = 'true' ORDER BY posted_date DESC

SELECT * FROM dbo.NEWS WHERE category_id = 2
SELECT * FROM dbo.CATEGORIES INNER JOIN dbo.NEWS ON NEWS.category_id = CATEGORIES.Id WHERE category_id = 4

SELECT * FROM dbo.CATEGORIES INNER JOIN dbo.NEWS ON NEWS.category_id = CATEGORIES.Id WHERE category_id = 6