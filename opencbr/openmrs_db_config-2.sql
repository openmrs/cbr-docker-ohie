SELECT uuid INTO @OLD_ID_UUID FROM patient_identifier_type WHERE name = 'Old Identification Number';
SELECT uuid INTO @OPENMRS_IDENTIFIER_UUID FROM patient_identifier_type WHERE name = 'OpenMRS Identification Number';
SELECT uuid INTO @OPENMRS_ID_UUID FROM patient_identifier_type WHERE name = 'OpenMRS ID';

SET @OLD_ID_MAP = CONCAT_WS(':', @OLD_ID_UUID, '2.16.840.1.113883.3.7194.2.5');
SET @OPENMRS_IDENTFIER_ID_MAP = CONCAT_WS(':', @OPENMRS_IDENTIFIER_UUID, '2.16.840.1.113883.3.7194.2.4');
SET @OPENMRS_ID_MAP = CONCAT_WS(':', @OPENMRS_ID_UUID, '2.16.840.1.113883.3.7194.2.6');
SET @ID_MAPPINGS = CONCAT_WS(',', @OLD_ID_MAP, @OPENMRS_IDENTFIER_ID_MAP, @OPENMRS_ID_MAP);

UPDATE patient_identifier_type SET location_behavior = 'NOT_USED' WHERE uuid = @OLD_ID_UUID;
UPDATE patient_identifier_type SET required = false WHERE uuid = @OPENMRS_ID_UUID;

INSERT INTO global_property (property, property_value, description, uuid)
VALUES
  ('casereport.organisationOID', '2.16.840.1.113883.3.7194.1.102', 'Identifier of the entity that submits case report
  documents, MUST be an OID, please refer to the module documentation for the constraints around the allowed values.', UUID()),
  ('casereport.organisationExtension', 'DEMO2', 'Extension of the entity that submits case report documents', UUID()),
  ('casereport.organisationName', 'Demo 2', 'Name of the entity that submits case report documents', UUID()),
  ('casereport.enableCors', 'true', "When set to true, this allows the CBR simulator and any other authenticated code running in
            the browser to have access to this instance's rest API, for security reasons this should
            always be set to false if you are not running the simulator against this instance.", UUID()),
  ('casereport.openHIMUrl', 'http://openhim-core:5001/xdsrepository', 'The URL to the OpenHIM server, typically
  the path should match the URL pattern of the channel for the OpenXDS mediator', UUID()),
  ('casereport.openHIMClientId', 'OpenCBR', 'The OpenHIM client Id, to be set if basic authentication is required, the
  client must have access to the OpenXDS mediator', UUID()),
  ('casereport.openHIMClientPassword', 'OpenCBR#123', 'The OpenHIM client password, to be set if basic authentication is required', UUID()),
  ('casereport.identifierTypeMappings', @ID_MAPPINGS, 'A comma separated list of mappings between local identifier types
  to those in the Client Registry, the values are local identifier type uuids and the unique OIDs of the identifiers in
  the client registry, an example mapping is 2f470aa8-1d73-43b7-81b5-01f0c0dfa53c:2.16.840.1.113883.1.3', UUID());

UPDATE idgen_seq_id_gen SET first_identifier_base = '20000' WHERE id = 1;
