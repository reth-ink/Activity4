CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals(
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid)
REFERENCES owners(ownerid)
);

CREATE TABLE appointments(
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors(
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices(
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount NUMERIC(10,2),
    paymentdate DATE,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords(
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate TIMESTAMP,
    doctorid INT,
    DIAGNOSIS TEXT,
    PRESCRIPTION TEXT,
    NOTES TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Juan', 'Dela Cruz', '123 Mabini St., Manila', '09171234567', 'juan.delacruz@example.com'),
(2, 'Maria', 'Santos', '45 Rizal Ave., Quezon City', '09182345678', 'maria.santos@example.com'),
(3, 'Pedro', 'Reyes', '78 Bonifacio Rd., Pasig', '09193456789', 'pedro.reyes@example.com'),
(4, 'Ana', 'Garcia', '12 Luna St., Makati', '09204567891', 'ana.garcia@example.com'),
(5, 'Lorenzo', 'Torres', '56 Dimasalang, Manila', '09215678902', 'lorenzo.torres@example.com'),
(6, 'Carmen', 'Lopez', '89 Malvar St., Caloocan', '09226789013', 'carmen.lopez@example.com'),
(7, 'Miguel', 'Fernandez', '34 Katipunan Ave., QC', '09237890124', 'miguel.fernandez@example.com'),
(8, 'Isabel', 'Cruz', '120 Roxas Blvd., Pasay', '09248901235', 'isabel.cruz@example.com'),
(9, 'Rafael', 'Mendoza', '75 Ortigas Center, Pasig', '09259012346', 'rafael.mendoza@example.com'),
(10, 'Sofia', 'Ramos', '22 Shaw Blvd., Mandaluyong', '09260123457', 'sofia.ramos@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) 
VALUES
(1, 'Leo', 'Lion', 'African Lion', '2018-03-15', 'Male', 'Golden', 1),
(2, 'Molly', 'Cat', 'Siamese', '2020-06-21', 'Female', 'Cream', 2),
(3, 'Max', 'Dog', 'Golden Retriever', '2019-09-10', 'Male', 'Golden', 3),
(4, 'Daisy', 'Cow', 'Holstein', '2017-01-05', 'Female', 'Black & White', 4),
(5, 'Charlie', 'Horse', 'Arabian', '2015-12-12', 'Male', 'Brown', 5),
(6, 'Luna', 'Rabbit', 'Netherland Dwarf', '2021-11-01', 'Female', 'White', 6),
(7, 'Jack', 'Elephant', 'African Elephant', '2012-08-30', 'Male', 'Grey', 7),
(8, 'Bella', 'Sheep', 'Merino', '2019-04-17', 'Female', 'White', 8),
(9, 'Rocky', 'Dog', 'Bulldog', '2018-07-22', 'Male', 'Brindle', 9),
(10, 'Coco', 'Parrot', 'Macaw', '2020-02-14', 'Female', 'Blue & Yellow', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2025-01-05', 'Routine check-up'),
(2, 2, '2025-01-10', 'Vaccination'),
(3, 3, '2025-01-12', 'Skin allergy'),
(4, 4, '2025-01-15', 'Deworming'),
(5, 5, '2025-01-20', 'Follow-up consultation'),
(6, 6, '2025-01-22', 'Dental cleaning'),
(7, 7, '2025-01-25', 'Limping / leg injury'),
(8, 8, '2025-01-28', 'Ear infection'),
(9, 9, '2025-02-01', 'Grooming appointment'),
(10, 10, '2025-02-03', 'Vaccination booster');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');
