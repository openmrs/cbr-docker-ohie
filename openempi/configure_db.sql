UPDATE identifier_domain SET universal_identifier_type_code = 'ISO'
WHERE namespace_identifier = '2.16.840.1.113883.4.357';

UPDATE identifier_domain
SET universal_identifier_type_code = 'ISO', universal_identifier = '2.16.840.1.113883.3.7194.2.2', name = 'OpenMRS 1'
WHERE namespace_identifier = '35a02490-5c20-11de-8ae4-001d60400e9e';

INSERT INTO identifier_domain (identifier_domain_id, identifier_domain_name, identifier_domain_description, universal_identifier, universal_identifier_type_code, namespace_identifier, date_created, creator_id)
VALUES(81, 'OpenMRS Old ID 1', 'Number given out prior to the OpenMRS system (No check digit)', '2.16.840.1.113883.3.7194.2.1', 'ISO', 'OpenMRS Old ID', current_timestamp, -1),
      (82, 'OpenMRS ID 1', 'OpenMRS patient identifier, with check-digit', '2.16.840.1.113883.3.7194.2.3', 'ISO', 'OpenMRS ID', current_timestamp, -1),
      (83, 'OpenMRS 2', 'OpenMRS patient identifier, with check-digit', '2.16.840.1.113883.3.7194.2.4', 'ISO', 'OpenMRS 2', current_timestamp, -1),
      (84, 'OpenMRS Old ID 2', 'OpenMRS patient identifier, with check-digit', '2.16.840.1.113883.3.7194.2.5', 'ISO', 'OpenMRS Old ID 2', current_timestamp, -1),
      (85, 'OpenMRS ID 2', 'OpenMRS patient identifier, with check-digit', '2.16.840.1.113883.3.7194.2.6', 'ISO', 'OpenMRS ID 2', current_timestamp, -1);
