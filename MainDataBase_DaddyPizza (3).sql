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
    idToppings INT FOREIGN KEY REFERENCES Toppings(id)
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
