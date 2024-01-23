CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

INSERT INTO services (service_id, name, description)
VALUES
    ('1', 'Сезонная замена шин', 'Замена шин в соответствии с текущим сезоном'),
    ('2', 'Балансировка колес', 'Балансировка передних и задних колес'),
    ('3', 'Ремонт проколов', 'Восстановление проколотых шин');

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(255)
);

INSERT INTO clients (client_id, first_name, last_name, phone_number, email, address)
VALUES
    ('1', 'Иван', 'Иванов', '123-456-7890', 'ivan@example.com', 'ул. Пушкина, д.1'),
    ('2', 'Мария', 'Петрова', '987-654-3210', 'maria@example.com', 'ул. Лермонтова, д.2');

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(client_id),
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INTEGER,
    license_plate VARCHAR(20) NOT NULL,
    tire_size VARCHAR(20)
);

INSERT INTO cars (car_id, client_id, make, model, year, license_plate, tire_size)
VALUES
    ('1', '1', 'Toyota', 'Camry', 2018, 'ABC123', '225/60R16'),
    ('2', '2', 'Honda', 'Accord', 2020, 'XYZ789', '205/55R17');

CREATE TABLE car_services (
    car_service_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES cars(car_id),
    service_id INTEGER REFERENCES services(service_id)
);

INSERT INTO car_services (car_service_id, car_id, service_id)
VALUES
    ('1', '1', '1'), -- Toyota Camry выбрал услугу "Сезонная замена шин"
    ('2', '2', '2'), -- Honda Accord выбрал услугу "Балансировка колес"
    ('3', '2', '3'); -- Honda Accord выбрал услугу "Ремонт проколов"