CREATE DATABASE PizzaForGoodDaddyDB;
GO
USE PizzaForGoodDaddyDB;
GO 

CREATE TABLE Roles
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(MAX) NOT NULL,
    createDate DATETIME NOT NULL
)
GO

CREATE TABLE Users
(
    id INT PRIMARY KEY IDENTITY,
    email NVARCHAR(MAX) NOT NULL,
    password NVARCHAR(MAX) NOT NULL,
    idRole INT FOREIGN KEY REFERENCES Roles(id),
    adress NVARCHAR(MAX) NOT NULL,
    createDate DATETIME NOT NULL
)
GO

CREATE TABLE Toppings
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(MAX) NOT NULL,
    weight NVARCHAR(MAX) NOT NULL,
    createDate DATETIME NOT NULL
)
GO

CREATE TABLE Categories
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(MAX) NOT NULL,
    createDate DATETIME NOT NULL
)
GO

CREATE TABLE Pizzas
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(MAX) NOT NULL,
    size NVARCHAR(MAX) NOT NULL,
    price FLOAT NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    idCategory INT FOREIGN KEY REFERENCES Categories(id),
    createDate DATETIME NOT NULL
)
GO

CREATE TABLE PizzasToppings
(
    id INT PRIMARY KEY IDENTITY,
    idPizza INT FOREIGN KEY REFERENCES Pizzas(id),
    idTopping INT FOREIGN KEY REFERENCES Toppings(id)
)
GO

CREATE TABLE Orders
(
    id INT PRIMARY KEY IDENTITY,
    dateOrder DATETIME NOT NULL,
    status NVARCHAR(MAX) NOT NULL,
    idUser INT FOREIGN KEY REFERENCES Users(id)
)
GO

CREATE TABLE OrderPizzas
(
    id INT PRIMARY KEY IDENTITY,
    idPizza INT FOREIGN KEY REFERENCES Pizzas(id),
    idOrder INT FOREIGN KEY REFERENCES Orders(id),
    count INT NOT NULL
)
GO

CREATE TABLE Histories
(
    id INT PRIMARY KEY IDENTITY,
    idOrder INT FOREIGN KEY REFERENCES Orders(id),
    idUser INT FOREIGN KEY REFERENCES Users(id)
)
GO

CREATE TABLE Combos
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(MAX) NOT NULL,
    desription NVARCHAR(MAX) NOT NULL,
    createDate DATETIME NOT NULL,
    price FLOAT NOT NULL,
    idCategory INT FOREIGN KEY REFERENCES Categories(id)
)
GO

CREATE TABLE ComboItems
(
    id INT PRIMARY KEY IDENTITY,
    idCombo INT FOREIGN KEY REFERENCES Combos(id),
    idPizza INT FOREIGN KEY REFERENCES Pizzas(id)
)
GO

CREATE TABLE OrderCombos
(
    id INT PRIMARY KEY IDENTITY,
    idCombo INT FOREIGN KEY REFERENCES Combos(id),
    idOrder INT FOREIGN KEY REFERENCES Orders(id),
    count INT NOT NULL
)
GO

CREATE TABLE Baskets
(
    id INT PRIMARY KEY,
    createDate DATETIME NOT NULL,
    CONSTRAINT FK_Baskets_UserId FOREIGN KEY (id) REFERENCES Users(id)
)
GO

CREATE TABLE BasketItemsPizzas
(
    id INT PRIMARY KEY IDENTITY,
    idBasket INT FOREIGN KEY REFERENCES Baskets(id),
    idPizza INT FOREIGN KEY REFERENCES Pizzas(id),
    count INT NOT NULL
)
GO

CREATE TABLE BasketItemsCombos
(
    id INT PRIMARY KEY IDENTITY,
    idBasket INT FOREIGN KEY REFERENCES Baskets(id),
    idCombo INT FOREIGN KEY REFERENCES Combos(id),
    count INT NOT NULL
)
go
INSERT INTO Roles (name, createDate)
VALUES 
('������������', GETDATE()), 
('�����', GETDATE());
GO

INSERT INTO Categories (name, createDate)
VALUES 
('������', GETDATE()), 
('������', GETDATE()), 
('������', GETDATE()), 
('��������������', GETDATE());
GO

INSERT INTO Pizzas (name, size, price, description, idCategory, createDate)
VALUES 
('������', '�������', 456, '��������, �������, ��������� ���������, ������ �������� ������, ���������, ��������� �������� ����', 1, GETDATE()),
('������', '�������', 478, '���������, ���� ������ � ��������, ��������� ���� ��������', 2, GETDATE()),
('��������', '�������', 389, '��������� ���������, ����������� ������ ���������, ��������� �������� ����', 3, GETDATE()),
('������� ��������', '�������', 500, '��������, ���������, ��������� ���� ��������', 1, GETDATE()),
('������� � ���', '���������', 300, '�������, ���������, ��������� ���� ��������', 4, GETDATE());
GO
-- ���������� ������� Toppings
INSERT INTO Toppings (name, weight, createDate)
VALUES 
('��������� ���������', '50 �', GETDATE()), 
('��������', '100 �', GETDATE()), 
('�������', '70 �', GETDATE()), 
('���������', '120 �', GETDATE()), 
('���� ������ � ��������', '80 �', GETDATE()), 
('������ �������� ������', '60 �', GETDATE());

-- ���������� ������� Combos
INSERT INTO Combos (name, desription, createDate, price, idCategory)
VALUES 
('�������� �����', '������� ����� �� ����� + 2 � ����������� �������', GETDATE(), 850, 1),
('����� "������ ����"', '2 ������� ����� �� ����� + 2 �������� + ����� �� �����', GETDATE(), 1200, 2);

-- ���������� ������� ComboItems
INSERT INTO ComboItems (idCombo, idPizza)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- ���������� ������� Users
INSERT INTO Users (email, password, idRole, adress, createDate)
VALUES 
('user1@example.com', 'password1', 1, '�. ������, ��. �������, �. 10, ��. 5', GETDATE()), 
('admin@example.com', 'adminpassword', 2, '�. �����-���������, ��. ������, �. 15', GETDATE());

-- ���������� ������� Baskets
INSERT INTO Baskets (id, createDate)
VALUES 
(1, GETDATE()),
(2, GETDATE());

-- ���������� ������� BasketItemsPizzas
INSERT INTO BasketItemsPizzas (idBasket, idPizza, count)
VALUES 
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 4, 3);
select * from OrderPizzas
select * from Orders
select * from Pizzas
select * from PizzasToppings
select * from BasketItemsPizzas
select * from Users
update BasketItemsPizzas set idBasket = 3 WHERE idBasket = 2

select * from Baskets
insert into Baskets VALUES (3,GETDATE())