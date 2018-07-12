SELECT uuid INTO @OLD_ID_UUID FROM patient_identifier_type WHERE name = 'Old Identification Number';
SELECT uuid INTO @OPENMRS_IDENTIFIER_UUID FROM patient_identifier_type WHERE name = 'OpenMRS Identification Number';
SELECT uuid INTO @OPENMRS_ID_UUID FROM patient_identifier_type WHERE name = 'OpenMRS ID';

SET @OLD_ID_MAP = CONCAT_WS(':', @OLD_ID_UUID, '2.16.840.1.113883.3.7194.2.1');
SET @OPENMRS_IDENTFIER_ID_MAP = CONCAT_WS(':', @OPENMRS_IDENTIFIER_UUID, '2.16.840.1.113883.3.7194.2.2');
SET @OPENMRS_ID_MAP = CONCAT_WS(':', @OPENMRS_ID_UUID, '2.16.840.1.113883.3.7194.2.3');
SET @ID_MAPPINGS = CONCAT_WS(',', @OLD_ID_MAP, @OPENMRS_IDENTFIER_ID_MAP, @OPENMRS_ID_MAP);

INSERT INTO global_property (property, property_value, description, uuid)
VALUES
  ('casereport.organisationOID', '2.16.840.1.113883.3.7194.1.100', 'Identifier of the entity that submits case report
  documents, MUST be an OID, please refer to the module documentation for the constraints around the allowed values.', UUID()),
  ('casereport.organisationExtension', 'DEMO', 'Extension of the entity that submits case report documents', UUID()),
  ('casereport.organisationName', 'Demo', 'Name of the entity that submits case report documents', UUID()),
  ('casereport.openHIMUrl', 'http://host.docker.internal:5001/xdsrepository', 'The URL to the OpenHIM server, typically
  the path should match the URL pattern of the channel for the OpenXDS mediator', UUID()),
  ('casereport.openHIMClientId', 'OpenCBR', 'The OpenHIM client Id, to be set if basic authentication is required, the
  client must have access to the OpenXDS mediator', UUID()),
  ('casereport.openHIMClientPassword', 'OpenCBR#123', 'The OpenHIM client password, to be set if basic authentication is required', UUID()),
  ('casereport.identifierTypeMappings', @ID_MAPPINGS, 'A comma separated list of mappings between local identifier types
  to those in the Client Registry, the values are local identifier type uuids and the unique OIDs of the identifiers in
  the client registry, an example mapping is 2f470aa8-1d73-43b7-81b5-01f0c0dfa53c:2.16.840.1.113883.1.3', UUID());