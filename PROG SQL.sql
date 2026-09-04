-- Create VENUEE table
CREATE TABLE Venuee (
    VenueeID INT PRIMARY KEY,
    VenueeName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Capacity INT CHECK (Capacity > 0)
);

-- Create ORGANISERR table
CREATE TABLE Organiserr (
    OrganiserrID INT PRIMARY KEY,
    OrganiserrName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create CATEGORYY table
CREATE TABLE Categoryy (
    CategoryyID INT PRIMARY KEY,
    CategoryyName VARCHAR(50) NOT NULL,
    Description VARCHAR(200)
);

-- Create RACEE table
CREATE TABLE Racee (
    RaceeID INT PRIMARY KEY,
    RaceeName VARCHAR(100) NOT NULL,
    RaceeDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    Distance DECIMAL(5,2) NOT NULL,
    VenueeID INT NOT NULL,
    OrganiserrID INT NOT NULL,
    CategoryyID INT NOT NULL,
    FOREIGN KEY (VenueeID) REFERENCES Venuee(VenueeID),
    FOREIGN KEY (OrganiserrID) REFERENCES Organiserr(OrganiserrID),
    FOREIGN KEY (CategoryyID) REFERENCES Categoryy(CategoryyID)
);

-- Create PARTICIPANTT table
CREATE TABLE Participantt (
    ParticipanttID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);

-- Create REGISTRATIONN table
CREATE TABLE Registrationn (
    RegistrationnID INT PRIMARY KEY,
    ParticipanttID INT NOT NULL,
    RaceeID INT NOT NULL,
    RegistrationDate DATE DEFAULT GETDATE(),
    RaceNumber INT UNIQUE,
    RegistrationStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (ParticipanttID) REFERENCES Participantt(ParticipanttID),
    FOREIGN KEY (RaceeID) REFERENCES Racee(RaceeID)
);

-- Create RACERR table
CREATE TABLE Racerr (
    RacerrID INT PRIMARY KEY,
    RacerrName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Nationality VARCHAR(50),
    LicenseNumber VARCHAR(50) UNIQUE
);

-- Create RESULTT table
CREATE TABLE Resultt (
    ResulttID INT PRIMARY KEY,
    RegistrationnID INT NOT NULL,
    FinishTime TIME,
    Position INT,
    ResultStatus VARCHAR(20),
    FOREIGN KEY (RegistrationnID) REFERENCES Registrationn(RegistrationnID)
);

-- Insert sample data
INSERT INTO Venuee VALUES (1, 'Polokwane Stadium', '123 Main St, Polokwane', 5000);
INSERT INTO Venuee VALUES (2, 'Limpopo Arena', '456 Central Rd, Limpopo', 3000);

INSERT INTO Organiserr VALUES (1, 'RaceDay SA', 'info@racedaysa.com');
INSERT INTO Organiserr VALUES (2, 'Elite Runners Club', 'contact@eliteclub.com');

INSERT INTO Categoryy VALUES (1, 'Marathon', 'Long-distance race 42.2km');
INSERT INTO Categoryy VALUES (2, 'Sprint', 'Short-distance race 5km');
INSERT INTO Categoryy VALUES (3, 'Relay', 'Team-based race 10km');

INSERT INTO Racee VALUES (1, 'Spring Marathon', '2026-09-15', '08:00', 42.2, 1, 1, 1);
INSERT INTO Racee VALUES (2, 'Summer Sprint', '2026-10-01', '10:00', 5.0, 2, 2, 2);
INSERT INTO Racee VALUES (3, 'Autumn Relay', '2026-11-20', '09:00', 10.0, 1, 1, 3);

INSERT INTO Participantt VALUES (1, 'John', 'Mokoena', 'john@example.com', '0821234567');
INSERT INTO Participantt VALUES (2, 'Sarah', 'Nkosi', 'sarah@example.com', '0839876543');

INSERT INTO Registrationn VALUES (1, 1, 1, '2026-09-01', 101, 'Confirmed');
INSERT INTO Registrationn VALUES (2, 2, 2, '2026-09-05', 102, 'Confirmed');

INSERT INTO Racerr VALUES (1, 'Thabo Dlamini', '1995-04-12', 'South African', 'LIC12345');
INSERT INTO Racerr VALUES (2, 'Emily Smith', '1998-07-20', 'British', 'LIC67890');

INSERT INTO Resultt VALUES (1, 1, '10:15', 1, 'Completed');
INSERT INTO Resultt VALUES (2, 2, '00:25', 2, 'Completed');