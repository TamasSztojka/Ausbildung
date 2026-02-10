-- All Pets
SELECT 
	p.name AS pet_name,
	p.species,
	o.first_name AS owner_first_name,
	o.last_name AS owner_last_name
FROM pets p
JOIN petowner o ON o.petowner_id = p.petowner_id;

-- All treatments of pet with id 1
SELECT 
	v.name AS vet_name,
	t.diagnosis,
	t.therapie,
	t.costs
FROM treatment t
JOIN vet v ON v.vet_id = t.vet_id
WHERE t.pet_id = 1;

-- The average cost of treatment for each vet
SELECT
	v.vet_id,
    v.name AS vet_name,
    ROUND(AVG(t.costs), 2) AS average_costs
FROM vet v
JOIN treatment t on t.vet_id = v.vet_id
GROUP BY v.vet_id, v.name;

-- All pets that were treated in the last 30 days
SELECT
	p.pet_id,
    p.name,
    p.species
FROM pets p
JOIN treatment t on t.pet_id = p.pet_id
WHERE t.date >= (CURRENT_DATE - INTERVAL 30 DAY);

-- Pets that got more than two treatments
SELECT
	o.petowner_id,
    o.first_name,
    o.last_name,
    COUNT(t.treatment_id) AS treatment_count
FROM petowner o
JOIN pets p ON p.petowner_id = o.petowner_id
JOIN treatment t ON t.pet_id = p.pet_id
GROUP BY o.petowner_id, o.first_name, o.last_name
HAVING COUNT(t.treatment_id) > 2;

-- The most expensive treatment for each pet
SELECT
	p.pet_id,
    p.name AS pet_name,
    MAX(t.costs) AS max_cost
FROM pets p
JOIN treatment t ON t.pet_id = p.pet_id
GROUP BY p.pet_id, p.name;

-- Show all pets that were treated by the vet with id 1
SELECT
	p.pet_id,
    p.name,
    p.species
FROM pets p
JOIN treatment t ON t.pet_id = p.pet_id
WHERE t.vet_id = 1;

-- Show all pets that were not treated yet
SELECT
	o.petowner_id,
    o.first_name,
    o.last_name
FROM petowner o
LEFT JOIN pets p ON p.petowner_id = o.petowner_id
LEFT JOIN treatment t ON t.pet_id = p.pet_id
WHERE t.pet_id IS NULL;


    


