SELECT location_attribute_type_id INTO @CODE_ATTRIB_TYPE_ID FROM location_attribute_type
WHERE uuid = '66bfca6e-75af-11e8-a395-ec86dab4f7b9';
SELECT location_attribute_type_id INTO @EXT_ID_ATTRIB_TYPE_ID FROM location_attribute_type
WHERE uuid = 'c54ee8f6-75b6-11e8-a395-ec86dab4f7b9';

SET @LOCATION_ID_1 = 2;
SET @LOCATION_ID_2 = 3;

INSERT INTO location(name, description, creator, date_created, uuid)
VALUES ('Demo 1', 'Location for OpenMRS instance 1', 1, '2018-07-02 00:00:00', UUID());

INSERT INTO location(name, description, creator, date_created, uuid)
VALUES ('Demo 2', 'Location for OpenMRS instance 2', 1, '2018-07-02 00:00:00', UUID());

INSERT INTO location_attribute(location_id, attribute_type_id, value_reference, creator, date_created, uuid)
VALUES
  (@LOCATION_ID_1, @CODE_ATTRIB_TYPE_ID, 'DEMO1', 1, '2018-07-02 00:00:00', UUID()),
  (@LOCATION_ID_1, @EXT_ID_ATTRIB_TYPE_ID, 'DEMO1^^^&2.16.840.1.113883.3.7194.1.101&ISO', 1, '2018-07-02 00:00:00', UUID()),
  (@LOCATION_ID_2, @CODE_ATTRIB_TYPE_ID, 'DEMO2', 1, '2018-07-02 00:00:00', UUID()),
  (@LOCATION_ID_2, @EXT_ID_ATTRIB_TYPE_ID, 'DEMO2^^^&2.16.840.1.113883.3.7194.1.102&ISO', 1, '2018-07-02 00:00:00', UUID());

UPDATE global_property
SET property_value = 'http://openshr-openxds:8010/axis2/services/xdsregistryb'
WHERE property = 'xds-b-repository.xdsregistry.url';

UPDATE global_property
SET property_value = 'http://dhis2:8080'
WHERE property = 'dhis2tracker.dhis2Url';

UPDATE global_property
SET property_value = 'admin'
WHERE property = 'dhis2tracker.username';

UPDATE global_property
SET property_value = 'district'
WHERE property = 'dhis2tracker.password';

UPDATE global_property
SET property_value = 'fiRccILzA18'
WHERE property = 'dhis2tracker.trackedEntityTypeUID';

UPDATE global_property
SET property_value = 'llkudzlGDK0'
WHERE property = 'dhis2tracker.programUID';

UPDATE global_property
SET property_value = 'f8qGHzwL6q7'
WHERE property = 'dhis2tracker.firstnameUID';

UPDATE global_property
SET property_value = 'LGS3rs7LAYp'
WHERE property = 'dhis2tracker.lastnameUID';

UPDATE global_property
SET property_value = 'BFeNShBIsuB'
WHERE property = 'dhis2tracker.middlenameUID';

UPDATE global_property
SET property_value = 'C196Ox4Ayeh'
WHERE property = 'dhis2tracker.genderUID';

UPDATE global_property
SET property_value = 'M'
WHERE property = 'dhis2tracker.maleOptionCode';

UPDATE global_property
SET property_value = 'F'
WHERE property = 'dhis2tracker.femaleOptionCode';

UPDATE global_property
SET property_value = 'wBZ2kF1LdXe'
WHERE property = 'dhis2tracker.birthdateUID';

UPDATE global_property
SET property_value = 'T4hs1vXmjFC'
WHERE property = 'dhis2tracker.personIdUID';

UPDATE global_property
SET property_value = 'aLotiN5zPc6'
WHERE property = 'dhis2tracker.dateOfHivDiagnosisUID';