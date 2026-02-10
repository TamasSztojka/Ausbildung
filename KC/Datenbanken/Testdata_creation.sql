INSERT INTO petowner (first_name, last_name, adress, phonenumber, email) VALUES
('Anna', 'Müller', 'Hauptstraße 12, Berlin', '030123456', 'anna.mueller@mail.de'),
('Peter', 'Schmidt', 'Bahnhofstraße 8, Hamburg', '040987654', 'peter.schmidt@mail.de'),
('Laura', 'Weber', 'Gartenweg 5, München', '089555444', 'laura.weber@mail.de'),
('Markus', 'Fischer', 'Ringstraße 21, Köln', '022112233', 'markus.fischer@mail.de'),
('Julia', 'Becker', 'Schulstraße 3, Frankfurt', '069998877', 'julia.becker@mail.de');

INSERT INTO pets (petowner_id, name, species, breed, birthday) VALUES
(1, 'Bello', 'Dog', 'Golden Retriever', '2018-05-12'),
(1, 'Mimi', 'Cat', 'British Shorthair', '2020-03-01'),
(2, 'Rocky', 'Dog', 'German Shepherd', '2017-09-20'),
(2, 'Luna', 'Cat', 'Maine Coon', '2019-11-11'),
(3, 'Charlie', 'Dog', 'Beagle', '2021-01-15'),
(3, 'Nala', 'Cat', 'Siamese', '2018-07-07'),
(4, 'Max', 'Dog', 'Bulldog', '2016-06-30'),
(4, 'Coco', 'Bird', 'Parrot', '2015-04-10'),
(5, 'Hoppel', 'Rabbit', 'Dwarf Rabbit', '2022-02-02'),
(5, 'Spike', 'Reptile', 'Bearded Dragon', '2020-08-18');

INSERT INTO vet (name, specialization, phonenumber, email, license_number) VALUES
('Dr. Meyer', 'Surgery', '030111222', 'meyer@vetclinic.de', 'LIC-1001'),
('Dr. Klein', 'Dermatology', '040333444', 'klein@vetclinic.de', 'LIC-1002'),
('Dr. Braun', 'Dentistry', '089555666', 'braun@vetclinic.de', 'LIC-1003'),
('Dr. Vogel', 'Exotic Animals', '069777888', 'vogel@vetclinic.de', 'LIC-1004');

INSERT INTO treatment (pet_id, vet_id, date, diagnosis, therapie, costs) VALUES
(1, 1, '2023-01-10', 'Broken leg', 'Surgery and bandage', 450.00),
(1, 2, '2023-06-15', 'Skin allergy', 'Medication and diet change', 120.00),

(2, 3, '2023-02-20', 'Dental tartar', 'Teeth cleaning', 180.00),
(2, 3, '2024-01-05', 'Tooth infection', 'Antibiotics', 95.00),

(3, 1, '2022-11-11', 'Knee injury', 'Surgery', 600.00),
(3, 1, '2023-12-01', 'Follow-up', 'Physiotherapy', 150.00),

(4, 2, '2023-03-18', 'Flea infestation', 'Antiparasitic treatment', 80.00),

(5, 2, '2024-02-14', 'Skin rash', 'Ointment', 60.00),
(5, 4, '2024-03-01', 'Vaccination', 'Routine vaccination', 45.00),

(6, 3, '2023-04-09', 'Gum inflammation', 'Dental treatment', 130.00),

(7, 1, '2022-08-22', 'Breathing issues', 'Medication', 200.00),
(7, 1, '2023-09-10', 'Check-up', 'General examination', 70.00),

(8, 4, '2023-05-30', 'Feather loss', 'Vitamin therapy', 90.00),
(8, 4, '2024-01-12', 'Beak injury', 'Beak repair', 110.00),

(9, 4, '2023-07-07', 'Digestive problems', 'Diet adjustment', 55.00),

(10, 4, '2023-10-19', 'Metabolic disorder', 'Medication', 140.00),
(10, 4, '2024-01-25', 'Check-up', 'Health monitoring', 65.00),

(6, 2, '2024-02-10', 'Skin infection', 'Antibiotics', 85.00),
(4, 3, '2024-03-03', 'Dental check', 'Cleaning', 90.00);

INSERT INTO treatment (pet_id, vet_id, date, diagnosis, therapie, costs) VALUES
(6, 2, '2026-02-08', 'Skin infection', 'Antibiotics', 85.00),
(4, 3, '2026-02-07', 'Dental check', 'Cleaning', 90.00);

INSERT INTO petowner (first_name, last_name, adress, phonenumber, email) VALUES
('Tamás', 'Sztojka', 'Hauptstraße 12, Berlin', '030123456', 'Tomi.Sztojka@mail.de');

INSERT INTO pets (petowner_id, name, species, breed, birthday) VALUES
(6, 'Vuki', 'Dog', 'Chihuahua', '2012-03-12');