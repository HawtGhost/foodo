CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    NomorTelepon VARCHAR(20),
    PasswordHash VARCHAR(255),
    Salt VARCHAR(255)
);

INSERT INTO Customers VALUES
(1, 'Budi', 'Santoso', 'budi@example.com', '08123456789', 'abc123', 'xyz'),
(2, 'Siti', 'Nurbaya', 'siti@example.com', '08123456790', 'def456', 'uvw'),
(3, 'Joko', 'Widodo', 'joko@example.com', '08123456791', 'ghi789', 'rst'),
(4, 'Ani', 'Susanti', 'ani@example.com', '08123456792', 'jkl012', 'opq'),
(5, 'Tono', 'Haryanto', 'tono@example.com', '08123456793', 'mno345', 'lmn'),
(6, 'Tina', 'Effendi', 'tina@example.com', '08123456794', 'pqr678', 'kji');


CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    NamaMenu VARCHAR(255),
    Harga INT,
    Deskripsi TEXT,
    Ketersediaan VARCHAR(3)
);

INSERT INTO Menu VALUES
(1, 'Batagor', 15000, '', 'Ya'),
(2, 'Nasi Kuning', 20000, '', 'Ya'),
(3, 'Nasi Pecel', 18000, '', 'Ya'),
(4, 'Apple Juice', 10000, '', 'Ya'),
(5, 'Avocado Juice', 12000, '', 'Ya'),
(6, 'Coffee', 8000, '', 'Ya');

CREATE TABLE MetodePembayaran (
    MetodeID INT PRIMARY KEY,
    NamaMetode VARCHAR(255)
);

INSERT INTO MetodePembayaran VALUES
(1, 'QRIS'),
(2, 'Debit');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    TanggalPemesanan DATE,
    TotalHarga INT,
    StatusPembayaran VARCHAR(255),
    MetodeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (MetodeID) REFERENCES MetodePembayaran(MetodeID)
);

INSERT INTO Orders VALUES
(1, 1, '2023-11-16', 45000, 'Sudah Dibayar', 1),
(2, 2, '2023-11-16', 30000, 'Sudah Dibayar', 2),
(3, 3, '2023-11-16', 28000, 'Belum Dibayar', 1),
(4, 4, '2023-11-16', 20000, 'Sudah Dibayar', 2),
(5, 5, '2023-11-16', 15000, 'Belum Dibayar', 1),
(6, 6, '2023-11-16', 8000, 'Sudah Dibayar', 2);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    MenuID INT,
    Jumlah INT,
    Catatan TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

INSERT INTO OrderDetails VALUES
(1, 1, 1, 2, ''),
(2, 1, 4, 1, ''),
(3, 2, 2, 1, ''),
(4, 2, 5, 1, ''),
(5, 3, 3, 1, ''),
(6, 3, 6, 1, '');