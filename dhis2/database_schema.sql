--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uid(); Type: FUNCTION; Schema: public; Owner: dhis
--

CREATE FUNCTION public.uid() RETURNS text
    LANGUAGE sql
    AS $$ SELECT substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' FROM (random()*51)::int +1 for 1) || array_to_string(ARRAY(SELECT substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'  FROM (random()*61)::int + 1 FOR 1) FROM generate_series(1,10)), '') $$;


ALTER FUNCTION public.uid() OWNER TO dhis;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: analyticsperiodboundary; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.analyticsperiodboundary (
    analyticsperiodboundaryid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    boundarytarget character varying(50),
    analyticsperiodboundarytype character varying(50),
    offsetperiods integer,
    offsetperiodtypeid integer,
    programindicatorid integer
);


ALTER TABLE public.analyticsperiodboundary OWNER TO dhis;

--
-- Name: attribute; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.attribute (
    attributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    valuetype character varying(50) NOT NULL,
    mandatory boolean NOT NULL,
    isunique boolean,
    dataelementattribute boolean NOT NULL,
    dataelementgroupattribute boolean,
    indicatorattribute boolean NOT NULL,
    indicatorgroupattribute boolean,
    datasetattribute boolean,
    organisationunitattribute boolean NOT NULL,
    organisationunitgroupattribute boolean,
    organisationunitgroupsetattribute boolean,
    userattribute boolean NOT NULL,
    usergroupattribute boolean,
    programattribute boolean,
    programstageattribute boolean,
    trackedentitytypeattribute boolean,
    trackedentityattributeattribute boolean,
    categoryoptionattribute boolean,
    categoryoptiongroupattribute boolean,
    documentattribute boolean,
    optionattribute boolean,
    optionsetattribute boolean,
    constantattribute boolean,
    legendsetattribute boolean,
    programindicatorattribute boolean,
    sqlviewattribute boolean,
    sectionattribute boolean,
    categoryoptioncomboattribute boolean,
    categoryoptiongroupsetattribute boolean,
    dataelementgroupsetattribute boolean,
    validationruleattribute boolean,
    validationrulegroupattribute boolean,
    categoryattribute boolean,
    sortorder integer,
    optionsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.attribute OWNER TO dhis;

--
-- Name: attributetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.attributetranslations (
    attributeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.attributetranslations OWNER TO dhis;

--
-- Name: attributeuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.attributeuseraccesses (
    attributeid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.attributeuseraccesses OWNER TO dhis;

--
-- Name: attributeusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.attributeusergroupaccesses (
    attributeid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.attributeusergroupaccesses OWNER TO dhis;

--
-- Name: attributevalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.attributevalue (
    attributevalueid integer NOT NULL,
    created timestamp without time zone,
    lastupdated timestamp without time zone,
    value text,
    attributeid integer NOT NULL
);


ALTER TABLE public.attributevalue OWNER TO dhis;

--
-- Name: categories_categoryoptions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categories_categoryoptions (
    categoryid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE public.categories_categoryoptions OWNER TO dhis;

--
-- Name: categoryattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryattributevalues (
    categoryid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.categoryattributevalues OWNER TO dhis;

--
-- Name: categorycombo; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombo (
    categorycomboid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    datadimensiontype character varying(255) NOT NULL,
    skiptotal boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.categorycombo OWNER TO dhis;

--
-- Name: categorycombos_categories; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombos_categories (
    categoryid integer,
    sort_order integer NOT NULL,
    categorycomboid integer NOT NULL
);


ALTER TABLE public.categorycombos_categories OWNER TO dhis;

--
-- Name: categorycombos_optioncombos; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombos_optioncombos (
    categoryoptioncomboid integer NOT NULL,
    categorycomboid integer NOT NULL
);


ALTER TABLE public.categorycombos_optioncombos OWNER TO dhis;

--
-- Name: categorycombotranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombotranslations (
    categorycomboid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.categorycombotranslations OWNER TO dhis;

--
-- Name: categorycombouseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombouseraccesses (
    categorycomboid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.categorycombouseraccesses OWNER TO dhis;

--
-- Name: categorycombousergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombousergroupaccesses (
    categorycomboid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.categorycombousergroupaccesses OWNER TO dhis;

--
-- Name: categorydimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorydimension (
    categorydimensionid integer NOT NULL,
    categoryid integer
);


ALTER TABLE public.categorydimension OWNER TO dhis;

--
-- Name: categorydimension_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorydimension_items (
    categorydimensionid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE public.categorydimension_items OWNER TO dhis;

--
-- Name: categoryoption_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoption_organisationunits (
    organisationunitid integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE public.categoryoption_organisationunits OWNER TO dhis;

--
-- Name: categoryoptioncombo; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptioncombo (
    categoryoptioncomboid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name text,
    ignoreapproval boolean
);


ALTER TABLE public.categoryoptioncombo OWNER TO dhis;

--
-- Name: categoryoptioncomboattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptioncomboattributevalues (
    categoryoptioncomboid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.categoryoptioncomboattributevalues OWNER TO dhis;

--
-- Name: categoryoptioncombos_categoryoptions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptioncombos_categoryoptions (
    categoryoptionid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL
);


ALTER TABLE public.categoryoptioncombos_categoryoptions OWNER TO dhis;

--
-- Name: categoryoptioncombotranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptioncombotranslations (
    categoryoptioncomboid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.categoryoptioncombotranslations OWNER TO dhis;

--
-- Name: categoryoptiongroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroup (
    categoryoptiongroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    datadimensiontype character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.categoryoptiongroup OWNER TO dhis;

--
-- Name: categoryoptiongroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupattributevalues (
    categoryoptiongroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupattributevalues OWNER TO dhis;

--
-- Name: categoryoptiongroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupmembers (
    categoryoptiongroupid integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupmembers OWNER TO dhis;

--
-- Name: categoryoptiongroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupset (
    categoryoptiongroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    datadimension boolean NOT NULL,
    datadimensiontype character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.categoryoptiongroupset OWNER TO dhis;

--
-- Name: categoryoptiongroupsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsetattributevalues (
    categoryoptiongroupsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupsetattributevalues OWNER TO dhis;

--
-- Name: categoryoptiongroupsetdimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsetdimension (
    categoryoptiongroupsetdimensionid integer NOT NULL,
    categoryoptiongroupsetid integer
);


ALTER TABLE public.categoryoptiongroupsetdimension OWNER TO dhis;

--
-- Name: categoryoptiongroupsetdimension_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsetdimension_items (
    categoryoptiongroupsetdimensionid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupsetdimension_items OWNER TO dhis;

--
-- Name: categoryoptiongroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsetmembers (
    categoryoptiongroupsetid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupsetmembers OWNER TO dhis;

--
-- Name: categoryoptiongroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsettranslations (
    categoryoptiongroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupsettranslations OWNER TO dhis;

--
-- Name: categoryoptiongroupsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsetuseraccesses (
    categoryoptiongroupsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupsetuseraccesses OWNER TO dhis;

--
-- Name: categoryoptiongroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsetusergroupaccesses (
    categoryoptiongroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: categoryoptiongrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongrouptranslations (
    categoryoptiongroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.categoryoptiongrouptranslations OWNER TO dhis;

--
-- Name: categoryoptiongroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupuseraccesses (
    categoryoptiongroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupuseraccesses OWNER TO dhis;

--
-- Name: categoryoptiongroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupusergroupaccesses (
    categoryoptiongroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.categoryoptiongroupusergroupaccesses OWNER TO dhis;

--
-- Name: categoryoptiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiontranslations (
    categoryoptionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.categoryoptiontranslations OWNER TO dhis;

--
-- Name: chart; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart (
    chartid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    domainaxislabel character varying(255),
    rangeaxislabel character varying(255),
    type character varying(40) NOT NULL,
    series character varying(255),
    category character varying(255),
    hidelegend boolean,
    nospacebetweencolumns boolean,
    regressiontype character varying(40) NOT NULL,
    title character varying(255),
    subtitle character varying(255),
    hidetitle boolean,
    hidesubtitle boolean,
    targetlinevalue double precision,
    targetlinelabel character varying(255),
    baselinevalue double precision,
    baselinelabel character varying(255),
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    aggregationtype character varying(40),
    completedonly boolean,
    showdata boolean,
    hideemptyrowitems character varying(40),
    percentstackedvalues boolean,
    cumulativevalues boolean,
    rangeaxismaxvalue double precision,
    rangeaxisminvalue double precision,
    rangeaxissteps integer,
    rangeaxisdecimals integer,
    legendsetid integer,
    legenddisplaystrategy character varying(40),
    colorsetid integer,
    sortorder integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8),
    favorites jsonb
);


ALTER TABLE public.chart OWNER TO dhis;

--
-- Name: chart_categorydimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_categorydimensions (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


ALTER TABLE public.chart_categorydimensions OWNER TO dhis;

--
-- Name: chart_categoryoptiongroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_categoryoptiongroupsetdimensions (
    chart integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.chart_categoryoptiongroupsetdimensions OWNER TO dhis;

--
-- Name: chart_datadimensionitems; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_datadimensionitems (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


ALTER TABLE public.chart_datadimensionitems OWNER TO dhis;

--
-- Name: chart_dataelementgroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_dataelementgroupsetdimensions (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.chart_dataelementgroupsetdimensions OWNER TO dhis;

--
-- Name: chart_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_filters (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    filter character varying(255)
);


ALTER TABLE public.chart_filters OWNER TO dhis;

--
-- Name: chart_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_itemorgunitgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.chart_itemorgunitgroups OWNER TO dhis;

--
-- Name: chart_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_organisationunits (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.chart_organisationunits OWNER TO dhis;

--
-- Name: chart_orgunitgroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_orgunitgroupsetdimensions (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.chart_orgunitgroupsetdimensions OWNER TO dhis;

--
-- Name: chart_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_orgunitlevels (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE public.chart_orgunitlevels OWNER TO dhis;

--
-- Name: chart_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chart_periods (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE public.chart_periods OWNER TO dhis;

--
-- Name: charttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.charttranslations (
    chartid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.charttranslations OWNER TO dhis;

--
-- Name: chartuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chartuseraccesses (
    chartid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.chartuseraccesses OWNER TO dhis;

--
-- Name: chartusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.chartusergroupaccesses (
    chartid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.chartusergroupaccesses OWNER TO dhis;

--
-- Name: color; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.color (
    colorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    color character varying(255)
);


ALTER TABLE public.color OWNER TO dhis;

--
-- Name: colorset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.colorset (
    colorsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL
);


ALTER TABLE public.colorset OWNER TO dhis;

--
-- Name: colorset_colors; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.colorset_colors (
    colorsetid integer NOT NULL,
    sort_order integer NOT NULL,
    colorid integer NOT NULL
);


ALTER TABLE public.colorset_colors OWNER TO dhis;

--
-- Name: colorsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.colorsettranslations (
    colorsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.colorsettranslations OWNER TO dhis;

--
-- Name: colortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.colortranslations (
    colorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.colortranslations OWNER TO dhis;

--
-- Name: completedatasetregistration; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.completedatasetregistration (
    datasetid integer NOT NULL,
    periodid integer NOT NULL,
    sourceid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    date timestamp without time zone,
    storedby character varying(255)
);


ALTER TABLE public.completedatasetregistration OWNER TO dhis;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.configuration (
    configurationid integer NOT NULL,
    systemid character varying(255),
    feedbackrecipientsid integer,
    offlineorgunitlevelid integer,
    infrastructuralindicatorsid integer,
    infrastructuraldataelementsid integer,
    infrastructuralperiodtypeid integer,
    selfregistrationrole integer,
    selfregistrationorgunit integer
);


ALTER TABLE public.configuration OWNER TO dhis;

--
-- Name: configuration_corswhitelist; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.configuration_corswhitelist (
    configurationid integer NOT NULL,
    corswhitelist character varying(255)
);


ALTER TABLE public.configuration_corswhitelist OWNER TO dhis;

--
-- Name: constant; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.constant (
    constantid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    value double precision NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.constant OWNER TO dhis;

--
-- Name: constantattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.constantattributevalues (
    constantid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.constantattributevalues OWNER TO dhis;

--
-- Name: constanttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.constanttranslations (
    colorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.constanttranslations OWNER TO dhis;

--
-- Name: constantuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.constantuseraccesses (
    constantid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.constantuseraccesses OWNER TO dhis;

--
-- Name: constantusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.constantusergroupaccesses (
    constantid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.constantusergroupaccesses OWNER TO dhis;

--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboard (
    dashboardid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    userid integer,
    externalaccess boolean,
    publicaccess character varying(8),
    favorites jsonb
);


ALTER TABLE public.dashboard OWNER TO dhis;

--
-- Name: dashboard_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboard_items (
    dashboardid integer NOT NULL,
    sort_order integer NOT NULL,
    dashboarditemid integer NOT NULL
);


ALTER TABLE public.dashboard_items OWNER TO dhis;

--
-- Name: dashboarditem; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarditem (
    dashboarditemid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    chartid integer,
    eventchartid integer,
    mapid integer,
    reporttable integer,
    eventreport integer,
    textcontent text,
    messages boolean,
    appkey character varying(255),
    shape character varying(50),
    x integer,
    y integer,
    height integer,
    width integer
);


ALTER TABLE public.dashboarditem OWNER TO dhis;

--
-- Name: dashboarditem_reports; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarditem_reports (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    reportid integer NOT NULL
);


ALTER TABLE public.dashboarditem_reports OWNER TO dhis;

--
-- Name: dashboarditem_resources; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarditem_resources (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    resourceid integer NOT NULL
);


ALTER TABLE public.dashboarditem_resources OWNER TO dhis;

--
-- Name: dashboarditem_users; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarditem_users (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.dashboarditem_users OWNER TO dhis;

--
-- Name: dashboarditemtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarditemtranslations (
    dashboarditemid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dashboarditemtranslations OWNER TO dhis;

--
-- Name: dashboardtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboardtranslations (
    dashboardid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dashboardtranslations OWNER TO dhis;

--
-- Name: dashboarduseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarduseraccesses (
    dashboardid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dashboarduseraccesses OWNER TO dhis;

--
-- Name: dashboardusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboardusergroupaccesses (
    dashboardid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dashboardusergroupaccesses OWNER TO dhis;

--
-- Name: dataapproval; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapproval (
    dataapprovalid integer NOT NULL,
    dataapprovallevelid integer NOT NULL,
    workflowid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    accepted boolean NOT NULL,
    created timestamp without time zone NOT NULL,
    creator integer NOT NULL
);


ALTER TABLE public.dataapproval OWNER TO dhis;

--
-- Name: dataapprovalaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalaudit (
    dataapprovalauditid integer NOT NULL,
    levelid integer NOT NULL,
    workflowid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    action character varying(100) NOT NULL,
    created timestamp without time zone NOT NULL,
    creator integer NOT NULL
);


ALTER TABLE public.dataapprovalaudit OWNER TO dhis;

--
-- Name: dataapprovallevel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovallevel (
    dataapprovallevelid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    level integer NOT NULL,
    orgunitlevel integer NOT NULL,
    categoryoptiongroupsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataapprovallevel OWNER TO dhis;

--
-- Name: dataapprovalleveltranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalleveltranslations (
    dataapprovallevelid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataapprovalleveltranslations OWNER TO dhis;

--
-- Name: dataapprovalleveluseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalleveluseraccesses (
    dataapprovallevelid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataapprovalleveluseraccesses OWNER TO dhis;

--
-- Name: dataapprovallevelusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovallevelusergroupaccesses (
    dataapprovallevelid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataapprovallevelusergroupaccesses OWNER TO dhis;

--
-- Name: dataapprovalworkflow; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalworkflow (
    workflowid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    periodtypeid integer NOT NULL,
    categorycomboid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataapprovalworkflow OWNER TO dhis;

--
-- Name: dataapprovalworkflowlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalworkflowlevels (
    workflowid integer NOT NULL,
    dataapprovallevelid integer NOT NULL
);


ALTER TABLE public.dataapprovalworkflowlevels OWNER TO dhis;

--
-- Name: dataapprovalworkflowtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalworkflowtranslations (
    workflowid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataapprovalworkflowtranslations OWNER TO dhis;

--
-- Name: dataapprovalworkflowuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalworkflowuseraccesses (
    workflowid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataapprovalworkflowuseraccesses OWNER TO dhis;

--
-- Name: dataapprovalworkflowusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalworkflowusergroupaccesses (
    workflowid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataapprovalworkflowusergroupaccesses OWNER TO dhis;

--
-- Name: datadimensionitem; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datadimensionitem (
    datadimensionitemid integer NOT NULL,
    indicatorid integer,
    dataelementid integer,
    dataelementoperand_dataelementid integer,
    dataelementoperand_categoryoptioncomboid integer,
    datasetid integer,
    metric character varying(50),
    programindicatorid integer,
    programdataelement_programid integer,
    programdataelement_dataelementid integer,
    programattribute_programid integer,
    programattribute_attributeid integer
);


ALTER TABLE public.datadimensionitem OWNER TO dhis;

--
-- Name: dataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelement (
    dataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    formname character varying(230),
    style jsonb,
    valuetype character varying(50) NOT NULL,
    domaintype character varying(255) NOT NULL,
    aggregationtype character varying(50) NOT NULL,
    categorycomboid integer NOT NULL,
    url character varying(255),
    zeroissignificant boolean NOT NULL,
    optionsetid integer,
    commentoptionsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataelement OWNER TO dhis;

--
-- Name: dataelementaggregationlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementaggregationlevels (
    dataelementid integer NOT NULL,
    sort_order integer NOT NULL,
    aggregationlevel integer
);


ALTER TABLE public.dataelementaggregationlevels OWNER TO dhis;

--
-- Name: dataelementattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementattributevalues (
    dataelementid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.dataelementattributevalues OWNER TO dhis;

--
-- Name: dataelementcategory; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategory (
    categoryid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    datadimensiontype character varying(255) NOT NULL,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataelementcategory OWNER TO dhis;

--
-- Name: dataelementcategoryoption; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategoryoption (
    categoryoptionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    startdate date,
    enddate date,
    style jsonb,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataelementcategoryoption OWNER TO dhis;

--
-- Name: dataelementcategoryoptionattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategoryoptionattributevalues (
    categoryoptionid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.dataelementcategoryoptionattributevalues OWNER TO dhis;

--
-- Name: dataelementcategoryoptionuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategoryoptionuseraccesses (
    categoryoptionid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataelementcategoryoptionuseraccesses OWNER TO dhis;

--
-- Name: dataelementcategoryoptionusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategoryoptionusergroupaccesses (
    categoryoptionid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataelementcategoryoptionusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementcategorytranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategorytranslations (
    categoryid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataelementcategorytranslations OWNER TO dhis;

--
-- Name: dataelementcategoryuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategoryuseraccesses (
    categoryid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataelementcategoryuseraccesses OWNER TO dhis;

--
-- Name: dataelementcategoryusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategoryusergroupaccesses (
    categoryid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataelementcategoryusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroup (
    dataelementgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataelementgroup OWNER TO dhis;

--
-- Name: dataelementgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupattributevalues (
    dataelementgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.dataelementgroupattributevalues OWNER TO dhis;

--
-- Name: dataelementgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupmembers (
    dataelementgroupid integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE public.dataelementgroupmembers OWNER TO dhis;

--
-- Name: dataelementgroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupset (
    dataelementgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.dataelementgroupset OWNER TO dhis;

--
-- Name: dataelementgroupsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsetattributevalues (
    dataelementgroupsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.dataelementgroupsetattributevalues OWNER TO dhis;

--
-- Name: dataelementgroupsetdimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsetdimension (
    dataelementgroupsetdimensionid integer NOT NULL,
    dataelementgroupsetid integer
);


ALTER TABLE public.dataelementgroupsetdimension OWNER TO dhis;

--
-- Name: dataelementgroupsetdimension_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsetdimension_items (
    dataelementgroupsetdimensionid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupid integer NOT NULL
);


ALTER TABLE public.dataelementgroupsetdimension_items OWNER TO dhis;

--
-- Name: dataelementgroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsetmembers (
    dataelementgroupsetid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupid integer NOT NULL
);


ALTER TABLE public.dataelementgroupsetmembers OWNER TO dhis;

--
-- Name: dataelementgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsettranslations (
    dataelementgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataelementgroupsettranslations OWNER TO dhis;

--
-- Name: dataelementgroupsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsetuseraccesses (
    dataelementgroupsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataelementgroupsetuseraccesses OWNER TO dhis;

--
-- Name: dataelementgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsetusergroupaccesses (
    dataelementgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataelementgroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgrouptranslations (
    dataelementgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataelementgrouptranslations OWNER TO dhis;

--
-- Name: dataelementgroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupuseraccesses (
    dataelementgroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataelementgroupuseraccesses OWNER TO dhis;

--
-- Name: dataelementgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupusergroupaccesses (
    dataelementgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataelementgroupusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementlegendsets; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementlegendsets (
    dataelementid integer NOT NULL,
    sort_order integer NOT NULL,
    legendsetid integer NOT NULL
);


ALTER TABLE public.dataelementlegendsets OWNER TO dhis;

--
-- Name: dataelementoperand; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementoperand (
    dataelementoperandid integer NOT NULL,
    dataelementid integer,
    categoryoptioncomboid integer
);


ALTER TABLE public.dataelementoperand OWNER TO dhis;

--
-- Name: dataelementtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementtranslations (
    dataelementid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataelementtranslations OWNER TO dhis;

--
-- Name: dataelementuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementuseraccesses (
    dataelementid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.dataelementuseraccesses OWNER TO dhis;

--
-- Name: dataelementusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementusergroupaccesses (
    dataelementid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.dataelementusergroupaccesses OWNER TO dhis;

--
-- Name: dataentryform; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataentryform (
    dataentryformid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(160) NOT NULL,
    style character varying(40),
    htmlcode text,
    format integer
);


ALTER TABLE public.dataentryform OWNER TO dhis;

--
-- Name: dataentryformtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataentryformtranslations (
    dataentryformid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.dataentryformtranslations OWNER TO dhis;

--
-- Name: datainputperiod; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datainputperiod (
    datainputperiodid integer NOT NULL,
    periodid integer NOT NULL,
    openingdate timestamp without time zone,
    closingdate timestamp without time zone,
    datasetid integer
);


ALTER TABLE public.datainputperiod OWNER TO dhis;

--
-- Name: dataset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataset (
    datasetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    formname text,
    style jsonb,
    periodtypeid integer NOT NULL,
    categorycomboid integer NOT NULL,
    dataentryform integer,
    mobile boolean NOT NULL,
    version integer,
    expirydays integer,
    timelydays integer,
    notifycompletinguser boolean,
    workflowid integer,
    openfutureperiods integer,
    fieldcombinationrequired boolean,
    validcompleteonly boolean,
    novaluerequirescomment boolean,
    skipoffline boolean,
    dataelementdecoration boolean,
    renderastabs boolean,
    renderhorizontally boolean,
    compulsoryfieldscompleteonly boolean,
    userid integer,
    publicaccess character varying(8),
    notificationrecipients integer
);


ALTER TABLE public.dataset OWNER TO dhis;

--
-- Name: datasetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetattributevalues (
    datasetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.datasetattributevalues OWNER TO dhis;

--
-- Name: datasetelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetelement (
    datasetelementid integer NOT NULL,
    datasetid integer,
    dataelementid integer NOT NULL,
    categorycomboid integer
);


ALTER TABLE public.datasetelement OWNER TO dhis;

--
-- Name: datasetindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetindicators (
    datasetid integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE public.datasetindicators OWNER TO dhis;

--
-- Name: datasetlegendsets; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetlegendsets (
    datasetid integer NOT NULL,
    sort_order integer NOT NULL,
    legendsetid integer NOT NULL
);


ALTER TABLE public.datasetlegendsets OWNER TO dhis;

--
-- Name: datasetnotification_datasets; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetnotification_datasets (
    datasetnotificationtemplateid integer NOT NULL,
    datasetid integer NOT NULL
);


ALTER TABLE public.datasetnotification_datasets OWNER TO dhis;

--
-- Name: datasetnotificationtemplate; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetnotificationtemplate (
    datasetnotificationtemplateid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    subjecttemplate character varying(100),
    messagetemplate text NOT NULL,
    relativescheduleddays integer,
    sendstrategy character varying(50),
    usergroupid integer,
    datasetnotificationtrigger character varying(255),
    notificationrecipienttype character varying(255)
);


ALTER TABLE public.datasetnotificationtemplate OWNER TO dhis;

--
-- Name: datasetnotificationtemplate_deliverychannel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetnotificationtemplate_deliverychannel (
    datasetnotificationtemplateid integer NOT NULL,
    deliverychannel character varying(255)
);


ALTER TABLE public.datasetnotificationtemplate_deliverychannel OWNER TO dhis;

--
-- Name: datasetoperands; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetoperands (
    datasetid integer NOT NULL,
    dataelementoperandid integer NOT NULL
);


ALTER TABLE public.datasetoperands OWNER TO dhis;

--
-- Name: datasetsectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetsectiontranslations (
    sectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.datasetsectiontranslations OWNER TO dhis;

--
-- Name: datasetsource; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetsource (
    datasetid integer NOT NULL,
    sourceid integer NOT NULL
);


ALTER TABLE public.datasetsource OWNER TO dhis;

--
-- Name: datasettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasettranslations (
    datasetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.datasettranslations OWNER TO dhis;

--
-- Name: datasetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetuseraccesses (
    datasetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.datasetuseraccesses OWNER TO dhis;

--
-- Name: datasetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetusergroupaccesses (
    datasetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.datasetusergroupaccesses OWNER TO dhis;

--
-- Name: datastatistics; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datastatistics (
    statisticsid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    chartviews double precision,
    mapviews double precision,
    reporttableviews double precision,
    eventreportviews double precision,
    eventchartviews double precision,
    dashboardviews double precision,
    datasetreportviews double precision,
    active_users integer,
    totalviews double precision,
    charts double precision,
    maps double precision,
    reporttables double precision,
    eventreports double precision,
    eventcharts double precision,
    dashboards double precision,
    indicators double precision,
    datavalues double precision,
    users integer
);


ALTER TABLE public.datastatistics OWNER TO dhis;

--
-- Name: datastatisticsevent; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datastatisticsevent (
    eventid integer NOT NULL,
    eventtype character varying,
    "timestamp" timestamp without time zone,
    username character varying(255),
    favoriteuid character varying(255)
);


ALTER TABLE public.datastatisticsevent OWNER TO dhis;

--
-- Name: datavalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datavalue (
    dataelementid integer NOT NULL,
    periodid integer NOT NULL,
    sourceid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    value character varying(50000),
    storedby character varying(255),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    comment character varying(50000),
    followup boolean,
    deleted boolean NOT NULL
);


ALTER TABLE public.datavalue OWNER TO dhis;

--
-- Name: datavalueaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datavalueaudit (
    datavalueauditid integer NOT NULL,
    dataelementid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    value character varying(50000),
    created timestamp without time zone,
    modifiedby character varying(100),
    audittype character varying(100) NOT NULL
);


ALTER TABLE public.datavalueaudit OWNER TO dhis;

--
-- Name: deletedobject; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.deletedobject (
    deletedobjectid integer NOT NULL,
    klass character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    code character varying(255),
    deleted_at timestamp without time zone NOT NULL,
    deleted_by character varying(255)
);


ALTER TABLE public.deletedobject OWNER TO dhis;

--
-- Name: document; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.document (
    documentid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    url text NOT NULL,
    fileresource integer,
    external boolean NOT NULL,
    contenttype character varying(255),
    attachment boolean,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.document OWNER TO dhis;

--
-- Name: documentattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.documentattributevalues (
    documentid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.documentattributevalues OWNER TO dhis;

--
-- Name: documenttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.documenttranslations (
    documentid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.documenttranslations OWNER TO dhis;

--
-- Name: documentuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.documentuseraccesses (
    documentid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.documentuseraccesses OWNER TO dhis;

--
-- Name: documentusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.documentusergroupaccesses (
    documentid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.documentusergroupaccesses OWNER TO dhis;

--
-- Name: eventchart; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart (
    eventchartid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    programid integer NOT NULL,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    dataelementvaluedimensionid integer,
    attributevaluedimensionid integer,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    subtitle character varying(255),
    hidetitle boolean,
    hidesubtitle boolean,
    type character varying(40) NOT NULL,
    showdata boolean,
    hideemptyrowitems character varying(40),
    hidenadata boolean,
    programstatus character varying(40),
    eventstatus character varying(40),
    percentstackedvalues boolean,
    cumulativevalues boolean,
    rangeaxismaxvalue double precision,
    rangeaxisminvalue double precision,
    rangeaxissteps integer,
    rangeaxisdecimals integer,
    outputtype character varying(30),
    collapsedatadimensions boolean,
    domainaxislabel character varying(255),
    rangeaxislabel character varying(255),
    hidelegend boolean,
    nospacebetweencolumns boolean,
    regressiontype character varying(40) NOT NULL,
    targetlinevalue double precision,
    targetlinelabel character varying(255),
    baselinevalue double precision,
    baselinelabel character varying(255),
    sortorder integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8),
    favorites jsonb
);


ALTER TABLE public.eventchart OWNER TO dhis;

--
-- Name: eventchart_attributedimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_attributedimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


ALTER TABLE public.eventchart_attributedimensions OWNER TO dhis;

--
-- Name: eventchart_categorydimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_categorydimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


ALTER TABLE public.eventchart_categorydimensions OWNER TO dhis;

--
-- Name: eventchart_categoryoptiongroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_categoryoptiongroupsetdimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.eventchart_categoryoptiongroupsetdimensions OWNER TO dhis;

--
-- Name: eventchart_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_columns (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.eventchart_columns OWNER TO dhis;

--
-- Name: eventchart_dataelementdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_dataelementdimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


ALTER TABLE public.eventchart_dataelementdimensions OWNER TO dhis;

--
-- Name: eventchart_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_filters (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.eventchart_filters OWNER TO dhis;

--
-- Name: eventchart_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_itemorgunitgroups (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.eventchart_itemorgunitgroups OWNER TO dhis;

--
-- Name: eventchart_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_organisationunits (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.eventchart_organisationunits OWNER TO dhis;

--
-- Name: eventchart_orgunitgroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_orgunitgroupsetdimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.eventchart_orgunitgroupsetdimensions OWNER TO dhis;

--
-- Name: eventchart_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_orgunitlevels (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE public.eventchart_orgunitlevels OWNER TO dhis;

--
-- Name: eventchart_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_periods (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE public.eventchart_periods OWNER TO dhis;

--
-- Name: eventchart_programindicatordimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_programindicatordimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityprogramindicatordimensionid integer NOT NULL
);


ALTER TABLE public.eventchart_programindicatordimensions OWNER TO dhis;

--
-- Name: eventchart_rows; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchart_rows (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.eventchart_rows OWNER TO dhis;

--
-- Name: eventcharttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventcharttranslations (
    eventchartid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.eventcharttranslations OWNER TO dhis;

--
-- Name: eventchartuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchartuseraccesses (
    eventchartid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.eventchartuseraccesses OWNER TO dhis;

--
-- Name: eventchartusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventchartusergroupaccesses (
    eventchartid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.eventchartusergroupaccesses OWNER TO dhis;

--
-- Name: eventreport; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport (
    eventreportid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    programid integer NOT NULL,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    dataelementvaluedimensionid integer,
    attributevaluedimensionid integer,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    subtitle character varying(255),
    hidetitle boolean,
    hidesubtitle boolean,
    datatype character varying(40),
    rowtotals boolean,
    coltotals boolean,
    rowsubtotals boolean,
    colsubtotals boolean,
    hideemptyrows boolean,
    hidenadata boolean,
    showhierarchy boolean,
    outputtype character varying(30),
    collapsedatadimensions boolean,
    showdimensionlabels boolean,
    digitgroupseparator character varying(40),
    displaydensity character varying(40),
    fontsize character varying(40),
    programstatus character varying(40),
    eventstatus character varying(40),
    sortorder integer,
    toplimit integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8),
    favorites jsonb
);


ALTER TABLE public.eventreport OWNER TO dhis;

--
-- Name: eventreport_attributedimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_attributedimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


ALTER TABLE public.eventreport_attributedimensions OWNER TO dhis;

--
-- Name: eventreport_categorydimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_categorydimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


ALTER TABLE public.eventreport_categorydimensions OWNER TO dhis;

--
-- Name: eventreport_categoryoptiongroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_categoryoptiongroupsetdimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.eventreport_categoryoptiongroupsetdimensions OWNER TO dhis;

--
-- Name: eventreport_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_columns (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.eventreport_columns OWNER TO dhis;

--
-- Name: eventreport_dataelementdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_dataelementdimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


ALTER TABLE public.eventreport_dataelementdimensions OWNER TO dhis;

--
-- Name: eventreport_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_filters (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.eventreport_filters OWNER TO dhis;

--
-- Name: eventreport_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_itemorgunitgroups (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.eventreport_itemorgunitgroups OWNER TO dhis;

--
-- Name: eventreport_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_organisationunits (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.eventreport_organisationunits OWNER TO dhis;

--
-- Name: eventreport_orgunitgroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_orgunitgroupsetdimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.eventreport_orgunitgroupsetdimensions OWNER TO dhis;

--
-- Name: eventreport_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_orgunitlevels (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE public.eventreport_orgunitlevels OWNER TO dhis;

--
-- Name: eventreport_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_periods (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE public.eventreport_periods OWNER TO dhis;

--
-- Name: eventreport_programindicatordimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_programindicatordimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityprogramindicatordimensionid integer NOT NULL
);


ALTER TABLE public.eventreport_programindicatordimensions OWNER TO dhis;

--
-- Name: eventreport_rows; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreport_rows (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.eventreport_rows OWNER TO dhis;

--
-- Name: eventreporttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreporttranslations (
    eventreportid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.eventreporttranslations OWNER TO dhis;

--
-- Name: eventreportuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreportuseraccesses (
    eventreportid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.eventreportuseraccesses OWNER TO dhis;

--
-- Name: eventreportusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreportusergroupaccesses (
    eventreportid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.eventreportusergroupaccesses OWNER TO dhis;

--
-- Name: expression; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.expression (
    expressionid integer NOT NULL,
    description character varying(255),
    expression text,
    slidingwindow boolean,
    missingvaluestrategy character varying(100) NOT NULL
);


ALTER TABLE public.expression OWNER TO dhis;

--
-- Name: externalfileresource; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.externalfileresource (
    externalfileresourceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    accesstoken character varying(255),
    expires timestamp without time zone,
    fileresourceid integer NOT NULL
);


ALTER TABLE public.externalfileresource OWNER TO dhis;

--
-- Name: externalmaplayer; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.externalmaplayer (
    externalmaplayerid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    attribution text,
    url text NOT NULL,
    legendseturl text,
    maplayerposition bytea NOT NULL,
    layers text,
    imageformat bytea NOT NULL,
    mapservice bytea NOT NULL,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.externalmaplayer OWNER TO dhis;

--
-- Name: externalmaplayeruseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.externalmaplayeruseraccesses (
    externalmaplayerid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.externalmaplayeruseraccesses OWNER TO dhis;

--
-- Name: externalmaplayerusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.externalmaplayerusergroupaccesses (
    externalmaplayerid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.externalmaplayerusergroupaccesses OWNER TO dhis;

--
-- Name: externalnotificationlogentry; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.externalnotificationlogentry (
    externalnotificationlogentryid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastsentat timestamp without time zone,
    retries integer,
    key text NOT NULL,
    templateuid text NOT NULL,
    allowmultiple boolean,
    triggerby character varying(255)
);


ALTER TABLE public.externalnotificationlogentry OWNER TO dhis;

--
-- Name: fileresource; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.fileresource (
    fileresourceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    contenttype character varying(255) NOT NULL,
    contentlength bigint NOT NULL,
    contentmd5 character varying(32) NOT NULL,
    storagekey character varying(1024) NOT NULL,
    isassigned boolean NOT NULL,
    storagestatus character varying(40),
    domain character varying(40),
    userid integer
);


ALTER TABLE public.fileresource OWNER TO dhis;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: dhis
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO dhis;

--
-- Name: i18nlocale; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.i18nlocale (
    i18nlocaleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(250) NOT NULL,
    locale character varying(15) NOT NULL
);


ALTER TABLE public.i18nlocale OWNER TO dhis;

--
-- Name: incomingsms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.incomingsms (
    id integer NOT NULL,
    originator character varying(255) NOT NULL,
    encoding integer NOT NULL,
    sentdate timestamp without time zone NOT NULL,
    receiveddate timestamp without time zone NOT NULL,
    text character varying(255),
    gatewayid character varying(255) NOT NULL,
    status integer NOT NULL,
    parsed boolean,
    statusmessage character varying(255),
    userid integer
);


ALTER TABLE public.incomingsms OWNER TO dhis;

--
-- Name: indicator; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicator (
    indicatorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    formname text,
    annualized boolean NOT NULL,
    decimals integer,
    indicatortypeid integer NOT NULL,
    numerator text NOT NULL,
    numeratordescription text,
    denominator text NOT NULL,
    denominatordescription text,
    url character varying(255),
    style jsonb,
    aggregateexportcategoryoptioncombo character varying(255),
    aggregateexportattributeoptioncombo character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.indicator OWNER TO dhis;

--
-- Name: indicatorattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorattributevalues (
    indicatorid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.indicatorattributevalues OWNER TO dhis;

--
-- Name: indicatorgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroup (
    indicatorgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.indicatorgroup OWNER TO dhis;

--
-- Name: indicatorgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupattributevalues (
    indicatorgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.indicatorgroupattributevalues OWNER TO dhis;

--
-- Name: indicatorgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupmembers (
    indicatorgroupid integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE public.indicatorgroupmembers OWNER TO dhis;

--
-- Name: indicatorgroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupset (
    indicatorgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.indicatorgroupset OWNER TO dhis;

--
-- Name: indicatorgroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupsetmembers (
    indicatorgroupid integer NOT NULL,
    indicatorgroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE public.indicatorgroupsetmembers OWNER TO dhis;

--
-- Name: indicatorgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupsettranslations (
    indicatorgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.indicatorgroupsettranslations OWNER TO dhis;

--
-- Name: indicatorgroupsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupsetuseraccesses (
    indicatorgroupsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.indicatorgroupsetuseraccesses OWNER TO dhis;

--
-- Name: indicatorgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupsetusergroupaccesses (
    indicatorgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.indicatorgroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: indicatorgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgrouptranslations (
    indicatorgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.indicatorgrouptranslations OWNER TO dhis;

--
-- Name: indicatorgroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupuseraccesses (
    indicatorgroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.indicatorgroupuseraccesses OWNER TO dhis;

--
-- Name: indicatorgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupusergroupaccesses (
    indicatorgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.indicatorgroupusergroupaccesses OWNER TO dhis;

--
-- Name: indicatorlegendsets; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorlegendsets (
    indicatorid integer NOT NULL,
    sort_order integer NOT NULL,
    legendsetid integer NOT NULL
);


ALTER TABLE public.indicatorlegendsets OWNER TO dhis;

--
-- Name: indicatortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatortranslations (
    indicatorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.indicatortranslations OWNER TO dhis;

--
-- Name: indicatortype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatortype (
    indicatortypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    indicatorfactor integer NOT NULL,
    indicatornumber boolean
);


ALTER TABLE public.indicatortype OWNER TO dhis;

--
-- Name: indicatortypetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatortypetranslations (
    indicatortypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.indicatortypetranslations OWNER TO dhis;

--
-- Name: indicatoruseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatoruseraccesses (
    indicatorid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.indicatoruseraccesses OWNER TO dhis;

--
-- Name: indicatorusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorusergroupaccesses (
    indicatorid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.indicatorusergroupaccesses OWNER TO dhis;

--
-- Name: intepretation_likedby; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.intepretation_likedby (
    interpretationid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.intepretation_likedby OWNER TO dhis;

--
-- Name: interpretation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.interpretation (
    interpretationid integer NOT NULL,
    uid character varying(11) NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    reporttableid integer,
    chartid integer,
    mapid integer,
    eventreportid integer,
    eventchartid integer,
    datasetid integer,
    periodid integer,
    organisationunitid integer,
    interpretationtext text,
    created timestamp without time zone NOT NULL,
    likes integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.interpretation OWNER TO dhis;

--
-- Name: interpretation_comments; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.interpretation_comments (
    interpretationid integer NOT NULL,
    sort_order integer NOT NULL,
    interpretationcommentid integer NOT NULL
);


ALTER TABLE public.interpretation_comments OWNER TO dhis;

--
-- Name: interpretationcomment; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.interpretationcomment (
    interpretationcommentid integer NOT NULL,
    uid character varying(11),
    lastupdated timestamp without time zone NOT NULL,
    commenttext text,
    userid integer NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.interpretationcomment OWNER TO dhis;

--
-- Name: interpretationuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.interpretationuseraccesses (
    interpretationid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.interpretationuseraccesses OWNER TO dhis;

--
-- Name: interpretationusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.interpretationusergroupaccesses (
    interpretationid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.interpretationusergroupaccesses OWNER TO dhis;

--
-- Name: jobconfiguration; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.jobconfiguration (
    jobconfigurationid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    cronexpression character varying(255) NOT NULL,
    jobtype bytea NOT NULL,
    jobstatus bytea NOT NULL,
    lastexecutedstatus bytea,
    lastexecuted timestamp without time zone,
    lastruntimeexecution text,
    nextexecutiontime timestamp without time zone,
    continuousexecution boolean NOT NULL,
    enabled boolean NOT NULL,
    jobparameters bytea
);


ALTER TABLE public.jobconfiguration OWNER TO dhis;

--
-- Name: keyjsonvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.keyjsonvalue (
    keyjsonvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    namespace character varying(255) NOT NULL,
    namespacekey character varying(255) NOT NULL,
    value text,
    encrypted_value character varying(255),
    encrypted boolean
);


ALTER TABLE public.keyjsonvalue OWNER TO dhis;

--
-- Name: legendsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.legendsetattributevalues (
    legendsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.legendsetattributevalues OWNER TO dhis;

--
-- Name: legendsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.legendsetuseraccesses (
    maplegendsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.legendsetuseraccesses OWNER TO dhis;

--
-- Name: legendsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.legendsetusergroupaccesses (
    maplegendsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.legendsetusergroupaccesses OWNER TO dhis;

--
-- Name: lockexception; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.lockexception (
    lockexceptionid integer NOT NULL,
    organisationunitid integer,
    periodid integer,
    datasetid integer
);


ALTER TABLE public.lockexception OWNER TO dhis;

--
-- Name: map; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.map (
    mapid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    longitude double precision,
    latitude double precision,
    zoom integer,
    basemap character varying(255),
    title character varying(255),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8),
    favorites jsonb
);


ALTER TABLE public.map OWNER TO dhis;

--
-- Name: maplegend; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.maplegend (
    maplegendid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    startvalue double precision NOT NULL,
    endvalue double precision NOT NULL,
    color character varying(255),
    image character varying(255),
    maplegendsetid integer
);


ALTER TABLE public.maplegend OWNER TO dhis;

--
-- Name: maplegendset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.maplegendset (
    maplegendsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    symbolizer character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.maplegendset OWNER TO dhis;

--
-- Name: maplegendsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.maplegendsettranslations (
    maplegendsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.maplegendsettranslations OWNER TO dhis;

--
-- Name: maplegendtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.maplegendtranslations (
    maplegendid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.maplegendtranslations OWNER TO dhis;

--
-- Name: mapmapviews; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapmapviews (
    mapid integer NOT NULL,
    sort_order integer NOT NULL,
    mapviewid integer NOT NULL
);


ALTER TABLE public.mapmapviews OWNER TO dhis;

--
-- Name: mapuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapuseraccesses (
    mapid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.mapuseraccesses OWNER TO dhis;

--
-- Name: mapusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapusergroupaccesses (
    mapid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.mapusergroupaccesses OWNER TO dhis;

--
-- Name: mapview; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview (
    mapviewid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    description text,
    layer character varying(255) NOT NULL,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    aggregationtype character varying(40),
    programid integer,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    method integer,
    classes integer,
    colorlow character varying(255),
    colorhigh character varying(255),
    colorscale character varying(255),
    legendsetid integer,
    radiuslow integer,
    radiushigh integer,
    opacity double precision,
    orgunitgroupsetid integer,
    arearadius integer,
    hidden boolean,
    labels boolean,
    labelfontsize character varying(255),
    labelfontweight character varying(255),
    labelfontstyle character varying(255),
    labelfontcolor character varying(255),
    eventclustering boolean,
    eventcoordinatefield character varying(255),
    eventpointcolor character varying(255),
    eventpointradius integer,
    config text,
    styledataitem jsonb
);


ALTER TABLE public.mapview OWNER TO dhis;

--
-- Name: mapview_attributedimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_attributedimensions (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


ALTER TABLE public.mapview_attributedimensions OWNER TO dhis;

--
-- Name: mapview_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_columns (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.mapview_columns OWNER TO dhis;

--
-- Name: mapview_datadimensionitems; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_datadimensionitems (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


ALTER TABLE public.mapview_datadimensionitems OWNER TO dhis;

--
-- Name: mapview_dataelementdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_dataelementdimensions (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


ALTER TABLE public.mapview_dataelementdimensions OWNER TO dhis;

--
-- Name: mapview_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_itemorgunitgroups (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.mapview_itemorgunitgroups OWNER TO dhis;

--
-- Name: mapview_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_organisationunits (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.mapview_organisationunits OWNER TO dhis;

--
-- Name: mapview_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_orgunitlevels (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE public.mapview_orgunitlevels OWNER TO dhis;

--
-- Name: mapview_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapview_periods (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE public.mapview_periods OWNER TO dhis;

--
-- Name: mapviewtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapviewtranslations (
    mapviewid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.mapviewtranslations OWNER TO dhis;

--
-- Name: message; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.message (
    messageid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    messagetext text,
    internal boolean,
    metadata character varying(255),
    userid integer
);


ALTER TABLE public.message OWNER TO dhis;

--
-- Name: messageconversation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.messageconversation (
    messageconversationid integer NOT NULL,
    uid character varying(11),
    messagecount integer,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    subject character varying(255) NOT NULL,
    messagetype character varying(255) NOT NULL,
    priority character varying(255),
    status character varying(255),
    user_assigned integer,
    lastsenderid integer,
    lastmessage timestamp without time zone,
    userid integer
);


ALTER TABLE public.messageconversation OWNER TO dhis;

--
-- Name: messageconversation_messages; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.messageconversation_messages (
    messageconversationid integer NOT NULL,
    sort_order integer NOT NULL,
    messageid integer NOT NULL
);


ALTER TABLE public.messageconversation_messages OWNER TO dhis;

--
-- Name: messageconversation_usermessages; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.messageconversation_usermessages (
    messageconversationid integer NOT NULL,
    usermessageid integer NOT NULL
);


ALTER TABLE public.messageconversation_usermessages OWNER TO dhis;

--
-- Name: metadataaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.metadataaudit (
    metadataauditid integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    klass character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    code character varying(255),
    type character varying(50) NOT NULL,
    value text
);


ALTER TABLE public.metadataaudit OWNER TO dhis;

--
-- Name: metadataversion; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.metadataversion (
    versionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    versiontype character varying(50),
    importdate timestamp without time zone,
    hashcode character varying(50) NOT NULL
);


ALTER TABLE public.metadataversion OWNER TO dhis;

--
-- Name: minmaxdataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.minmaxdataelement (
    minmaxdataelementid integer NOT NULL,
    sourceid integer,
    dataelementid integer,
    categoryoptioncomboid integer,
    minimumvalue integer NOT NULL,
    maximumvalue integer NOT NULL,
    generatedvalue boolean NOT NULL
);


ALTER TABLE public.minmaxdataelement OWNER TO dhis;

--
-- Name: oauth2client; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.oauth2client (
    oauth2clientid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    cid character varying(230) NOT NULL,
    secret character varying(512) NOT NULL
);


ALTER TABLE public.oauth2client OWNER TO dhis;

--
-- Name: oauth2clientgranttypes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.oauth2clientgranttypes (
    oauth2clientid integer NOT NULL,
    sort_order integer NOT NULL,
    granttype character varying(255)
);


ALTER TABLE public.oauth2clientgranttypes OWNER TO dhis;

--
-- Name: oauth2clientredirecturis; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.oauth2clientredirecturis (
    oauth2clientid integer NOT NULL,
    sort_order integer NOT NULL,
    redirecturi character varying(255)
);


ALTER TABLE public.oauth2clientredirecturis OWNER TO dhis;

--
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256) NOT NULL,
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);


ALTER TABLE public.oauth_access_token OWNER TO dhis;

--
-- Name: oauth_code; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.oauth_code (
    code character varying(256),
    authentication bytea
);


ALTER TABLE public.oauth_code OWNER TO dhis;

--
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.oauth_refresh_token (
    token_id character varying(256),
    token bytea,
    authentication bytea
);


ALTER TABLE public.oauth_refresh_token OWNER TO dhis;

--
-- Name: objecttranslation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.objecttranslation (
    objecttranslationid integer NOT NULL,
    locale character varying(15) NOT NULL,
    property character varying(50) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.objecttranslation OWNER TO dhis;

--
-- Name: optionattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionattributevalues (
    optionvalueid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.optionattributevalues OWNER TO dhis;

--
-- Name: optiongroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroup (
    optiongroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.optiongroup OWNER TO dhis;

--
-- Name: optiongroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupattributevalues (
    optiongroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.optiongroupattributevalues OWNER TO dhis;

--
-- Name: optiongroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupmembers (
    optiongroupid integer NOT NULL,
    optionid integer NOT NULL
);


ALTER TABLE public.optiongroupmembers OWNER TO dhis;

--
-- Name: optiongroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupset (
    optiongroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    datadimension boolean NOT NULL,
    optionsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.optiongroupset OWNER TO dhis;

--
-- Name: optiongroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupsetmembers (
    optiongroupsetid integer NOT NULL,
    sort_order integer NOT NULL,
    optiongroupid integer NOT NULL
);


ALTER TABLE public.optiongroupsetmembers OWNER TO dhis;

--
-- Name: optiongroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupsettranslations (
    optiongroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.optiongroupsettranslations OWNER TO dhis;

--
-- Name: optiongroupsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupsetuseraccesses (
    optiongroupsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.optiongroupsetuseraccesses OWNER TO dhis;

--
-- Name: optiongroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupsetusergroupaccesses (
    optiongroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.optiongroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: optiongrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongrouptranslations (
    optiongroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.optiongrouptranslations OWNER TO dhis;

--
-- Name: optiongroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupuseraccesses (
    optiongroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.optiongroupuseraccesses OWNER TO dhis;

--
-- Name: optiongroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupusergroupaccesses (
    optiongroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.optiongroupusergroupaccesses OWNER TO dhis;

--
-- Name: optionset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionset (
    optionsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    valuetype character varying(50) NOT NULL,
    version integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.optionset OWNER TO dhis;

--
-- Name: optionsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionsetattributevalues (
    optionsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.optionsetattributevalues OWNER TO dhis;

--
-- Name: optionsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionsettranslations (
    optionsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.optionsettranslations OWNER TO dhis;

--
-- Name: optionsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionsetuseraccesses (
    optionsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.optionsetuseraccesses OWNER TO dhis;

--
-- Name: optionsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionsetusergroupaccesses (
    optionsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.optionsetusergroupaccesses OWNER TO dhis;

--
-- Name: optionvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionvalue (
    optionvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(230) NOT NULL,
    name character varying(230) NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    sort_order integer,
    description text,
    formname text,
    style jsonb,
    optionsetid integer
);


ALTER TABLE public.optionvalue OWNER TO dhis;

--
-- Name: optionvaluetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionvaluetranslations (
    optionvalueid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.optionvaluetranslations OWNER TO dhis;

--
-- Name: organisationunit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.organisationunit (
    organisationunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    parentid integer,
    path character varying(255),
    hierarchylevel integer,
    description text,
    openingdate date NOT NULL,
    closeddate date,
    comment text,
    featuretype character varying(50),
    coordinates text,
    url character varying(255),
    contactperson character varying(255),
    address character varying(255),
    email character varying(150),
    phonenumber character varying(150),
    userid integer
);


ALTER TABLE public.organisationunit OWNER TO dhis;

--
-- Name: organisationunitattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.organisationunitattributevalues (
    organisationunitid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.organisationunitattributevalues OWNER TO dhis;

--
-- Name: organisationunittranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.organisationunittranslations (
    organisationunitid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.organisationunittranslations OWNER TO dhis;

--
-- Name: orgunitgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroup (
    orgunitgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    symbol character varying(255),
    color character varying(255),
    coordinates text,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.orgunitgroup OWNER TO dhis;

--
-- Name: orgunitgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupattributevalues (
    orgunitgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.orgunitgroupattributevalues OWNER TO dhis;

--
-- Name: orgunitgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupmembers (
    organisationunitid integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.orgunitgroupmembers OWNER TO dhis;

--
-- Name: orgunitgroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupset (
    orgunitgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean NOT NULL,
    includesubhierarchyinanalytics boolean,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.orgunitgroupset OWNER TO dhis;

--
-- Name: orgunitgroupsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsetattributevalues (
    orgunitgroupsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.orgunitgroupsetattributevalues OWNER TO dhis;

--
-- Name: orgunitgroupsetdimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsetdimension (
    orgunitgroupsetdimensionid integer NOT NULL,
    orgunitgroupsetid integer
);


ALTER TABLE public.orgunitgroupsetdimension OWNER TO dhis;

--
-- Name: orgunitgroupsetdimension_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsetdimension_items (
    orgunitgroupsetdimensionid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.orgunitgroupsetdimension_items OWNER TO dhis;

--
-- Name: orgunitgroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsetmembers (
    orgunitgroupsetid integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.orgunitgroupsetmembers OWNER TO dhis;

--
-- Name: orgunitgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsettranslations (
    orgunitgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.orgunitgroupsettranslations OWNER TO dhis;

--
-- Name: orgunitgroupsetuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsetuseraccesses (
    orgunitgroupsetid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.orgunitgroupsetuseraccesses OWNER TO dhis;

--
-- Name: orgunitgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsetusergroupaccesses (
    orgunitgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.orgunitgroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: orgunitgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgrouptranslations (
    orgunitgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.orgunitgrouptranslations OWNER TO dhis;

--
-- Name: orgunitgroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupuseraccesses (
    orgunitgroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.orgunitgroupuseraccesses OWNER TO dhis;

--
-- Name: orgunitgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupusergroupaccesses (
    orgunitgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.orgunitgroupusergroupaccesses OWNER TO dhis;

--
-- Name: orgunitlevel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitlevel (
    orgunitlevelid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    level integer NOT NULL,
    offlinelevels integer
);


ALTER TABLE public.orgunitlevel OWNER TO dhis;

--
-- Name: orgunitleveltranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitleveltranslations (
    orgunitlevelid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.orgunitleveltranslations OWNER TO dhis;

--
-- Name: outbound_sms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.outbound_sms (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    message character varying(500),
    status integer NOT NULL,
    sender character varying(255)
);


ALTER TABLE public.outbound_sms OWNER TO dhis;

--
-- Name: outbound_sms_recipients; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.outbound_sms_recipients (
    outbound_sms_id integer NOT NULL,
    elt text
);


ALTER TABLE public.outbound_sms_recipients OWNER TO dhis;

--
-- Name: period; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.period (
    periodid integer NOT NULL,
    periodtypeid integer,
    startdate date NOT NULL,
    enddate date NOT NULL
);


ALTER TABLE public.period OWNER TO dhis;

--
-- Name: periodtype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.periodtype (
    periodtypeid integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.periodtype OWNER TO dhis;

--
-- Name: predictor; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.predictor (
    predictorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    generatorexpressionid integer NOT NULL,
    generatoroutput integer NOT NULL,
    generatoroutputcombo integer,
    skiptestexpressionid integer,
    periodtypeid integer NOT NULL,
    sequentialsamplecount integer NOT NULL,
    annualsamplecount integer NOT NULL,
    sequentialskipcount integer
);


ALTER TABLE public.predictor OWNER TO dhis;

--
-- Name: predictororgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.predictororgunitlevels (
    predictorid integer NOT NULL,
    orgunitlevelid integer NOT NULL
);


ALTER TABLE public.predictororgunitlevels OWNER TO dhis;

--
-- Name: previouspasswords; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.previouspasswords (
    userid integer NOT NULL,
    list_index integer NOT NULL,
    previouspassword text
);


ALTER TABLE public.previouspasswords OWNER TO dhis;

--
-- Name: program; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.program (
    programid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    formname text,
    version integer,
    enrollmentdatelabel text,
    incidentdatelabel text,
    type character varying(255) NOT NULL,
    displayincidentdate boolean,
    onlyenrollonce boolean,
    skipoffline boolean NOT NULL,
    displayfrontpagelist boolean,
    usefirststageduringregistration boolean,
    capturecoordinates boolean,
    expirydays integer,
    completeeventsexpirydays integer,
    minattributesrequiredtosearch integer,
    maxteicounttoreturn integer,
    style jsonb,
    expiryperiodtypeid integer,
    ignoreoverdueevents boolean,
    selectenrollmentdatesinfuture boolean,
    selectincidentdatesinfuture boolean,
    relationshiptext character varying(255),
    relationshiptypeid integer,
    relationshipfroma boolean,
    relatedprogramid integer,
    categorycomboid integer NOT NULL,
    trackedentitytypeid integer,
    dataentryformid integer,
    workflowid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.program OWNER TO dhis;

--
-- Name: program_attribute_group; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.program_attribute_group (
    programtrackedentityattributegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(255),
    description text,
    uniqunessype bytea NOT NULL
);


ALTER TABLE public.program_attribute_group OWNER TO dhis;

--
-- Name: program_attributes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.program_attributes (
    programtrackedentityattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    programid integer,
    trackedentityattributeid integer,
    displayinlist boolean,
    mandatory boolean,
    sort_order integer,
    allowfuturedate boolean,
    renderoptionsasradio boolean,
    rendertype jsonb,
    searchable boolean
);


ALTER TABLE public.program_attributes OWNER TO dhis;

--
-- Name: program_criteria; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.program_criteria (
    programid integer NOT NULL,
    validationcriteriaid integer NOT NULL
);


ALTER TABLE public.program_criteria OWNER TO dhis;

--
-- Name: program_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.program_organisationunits (
    organisationunitid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE public.program_organisationunits OWNER TO dhis;

--
-- Name: program_userroles; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.program_userroles (
    programid integer,
    userroleid integer NOT NULL
);


ALTER TABLE public.program_userroles OWNER TO dhis;

--
-- Name: programattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programattributevalues (
    programid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.programattributevalues OWNER TO dhis;

--
-- Name: programexpression; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programexpression (
    programexpressionid integer NOT NULL,
    description character varying(255),
    expression text
);


ALTER TABLE public.programexpression OWNER TO dhis;

--
-- Name: programindicator; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicator (
    programindicatorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    formname text,
    style jsonb,
    programid integer NOT NULL,
    expression text,
    filter text,
    aggregationtype character varying(40),
    decimals integer,
    aggregateexportcategoryoptioncombo character varying(255),
    aggregateexportattributeoptioncombo character varying(255),
    displayinform boolean,
    analyticstype character varying(15) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.programindicator OWNER TO dhis;

--
-- Name: programindicatorattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorattributevalues (
    programindicatorid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.programindicatorattributevalues OWNER TO dhis;

--
-- Name: programindicatorgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgroup (
    programindicatorgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.programindicatorgroup OWNER TO dhis;

--
-- Name: programindicatorgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgroupattributevalues (
    programindicatorgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.programindicatorgroupattributevalues OWNER TO dhis;

--
-- Name: programindicatorgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgroupmembers (
    programindicatorgroupid integer NOT NULL,
    programindicatorid integer NOT NULL
);


ALTER TABLE public.programindicatorgroupmembers OWNER TO dhis;

--
-- Name: programindicatorgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgrouptranslations (
    programindicatorgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programindicatorgrouptranslations OWNER TO dhis;

--
-- Name: programindicatorgroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgroupuseraccesses (
    programindicatorgroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.programindicatorgroupuseraccesses OWNER TO dhis;

--
-- Name: programindicatorgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgroupusergroupaccesses (
    programindicatorgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.programindicatorgroupusergroupaccesses OWNER TO dhis;

--
-- Name: programindicatorlegendsets; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorlegendsets (
    programindicatorid integer NOT NULL,
    sort_order integer NOT NULL,
    legendsetid integer NOT NULL
);


ALTER TABLE public.programindicatorlegendsets OWNER TO dhis;

--
-- Name: programindicatortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatortranslations (
    programindicatorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programindicatortranslations OWNER TO dhis;

--
-- Name: programindicatoruseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatoruseraccesses (
    programindicatorid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.programindicatoruseraccesses OWNER TO dhis;

--
-- Name: programindicatorusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorusergroupaccesses (
    programindicatorid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.programindicatorusergroupaccesses OWNER TO dhis;

--
-- Name: programinstance; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programinstance (
    programinstanceid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    createdatclient timestamp without time zone,
    lastupdatedatclient timestamp without time zone,
    incidentdate timestamp without time zone,
    enrollmentdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone,
    followup boolean,
    completedby character varying(255),
    longitude double precision,
    latitude double precision,
    deleted boolean NOT NULL,
    storedby character varying(255),
    status character varying(50),
    trackedentityinstanceid integer,
    programid integer NOT NULL,
    organisationunitid integer
);


ALTER TABLE public.programinstance OWNER TO dhis;

--
-- Name: programinstance_messageconversation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programinstance_messageconversation (
    programinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    messageconversationid integer NOT NULL
);


ALTER TABLE public.programinstance_messageconversation OWNER TO dhis;

--
-- Name: programinstancecomments; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programinstancecomments (
    programinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitycommentid integer NOT NULL
);


ALTER TABLE public.programinstancecomments OWNER TO dhis;

--
-- Name: programmessage; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programmessage (
    id integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    text character varying(500) NOT NULL,
    subject character varying(200),
    processeddate timestamp without time zone,
    messagestatus character varying(50),
    trackedentityinstanceid integer,
    organisationunitid integer,
    programinstanceid integer,
    programstageinstanceid integer
);


ALTER TABLE public.programmessage OWNER TO dhis;

--
-- Name: programmessage_deliverychannels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programmessage_deliverychannels (
    programmessagedeliverychannelsid integer NOT NULL,
    deliverychannel character varying(255)
);


ALTER TABLE public.programmessage_deliverychannels OWNER TO dhis;

--
-- Name: programmessage_emailaddresses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programmessage_emailaddresses (
    programmessageemailaddressid integer NOT NULL,
    email text
);


ALTER TABLE public.programmessage_emailaddresses OWNER TO dhis;

--
-- Name: programmessage_phonenumbers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programmessage_phonenumbers (
    programmessagephonenumberid integer NOT NULL,
    phonenumber text
);


ALTER TABLE public.programmessage_phonenumbers OWNER TO dhis;

--
-- Name: programmessagetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programmessagetranslations (
    id integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programmessagetranslations OWNER TO dhis;

--
-- Name: programnotificationtemplate; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programnotificationtemplate (
    programnotificationtemplateid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    relativescheduleddays integer,
    usergroupid integer,
    trackedentityattributeid integer,
    dataelementid integer,
    subjecttemplate character varying(100),
    messagetemplate text NOT NULL,
    notificationtrigger character varying(255),
    notificationrecipienttype character varying(255),
    programstageid integer,
    programid integer
);


ALTER TABLE public.programnotificationtemplate OWNER TO dhis;

--
-- Name: programnotificationtemplate_deliverychannel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programnotificationtemplate_deliverychannel (
    programnotificationtemplatedeliverychannelid integer NOT NULL,
    deliverychannel character varying(255)
);


ALTER TABLE public.programnotificationtemplate_deliverychannel OWNER TO dhis;

--
-- Name: programrule; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programrule (
    programruleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description character varying(255),
    programid integer NOT NULL,
    programstageid integer,
    rulecondition text,
    priority integer
);


ALTER TABLE public.programrule OWNER TO dhis;

--
-- Name: programruleaction; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programruleaction (
    programruleactionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    programruleid integer,
    actiontype character varying(255) NOT NULL,
    dataelementid integer,
    trackedentityattributeid integer,
    programindicatorid integer,
    programstagesectionid integer,
    programstageid integer,
    programnotificationtemplateid integer,
    location character varying(255),
    content text,
    data text
);


ALTER TABLE public.programruleaction OWNER TO dhis;

--
-- Name: programruletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programruletranslations (
    programruleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programruletranslations OWNER TO dhis;

--
-- Name: programrulevariable; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programrulevariable (
    programrulevariableid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    programid integer NOT NULL,
    sourcetype character varying(255) NOT NULL,
    trackedentityattributeid integer,
    dataelementid integer,
    usecodeforoptionset boolean,
    programstageid integer
);


ALTER TABLE public.programrulevariable OWNER TO dhis;

--
-- Name: programsection; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programsection (
    programsectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    formname text,
    style jsonb,
    rendertype jsonb,
    programid integer,
    sortorder integer NOT NULL
);


ALTER TABLE public.programsection OWNER TO dhis;

--
-- Name: programsection_attributes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programsection_attributes (
    programsectionid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributeid integer NOT NULL
);


ALTER TABLE public.programsection_attributes OWNER TO dhis;

--
-- Name: programsectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programsectiontranslations (
    programsectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programsectiontranslations OWNER TO dhis;

--
-- Name: programstage; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstage (
    programstageid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230),
    description text,
    formname text,
    mindaysfromstart integer NOT NULL,
    programid integer,
    repeatable boolean NOT NULL,
    dataentryformid integer,
    standardinterval integer,
    executiondatelabel character varying(255),
    duedatelabel character varying(255),
    autogenerateevent boolean,
    validcompleteonly boolean,
    displaygenerateeventbox boolean,
    capturecoordinates boolean,
    generatedbyenrollmentdate boolean,
    blockentryform boolean,
    remindcompleted boolean,
    allowgeneratenextvisit boolean,
    openafterenrollment boolean,
    reportdatetouse character varying(255),
    pregenerateuid boolean,
    style jsonb,
    hideduedate boolean,
    sort_order integer,
    periodtypeid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.programstage OWNER TO dhis;

--
-- Name: programstageattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstageattributevalues (
    programstageid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.programstageattributevalues OWNER TO dhis;

--
-- Name: programstagedataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagedataelement (
    programstagedataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    programstageid integer,
    dataelementid integer,
    compulsory boolean NOT NULL,
    allowprovidedelsewhere boolean,
    sort_order integer,
    displayinreports boolean,
    allowfuturedate boolean,
    renderoptionsasradio boolean,
    rendertype jsonb
);


ALTER TABLE public.programstagedataelement OWNER TO dhis;

--
-- Name: programstageinstance; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstageinstance (
    programstageinstanceid integer NOT NULL,
    uid character varying(11),
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    createdatclient timestamp without time zone,
    lastupdatedatclient timestamp without time zone,
    programinstanceid integer NOT NULL,
    programstageid integer NOT NULL,
    attributeoptioncomboid integer,
    deleted boolean NOT NULL,
    storedby character varying(255),
    duedate timestamp without time zone,
    executiondate timestamp without time zone,
    organisationunitid integer,
    status character varying(25) NOT NULL,
    longitude double precision,
    latitude double precision,
    completedby character varying(255),
    completeddate timestamp without time zone
);


ALTER TABLE public.programstageinstance OWNER TO dhis;

--
-- Name: programstageinstance_messageconversation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstageinstance_messageconversation (
    programstageinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    messageconversationid integer NOT NULL
);


ALTER TABLE public.programstageinstance_messageconversation OWNER TO dhis;

--
-- Name: programstageinstancecomments; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstageinstancecomments (
    programstageinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitycommentid integer NOT NULL
);


ALTER TABLE public.programstageinstancecomments OWNER TO dhis;

--
-- Name: programstagesection; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagesection (
    programstagesectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    formname text,
    style jsonb,
    rendertype jsonb,
    programstageid integer,
    sortorder integer NOT NULL
);


ALTER TABLE public.programstagesection OWNER TO dhis;

--
-- Name: programstagesection_dataelements; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagesection_dataelements (
    programstagesectionid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE public.programstagesection_dataelements OWNER TO dhis;

--
-- Name: programstagesection_programindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagesection_programindicators (
    programstagesectionid integer NOT NULL,
    sort_order integer NOT NULL,
    programindicatorid integer NOT NULL
);


ALTER TABLE public.programstagesection_programindicators OWNER TO dhis;

--
-- Name: programstagesectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagesectiontranslations (
    programstagesectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programstagesectiontranslations OWNER TO dhis;

--
-- Name: programstagetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagetranslations (
    programstageid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programstagetranslations OWNER TO dhis;

--
-- Name: programstageuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstageuseraccesses (
    programstageid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.programstageuseraccesses OWNER TO dhis;

--
-- Name: programstageusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstageusergroupaccesses (
    programid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.programstageusergroupaccesses OWNER TO dhis;

--
-- Name: programtrackedentityattributegroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programtrackedentityattributegroupmembers (
    programtrackedentityattributegroupid integer NOT NULL,
    programtrackedentityattributeid integer NOT NULL
);


ALTER TABLE public.programtrackedentityattributegroupmembers OWNER TO dhis;

--
-- Name: programtrackedentityattributegrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programtrackedentityattributegrouptranslations (
    programtrackedentityattributegroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programtrackedentityattributegrouptranslations OWNER TO dhis;

--
-- Name: programtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programtranslations (
    programid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.programtranslations OWNER TO dhis;

--
-- Name: programuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programuseraccesses (
    programid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.programuseraccesses OWNER TO dhis;

--
-- Name: programusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programusergroupaccesses (
    programid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.programusergroupaccesses OWNER TO dhis;

--
-- Name: pushanalysis; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.pushanalysis (
    pushanalysisid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(255) NOT NULL,
    title character varying(255),
    message text,
    enabled boolean NOT NULL,
    schedulingdayoffrequency integer,
    schedulingfrequency bytea,
    dashboard integer NOT NULL
);


ALTER TABLE public.pushanalysis OWNER TO dhis;

--
-- Name: pushanalysisrecipientusergroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.pushanalysisrecipientusergroups (
    usergroupid integer NOT NULL,
    elt integer NOT NULL
);


ALTER TABLE public.pushanalysisrecipientusergroups OWNER TO dhis;

--
-- Name: relationship; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.relationship (
    relationshipid integer NOT NULL,
    formname text,
    description text,
    style jsonb,
    trackedentityinstanceaid integer NOT NULL,
    relationshiptypeid integer NOT NULL,
    trackedentityinstancebid integer NOT NULL
);


ALTER TABLE public.relationship OWNER TO dhis;

--
-- Name: relationshiptype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.relationshiptype (
    relationshiptypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    a_is_to_b character varying(255) NOT NULL,
    b_is_to_a character varying(255) NOT NULL
);


ALTER TABLE public.relationshiptype OWNER TO dhis;

--
-- Name: relationshiptypetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.relationshiptypetranslations (
    relationshiptypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.relationshiptypetranslations OWNER TO dhis;

--
-- Name: relativeperiods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.relativeperiods (
    relativeperiodsid integer NOT NULL,
    thisday boolean NOT NULL,
    yesterday boolean NOT NULL,
    last3days boolean NOT NULL,
    last7days boolean NOT NULL,
    last14days boolean NOT NULL,
    thismonth boolean NOT NULL,
    lastmonth boolean NOT NULL,
    thisbimonth boolean NOT NULL,
    lastbimonth boolean NOT NULL,
    thisquarter boolean NOT NULL,
    lastquarter boolean NOT NULL,
    thissixmonth boolean NOT NULL,
    lastsixmonth boolean NOT NULL,
    weeksthisyear boolean,
    monthsthisyear boolean NOT NULL,
    bimonthsthisyear boolean,
    quartersthisyear boolean NOT NULL,
    thisyear boolean NOT NULL,
    monthslastyear boolean NOT NULL,
    quarterslastyear boolean NOT NULL,
    lastyear boolean NOT NULL,
    last5years boolean NOT NULL,
    last12months boolean NOT NULL,
    last6months boolean NOT NULL,
    last3months boolean NOT NULL,
    last6bimonths boolean NOT NULL,
    last4quarters boolean NOT NULL,
    last2sixmonths boolean NOT NULL,
    thisfinancialyear boolean NOT NULL,
    lastfinancialyear boolean NOT NULL,
    last5financialyears boolean NOT NULL,
    thisweek boolean NOT NULL,
    lastweek boolean NOT NULL,
    thisbiweek boolean,
    lastbiweek boolean,
    last4weeks boolean NOT NULL,
    last4biweeks boolean,
    last12weeks boolean NOT NULL,
    last52weeks boolean NOT NULL
);


ALTER TABLE public.relativeperiods OWNER TO dhis;

--
-- Name: report; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.report (
    reportid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    type character varying(50),
    designcontent text,
    reporttableid integer,
    relativeperiodsid integer,
    paramreportingmonth boolean,
    paramorganisationunit boolean,
    cachestrategy character varying(40),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.report OWNER TO dhis;

--
-- Name: reporttable; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable (
    reporttableid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    measurecriteria character varying(255),
    regression boolean,
    cumulative boolean,
    relativeperiodsid integer,
    paramreportingmonth boolean,
    paramgrandparentorganisationunit boolean,
    paramparentorganisationunit boolean,
    paramorganisationunit boolean,
    sortorder integer,
    toplimit integer,
    rowtotals boolean,
    coltotals boolean,
    rowsubtotals boolean,
    colsubtotals boolean,
    hideemptyrows boolean,
    hideemptycolumns boolean,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    subtitle character varying(255),
    hidetitle boolean,
    hidesubtitle boolean,
    digitgroupseparator character varying(40),
    displaydensity character varying(40),
    fontsize character varying(40),
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    legendsetid integer,
    legenddisplaystyle character varying(40),
    legenddisplaystrategy character varying(40),
    numbertype character varying(40),
    showhierarchy boolean,
    showdimensionlabels boolean,
    skiprounding boolean,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8),
    favorites jsonb
);


ALTER TABLE public.reporttable OWNER TO dhis;

--
-- Name: reporttable_categorydimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_categorydimensions (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


ALTER TABLE public.reporttable_categorydimensions OWNER TO dhis;

--
-- Name: reporttable_categoryoptiongroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_categoryoptiongroupsetdimensions (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.reporttable_categoryoptiongroupsetdimensions OWNER TO dhis;

--
-- Name: reporttable_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_columns (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.reporttable_columns OWNER TO dhis;

--
-- Name: reporttable_datadimensionitems; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_datadimensionitems (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


ALTER TABLE public.reporttable_datadimensionitems OWNER TO dhis;

--
-- Name: reporttable_dataelementgroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_dataelementgroupsetdimensions (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.reporttable_dataelementgroupsetdimensions OWNER TO dhis;

--
-- Name: reporttable_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_filters (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.reporttable_filters OWNER TO dhis;

--
-- Name: reporttable_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_itemorgunitgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE public.reporttable_itemorgunitgroups OWNER TO dhis;

--
-- Name: reporttable_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_organisationunits (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.reporttable_organisationunits OWNER TO dhis;

--
-- Name: reporttable_orgunitgroupsetdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_orgunitgroupsetdimensions (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupsetdimensionid integer NOT NULL
);


ALTER TABLE public.reporttable_orgunitgroupsetdimensions OWNER TO dhis;

--
-- Name: reporttable_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_orgunitlevels (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE public.reporttable_orgunitlevels OWNER TO dhis;

--
-- Name: reporttable_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_periods (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE public.reporttable_periods OWNER TO dhis;

--
-- Name: reporttable_rows; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttable_rows (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE public.reporttable_rows OWNER TO dhis;

--
-- Name: reporttabletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttabletranslations (
    reporttableid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.reporttabletranslations OWNER TO dhis;

--
-- Name: reporttableuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttableuseraccesses (
    reporttableid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.reporttableuseraccesses OWNER TO dhis;

--
-- Name: reporttableusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttableusergroupaccesses (
    reporttableid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.reporttableusergroupaccesses OWNER TO dhis;

--
-- Name: reporttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttranslations (
    reportid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.reporttranslations OWNER TO dhis;

--
-- Name: reportuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reportuseraccesses (
    reportid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.reportuseraccesses OWNER TO dhis;

--
-- Name: reportusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reportusergroupaccesses (
    reportid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.reportusergroupaccesses OWNER TO dhis;

--
-- Name: reservedvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reservedvalue (
    reservedvalueid integer NOT NULL,
    expirydate timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    ownerobject character varying(255),
    owneruid character varying(255),
    key character varying(255),
    value character varying(255)
);


ALTER TABLE public.reservedvalue OWNER TO dhis;

--
-- Name: section; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.section (
    sectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    datasetid integer NOT NULL,
    sortorder integer NOT NULL,
    showrowtotals boolean,
    showcolumntotals boolean
);


ALTER TABLE public.section OWNER TO dhis;

--
-- Name: sectionattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sectionattributevalues (
    sectionid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.sectionattributevalues OWNER TO dhis;

--
-- Name: sectiondataelements; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sectiondataelements (
    sectionid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE public.sectiondataelements OWNER TO dhis;

--
-- Name: sectiongreyedfields; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sectiongreyedfields (
    sectionid integer NOT NULL,
    dataelementoperandid integer NOT NULL
);


ALTER TABLE public.sectiongreyedfields OWNER TO dhis;

--
-- Name: sectionindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sectionindicators (
    sectionid integer NOT NULL,
    sort_order integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE public.sectionindicators OWNER TO dhis;

--
-- Name: sequentialnumbercounter; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sequentialnumbercounter (
    id integer NOT NULL,
    owneruid character varying(255),
    key character varying(255),
    counter integer
);


ALTER TABLE public.sequentialnumbercounter OWNER TO dhis;

--
-- Name: smscodes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.smscodes (
    smscodeid integer NOT NULL,
    code character varying(255),
    formula text,
    compulsory boolean,
    dataelementid integer,
    trackedentityattributeid integer,
    optionid integer
);


ALTER TABLE public.smscodes OWNER TO dhis;

--
-- Name: smscommandcodes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.smscommandcodes (
    id integer NOT NULL,
    codeid integer NOT NULL
);


ALTER TABLE public.smscommandcodes OWNER TO dhis;

--
-- Name: smscommands; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.smscommands (
    smscommandid integer NOT NULL,
    uid character varying(11) NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name text,
    parsertype integer,
    separatorkey text,
    codeseparator text,
    defaultmessage text,
    receivedmessage text,
    wrongformatmessage text,
    nousermessage text,
    morethanoneorgunitmessage text,
    successmessage text,
    currentperiodusedforreporting boolean,
    completenessmethod text,
    datasetid integer,
    usergroupid integer,
    programid integer,
    programstageid integer
);


ALTER TABLE public.smscommands OWNER TO dhis;

--
-- Name: smscommandspecialcharacters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.smscommandspecialcharacters (
    smscommandid integer NOT NULL,
    specialcharacterid integer NOT NULL
);


ALTER TABLE public.smscommandspecialcharacters OWNER TO dhis;

--
-- Name: smsspecialcharacter; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.smsspecialcharacter (
    specialcharacterid integer NOT NULL,
    name text,
    value text
);


ALTER TABLE public.smsspecialcharacter OWNER TO dhis;

--
-- Name: sqlview; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sqlview (
    sqlviewid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    sqlquery text NOT NULL,
    type character varying(40),
    cachestrategy character varying(40),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.sqlview OWNER TO dhis;

--
-- Name: sqlviewattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sqlviewattributevalues (
    sqlviewid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.sqlviewattributevalues OWNER TO dhis;

--
-- Name: sqlviewuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sqlviewuseraccesses (
    sqlviewid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.sqlviewuseraccesses OWNER TO dhis;

--
-- Name: sqlviewusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.sqlviewusergroupaccesses (
    sqlviewid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.sqlviewusergroupaccesses OWNER TO dhis;

--
-- Name: systemsetting; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.systemsetting (
    systemsettingid integer NOT NULL,
    name character varying(255) NOT NULL,
    value bytea
);


ALTER TABLE public.systemsetting OWNER TO dhis;

--
-- Name: tablehook; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.tablehook (
    analyticstablehookid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(255) NOT NULL,
    analyticstablephase character varying(50) NOT NULL,
    resourcetabletype character varying(50),
    analyticstabletype character varying(50),
    sql text NOT NULL
);


ALTER TABLE public.tablehook OWNER TO dhis;

--
-- Name: trackedentityattribute; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattribute (
    trackedentityattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    formname text,
    valuetype character varying(36) NOT NULL,
    aggregationtype character varying(40) NOT NULL,
    optionsetid integer,
    inherit boolean,
    expression character varying(255),
    displayonvisitschedule boolean,
    sortorderinvisitschedule integer,
    displayinlistnoprogram boolean,
    sortorderinlistnoprogram integer,
    confidential boolean,
    uniquefield boolean,
    generated boolean,
    pattern character varying(255),
    textpattern jsonb,
    style jsonb,
    orgunitscope boolean,
    programscope boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.trackedentityattribute OWNER TO dhis;

--
-- Name: trackedentityattributeattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributeattributevalues (
    trackedentityattributeid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.trackedentityattributeattributevalues OWNER TO dhis;

--
-- Name: trackedentityattributedimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributedimension (
    trackedentityattributedimensionid integer NOT NULL,
    trackedentityattributeid integer,
    legendsetid integer,
    filter text
);


ALTER TABLE public.trackedentityattributedimension OWNER TO dhis;

--
-- Name: trackedentityattributelegendsets; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributelegendsets (
    trackedentityattributeid integer NOT NULL,
    sort_order integer NOT NULL,
    legendsetid integer NOT NULL
);


ALTER TABLE public.trackedentityattributelegendsets OWNER TO dhis;

--
-- Name: trackedentityattributetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributetranslations (
    trackedentityattributeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.trackedentityattributetranslations OWNER TO dhis;

--
-- Name: trackedentityattributeuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributeuseraccesses (
    trackedentityattributeid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.trackedentityattributeuseraccesses OWNER TO dhis;

--
-- Name: trackedentityattributeusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributeusergroupaccesses (
    trackedentityattributeid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.trackedentityattributeusergroupaccesses OWNER TO dhis;

--
-- Name: trackedentityattributevalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributevalue (
    trackedentityinstanceid integer NOT NULL,
    trackedentityattributeid integer NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    value character varying(50000),
    encryptedvalue character varying(50000),
    storedby character varying(255)
);


ALTER TABLE public.trackedentityattributevalue OWNER TO dhis;

--
-- Name: trackedentityattributevalueaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributevalueaudit (
    trackedentityattributevalueauditid integer NOT NULL,
    trackedentityinstanceid integer,
    trackedentityattributeid integer,
    value character varying(50000),
    encryptedvalue character varying(50000),
    created timestamp without time zone,
    modifiedby character varying(255),
    audittype character varying(100) NOT NULL
);


ALTER TABLE public.trackedentityattributevalueaudit OWNER TO dhis;

--
-- Name: trackedentitycomment; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitycomment (
    trackedentitycommentid integer NOT NULL,
    commenttext text,
    createddate timestamp without time zone,
    creator character varying(255)
);


ALTER TABLE public.trackedentitycomment OWNER TO dhis;

--
-- Name: trackedentitydataelementdimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitydataelementdimension (
    trackedentitydataelementdimensionid integer NOT NULL,
    dataelementid integer,
    legendsetid integer,
    filter text
);


ALTER TABLE public.trackedentitydataelementdimension OWNER TO dhis;

--
-- Name: trackedentitydatavalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitydatavalue (
    programstageinstanceid integer NOT NULL,
    dataelementid integer NOT NULL,
    value character varying(50000),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    providedelsewhere boolean,
    storedby character varying(255)
);


ALTER TABLE public.trackedentitydatavalue OWNER TO dhis;

--
-- Name: trackedentitydatavalueaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitydatavalueaudit (
    trackedentitydatavalueauditid integer NOT NULL,
    programstageinstanceid integer,
    dataelementid integer,
    value character varying(50000),
    created timestamp without time zone,
    providedelsewhere boolean,
    modifiedby character varying(255),
    audittype character varying(100) NOT NULL
);


ALTER TABLE public.trackedentitydatavalueaudit OWNER TO dhis;

--
-- Name: trackedentityinstance; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityinstance (
    trackedentityinstanceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    createdatclient timestamp without time zone,
    lastupdatedatclient timestamp without time zone,
    inactive boolean,
    deleted boolean NOT NULL,
    featuretype character varying(50),
    coordinates text,
    representativeid integer,
    organisationunitid integer NOT NULL,
    trackedentitytypeid integer
);


ALTER TABLE public.trackedentityinstance OWNER TO dhis;

--
-- Name: trackedentityinstancefilter; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityinstancefilter (
    trackedentityinstancefilterid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description character varying(255),
    sortorder integer,
    style jsonb,
    programid integer NOT NULL,
    enrollmentstatus character varying(50),
    followup boolean,
    enrollmentcreatedperiod jsonb,
    eventfilters jsonb
);


ALTER TABLE public.trackedentityinstancefilter OWNER TO dhis;

--
-- Name: trackedentityprogramindicatordimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityprogramindicatordimension (
    trackedentityprogramindicatordimensionid integer NOT NULL,
    programindicatorid integer,
    legendsetid integer,
    filter text
);


ALTER TABLE public.trackedentityprogramindicatordimension OWNER TO dhis;

--
-- Name: trackedentitytranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytranslations (
    trackedentitytypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.trackedentitytranslations OWNER TO dhis;

--
-- Name: trackedentitytype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytype (
    trackedentitytypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    formname text,
    style jsonb,
    minattributesrequiredtosearch integer,
    maxteicounttoreturn integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.trackedentitytype OWNER TO dhis;

--
-- Name: trackedentitytypeattribute; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytypeattribute (
    trackedentitytypeattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    trackedentitytypeid integer,
    trackedentityattributeid integer,
    displayinlist boolean,
    mandatory boolean,
    searchable boolean,
    sort_order integer
);


ALTER TABLE public.trackedentitytypeattribute OWNER TO dhis;

--
-- Name: trackedentitytypeattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytypeattributevalues (
    trackedentitytypeid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.trackedentitytypeattributevalues OWNER TO dhis;

--
-- Name: trackedentitytypeuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytypeuseraccesses (
    trackedentitytypeid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.trackedentitytypeuseraccesses OWNER TO dhis;

--
-- Name: trackedentitytypeusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytypeusergroupaccesses (
    trackedentitytypeid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.trackedentitytypeusergroupaccesses OWNER TO dhis;

--
-- Name: useraccess; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.useraccess (
    useraccessid integer NOT NULL,
    access character varying(255),
    userid integer
);


ALTER TABLE public.useraccess OWNER TO dhis;

--
-- Name: userapps; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userapps (
    userinfoid integer NOT NULL,
    sort_order integer NOT NULL,
    app character varying(255)
);


ALTER TABLE public.userapps OWNER TO dhis;

--
-- Name: userattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userattributevalues (
    userinfoid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.userattributevalues OWNER TO dhis;

--
-- Name: userdatavieworgunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userdatavieworgunits (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.userdatavieworgunits OWNER TO dhis;

--
-- Name: usergroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroup (
    usergroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.usergroup OWNER TO dhis;

--
-- Name: usergroupaccess; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroupaccess (
    usergroupaccessid integer NOT NULL,
    access character varying(255),
    usergroupid integer
);


ALTER TABLE public.usergroupaccess OWNER TO dhis;

--
-- Name: usergroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroupattributevalues (
    usergroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.usergroupattributevalues OWNER TO dhis;

--
-- Name: usergroupmanaged; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroupmanaged (
    managedbygroupid integer NOT NULL,
    managedgroupid integer NOT NULL
);


ALTER TABLE public.usergroupmanaged OWNER TO dhis;

--
-- Name: usergroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroupmembers (
    userid integer NOT NULL,
    usergroupid integer NOT NULL
);


ALTER TABLE public.usergroupmembers OWNER TO dhis;

--
-- Name: usergrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergrouptranslations (
    usergroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.usergrouptranslations OWNER TO dhis;

--
-- Name: usergroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroupuseraccesses (
    usergroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.usergroupuseraccesses OWNER TO dhis;

--
-- Name: usergroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergroupusergroupaccesses (
    usergroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.usergroupusergroupaccesses OWNER TO dhis;

--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userinfo (
    userinfoid integer NOT NULL,
    uid character varying(11),
    code character varying(50),
    lastupdated timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    surname character varying(160) NOT NULL,
    firstname character varying(160) NOT NULL,
    email character varying(160),
    phonenumber character varying(80),
    jobtitle character varying(160),
    introduction text,
    gender character varying(50),
    birthday date,
    nationality character varying(160),
    employer character varying(160),
    education text,
    interests text,
    languages text,
    lastcheckedinterpretations timestamp without time zone
);


ALTER TABLE public.userinfo OWNER TO dhis;

--
-- Name: userkeyjsonvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userkeyjsonvalue (
    userkeyjsonvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    userid integer NOT NULL,
    namespace character varying(255) NOT NULL,
    userkey character varying(255) NOT NULL,
    value text,
    encrypted_value character varying(255),
    encrypted boolean
);


ALTER TABLE public.userkeyjsonvalue OWNER TO dhis;

--
-- Name: usermembership; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usermembership (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.usermembership OWNER TO dhis;

--
-- Name: usermessage; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usermessage (
    usermessageid integer NOT NULL,
    usermessagekey character varying(255),
    userid integer NOT NULL,
    isread boolean NOT NULL,
    isfollowup boolean
);


ALTER TABLE public.usermessage OWNER TO dhis;

--
-- Name: userrole; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userrole (
    userroleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.userrole OWNER TO dhis;

--
-- Name: userroleauthorities; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userroleauthorities (
    userroleid integer NOT NULL,
    authority character varying(255)
);


ALTER TABLE public.userroleauthorities OWNER TO dhis;

--
-- Name: userrolemembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userrolemembers (
    userid integer NOT NULL,
    userroleid integer NOT NULL
);


ALTER TABLE public.userrolemembers OWNER TO dhis;

--
-- Name: userroletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userroletranslations (
    userroleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.userroletranslations OWNER TO dhis;

--
-- Name: userroleuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userroleuseraccesses (
    userroleid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.userroleuseraccesses OWNER TO dhis;

--
-- Name: userroleusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userroleusergroupaccesses (
    userroleid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.userroleusergroupaccesses OWNER TO dhis;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    creatoruserid integer,
    username character varying(255) NOT NULL,
    password character varying(60),
    externalauth boolean,
    openid text,
    ldapid text,
    passwordlastupdated timestamp without time zone,
    lastlogin timestamp without time zone,
    restoretoken character varying(255),
    restorecode character varying(255),
    restoreexpiry timestamp without time zone,
    selfregistered boolean,
    invitation boolean,
    disabled boolean
);


ALTER TABLE public.users OWNER TO dhis;

--
-- Name: users_catdimensionconstraints; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.users_catdimensionconstraints (
    userid integer NOT NULL,
    dataelementcategoryid integer NOT NULL
);


ALTER TABLE public.users_catdimensionconstraints OWNER TO dhis;

--
-- Name: users_cogsdimensionconstraints; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.users_cogsdimensionconstraints (
    userid integer NOT NULL,
    categoryoptiongroupsetid integer NOT NULL
);


ALTER TABLE public.users_cogsdimensionconstraints OWNER TO dhis;

--
-- Name: usersetting; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usersetting (
    userinfoid integer NOT NULL,
    name character varying(255) NOT NULL,
    value bytea
);


ALTER TABLE public.usersetting OWNER TO dhis;

--
-- Name: userteisearchorgunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userteisearchorgunits (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE public.userteisearchorgunits OWNER TO dhis;

--
-- Name: validationcriteria; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationcriteria (
    validationcriteriaid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description character varying(255),
    property character varying(255),
    operator integer NOT NULL,
    value bytea
);


ALTER TABLE public.validationcriteria OWNER TO dhis;

--
-- Name: validationcriteriatranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationcriteriatranslations (
    validationcriteriaid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.validationcriteriatranslations OWNER TO dhis;

--
-- Name: validationnotificationtemplate; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationnotificationtemplate (
    validationnotificationtemplateid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    subjecttemplate character varying(100),
    messagetemplate text,
    notifyusersinhierarchyonly boolean,
    sendstrategy character varying(50) NOT NULL
);


ALTER TABLE public.validationnotificationtemplate OWNER TO dhis;

--
-- Name: validationnotificationtemplate_recipientusergroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationnotificationtemplate_recipientusergroups (
    validationnotificationtemplateid integer NOT NULL,
    usergroupid integer NOT NULL
);


ALTER TABLE public.validationnotificationtemplate_recipientusergroups OWNER TO dhis;

--
-- Name: validationnotificationtemplatevalidationrules; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationnotificationtemplatevalidationrules (
    validationnotificationtemplateid integer NOT NULL,
    validationruleid integer NOT NULL
);


ALTER TABLE public.validationnotificationtemplatevalidationrules OWNER TO dhis;

--
-- Name: validationresult; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationresult (
    validationresultid integer NOT NULL,
    created timestamp without time zone NOT NULL,
    leftsidevalue double precision,
    rightsidevalue double precision,
    validationruleid integer,
    periodid integer,
    organisationunitid integer,
    attributeoptioncomboid integer,
    dayinperiod integer,
    notificationsent boolean
);


ALTER TABLE public.validationresult OWNER TO dhis;

--
-- Name: validationrule; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrule (
    validationruleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    instruction text,
    importance character varying(50),
    operator character varying(255) NOT NULL,
    leftexpressionid integer NOT NULL,
    rightexpressionid integer NOT NULL,
    skipformvalidation boolean,
    periodtypeid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.validationrule OWNER TO dhis;

--
-- Name: validationruleattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationruleattributevalues (
    validationruleid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.validationruleattributevalues OWNER TO dhis;

--
-- Name: validationrulegroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrulegroup (
    validationrulegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    description text,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE public.validationrulegroup OWNER TO dhis;

--
-- Name: validationrulegroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrulegroupattributevalues (
    validationrulegroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE public.validationrulegroupattributevalues OWNER TO dhis;

--
-- Name: validationrulegroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrulegroupmembers (
    validationgroupid integer NOT NULL,
    validationruleid integer NOT NULL
);


ALTER TABLE public.validationrulegroupmembers OWNER TO dhis;

--
-- Name: validationrulegrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrulegrouptranslations (
    validationrulegroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.validationrulegrouptranslations OWNER TO dhis;

--
-- Name: validationrulegroupuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrulegroupuseraccesses (
    validationrulegroupid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.validationrulegroupuseraccesses OWNER TO dhis;

--
-- Name: validationrulegroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationrulegroupusergroupaccesses (
    validationrulegroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.validationrulegroupusergroupaccesses OWNER TO dhis;

--
-- Name: validationruleorganisationunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationruleorganisationunitlevels (
    validationruleid integer NOT NULL,
    organisationunitlevel integer
);


ALTER TABLE public.validationruleorganisationunitlevels OWNER TO dhis;

--
-- Name: validationruletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationruletranslations (
    validationruleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE public.validationruletranslations OWNER TO dhis;

--
-- Name: validationruleuseraccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationruleuseraccesses (
    validationruleid integer NOT NULL,
    useraccessid integer NOT NULL
);


ALTER TABLE public.validationruleuseraccesses OWNER TO dhis;

--
-- Name: validationruleusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationruleusergroupaccesses (
    validationruleid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE public.validationruleusergroupaccesses OWNER TO dhis;

--
-- Name: version; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.version (
    versionid integer NOT NULL,
    versionkey character varying(230) NOT NULL,
    versionvalue character varying(255)
);


ALTER TABLE public.version OWNER TO dhis;

--
-- Name: analyticsperiodboundary analyticsperiodboundary_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.analyticsperiodboundary
    ADD CONSTRAINT analyticsperiodboundary_pkey PRIMARY KEY (analyticsperiodboundaryid);


--
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (attributeid);


--
-- Name: attributetranslations attributetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributetranslations
    ADD CONSTRAINT attributetranslations_pkey PRIMARY KEY (attributeid, objecttranslationid);


--
-- Name: attributeuseraccesses attributeuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeuseraccesses
    ADD CONSTRAINT attributeuseraccesses_pkey PRIMARY KEY (attributeid, useraccessid);


--
-- Name: attributeusergroupaccesses attributeusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeusergroupaccesses
    ADD CONSTRAINT attributeusergroupaccesses_pkey PRIMARY KEY (attributeid, usergroupaccessid);


--
-- Name: attributevalue attributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributevalue
    ADD CONSTRAINT attributevalue_pkey PRIMARY KEY (attributevalueid);


--
-- Name: categories_categoryoptions categories_categoryoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categories_categoryoptions
    ADD CONSTRAINT categories_categoryoptions_pkey PRIMARY KEY (categoryid, sort_order);


--
-- Name: categoryattributevalues categoryattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryattributevalues
    ADD CONSTRAINT categoryattributevalues_pkey PRIMARY KEY (categoryid, attributevalueid);


--
-- Name: categorycombo categorycombo_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombo
    ADD CONSTRAINT categorycombo_pkey PRIMARY KEY (categorycomboid);


--
-- Name: categorycombos_categories categorycombos_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombos_categories
    ADD CONSTRAINT categorycombos_categories_pkey PRIMARY KEY (categorycomboid, sort_order);


--
-- Name: categorycombos_optioncombos categorycombos_optioncombos_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombos_optioncombos
    ADD CONSTRAINT categorycombos_optioncombos_pkey PRIMARY KEY (categoryoptioncomboid);


--
-- Name: categorycombotranslations categorycombotranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombotranslations
    ADD CONSTRAINT categorycombotranslations_pkey PRIMARY KEY (categorycomboid, objecttranslationid);


--
-- Name: categorycombouseraccesses categorycombouseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombouseraccesses
    ADD CONSTRAINT categorycombouseraccesses_pkey PRIMARY KEY (categorycomboid, useraccessid);


--
-- Name: categorycombousergroupaccesses categorycombousergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombousergroupaccesses
    ADD CONSTRAINT categorycombousergroupaccesses_pkey PRIMARY KEY (categorycomboid, usergroupaccessid);


--
-- Name: categorydimension_items categorydimension_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorydimension_items
    ADD CONSTRAINT categorydimension_items_pkey PRIMARY KEY (categorydimensionid, sort_order);


--
-- Name: categorydimension categorydimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorydimension
    ADD CONSTRAINT categorydimension_pkey PRIMARY KEY (categorydimensionid);


--
-- Name: categoryoption_organisationunits categoryoption_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoption_organisationunits
    ADD CONSTRAINT categoryoption_organisationunits_pkey PRIMARY KEY (categoryoptionid, organisationunitid);


--
-- Name: categoryoptioncombo categoryoptioncombo_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombo
    ADD CONSTRAINT categoryoptioncombo_pkey PRIMARY KEY (categoryoptioncomboid);


--
-- Name: categoryoptioncomboattributevalues categoryoptioncomboattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncomboattributevalues
    ADD CONSTRAINT categoryoptioncomboattributevalues_pkey PRIMARY KEY (categoryoptioncomboid, attributevalueid);


--
-- Name: categoryoptioncombos_categoryoptions categoryoptioncombos_categoryoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombos_categoryoptions
    ADD CONSTRAINT categoryoptioncombos_categoryoptions_pkey PRIMARY KEY (categoryoptioncomboid, categoryoptionid);


--
-- Name: categoryoptioncombotranslations categoryoptioncombotranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombotranslations
    ADD CONSTRAINT categoryoptioncombotranslations_pkey PRIMARY KEY (categoryoptioncomboid, objecttranslationid);


--
-- Name: categoryoptiongroup categoryoptiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT categoryoptiongroup_pkey PRIMARY KEY (categoryoptiongroupid);


--
-- Name: categoryoptiongroupattributevalues categoryoptiongroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupattributevalues
    ADD CONSTRAINT categoryoptiongroupattributevalues_pkey PRIMARY KEY (categoryoptiongroupid, attributevalueid);


--
-- Name: categoryoptiongroupmembers categoryoptiongroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupmembers
    ADD CONSTRAINT categoryoptiongroupmembers_pkey PRIMARY KEY (categoryoptiongroupid, categoryoptionid);


--
-- Name: categoryoptiongroupset categoryoptiongroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupset
    ADD CONSTRAINT categoryoptiongroupset_pkey PRIMARY KEY (categoryoptiongroupsetid);


--
-- Name: categoryoptiongroupsetattributevalues categoryoptiongroupsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetattributevalues
    ADD CONSTRAINT categoryoptiongroupsetattributevalues_pkey PRIMARY KEY (categoryoptiongroupsetid, attributevalueid);


--
-- Name: categoryoptiongroupsetdimension_items categoryoptiongroupsetdimension_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetdimension_items
    ADD CONSTRAINT categoryoptiongroupsetdimension_items_pkey PRIMARY KEY (categoryoptiongroupsetdimensionid, sort_order);


--
-- Name: categoryoptiongroupsetdimension categoryoptiongroupsetdimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetdimension
    ADD CONSTRAINT categoryoptiongroupsetdimension_pkey PRIMARY KEY (categoryoptiongroupsetdimensionid);


--
-- Name: categoryoptiongroupsetmembers categoryoptiongroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetmembers
    ADD CONSTRAINT categoryoptiongroupsetmembers_pkey PRIMARY KEY (categoryoptiongroupsetid, sort_order);


--
-- Name: categoryoptiongroupsettranslations categoryoptiongroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsettranslations
    ADD CONSTRAINT categoryoptiongroupsettranslations_pkey PRIMARY KEY (categoryoptiongroupsetid, objecttranslationid);


--
-- Name: categoryoptiongroupsetuseraccesses categoryoptiongroupsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetuseraccesses
    ADD CONSTRAINT categoryoptiongroupsetuseraccesses_pkey PRIMARY KEY (categoryoptiongroupsetid, useraccessid);


--
-- Name: categoryoptiongroupsetusergroupaccesses categoryoptiongroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT categoryoptiongroupsetusergroupaccesses_pkey PRIMARY KEY (categoryoptiongroupsetid, usergroupaccessid);


--
-- Name: categoryoptiongrouptranslations categoryoptiongrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongrouptranslations
    ADD CONSTRAINT categoryoptiongrouptranslations_pkey PRIMARY KEY (categoryoptiongroupid, objecttranslationid);


--
-- Name: categoryoptiongroupuseraccesses categoryoptiongroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupuseraccesses
    ADD CONSTRAINT categoryoptiongroupuseraccesses_pkey PRIMARY KEY (categoryoptiongroupid, useraccessid);


--
-- Name: categoryoptiongroupusergroupaccesses categoryoptiongroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT categoryoptiongroupusergroupaccesses_pkey PRIMARY KEY (categoryoptiongroupid, usergroupaccessid);


--
-- Name: categoryoptiontranslations categoryoptiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiontranslations
    ADD CONSTRAINT categoryoptiontranslations_pkey PRIMARY KEY (categoryoptionid, objecttranslationid);


--
-- Name: chart_categorydimensions chart_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_categorydimensions
    ADD CONSTRAINT chart_categorydimensions_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_categoryoptiongroupsetdimensions chart_categoryoptiongroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_categoryoptiongroupsetdimensions
    ADD CONSTRAINT chart_categoryoptiongroupsetdimensions_pkey PRIMARY KEY (chart, sort_order);


--
-- Name: chart_datadimensionitems chart_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_datadimensionitems
    ADD CONSTRAINT chart_datadimensionitems_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_dataelementgroupsetdimensions chart_dataelementgroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_dataelementgroupsetdimensions
    ADD CONSTRAINT chart_dataelementgroupsetdimensions_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_filters chart_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_filters
    ADD CONSTRAINT chart_filters_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_itemorgunitgroups chart_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_itemorgunitgroups
    ADD CONSTRAINT chart_itemorgunitgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_organisationunits chart_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_organisationunits
    ADD CONSTRAINT chart_organisationunits_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_orgunitgroupsetdimensions chart_orgunitgroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_orgunitgroupsetdimensions
    ADD CONSTRAINT chart_orgunitgroupsetdimensions_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_orgunitlevels chart_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_orgunitlevels
    ADD CONSTRAINT chart_orgunitlevels_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_periods chart_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_periods
    ADD CONSTRAINT chart_periods_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart chart_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT chart_pkey PRIMARY KEY (chartid);


--
-- Name: charttranslations charttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.charttranslations
    ADD CONSTRAINT charttranslations_pkey PRIMARY KEY (chartid, objecttranslationid);


--
-- Name: chartuseraccesses chartuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartuseraccesses
    ADD CONSTRAINT chartuseraccesses_pkey PRIMARY KEY (chartid, useraccessid);


--
-- Name: chartusergroupaccesses chartusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartusergroupaccesses
    ADD CONSTRAINT chartusergroupaccesses_pkey PRIMARY KEY (chartid, usergroupaccessid);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (colorid);


--
-- Name: colorset_colors colorset_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset_colors
    ADD CONSTRAINT colorset_colors_pkey PRIMARY KEY (colorsetid, sort_order);


--
-- Name: colorset colorset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset
    ADD CONSTRAINT colorset_pkey PRIMARY KEY (colorsetid);


--
-- Name: colorsettranslations colorsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorsettranslations
    ADD CONSTRAINT colorsettranslations_pkey PRIMARY KEY (colorsetid, objecttranslationid);


--
-- Name: colortranslations colortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colortranslations
    ADD CONSTRAINT colortranslations_pkey PRIMARY KEY (colorid, objecttranslationid);


--
-- Name: completedatasetregistration completedatasetregistration_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.completedatasetregistration
    ADD CONSTRAINT completedatasetregistration_pkey PRIMARY KEY (datasetid, periodid, sourceid, attributeoptioncomboid);


--
-- Name: configuration configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (configurationid);


--
-- Name: constant constant_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT constant_pkey PRIMARY KEY (constantid);


--
-- Name: constantattributevalues constantattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantattributevalues
    ADD CONSTRAINT constantattributevalues_pkey PRIMARY KEY (constantid, attributevalueid);


--
-- Name: constanttranslations constanttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constanttranslations
    ADD CONSTRAINT constanttranslations_pkey PRIMARY KEY (colorid, objecttranslationid);


--
-- Name: constantuseraccesses constantuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantuseraccesses
    ADD CONSTRAINT constantuseraccesses_pkey PRIMARY KEY (constantid, useraccessid);


--
-- Name: constantusergroupaccesses constantusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantusergroupaccesses
    ADD CONSTRAINT constantusergroupaccesses_pkey PRIMARY KEY (constantid, usergroupaccessid);


--
-- Name: dashboard_items dashboard_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard_items
    ADD CONSTRAINT dashboard_items_pkey PRIMARY KEY (dashboardid, sort_order);


--
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboardid);


--
-- Name: dashboarditem dashboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT dashboarditem_pkey PRIMARY KEY (dashboarditemid);


--
-- Name: dashboarditem_reports dashboarditem_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_reports
    ADD CONSTRAINT dashboarditem_reports_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditem_resources dashboarditem_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_resources
    ADD CONSTRAINT dashboarditem_resources_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditem_users dashboarditem_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_users
    ADD CONSTRAINT dashboarditem_users_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditemtranslations dashboarditemtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditemtranslations
    ADD CONSTRAINT dashboarditemtranslations_pkey PRIMARY KEY (dashboarditemid, objecttranslationid);


--
-- Name: dashboardtranslations dashboardtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardtranslations
    ADD CONSTRAINT dashboardtranslations_pkey PRIMARY KEY (dashboardid, objecttranslationid);


--
-- Name: dashboarduseraccesses dashboarduseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarduseraccesses
    ADD CONSTRAINT dashboarduseraccesses_pkey PRIMARY KEY (dashboardid, useraccessid);


--
-- Name: dashboardusergroupaccesses dashboardusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardusergroupaccesses
    ADD CONSTRAINT dashboardusergroupaccesses_pkey PRIMARY KEY (dashboardid, usergroupaccessid);


--
-- Name: dataapproval dataapproval_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT dataapproval_pkey PRIMARY KEY (dataapprovalid);


--
-- Name: dataapproval dataapproval_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT dataapproval_unique_key UNIQUE (dataapprovallevelid, workflowid, periodid, organisationunitid, attributeoptioncomboid);


--
-- Name: dataapprovalaudit dataapprovalaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT dataapprovalaudit_pkey PRIMARY KEY (dataapprovalauditid);


--
-- Name: dataapprovallevel dataapprovallevel_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT dataapprovallevel_pkey PRIMARY KEY (dataapprovallevelid);


--
-- Name: dataapprovalleveltranslations dataapprovalleveltranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveltranslations
    ADD CONSTRAINT dataapprovalleveltranslations_pkey PRIMARY KEY (dataapprovallevelid, objecttranslationid);


--
-- Name: dataapprovalleveluseraccesses dataapprovalleveluseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveluseraccesses
    ADD CONSTRAINT dataapprovalleveluseraccesses_pkey PRIMARY KEY (dataapprovallevelid, useraccessid);


--
-- Name: dataapprovallevelusergroupaccesses dataapprovallevelusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevelusergroupaccesses
    ADD CONSTRAINT dataapprovallevelusergroupaccesses_pkey PRIMARY KEY (dataapprovallevelid, usergroupaccessid);


--
-- Name: dataapprovalworkflow dataapprovalworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT dataapprovalworkflow_pkey PRIMARY KEY (workflowid);


--
-- Name: dataapprovalworkflowlevels dataapprovalworkflowlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowlevels
    ADD CONSTRAINT dataapprovalworkflowlevels_pkey PRIMARY KEY (workflowid, dataapprovallevelid);


--
-- Name: dataapprovalworkflowtranslations dataapprovalworkflowtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowtranslations
    ADD CONSTRAINT dataapprovalworkflowtranslations_pkey PRIMARY KEY (workflowid, objecttranslationid);


--
-- Name: dataapprovalworkflowuseraccesses dataapprovalworkflowuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowuseraccesses
    ADD CONSTRAINT dataapprovalworkflowuseraccesses_pkey PRIMARY KEY (workflowid, useraccessid);


--
-- Name: dataapprovalworkflowusergroupaccesses dataapprovalworkflowusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT dataapprovalworkflowusergroupaccesses_pkey PRIMARY KEY (workflowid, usergroupaccessid);


--
-- Name: datadimensionitem datadimensionitem_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT datadimensionitem_pkey PRIMARY KEY (datadimensionitemid);


--
-- Name: dataelement dataelement_code_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT dataelement_code_key UNIQUE (code);


--
-- Name: dataelement dataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT dataelement_pkey PRIMARY KEY (dataelementid);


--
-- Name: dataelementaggregationlevels dataelementaggregationlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementaggregationlevels
    ADD CONSTRAINT dataelementaggregationlevels_pkey PRIMARY KEY (dataelementid, sort_order);


--
-- Name: dataelementattributevalues dataelementattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementattributevalues
    ADD CONSTRAINT dataelementattributevalues_pkey PRIMARY KEY (dataelementid, attributevalueid);


--
-- Name: dataelementcategory dataelementcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategory
    ADD CONSTRAINT dataelementcategory_pkey PRIMARY KEY (categoryid);


--
-- Name: dataelementcategoryoption dataelementcategoryoption_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT dataelementcategoryoption_pkey PRIMARY KEY (categoryoptionid);


--
-- Name: dataelementcategoryoptionattributevalues dataelementcategoryoptionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionattributevalues
    ADD CONSTRAINT dataelementcategoryoptionattributevalues_pkey PRIMARY KEY (categoryoptionid, attributevalueid);


--
-- Name: dataelementcategoryoptionuseraccesses dataelementcategoryoptionuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionuseraccesses
    ADD CONSTRAINT dataelementcategoryoptionuseraccesses_pkey PRIMARY KEY (categoryoptionid, useraccessid);


--
-- Name: dataelementcategoryoptionusergroupaccesses dataelementcategoryoptionusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT dataelementcategoryoptionusergroupaccesses_pkey PRIMARY KEY (categoryoptionid, usergroupaccessid);


--
-- Name: dataelementcategorytranslations dataelementcategorytranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategorytranslations
    ADD CONSTRAINT dataelementcategorytranslations_pkey PRIMARY KEY (categoryid, objecttranslationid);


--
-- Name: dataelementcategoryuseraccesses dataelementcategoryuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryuseraccesses
    ADD CONSTRAINT dataelementcategoryuseraccesses_pkey PRIMARY KEY (categoryid, useraccessid);


--
-- Name: dataelementcategoryusergroupaccesses dataelementcategoryusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryusergroupaccesses
    ADD CONSTRAINT dataelementcategoryusergroupaccesses_pkey PRIMARY KEY (categoryid, usergroupaccessid);


--
-- Name: dataelementgroup dataelementgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT dataelementgroup_pkey PRIMARY KEY (dataelementgroupid);


--
-- Name: dataelementgroupattributevalues dataelementgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupattributevalues
    ADD CONSTRAINT dataelementgroupattributevalues_pkey PRIMARY KEY (dataelementgroupid, attributevalueid);


--
-- Name: dataelementgroupmembers dataelementgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupmembers
    ADD CONSTRAINT dataelementgroupmembers_pkey PRIMARY KEY (dataelementgroupid, dataelementid);


--
-- Name: dataelementgroupset dataelementgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupset
    ADD CONSTRAINT dataelementgroupset_pkey PRIMARY KEY (dataelementgroupsetid);


--
-- Name: dataelementgroupsetattributevalues dataelementgroupsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetattributevalues
    ADD CONSTRAINT dataelementgroupsetattributevalues_pkey PRIMARY KEY (dataelementgroupsetid, attributevalueid);


--
-- Name: dataelementgroupsetdimension_items dataelementgroupsetdimension_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetdimension_items
    ADD CONSTRAINT dataelementgroupsetdimension_items_pkey PRIMARY KEY (dataelementgroupsetdimensionid, sort_order);


--
-- Name: dataelementgroupsetdimension dataelementgroupsetdimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetdimension
    ADD CONSTRAINT dataelementgroupsetdimension_pkey PRIMARY KEY (dataelementgroupsetdimensionid);


--
-- Name: dataelementgroupsetmembers dataelementgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetmembers
    ADD CONSTRAINT dataelementgroupsetmembers_pkey PRIMARY KEY (dataelementgroupsetid, sort_order);


--
-- Name: dataelementgroupsettranslations dataelementgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsettranslations
    ADD CONSTRAINT dataelementgroupsettranslations_pkey PRIMARY KEY (dataelementgroupsetid, objecttranslationid);


--
-- Name: dataelementgroupsetuseraccesses dataelementgroupsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetuseraccesses
    ADD CONSTRAINT dataelementgroupsetuseraccesses_pkey PRIMARY KEY (dataelementgroupsetid, useraccessid);


--
-- Name: dataelementgroupsetusergroupaccesses dataelementgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT dataelementgroupsetusergroupaccesses_pkey PRIMARY KEY (dataelementgroupsetid, usergroupaccessid);


--
-- Name: dataelementgrouptranslations dataelementgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgrouptranslations
    ADD CONSTRAINT dataelementgrouptranslations_pkey PRIMARY KEY (dataelementgroupid, objecttranslationid);


--
-- Name: dataelementgroupuseraccesses dataelementgroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupuseraccesses
    ADD CONSTRAINT dataelementgroupuseraccesses_pkey PRIMARY KEY (dataelementgroupid, useraccessid);


--
-- Name: dataelementgroupusergroupaccesses dataelementgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupusergroupaccesses
    ADD CONSTRAINT dataelementgroupusergroupaccesses_pkey PRIMARY KEY (dataelementgroupid, usergroupaccessid);


--
-- Name: dataelementlegendsets dataelementlegendsets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementlegendsets
    ADD CONSTRAINT dataelementlegendsets_pkey PRIMARY KEY (dataelementid, sort_order);


--
-- Name: dataelementoperand dataelementoperand_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementoperand
    ADD CONSTRAINT dataelementoperand_pkey PRIMARY KEY (dataelementoperandid);


--
-- Name: dataelementtranslations dataelementtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementtranslations
    ADD CONSTRAINT dataelementtranslations_pkey PRIMARY KEY (dataelementid, objecttranslationid);


--
-- Name: dataelementuseraccesses dataelementuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementuseraccesses
    ADD CONSTRAINT dataelementuseraccesses_pkey PRIMARY KEY (dataelementid, useraccessid);


--
-- Name: dataelementusergroupaccesses dataelementusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementusergroupaccesses
    ADD CONSTRAINT dataelementusergroupaccesses_pkey PRIMARY KEY (dataelementid, usergroupaccessid);


--
-- Name: dataentryform dataentryform_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryform
    ADD CONSTRAINT dataentryform_pkey PRIMARY KEY (dataentryformid);


--
-- Name: dataentryformtranslations dataentryformtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryformtranslations
    ADD CONSTRAINT dataentryformtranslations_pkey PRIMARY KEY (dataentryformid, objecttranslationid);


--
-- Name: datainputperiod datainputperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datainputperiod
    ADD CONSTRAINT datainputperiod_pkey PRIMARY KEY (datainputperiodid);


--
-- Name: dataset dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (datasetid);


--
-- Name: datasetattributevalues datasetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetattributevalues
    ADD CONSTRAINT datasetattributevalues_pkey PRIMARY KEY (datasetid, attributevalueid);


--
-- Name: datasetelement datasetelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetelement
    ADD CONSTRAINT datasetelement_pkey PRIMARY KEY (datasetelementid);


--
-- Name: datasetelement datasetelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetelement
    ADD CONSTRAINT datasetelement_unique_key UNIQUE (datasetid, dataelementid);


--
-- Name: datasetindicators datasetindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetindicators
    ADD CONSTRAINT datasetindicators_pkey PRIMARY KEY (datasetid, indicatorid);


--
-- Name: datasetlegendsets datasetlegendsets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetlegendsets
    ADD CONSTRAINT datasetlegendsets_pkey PRIMARY KEY (datasetid, sort_order);


--
-- Name: datasetnotification_datasets datasetnotification_datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotification_datasets
    ADD CONSTRAINT datasetnotification_datasets_pkey PRIMARY KEY (datasetnotificationtemplateid, datasetid);


--
-- Name: datasetnotificationtemplate datasetnotificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotificationtemplate
    ADD CONSTRAINT datasetnotificationtemplate_pkey PRIMARY KEY (datasetnotificationtemplateid);


--
-- Name: datasetoperands datasetoperands_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetoperands
    ADD CONSTRAINT datasetoperands_pkey PRIMARY KEY (datasetid, dataelementoperandid);


--
-- Name: datasetsectiontranslations datasetsectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsectiontranslations
    ADD CONSTRAINT datasetsectiontranslations_pkey PRIMARY KEY (sectionid, objecttranslationid);


--
-- Name: datasetsource datasetsource_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsource
    ADD CONSTRAINT datasetsource_pkey PRIMARY KEY (datasetid, sourceid);


--
-- Name: datasettranslations datasettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasettranslations
    ADD CONSTRAINT datasettranslations_pkey PRIMARY KEY (datasetid, objecttranslationid);


--
-- Name: datasetuseraccesses datasetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetuseraccesses
    ADD CONSTRAINT datasetuseraccesses_pkey PRIMARY KEY (datasetid, useraccessid);


--
-- Name: datasetusergroupaccesses datasetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetusergroupaccesses
    ADD CONSTRAINT datasetusergroupaccesses_pkey PRIMARY KEY (datasetid, usergroupaccessid);


--
-- Name: datastatistics datastatistics_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datastatistics
    ADD CONSTRAINT datastatistics_pkey PRIMARY KEY (statisticsid);


--
-- Name: datastatisticsevent datastatisticsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datastatisticsevent
    ADD CONSTRAINT datastatisticsevent_pkey PRIMARY KEY (eventid);


--
-- Name: datavalue datavalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalue
    ADD CONSTRAINT datavalue_pkey PRIMARY KEY (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid);


--
-- Name: datavalueaudit datavalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalueaudit
    ADD CONSTRAINT datavalueaudit_pkey PRIMARY KEY (datavalueauditid);


--
-- Name: deletedobject deletedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.deletedobject
    ADD CONSTRAINT deletedobject_pkey PRIMARY KEY (deletedobjectid);


--
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (documentid);


--
-- Name: documentattributevalues documentattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentattributevalues
    ADD CONSTRAINT documentattributevalues_pkey PRIMARY KEY (documentid, attributevalueid);


--
-- Name: documenttranslations documenttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documenttranslations
    ADD CONSTRAINT documenttranslations_pkey PRIMARY KEY (documentid, objecttranslationid);


--
-- Name: documentuseraccesses documentuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentuseraccesses
    ADD CONSTRAINT documentuseraccesses_pkey PRIMARY KEY (documentid, useraccessid);


--
-- Name: documentusergroupaccesses documentusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentusergroupaccesses
    ADD CONSTRAINT documentusergroupaccesses_pkey PRIMARY KEY (documentid, usergroupaccessid);


--
-- Name: eventchart_attributedimensions eventchart_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_attributedimensions
    ADD CONSTRAINT eventchart_attributedimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_categorydimensions eventchart_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_categorydimensions
    ADD CONSTRAINT eventchart_categorydimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_categoryoptiongroupsetdimensions eventchart_categoryoptiongroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_categoryoptiongroupsetdimensions
    ADD CONSTRAINT eventchart_categoryoptiongroupsetdimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_columns eventchart_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_columns
    ADD CONSTRAINT eventchart_columns_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_dataelementdimensions eventchart_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_dataelementdimensions
    ADD CONSTRAINT eventchart_dataelementdimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_filters eventchart_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_filters
    ADD CONSTRAINT eventchart_filters_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_itemorgunitgroups eventchart_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_itemorgunitgroups
    ADD CONSTRAINT eventchart_itemorgunitgroups_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_organisationunits eventchart_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_organisationunits
    ADD CONSTRAINT eventchart_organisationunits_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_orgunitgroupsetdimensions eventchart_orgunitgroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_orgunitgroupsetdimensions
    ADD CONSTRAINT eventchart_orgunitgroupsetdimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_orgunitlevels eventchart_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_orgunitlevels
    ADD CONSTRAINT eventchart_orgunitlevels_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_periods eventchart_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_periods
    ADD CONSTRAINT eventchart_periods_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart eventchart_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT eventchart_pkey PRIMARY KEY (eventchartid);


--
-- Name: eventchart_programindicatordimensions eventchart_programindicatordimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_programindicatordimensions
    ADD CONSTRAINT eventchart_programindicatordimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_rows eventchart_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_rows
    ADD CONSTRAINT eventchart_rows_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventcharttranslations eventcharttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventcharttranslations
    ADD CONSTRAINT eventcharttranslations_pkey PRIMARY KEY (eventchartid, objecttranslationid);


--
-- Name: eventchartuseraccesses eventchartuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartuseraccesses
    ADD CONSTRAINT eventchartuseraccesses_pkey PRIMARY KEY (eventchartid, useraccessid);


--
-- Name: eventchartusergroupaccesses eventchartusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartusergroupaccesses
    ADD CONSTRAINT eventchartusergroupaccesses_pkey PRIMARY KEY (eventchartid, usergroupaccessid);


--
-- Name: eventreport_attributedimensions eventreport_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_attributedimensions
    ADD CONSTRAINT eventreport_attributedimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_categorydimensions eventreport_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_categorydimensions
    ADD CONSTRAINT eventreport_categorydimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_categoryoptiongroupsetdimensions eventreport_categoryoptiongroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_categoryoptiongroupsetdimensions
    ADD CONSTRAINT eventreport_categoryoptiongroupsetdimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_columns eventreport_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_columns
    ADD CONSTRAINT eventreport_columns_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_dataelementdimensions eventreport_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_dataelementdimensions
    ADD CONSTRAINT eventreport_dataelementdimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_filters eventreport_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_filters
    ADD CONSTRAINT eventreport_filters_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_itemorgunitgroups eventreport_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_itemorgunitgroups
    ADD CONSTRAINT eventreport_itemorgunitgroups_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_organisationunits eventreport_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_organisationunits
    ADD CONSTRAINT eventreport_organisationunits_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_orgunitgroupsetdimensions eventreport_orgunitgroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_orgunitgroupsetdimensions
    ADD CONSTRAINT eventreport_orgunitgroupsetdimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_orgunitlevels eventreport_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_orgunitlevels
    ADD CONSTRAINT eventreport_orgunitlevels_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_periods eventreport_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_periods
    ADD CONSTRAINT eventreport_periods_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport eventreport_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT eventreport_pkey PRIMARY KEY (eventreportid);


--
-- Name: eventreport_programindicatordimensions eventreport_programindicatordimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_programindicatordimensions
    ADD CONSTRAINT eventreport_programindicatordimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_rows eventreport_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_rows
    ADD CONSTRAINT eventreport_rows_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreporttranslations eventreporttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreporttranslations
    ADD CONSTRAINT eventreporttranslations_pkey PRIMARY KEY (eventreportid, objecttranslationid);


--
-- Name: eventreportuseraccesses eventreportuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportuseraccesses
    ADD CONSTRAINT eventreportuseraccesses_pkey PRIMARY KEY (eventreportid, useraccessid);


--
-- Name: eventreportusergroupaccesses eventreportusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportusergroupaccesses
    ADD CONSTRAINT eventreportusergroupaccesses_pkey PRIMARY KEY (eventreportid, usergroupaccessid);


--
-- Name: expression expression_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.expression
    ADD CONSTRAINT expression_pkey PRIMARY KEY (expressionid);


--
-- Name: externalfileresource externalfileresource_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalfileresource
    ADD CONSTRAINT externalfileresource_pkey PRIMARY KEY (externalfileresourceid);


--
-- Name: externalmaplayer externalmaplayer_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT externalmaplayer_pkey PRIMARY KEY (externalmaplayerid);


--
-- Name: externalmaplayeruseraccesses externalmaplayeruseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayeruseraccesses
    ADD CONSTRAINT externalmaplayeruseraccesses_pkey PRIMARY KEY (externalmaplayerid, useraccessid);


--
-- Name: externalmaplayerusergroupaccesses externalmaplayerusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayerusergroupaccesses
    ADD CONSTRAINT externalmaplayerusergroupaccesses_pkey PRIMARY KEY (externalmaplayerid, usergroupaccessid);


--
-- Name: externalnotificationlogentry externalnotificationlogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalnotificationlogentry
    ADD CONSTRAINT externalnotificationlogentry_pkey PRIMARY KEY (externalnotificationlogentryid);


--
-- Name: fileresource fileresource_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.fileresource
    ADD CONSTRAINT fileresource_pkey PRIMARY KEY (fileresourceid);


--
-- Name: i18nlocale i18nlocale_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.i18nlocale
    ADD CONSTRAINT i18nlocale_pkey PRIMARY KEY (i18nlocaleid);


--
-- Name: incomingsms incomingsms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.incomingsms
    ADD CONSTRAINT incomingsms_pkey PRIMARY KEY (id);


--
-- Name: indicator indicator_code_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_code_key UNIQUE (code);


--
-- Name: indicator indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_pkey PRIMARY KEY (indicatorid);


--
-- Name: indicatorattributevalues indicatorattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorattributevalues
    ADD CONSTRAINT indicatorattributevalues_pkey PRIMARY KEY (indicatorid, attributevalueid);


--
-- Name: indicatorgroup indicatorgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroup
    ADD CONSTRAINT indicatorgroup_pkey PRIMARY KEY (indicatorgroupid);


--
-- Name: indicatorgroupattributevalues indicatorgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupattributevalues
    ADD CONSTRAINT indicatorgroupattributevalues_pkey PRIMARY KEY (indicatorgroupid, attributevalueid);


--
-- Name: indicatorgroupmembers indicatorgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupmembers
    ADD CONSTRAINT indicatorgroupmembers_pkey PRIMARY KEY (indicatorgroupid, indicatorid);


--
-- Name: indicatorgroupset indicatorgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupset
    ADD CONSTRAINT indicatorgroupset_pkey PRIMARY KEY (indicatorgroupsetid);


--
-- Name: indicatorgroupsetmembers indicatorgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetmembers
    ADD CONSTRAINT indicatorgroupsetmembers_pkey PRIMARY KEY (indicatorgroupsetid, sort_order);


--
-- Name: indicatorgroupsettranslations indicatorgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsettranslations
    ADD CONSTRAINT indicatorgroupsettranslations_pkey PRIMARY KEY (indicatorgroupsetid, objecttranslationid);


--
-- Name: indicatorgroupsetuseraccesses indicatorgroupsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetuseraccesses
    ADD CONSTRAINT indicatorgroupsetuseraccesses_pkey PRIMARY KEY (indicatorgroupsetid, useraccessid);


--
-- Name: indicatorgroupsetusergroupaccesses indicatorgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT indicatorgroupsetusergroupaccesses_pkey PRIMARY KEY (indicatorgroupsetid, usergroupaccessid);


--
-- Name: indicatorgrouptranslations indicatorgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgrouptranslations
    ADD CONSTRAINT indicatorgrouptranslations_pkey PRIMARY KEY (indicatorgroupid, objecttranslationid);


--
-- Name: indicatorgroupuseraccesses indicatorgroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupuseraccesses
    ADD CONSTRAINT indicatorgroupuseraccesses_pkey PRIMARY KEY (indicatorgroupid, useraccessid);


--
-- Name: indicatorgroupusergroupaccesses indicatorgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupusergroupaccesses
    ADD CONSTRAINT indicatorgroupusergroupaccesses_pkey PRIMARY KEY (indicatorgroupid, usergroupaccessid);


--
-- Name: indicatorlegendsets indicatorlegendsets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorlegendsets
    ADD CONSTRAINT indicatorlegendsets_pkey PRIMARY KEY (indicatorid, sort_order);


--
-- Name: indicatortranslations indicatortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortranslations
    ADD CONSTRAINT indicatortranslations_pkey PRIMARY KEY (indicatorid, objecttranslationid);


--
-- Name: indicatortype indicatortype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortype
    ADD CONSTRAINT indicatortype_pkey PRIMARY KEY (indicatortypeid);


--
-- Name: indicatortypetranslations indicatortypetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortypetranslations
    ADD CONSTRAINT indicatortypetranslations_pkey PRIMARY KEY (indicatortypeid, objecttranslationid);


--
-- Name: indicatoruseraccesses indicatoruseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatoruseraccesses
    ADD CONSTRAINT indicatoruseraccesses_pkey PRIMARY KEY (indicatorid, useraccessid);


--
-- Name: indicatorusergroupaccesses indicatorusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorusergroupaccesses
    ADD CONSTRAINT indicatorusergroupaccesses_pkey PRIMARY KEY (indicatorid, usergroupaccessid);


--
-- Name: intepretation_likedby intepretation_likedby_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.intepretation_likedby
    ADD CONSTRAINT intepretation_likedby_pkey PRIMARY KEY (interpretationid, userid);


--
-- Name: interpretation_comments interpretation_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation_comments
    ADD CONSTRAINT interpretation_comments_pkey PRIMARY KEY (interpretationid, sort_order);


--
-- Name: interpretation interpretation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT interpretation_pkey PRIMARY KEY (interpretationid);


--
-- Name: interpretationcomment interpretationcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationcomment
    ADD CONSTRAINT interpretationcomment_pkey PRIMARY KEY (interpretationcommentid);


--
-- Name: interpretationuseraccesses interpretationuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationuseraccesses
    ADD CONSTRAINT interpretationuseraccesses_pkey PRIMARY KEY (interpretationid, useraccessid);


--
-- Name: interpretationusergroupaccesses interpretationusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationusergroupaccesses
    ADD CONSTRAINT interpretationusergroupaccesses_pkey PRIMARY KEY (interpretationid, usergroupaccessid);


--
-- Name: jobconfiguration jobconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.jobconfiguration
    ADD CONSTRAINT jobconfiguration_pkey PRIMARY KEY (jobconfigurationid);


--
-- Name: deletedobject key_deleted_object_klass_code; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.deletedobject
    ADD CONSTRAINT key_deleted_object_klass_code UNIQUE (klass, code);


--
-- Name: deletedobject key_deleted_object_klass_uid; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.deletedobject
    ADD CONSTRAINT key_deleted_object_klass_uid UNIQUE (klass, uid);


--
-- Name: section key_sectionnamedataset; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT key_sectionnamedataset UNIQUE (name, datasetid);


--
-- Name: keyjsonvalue keyjsonvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.keyjsonvalue
    ADD CONSTRAINT keyjsonvalue_pkey PRIMARY KEY (keyjsonvalueid);


--
-- Name: keyjsonvalue keyjsonvalue_unique_key_in_namespace; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.keyjsonvalue
    ADD CONSTRAINT keyjsonvalue_unique_key_in_namespace UNIQUE (namespace, namespacekey);


--
-- Name: legendsetattributevalues legendsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetattributevalues
    ADD CONSTRAINT legendsetattributevalues_pkey PRIMARY KEY (legendsetid, attributevalueid);


--
-- Name: legendsetuseraccesses legendsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetuseraccesses
    ADD CONSTRAINT legendsetuseraccesses_pkey PRIMARY KEY (maplegendsetid, useraccessid);


--
-- Name: legendsetusergroupaccesses legendsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetusergroupaccesses
    ADD CONSTRAINT legendsetusergroupaccesses_pkey PRIMARY KEY (maplegendsetid, usergroupaccessid);


--
-- Name: lockexception lockexception_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.lockexception
    ADD CONSTRAINT lockexception_pkey PRIMARY KEY (lockexceptionid);


--
-- Name: map map_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT map_pkey PRIMARY KEY (mapid);


--
-- Name: maplegend maplegend_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegend
    ADD CONSTRAINT maplegend_pkey PRIMARY KEY (maplegendid);


--
-- Name: maplegendset maplegendset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendset
    ADD CONSTRAINT maplegendset_pkey PRIMARY KEY (maplegendsetid);


--
-- Name: maplegendsettranslations maplegendsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendsettranslations
    ADD CONSTRAINT maplegendsettranslations_pkey PRIMARY KEY (maplegendsetid, objecttranslationid);


--
-- Name: maplegendtranslations maplegendtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendtranslations
    ADD CONSTRAINT maplegendtranslations_pkey PRIMARY KEY (maplegendid, objecttranslationid);


--
-- Name: mapmapviews mapmapviews_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapmapviews
    ADD CONSTRAINT mapmapviews_pkey PRIMARY KEY (mapid, sort_order);


--
-- Name: mapuseraccesses mapuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapuseraccesses
    ADD CONSTRAINT mapuseraccesses_pkey PRIMARY KEY (mapid, useraccessid);


--
-- Name: mapusergroupaccesses mapusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapusergroupaccesses
    ADD CONSTRAINT mapusergroupaccesses_pkey PRIMARY KEY (mapid, usergroupaccessid);


--
-- Name: mapview_attributedimensions mapview_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_attributedimensions
    ADD CONSTRAINT mapview_attributedimensions_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_columns mapview_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_columns
    ADD CONSTRAINT mapview_columns_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_datadimensionitems mapview_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_datadimensionitems
    ADD CONSTRAINT mapview_datadimensionitems_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_dataelementdimensions mapview_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_dataelementdimensions
    ADD CONSTRAINT mapview_dataelementdimensions_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_itemorgunitgroups mapview_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_itemorgunitgroups
    ADD CONSTRAINT mapview_itemorgunitgroups_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_organisationunits mapview_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_organisationunits
    ADD CONSTRAINT mapview_organisationunits_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_orgunitlevels mapview_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_orgunitlevels
    ADD CONSTRAINT mapview_orgunitlevels_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_periods mapview_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_periods
    ADD CONSTRAINT mapview_periods_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview mapview_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT mapview_pkey PRIMARY KEY (mapviewid);


--
-- Name: mapviewtranslations mapviewtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapviewtranslations
    ADD CONSTRAINT mapviewtranslations_pkey PRIMARY KEY (mapviewid, objecttranslationid);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (messageid);


--
-- Name: messageconversation_messages messageconversation_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_messages
    ADD CONSTRAINT messageconversation_messages_pkey PRIMARY KEY (messageconversationid, sort_order);


--
-- Name: messageconversation messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation
    ADD CONSTRAINT messageconversation_pkey PRIMARY KEY (messageconversationid);


--
-- Name: messageconversation_usermessages messageconversation_usermessages_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_usermessages
    ADD CONSTRAINT messageconversation_usermessages_pkey PRIMARY KEY (messageconversationid, usermessageid);


--
-- Name: metadataaudit metadataaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataaudit
    ADD CONSTRAINT metadataaudit_pkey PRIMARY KEY (metadataauditid);


--
-- Name: metadataversion metadataversion_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataversion
    ADD CONSTRAINT metadataversion_pkey PRIMARY KEY (versionid);


--
-- Name: minmaxdataelement minmaxdataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.minmaxdataelement
    ADD CONSTRAINT minmaxdataelement_pkey PRIMARY KEY (minmaxdataelementid);


--
-- Name: minmaxdataelement minmaxdataelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.minmaxdataelement
    ADD CONSTRAINT minmaxdataelement_unique_key UNIQUE (sourceid, dataelementid, categoryoptioncomboid);


--
-- Name: oauth2client oauth2client_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2client
    ADD CONSTRAINT oauth2client_pkey PRIMARY KEY (oauth2clientid);


--
-- Name: oauth2clientgranttypes oauth2clientgranttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2clientgranttypes
    ADD CONSTRAINT oauth2clientgranttypes_pkey PRIMARY KEY (oauth2clientid, sort_order);


--
-- Name: oauth2clientredirecturis oauth2clientredirecturis_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2clientredirecturis
    ADD CONSTRAINT oauth2clientredirecturis_pkey PRIMARY KEY (oauth2clientid, sort_order);


--
-- Name: oauth_access_token oauth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth_access_token
    ADD CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id);


--
-- Name: objecttranslation objecttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.objecttranslation
    ADD CONSTRAINT objecttranslation_pkey PRIMARY KEY (objecttranslationid);


--
-- Name: optionattributevalues optionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionattributevalues
    ADD CONSTRAINT optionattributevalues_pkey PRIMARY KEY (optionvalueid, attributevalueid);


--
-- Name: optiongroup optiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT optiongroup_pkey PRIMARY KEY (optiongroupid);


--
-- Name: optiongroupattributevalues optiongroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupattributevalues
    ADD CONSTRAINT optiongroupattributevalues_pkey PRIMARY KEY (optiongroupid, attributevalueid);


--
-- Name: optiongroupmembers optiongroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupmembers
    ADD CONSTRAINT optiongroupmembers_pkey PRIMARY KEY (optiongroupid, optionid);


--
-- Name: optiongroupset optiongroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT optiongroupset_pkey PRIMARY KEY (optiongroupsetid);


--
-- Name: optiongroupsetmembers optiongroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetmembers
    ADD CONSTRAINT optiongroupsetmembers_pkey PRIMARY KEY (optiongroupsetid, sort_order);


--
-- Name: optiongroupsettranslations optiongroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsettranslations
    ADD CONSTRAINT optiongroupsettranslations_pkey PRIMARY KEY (optiongroupsetid, objecttranslationid);


--
-- Name: optiongroupsetuseraccesses optiongroupsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetuseraccesses
    ADD CONSTRAINT optiongroupsetuseraccesses_pkey PRIMARY KEY (optiongroupsetid, useraccessid);


--
-- Name: optiongroupsetusergroupaccesses optiongroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetusergroupaccesses
    ADD CONSTRAINT optiongroupsetusergroupaccesses_pkey PRIMARY KEY (optiongroupsetid, usergroupaccessid);


--
-- Name: optiongrouptranslations optiongrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongrouptranslations
    ADD CONSTRAINT optiongrouptranslations_pkey PRIMARY KEY (optiongroupid, objecttranslationid);


--
-- Name: optiongroupuseraccesses optiongroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupuseraccesses
    ADD CONSTRAINT optiongroupuseraccesses_pkey PRIMARY KEY (optiongroupid, useraccessid);


--
-- Name: optiongroupusergroupaccesses optiongroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupusergroupaccesses
    ADD CONSTRAINT optiongroupusergroupaccesses_pkey PRIMARY KEY (optiongroupid, usergroupaccessid);


--
-- Name: optionset optionset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionset
    ADD CONSTRAINT optionset_pkey PRIMARY KEY (optionsetid);


--
-- Name: optionsetattributevalues optionsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetattributevalues
    ADD CONSTRAINT optionsetattributevalues_pkey PRIMARY KEY (optionsetid, attributevalueid);


--
-- Name: optionsettranslations optionsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsettranslations
    ADD CONSTRAINT optionsettranslations_pkey PRIMARY KEY (optionsetid, objecttranslationid);


--
-- Name: optionsetuseraccesses optionsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetuseraccesses
    ADD CONSTRAINT optionsetuseraccesses_pkey PRIMARY KEY (optionsetid, useraccessid);


--
-- Name: optionsetusergroupaccesses optionsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetusergroupaccesses
    ADD CONSTRAINT optionsetusergroupaccesses_pkey PRIMARY KEY (optionsetid, usergroupaccessid);


--
-- Name: optionvalue optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (optionvalueid);


--
-- Name: optionvaluetranslations optionvaluetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvaluetranslations
    ADD CONSTRAINT optionvaluetranslations_pkey PRIMARY KEY (optionvalueid, objecttranslationid);


--
-- Name: organisationunit organisationunit_code_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT organisationunit_code_key UNIQUE (code);


--
-- Name: organisationunit organisationunit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT organisationunit_pkey PRIMARY KEY (organisationunitid);


--
-- Name: organisationunitattributevalues organisationunitattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunitattributevalues
    ADD CONSTRAINT organisationunitattributevalues_pkey PRIMARY KEY (organisationunitid, attributevalueid);


--
-- Name: organisationunittranslations organisationunittranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunittranslations
    ADD CONSTRAINT organisationunittranslations_pkey PRIMARY KEY (organisationunitid, objecttranslationid);


--
-- Name: orgunitgroup orgunitgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT orgunitgroup_name_key UNIQUE (name);


--
-- Name: orgunitgroup orgunitgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT orgunitgroup_pkey PRIMARY KEY (orgunitgroupid);


--
-- Name: orgunitgroupattributevalues orgunitgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupattributevalues
    ADD CONSTRAINT orgunitgroupattributevalues_pkey PRIMARY KEY (orgunitgroupid, attributevalueid);


--
-- Name: orgunitgroupmembers orgunitgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupmembers
    ADD CONSTRAINT orgunitgroupmembers_pkey PRIMARY KEY (orgunitgroupid, organisationunitid);


--
-- Name: orgunitgroupset orgunitgroupset_name_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT orgunitgroupset_name_key UNIQUE (name);


--
-- Name: orgunitgroupset orgunitgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT orgunitgroupset_pkey PRIMARY KEY (orgunitgroupsetid);


--
-- Name: orgunitgroupsetattributevalues orgunitgroupsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetattributevalues
    ADD CONSTRAINT orgunitgroupsetattributevalues_pkey PRIMARY KEY (orgunitgroupsetid, attributevalueid);


--
-- Name: orgunitgroupsetdimension_items orgunitgroupsetdimension_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetdimension_items
    ADD CONSTRAINT orgunitgroupsetdimension_items_pkey PRIMARY KEY (orgunitgroupsetdimensionid, sort_order);


--
-- Name: orgunitgroupsetdimension orgunitgroupsetdimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetdimension
    ADD CONSTRAINT orgunitgroupsetdimension_pkey PRIMARY KEY (orgunitgroupsetdimensionid);


--
-- Name: orgunitgroupsetmembers orgunitgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetmembers
    ADD CONSTRAINT orgunitgroupsetmembers_pkey PRIMARY KEY (orgunitgroupsetid, orgunitgroupid);


--
-- Name: orgunitgroupsettranslations orgunitgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsettranslations
    ADD CONSTRAINT orgunitgroupsettranslations_pkey PRIMARY KEY (orgunitgroupsetid, objecttranslationid);


--
-- Name: orgunitgroupsetuseraccesses orgunitgroupsetuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetuseraccesses
    ADD CONSTRAINT orgunitgroupsetuseraccesses_pkey PRIMARY KEY (orgunitgroupsetid, useraccessid);


--
-- Name: orgunitgroupsetusergroupaccesses orgunitgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT orgunitgroupsetusergroupaccesses_pkey PRIMARY KEY (orgunitgroupsetid, usergroupaccessid);


--
-- Name: orgunitgrouptranslations orgunitgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgrouptranslations
    ADD CONSTRAINT orgunitgrouptranslations_pkey PRIMARY KEY (orgunitgroupid, objecttranslationid);


--
-- Name: orgunitgroupuseraccesses orgunitgroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupuseraccesses
    ADD CONSTRAINT orgunitgroupuseraccesses_pkey PRIMARY KEY (orgunitgroupid, useraccessid);


--
-- Name: orgunitgroupusergroupaccesses orgunitgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupusergroupaccesses
    ADD CONSTRAINT orgunitgroupusergroupaccesses_pkey PRIMARY KEY (orgunitgroupid, usergroupaccessid);


--
-- Name: orgunitlevel orgunitlevel_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitlevel
    ADD CONSTRAINT orgunitlevel_pkey PRIMARY KEY (orgunitlevelid);


--
-- Name: orgunitleveltranslations orgunitleveltranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitleveltranslations
    ADD CONSTRAINT orgunitleveltranslations_pkey PRIMARY KEY (orgunitlevelid, objecttranslationid);


--
-- Name: outbound_sms outbound_sms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.outbound_sms
    ADD CONSTRAINT outbound_sms_pkey PRIMARY KEY (id);


--
-- Name: period period_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT period_pkey PRIMARY KEY (periodid);


--
-- Name: periodtype periodtype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.periodtype
    ADD CONSTRAINT periodtype_pkey PRIMARY KEY (periodtypeid);


--
-- Name: predictor predictor_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT predictor_pkey PRIMARY KEY (predictorid);


--
-- Name: predictororgunitlevels predictororgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictororgunitlevels
    ADD CONSTRAINT predictororgunitlevels_pkey PRIMARY KEY (predictorid, orgunitlevelid);


--
-- Name: previouspasswords previouspasswords_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.previouspasswords
    ADD CONSTRAINT previouspasswords_pkey PRIMARY KEY (userid, list_index);


--
-- Name: program_attribute_group program_attribute_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attribute_group
    ADD CONSTRAINT program_attribute_group_pkey PRIMARY KEY (programtrackedentityattributegroupid);


--
-- Name: program_attributes program_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT program_attributes_pkey PRIMARY KEY (programtrackedentityattributeid);


--
-- Name: program_criteria program_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_criteria
    ADD CONSTRAINT program_criteria_pkey PRIMARY KEY (programid, validationcriteriaid);


--
-- Name: program_organisationunits program_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_organisationunits
    ADD CONSTRAINT program_organisationunits_pkey PRIMARY KEY (programid, organisationunitid);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (programid);


--
-- Name: programattributevalues programattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programattributevalues
    ADD CONSTRAINT programattributevalues_pkey PRIMARY KEY (programid, attributevalueid);


--
-- Name: programexpression programexpression_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programexpression
    ADD CONSTRAINT programexpression_pkey PRIMARY KEY (programexpressionid);


--
-- Name: programindicator programindicator_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT programindicator_pkey PRIMARY KEY (programindicatorid);


--
-- Name: programindicatorattributevalues programindicatorattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorattributevalues
    ADD CONSTRAINT programindicatorattributevalues_pkey PRIMARY KEY (programindicatorid, attributevalueid);


--
-- Name: programindicatorgroup programindicatorgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroup
    ADD CONSTRAINT programindicatorgroup_pkey PRIMARY KEY (programindicatorgroupid);


--
-- Name: programindicatorgroupattributevalues programindicatorgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupattributevalues
    ADD CONSTRAINT programindicatorgroupattributevalues_pkey PRIMARY KEY (programindicatorgroupid, attributevalueid);


--
-- Name: programindicatorgroupmembers programindicatorgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupmembers
    ADD CONSTRAINT programindicatorgroupmembers_pkey PRIMARY KEY (programindicatorgroupid, programindicatorid);


--
-- Name: programindicatorgrouptranslations programindicatorgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgrouptranslations
    ADD CONSTRAINT programindicatorgrouptranslations_pkey PRIMARY KEY (programindicatorgroupid, objecttranslationid);


--
-- Name: programindicatorgroupuseraccesses programindicatorgroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupuseraccesses
    ADD CONSTRAINT programindicatorgroupuseraccesses_pkey PRIMARY KEY (programindicatorgroupid, useraccessid);


--
-- Name: programindicatorgroupusergroupaccesses programindicatorgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupusergroupaccesses
    ADD CONSTRAINT programindicatorgroupusergroupaccesses_pkey PRIMARY KEY (programindicatorgroupid, usergroupaccessid);


--
-- Name: programindicatorlegendsets programindicatorlegendsets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorlegendsets
    ADD CONSTRAINT programindicatorlegendsets_pkey PRIMARY KEY (programindicatorid, sort_order);


--
-- Name: programindicatortranslations programindicatortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatortranslations
    ADD CONSTRAINT programindicatortranslations_pkey PRIMARY KEY (programindicatorid, objecttranslationid);


--
-- Name: programindicatoruseraccesses programindicatoruseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatoruseraccesses
    ADD CONSTRAINT programindicatoruseraccesses_pkey PRIMARY KEY (programindicatorid, useraccessid);


--
-- Name: programindicatorusergroupaccesses programindicatorusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorusergroupaccesses
    ADD CONSTRAINT programindicatorusergroupaccesses_pkey PRIMARY KEY (programindicatorid, usergroupaccessid);


--
-- Name: programinstance_messageconversation programinstance_messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance_messageconversation
    ADD CONSTRAINT programinstance_messageconversation_pkey PRIMARY KEY (programinstanceid, sort_order);


--
-- Name: programinstance programinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance
    ADD CONSTRAINT programinstance_pkey PRIMARY KEY (programinstanceid);


--
-- Name: programinstancecomments programinstancecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstancecomments
    ADD CONSTRAINT programinstancecomments_pkey PRIMARY KEY (programinstanceid, sort_order);


--
-- Name: programmessage programmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT programmessage_pkey PRIMARY KEY (id);


--
-- Name: programmessagetranslations programmessagetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessagetranslations
    ADD CONSTRAINT programmessagetranslations_pkey PRIMARY KEY (id, objecttranslationid);


--
-- Name: programnotificationtemplate programnotificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT programnotificationtemplate_pkey PRIMARY KEY (programnotificationtemplateid);


--
-- Name: programrule programrule_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrule
    ADD CONSTRAINT programrule_pkey PRIMARY KEY (programruleid);


--
-- Name: programruleaction programruleaction_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT programruleaction_pkey PRIMARY KEY (programruleactionid);


--
-- Name: programruletranslations programruletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruletranslations
    ADD CONSTRAINT programruletranslations_pkey PRIMARY KEY (programruleid, objecttranslationid);


--
-- Name: programrulevariable programrulevariable_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT programrulevariable_pkey PRIMARY KEY (programrulevariableid);


--
-- Name: programsection_attributes programsection_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection_attributes
    ADD CONSTRAINT programsection_attributes_pkey PRIMARY KEY (programsectionid, sort_order);


--
-- Name: programsection programsection_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection
    ADD CONSTRAINT programsection_pkey PRIMARY KEY (programsectionid);


--
-- Name: programsectiontranslations programsectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsectiontranslations
    ADD CONSTRAINT programsectiontranslations_pkey PRIMARY KEY (programsectionid, objecttranslationid);


--
-- Name: programstage programstage_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT programstage_pkey PRIMARY KEY (programstageid);


--
-- Name: programstageattributevalues programstageattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageattributevalues
    ADD CONSTRAINT programstageattributevalues_pkey PRIMARY KEY (programstageid, attributevalueid);


--
-- Name: programstagedataelement programstagedataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT programstagedataelement_pkey PRIMARY KEY (programstagedataelementid);


--
-- Name: programstagedataelement programstagedataelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT programstagedataelement_unique_key UNIQUE (programstageid, dataelementid);


--
-- Name: programstageinstance_messageconversation programstageinstance_messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance_messageconversation
    ADD CONSTRAINT programstageinstance_messageconversation_pkey PRIMARY KEY (programstageinstanceid, sort_order);


--
-- Name: programstageinstance programstageinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT programstageinstance_pkey PRIMARY KEY (programstageinstanceid);


--
-- Name: programstageinstancecomments programstageinstancecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstancecomments
    ADD CONSTRAINT programstageinstancecomments_pkey PRIMARY KEY (programstageinstanceid, sort_order);


--
-- Name: programstagesection_dataelements programstagesection_dataelements_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection_dataelements
    ADD CONSTRAINT programstagesection_dataelements_pkey PRIMARY KEY (programstagesectionid, sort_order);


--
-- Name: programstagesection programstagesection_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection
    ADD CONSTRAINT programstagesection_pkey PRIMARY KEY (programstagesectionid);


--
-- Name: programstagesection_programindicators programstagesection_programindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection_programindicators
    ADD CONSTRAINT programstagesection_programindicators_pkey PRIMARY KEY (programstagesectionid, sort_order);


--
-- Name: programstagesectiontranslations programstagesectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesectiontranslations
    ADD CONSTRAINT programstagesectiontranslations_pkey PRIMARY KEY (programstagesectionid, objecttranslationid);


--
-- Name: programstagetranslations programstagetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagetranslations
    ADD CONSTRAINT programstagetranslations_pkey PRIMARY KEY (programstageid, objecttranslationid);


--
-- Name: programstageuseraccesses programstageuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageuseraccesses
    ADD CONSTRAINT programstageuseraccesses_pkey PRIMARY KEY (programstageid, useraccessid);


--
-- Name: programstageusergroupaccesses programstageusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageusergroupaccesses
    ADD CONSTRAINT programstageusergroupaccesses_pkey PRIMARY KEY (programid, usergroupaccessid);


--
-- Name: program_attributes programtrackedentityattribute_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT programtrackedentityattribute_unique_key UNIQUE (programid, trackedentityattributeid);


--
-- Name: programtrackedentityattributegroupmembers programtrackedentityattributegroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegroupmembers
    ADD CONSTRAINT programtrackedentityattributegroupmembers_pkey PRIMARY KEY (programtrackedentityattributeid, programtrackedentityattributegroupid);


--
-- Name: programtrackedentityattributegrouptranslations programtrackedentityattributegrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegrouptranslations
    ADD CONSTRAINT programtrackedentityattributegrouptranslations_pkey PRIMARY KEY (programtrackedentityattributegroupid, objecttranslationid);


--
-- Name: programtranslations programtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtranslations
    ADD CONSTRAINT programtranslations_pkey PRIMARY KEY (programid, objecttranslationid);


--
-- Name: programuseraccesses programuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programuseraccesses
    ADD CONSTRAINT programuseraccesses_pkey PRIMARY KEY (programid, useraccessid);


--
-- Name: programusergroupaccesses programusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programusergroupaccesses
    ADD CONSTRAINT programusergroupaccesses_pkey PRIMARY KEY (programid, usergroupaccessid);


--
-- Name: pushanalysis pushanalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysis
    ADD CONSTRAINT pushanalysis_pkey PRIMARY KEY (pushanalysisid);


--
-- Name: pushanalysisrecipientusergroups pushanalysisrecipientusergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysisrecipientusergroups
    ADD CONSTRAINT pushanalysisrecipientusergroups_pkey PRIMARY KEY (usergroupid, elt);


--
-- Name: relationship relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (relationshipid);


--
-- Name: relationshiptype relationshiptype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptype
    ADD CONSTRAINT relationshiptype_pkey PRIMARY KEY (relationshiptypeid);


--
-- Name: relationshiptypetranslations relationshiptypetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptypetranslations
    ADD CONSTRAINT relationshiptypetranslations_pkey PRIMARY KEY (relationshiptypeid, objecttranslationid);


--
-- Name: relativeperiods relativeperiods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relativeperiods
    ADD CONSTRAINT relativeperiods_pkey PRIMARY KEY (relativeperiodsid);


--
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (reportid);


--
-- Name: reporttable_categorydimensions reporttable_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_categorydimensions
    ADD CONSTRAINT reporttable_categorydimensions_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_categoryoptiongroupsetdimensions reporttable_categoryoptiongroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_categoryoptiongroupsetdimensions
    ADD CONSTRAINT reporttable_categoryoptiongroupsetdimensions_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_columns reporttable_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_columns
    ADD CONSTRAINT reporttable_columns_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_datadimensionitems reporttable_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_datadimensionitems
    ADD CONSTRAINT reporttable_datadimensionitems_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_dataelementgroupsetdimensions reporttable_dataelementgroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_dataelementgroupsetdimensions
    ADD CONSTRAINT reporttable_dataelementgroupsetdimensions_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_filters reporttable_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_filters
    ADD CONSTRAINT reporttable_filters_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_itemorgunitgroups reporttable_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_itemorgunitgroups
    ADD CONSTRAINT reporttable_itemorgunitgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_organisationunits reporttable_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_organisationunits
    ADD CONSTRAINT reporttable_organisationunits_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_orgunitgroupsetdimensions reporttable_orgunitgroupsetdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_orgunitgroupsetdimensions
    ADD CONSTRAINT reporttable_orgunitgroupsetdimensions_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_orgunitlevels reporttable_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_orgunitlevels
    ADD CONSTRAINT reporttable_orgunitlevels_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_periods reporttable_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_periods
    ADD CONSTRAINT reporttable_periods_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable reporttable_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT reporttable_pkey PRIMARY KEY (reporttableid);


--
-- Name: reporttable_rows reporttable_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_rows
    ADD CONSTRAINT reporttable_rows_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttabletranslations reporttabletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttabletranslations
    ADD CONSTRAINT reporttabletranslations_pkey PRIMARY KEY (reporttableid, objecttranslationid);


--
-- Name: reporttableuseraccesses reporttableuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableuseraccesses
    ADD CONSTRAINT reporttableuseraccesses_pkey PRIMARY KEY (reporttableid, useraccessid);


--
-- Name: reporttableusergroupaccesses reporttableusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableusergroupaccesses
    ADD CONSTRAINT reporttableusergroupaccesses_pkey PRIMARY KEY (reporttableid, usergroupaccessid);


--
-- Name: reporttranslations reporttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttranslations
    ADD CONSTRAINT reporttranslations_pkey PRIMARY KEY (reportid, objecttranslationid);


--
-- Name: reportuseraccesses reportuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportuseraccesses
    ADD CONSTRAINT reportuseraccesses_pkey PRIMARY KEY (reportid, useraccessid);


--
-- Name: reportusergroupaccesses reportusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportusergroupaccesses
    ADD CONSTRAINT reportusergroupaccesses_pkey PRIMARY KEY (reportid, usergroupaccessid);


--
-- Name: reservedvalue reservedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reservedvalue
    ADD CONSTRAINT reservedvalue_pkey PRIMARY KEY (reservedvalueid);


--
-- Name: section section_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (sectionid);


--
-- Name: sectionattributevalues sectionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionattributevalues
    ADD CONSTRAINT sectionattributevalues_pkey PRIMARY KEY (sectionid, attributevalueid);


--
-- Name: sectiondataelements sectiondataelements_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectiondataelements
    ADD CONSTRAINT sectiondataelements_pkey PRIMARY KEY (sectionid, sort_order);


--
-- Name: sectiongreyedfields sectiongreyedfields_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectiongreyedfields
    ADD CONSTRAINT sectiongreyedfields_pkey PRIMARY KEY (sectionid, dataelementoperandid);


--
-- Name: sectionindicators sectionindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionindicators
    ADD CONSTRAINT sectionindicators_pkey PRIMARY KEY (sectionid, sort_order);


--
-- Name: sequentialnumbercounter sequentialnumbercounter_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sequentialnumbercounter
    ADD CONSTRAINT sequentialnumbercounter_pkey PRIMARY KEY (id);


--
-- Name: smscodes smscodes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscodes
    ADD CONSTRAINT smscodes_pkey PRIMARY KEY (smscodeid);


--
-- Name: smscommandcodes smscommandcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandcodes
    ADD CONSTRAINT smscommandcodes_pkey PRIMARY KEY (id, codeid);


--
-- Name: smscommands smscommands_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommands
    ADD CONSTRAINT smscommands_pkey PRIMARY KEY (smscommandid);


--
-- Name: smscommandspecialcharacters smscommandspecialcharacters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandspecialcharacters
    ADD CONSTRAINT smscommandspecialcharacters_pkey PRIMARY KEY (smscommandid, specialcharacterid);


--
-- Name: smsspecialcharacter smsspecialcharacter_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smsspecialcharacter
    ADD CONSTRAINT smsspecialcharacter_pkey PRIMARY KEY (specialcharacterid);


--
-- Name: sqlview sqlview_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlview
    ADD CONSTRAINT sqlview_pkey PRIMARY KEY (sqlviewid);


--
-- Name: sqlviewattributevalues sqlviewattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewattributevalues
    ADD CONSTRAINT sqlviewattributevalues_pkey PRIMARY KEY (sqlviewid, attributevalueid);


--
-- Name: sqlviewuseraccesses sqlviewuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewuseraccesses
    ADD CONSTRAINT sqlviewuseraccesses_pkey PRIMARY KEY (sqlviewid, useraccessid);


--
-- Name: sqlviewusergroupaccesses sqlviewusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewusergroupaccesses
    ADD CONSTRAINT sqlviewusergroupaccesses_pkey PRIMARY KEY (sqlviewid, usergroupaccessid);


--
-- Name: systemsetting systemsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.systemsetting
    ADD CONSTRAINT systemsetting_pkey PRIMARY KEY (systemsettingid);


--
-- Name: tablehook tablehook_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.tablehook
    ADD CONSTRAINT tablehook_pkey PRIMARY KEY (analyticstablehookid);


--
-- Name: trackedentityattribute trackedentityattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT trackedentityattribute_pkey PRIMARY KEY (trackedentityattributeid);


--
-- Name: trackedentityattributeattributevalues trackedentityattributeattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeattributevalues
    ADD CONSTRAINT trackedentityattributeattributevalues_pkey PRIMARY KEY (trackedentityattributeid, attributevalueid);


--
-- Name: trackedentityattributedimension trackedentityattributedimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributedimension
    ADD CONSTRAINT trackedentityattributedimension_pkey PRIMARY KEY (trackedentityattributedimensionid);


--
-- Name: trackedentityattributelegendsets trackedentityattributelegendsets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributelegendsets
    ADD CONSTRAINT trackedentityattributelegendsets_pkey PRIMARY KEY (trackedentityattributeid, sort_order);


--
-- Name: trackedentityattributetranslations trackedentityattributetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributetranslations
    ADD CONSTRAINT trackedentityattributetranslations_pkey PRIMARY KEY (trackedentityattributeid, objecttranslationid);


--
-- Name: trackedentityattributeuseraccesses trackedentityattributeuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeuseraccesses
    ADD CONSTRAINT trackedentityattributeuseraccesses_pkey PRIMARY KEY (trackedentityattributeid, useraccessid);


--
-- Name: trackedentityattributeusergroupaccesses trackedentityattributeusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeusergroupaccesses
    ADD CONSTRAINT trackedentityattributeusergroupaccesses_pkey PRIMARY KEY (trackedentityattributeid, usergroupaccessid);


--
-- Name: trackedentityattributevalue trackedentityattributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributevalue
    ADD CONSTRAINT trackedentityattributevalue_pkey PRIMARY KEY (trackedentityinstanceid, trackedentityattributeid);


--
-- Name: trackedentityattributevalueaudit trackedentityattributevalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributevalueaudit
    ADD CONSTRAINT trackedentityattributevalueaudit_pkey PRIMARY KEY (trackedentityattributevalueauditid);


--
-- Name: trackedentitycomment trackedentitycomment_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitycomment
    ADD CONSTRAINT trackedentitycomment_pkey PRIMARY KEY (trackedentitycommentid);


--
-- Name: trackedentitydataelementdimension trackedentitydataelementdimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydataelementdimension
    ADD CONSTRAINT trackedentitydataelementdimension_pkey PRIMARY KEY (trackedentitydataelementdimensionid);


--
-- Name: trackedentitydatavalue trackedentitydatavalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydatavalue
    ADD CONSTRAINT trackedentitydatavalue_pkey PRIMARY KEY (programstageinstanceid, dataelementid);


--
-- Name: trackedentitydatavalueaudit trackedentitydatavalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydatavalueaudit
    ADD CONSTRAINT trackedentitydatavalueaudit_pkey PRIMARY KEY (trackedentitydatavalueauditid);


--
-- Name: trackedentityinstance trackedentityinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT trackedentityinstance_pkey PRIMARY KEY (trackedentityinstanceid);


--
-- Name: trackedentityinstancefilter trackedentityinstancefilter_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstancefilter
    ADD CONSTRAINT trackedentityinstancefilter_pkey PRIMARY KEY (trackedentityinstancefilterid);


--
-- Name: trackedentityprogramindicatordimension trackedentityprogramindicatordimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityprogramindicatordimension
    ADD CONSTRAINT trackedentityprogramindicatordimension_pkey PRIMARY KEY (trackedentityprogramindicatordimensionid);


--
-- Name: trackedentitytranslations trackedentitytranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytranslations
    ADD CONSTRAINT trackedentitytranslations_pkey PRIMARY KEY (trackedentitytypeid, objecttranslationid);


--
-- Name: trackedentitytype trackedentitytype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytype
    ADD CONSTRAINT trackedentitytype_pkey PRIMARY KEY (trackedentitytypeid);


--
-- Name: trackedentitytypeattribute trackedentitytypeattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattribute
    ADD CONSTRAINT trackedentitytypeattribute_pkey PRIMARY KEY (trackedentitytypeattributeid);


--
-- Name: trackedentitytypeattributevalues trackedentitytypeattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattributevalues
    ADD CONSTRAINT trackedentitytypeattributevalues_pkey PRIMARY KEY (trackedentitytypeid, attributevalueid);


--
-- Name: trackedentitytypeuseraccesses trackedentitytypeuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeuseraccesses
    ADD CONSTRAINT trackedentitytypeuseraccesses_pkey PRIMARY KEY (trackedentitytypeid, useraccessid);


--
-- Name: trackedentitytypeusergroupaccesses trackedentitytypeusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeusergroupaccesses
    ADD CONSTRAINT trackedentitytypeusergroupaccesses_pkey PRIMARY KEY (trackedentitytypeid, usergroupaccessid);


--
-- Name: trackedentitytypeattribute uk_10sblshxcb7dd4qi3s879u35h; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattribute
    ADD CONSTRAINT uk_10sblshxcb7dd4qi3s879u35h UNIQUE (uid);


--
-- Name: validationrule uk_13x63e3skbl5qj4mc1qgq2xex; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT uk_13x63e3skbl5qj4mc1qgq2xex UNIQUE (code);


--
-- Name: orgunitgrouptranslations uk_15y1nx8cgycww2m802kwqqhp0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgrouptranslations
    ADD CONSTRAINT uk_15y1nx8cgycww2m802kwqqhp0 UNIQUE (objecttranslationid);


--
-- Name: analyticsperiodboundary uk_170fo1x2yy848uldft52htkuh; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.analyticsperiodboundary
    ADD CONSTRAINT uk_170fo1x2yy848uldft52htkuh UNIQUE (uid);


--
-- Name: attribute uk_1774shfid1uaopl9tu8am19fq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT uk_1774shfid1uaopl9tu8am19fq UNIQUE (code);


--
-- Name: optionvalue uk_18b68rcofdwt1sbr6rf55poog; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvalue
    ADD CONSTRAINT uk_18b68rcofdwt1sbr6rf55poog UNIQUE (uid);


--
-- Name: chartusergroupaccesses uk_191y3j7pfufwrenbd2h9q3pek; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartusergroupaccesses
    ADD CONSTRAINT uk_191y3j7pfufwrenbd2h9q3pek UNIQUE (usergroupaccessid);


--
-- Name: optiongroupuseraccesses uk_1bfr83at04owfxcj0ihpju132; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupuseraccesses
    ADD CONSTRAINT uk_1bfr83at04owfxcj0ihpju132 UNIQUE (useraccessid);


--
-- Name: mapview uk_1dw8gju4leg7iud4gpsr5r1ng; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT uk_1dw8gju4leg7iud4gpsr5r1ng UNIQUE (uid);


--
-- Name: dataelementcategory uk_1ev6xqtcsfr4wv6rel0lkg44n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategory
    ADD CONSTRAINT uk_1ev6xqtcsfr4wv6rel0lkg44n UNIQUE (uid);


--
-- Name: optiongroupsetmembers uk_1film7lsn5m1wyeku7yh5anfa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetmembers
    ADD CONSTRAINT uk_1film7lsn5m1wyeku7yh5anfa UNIQUE (optiongroupid);


--
-- Name: programruletranslations uk_1ho4mnbv5ukfj4i5cc01vytbc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruletranslations
    ADD CONSTRAINT uk_1ho4mnbv5ukfj4i5cc01vytbc UNIQUE (objecttranslationid);


--
-- Name: report uk_1ie06vhy3begtwuuvrv0f71se; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT uk_1ie06vhy3begtwuuvrv0f71se UNIQUE (uid);


--
-- Name: validationrulegroup uk_1lvk8ftq028jrr28qouou9q3c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroup
    ADD CONSTRAINT uk_1lvk8ftq028jrr28qouou9q3c UNIQUE (code);


--
-- Name: programstageinstancecomments uk_1n7xvxj0jupob5f2v86cv8qer; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstancecomments
    ADD CONSTRAINT uk_1n7xvxj0jupob5f2v86cv8qer UNIQUE (trackedentitycommentid);


--
-- Name: programusergroupaccesses uk_1naq88t24viefq6h7lcx3lbx4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programusergroupaccesses
    ADD CONSTRAINT uk_1naq88t24viefq6h7lcx3lbx4 UNIQUE (usergroupaccessid);


--
-- Name: programmessage uk_1qlw3rts2pog96ye7r6fqd122; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT uk_1qlw3rts2pog96ye7r6fqd122 UNIQUE (uid);


--
-- Name: chart uk_1sp445tglu49hyfwokjqn5bf6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT uk_1sp445tglu49hyfwokjqn5bf6 UNIQUE (uid);


--
-- Name: program uk_1tcaydw2p91wi8ib0qqa1jcfs; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT uk_1tcaydw2p91wi8ib0qqa1jcfs UNIQUE (shortname);


--
-- Name: dataelementgrouptranslations uk_1wvaptfvodonfldfc8cj1wosq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgrouptranslations
    ADD CONSTRAINT uk_1wvaptfvodonfldfc8cj1wosq UNIQUE (objecttranslationid);


--
-- Name: dataelementgroupset uk_1xk8j7j0a3li8o0ukblanosky; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupset
    ADD CONSTRAINT uk_1xk8j7j0a3li8o0ukblanosky UNIQUE (name);


--
-- Name: programstagesection uk_22wt9yk9idujmywno44v9qf66; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection
    ADD CONSTRAINT uk_22wt9yk9idujmywno44v9qf66 UNIQUE (code);


--
-- Name: documentuseraccesses uk_284n4lyg7j1g56mab44dyikvx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentuseraccesses
    ADD CONSTRAINT uk_284n4lyg7j1g56mab44dyikvx UNIQUE (useraccessid);


--
-- Name: categoryoptiongroupattributevalues uk_287ampe6pn4aepyn14hv71907; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupattributevalues
    ADD CONSTRAINT uk_287ampe6pn4aepyn14hv71907 UNIQUE (attributevalueid);


--
-- Name: optiongroupset uk_2boebaetgus89t1k8nn4dac65; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT uk_2boebaetgus89t1k8nn4dac65 UNIQUE (uid);


--
-- Name: dataapprovalleveluseraccesses uk_2dhynycj6yhlt3p2a4lfnxi1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveluseraccesses
    ADD CONSTRAINT uk_2dhynycj6yhlt3p2a4lfnxi1 UNIQUE (useraccessid);


--
-- Name: programstagedataelement uk_2ejl9l5vm4rhtqj8eit31g0u6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT uk_2ejl9l5vm4rhtqj8eit31g0u6 UNIQUE (code);


--
-- Name: i18nlocale uk_2l0ovv74pjtairmeyiwy4i2ui; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.i18nlocale
    ADD CONSTRAINT uk_2l0ovv74pjtairmeyiwy4i2ui UNIQUE (uid);


--
-- Name: dataelement uk_2nhc265rlfu3dlc3qouvjdprl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT uk_2nhc265rlfu3dlc3qouvjdprl UNIQUE (name);


--
-- Name: programsectiontranslations uk_2oimlmrj216imks25sfkw6jh6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsectiontranslations
    ADD CONSTRAINT uk_2oimlmrj216imks25sfkw6jh6 UNIQUE (objecttranslationid);


--
-- Name: programindicatorgroup uk_2p9x16ryxtek0g6bqwd49et0c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroup
    ADD CONSTRAINT uk_2p9x16ryxtek0g6bqwd49et0c UNIQUE (uid);


--
-- Name: programnotificationtemplate uk_2pimmculf9ttu2dxquomb9ram; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT uk_2pimmculf9ttu2dxquomb9ram UNIQUE (uid);


--
-- Name: dataapprovallevel uk_2r18tvmbtksk69j35uxpwej44; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT uk_2r18tvmbtksk69j35uxpwej44 UNIQUE (code);


--
-- Name: indicatorgroupuseraccesses uk_2rwitpm8stv7hpn3jlyc2sagd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupuseraccesses
    ADD CONSTRAINT uk_2rwitpm8stv7hpn3jlyc2sagd UNIQUE (useraccessid);


--
-- Name: userkeyjsonvalue uk_2ubxwwtgyqd0h2mvy46u3prfq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userkeyjsonvalue
    ADD CONSTRAINT uk_2ubxwwtgyqd0h2mvy46u3prfq UNIQUE (code);


--
-- Name: reservedvalue uk_2utuk3clxif3qi4icy859kdrb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reservedvalue
    ADD CONSTRAINT uk_2utuk3clxif3qi4icy859kdrb UNIQUE (ownerobject, owneruid, key, value);


--
-- Name: categoryoptiontranslations uk_30lywefwg093pjkat9w8gm84k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiontranslations
    ADD CONSTRAINT uk_30lywefwg093pjkat9w8gm84k UNIQUE (objecttranslationid);


--
-- Name: legendsetattributevalues uk_35yuroxg610mvtf39u4atl2wv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetattributevalues
    ADD CONSTRAINT uk_35yuroxg610mvtf39u4atl2wv UNIQUE (attributevalueid);


--
-- Name: map uk_37l2m3o1xfuagpki90gfh5kqb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT uk_37l2m3o1xfuagpki90gfh5kqb UNIQUE (code);


--
-- Name: categorycombo uk_3a4ee92kxafw85hsopq4qle47; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombo
    ADD CONSTRAINT uk_3a4ee92kxafw85hsopq4qle47 UNIQUE (code);


--
-- Name: datasetsectiontranslations uk_3a80nwvpu461lotvp07fcnrnc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsectiontranslations
    ADD CONSTRAINT uk_3a80nwvpu461lotvp07fcnrnc UNIQUE (objecttranslationid);


--
-- Name: programruleaction uk_3c2n8db21er764e4skh3qg57w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT uk_3c2n8db21er764e4skh3qg57w UNIQUE (uid);


--
-- Name: validationrulegroup uk_3cl2o6ha8naw5w6my3q4el6gk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroup
    ADD CONSTRAINT uk_3cl2o6ha8naw5w6my3q4el6gk UNIQUE (name);


--
-- Name: categoryoptioncombotranslations uk_3hp6444cqjtn6743ucvhb4e3f; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombotranslations
    ADD CONSTRAINT uk_3hp6444cqjtn6743ucvhb4e3f UNIQUE (objecttranslationid);


--
-- Name: orgunitgroupsettranslations uk_3i6ynfwrt35gl0moamcl5t958; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsettranslations
    ADD CONSTRAINT uk_3i6ynfwrt35gl0moamcl5t958 UNIQUE (objecttranslationid);


--
-- Name: dashboarditem uk_3idqsvkpmxpehxqv615s952vd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT uk_3idqsvkpmxpehxqv615s952vd UNIQUE (uid);


--
-- Name: orgunitgroup uk_3phvecdmy2msmcpitqifpcy3c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT uk_3phvecdmy2msmcpitqifpcy3c UNIQUE (code);


--
-- Name: dataelement uk_3r6dr8m9qwa89afngtr43x9jh; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT uk_3r6dr8m9qwa89afngtr43x9jh UNIQUE (uid);


--
-- Name: dataapprovalworkflow uk_3svwn20y9qda34bmatesg5c0j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT uk_3svwn20y9qda34bmatesg5c0j UNIQUE (code);


--
-- Name: categoryoptiongroupsetusergroupaccesses uk_3tn4w8rs68lpvrdaksbsalta7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT uk_3tn4w8rs68lpvrdaksbsalta7 UNIQUE (usergroupaccessid);


--
-- Name: orgunitgroupsetusergroupaccesses uk_3uh2stfqjquour25m5gjfdroi; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT uk_3uh2stfqjquour25m5gjfdroi UNIQUE (usergroupaccessid);


--
-- Name: trackedentityattributeusergroupaccesses uk_3va2lo93o5x8of9r244sb0ini; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeusergroupaccesses
    ADD CONSTRAINT uk_3va2lo93o5x8of9r244sb0ini UNIQUE (usergroupaccessid);


--
-- Name: programmessage uk_3vgkycs0lsgpxaqtytfijr1ji; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT uk_3vgkycs0lsgpxaqtytfijr1ji UNIQUE (code);


--
-- Name: reporttableuseraccesses uk_3wailhtvswifioim376gn0u9c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableuseraccesses
    ADD CONSTRAINT uk_3wailhtvswifioim376gn0u9c UNIQUE (useraccessid);


--
-- Name: programindicator uk_4372w9f7asbu1ybpduj2xqjmt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT uk_4372w9f7asbu1ybpduj2xqjmt UNIQUE (shortname);


--
-- Name: interpretationuseraccesses uk_46w0ywaj13n29eoi9767grqyc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationuseraccesses
    ADD CONSTRAINT uk_46w0ywaj13n29eoi9767grqyc UNIQUE (useraccessid);


--
-- Name: report uk_478bg522jkn8460hkeshlw1j1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT uk_478bg522jkn8460hkeshlw1j1 UNIQUE (relativeperiodsid);


--
-- Name: program_attribute_group uk_48xfoqrfjnkuay28xeixjm0t0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attribute_group
    ADD CONSTRAINT uk_48xfoqrfjnkuay28xeixjm0t0 UNIQUE (code);


--
-- Name: predictor uk_4b97sdsm2p477cc05eody10lm; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT uk_4b97sdsm2p477cc05eody10lm UNIQUE (name);


--
-- Name: tablehook uk_4bcigh7ivtiraxnhqrg72tldo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.tablehook
    ADD CONSTRAINT uk_4bcigh7ivtiraxnhqrg72tldo UNIQUE (code);


--
-- Name: fileresource uk_4dlqoc6s8ilws9yhacy5qkddb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.fileresource
    ADD CONSTRAINT uk_4dlqoc6s8ilws9yhacy5qkddb UNIQUE (code);


--
-- Name: validationruleusergroupaccesses uk_4edmqjfna3lc6gyjkh1h2a5fo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleusergroupaccesses
    ADD CONSTRAINT uk_4edmqjfna3lc6gyjkh1h2a5fo UNIQUE (usergroupaccessid);


--
-- Name: maplegendsettranslations uk_4gmflcy6at9qdl8q6ae23e7ul; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendsettranslations
    ADD CONSTRAINT uk_4gmflcy6at9qdl8q6ae23e7ul UNIQUE (objecttranslationid);


--
-- Name: trackedentitytype uk_4iylxmooa7ca562qvw4tjq5ys; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytype
    ADD CONSTRAINT uk_4iylxmooa7ca562qvw4tjq5ys UNIQUE (uid);


--
-- Name: userkeyjsonvalue uk_4k3a3mf7dgr4b2btftg5jkmt7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userkeyjsonvalue
    ADD CONSTRAINT uk_4k3a3mf7dgr4b2btftg5jkmt7 UNIQUE (uid);


--
-- Name: program_attribute_group uk_4n6nev8dlydiyu5k8xyjtsasl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attribute_group
    ADD CONSTRAINT uk_4n6nev8dlydiyu5k8xyjtsasl UNIQUE (name);


--
-- Name: programindicatorgroupattributevalues uk_4p7hvngancp6mtolp00nhgqy1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupattributevalues
    ADD CONSTRAINT uk_4p7hvngancp6mtolp00nhgqy1 UNIQUE (attributevalueid);


--
-- Name: dataelementcategoryoption uk_4pi5lfmisrt8un89dnb17xrdy; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT uk_4pi5lfmisrt8un89dnb17xrdy UNIQUE (uid);


--
-- Name: optionsetattributevalues uk_4sfn84gjcjre8ni3ofvhmkkvk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetattributevalues
    ADD CONSTRAINT uk_4sfn84gjcjre8ni3ofvhmkkvk UNIQUE (attributevalueid);


--
-- Name: indicatorgroupsetuseraccesses uk_4t108a6tjlba547s5i5j4vuhe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetuseraccesses
    ADD CONSTRAINT uk_4t108a6tjlba547s5i5j4vuhe UNIQUE (useraccessid);


--
-- Name: indicatorgroupusergroupaccesses uk_4wluhhaibua3a52cts7jnrt5b; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupusergroupaccesses
    ADD CONSTRAINT uk_4wluhhaibua3a52cts7jnrt5b UNIQUE (usergroupaccessid);


--
-- Name: sqlview uk_50aqn6tun6lt4u3ablvdxgoi6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlview
    ADD CONSTRAINT uk_50aqn6tun6lt4u3ablvdxgoi6 UNIQUE (code);


--
-- Name: programstagetranslations uk_50eq5f6ulswj595bxtbuaxa2x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagetranslations
    ADD CONSTRAINT uk_50eq5f6ulswj595bxtbuaxa2x UNIQUE (objecttranslationid);


--
-- Name: categoryoptiongroupsetuseraccesses uk_5159yqcajy9bc6urj5fqpg8q6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetuseraccesses
    ADD CONSTRAINT uk_5159yqcajy9bc6urj5fqpg8q6 UNIQUE (useraccessid);


--
-- Name: eventreporttranslations uk_52uh95pqjaa2q952258f3yixr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreporttranslations
    ADD CONSTRAINT uk_52uh95pqjaa2q952258f3yixr UNIQUE (objecttranslationid);


--
-- Name: dataelementcategoryuseraccesses uk_579c6m0lb755obiwg8ahswans; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryuseraccesses
    ADD CONSTRAINT uk_579c6m0lb755obiwg8ahswans UNIQUE (useraccessid);


--
-- Name: dataapprovalleveltranslations uk_57rc0c2r4unihva4dwydyixy6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveltranslations
    ADD CONSTRAINT uk_57rc0c2r4unihva4dwydyixy6 UNIQUE (objecttranslationid);


--
-- Name: externalmaplayer uk_581ayy658kxytmijcfd2rxnq0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT uk_581ayy658kxytmijcfd2rxnq0 UNIQUE (name);


--
-- Name: programindicator uk_59abitsfd3u0jx4ntrrblven0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT uk_59abitsfd3u0jx4ntrrblven0 UNIQUE (uid);


--
-- Name: userroleuseraccesses uk_5gnagy6dnux0xeucxi4phuyb2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleuseraccesses
    ADD CONSTRAINT uk_5gnagy6dnux0xeucxi4phuyb2 UNIQUE (useraccessid);


--
-- Name: documentattributevalues uk_5iwcc2c18pxom1nom9sxvo22f; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentattributevalues
    ADD CONSTRAINT uk_5iwcc2c18pxom1nom9sxvo22f UNIQUE (attributevalueid);


--
-- Name: orgunitlevel uk_5km0xiwk0dg7pnoru5yfvqsdo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitlevel
    ADD CONSTRAINT uk_5km0xiwk0dg7pnoru5yfvqsdo UNIQUE (uid);


--
-- Name: dataelementcategorytranslations uk_5l04wpj6gft1c4w2qesxygahl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategorytranslations
    ADD CONSTRAINT uk_5l04wpj6gft1c4w2qesxygahl UNIQUE (objecttranslationid);


--
-- Name: mapuseraccesses uk_5mg3p351cswnu4jy7avcoqoo5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapuseraccesses
    ADD CONSTRAINT uk_5mg3p351cswnu4jy7avcoqoo5 UNIQUE (useraccessid);


--
-- Name: dataapprovallevel uk_5mq4bmpyevmr1ddkkopweted1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT uk_5mq4bmpyevmr1ddkkopweted1 UNIQUE (name);


--
-- Name: constantattributevalues uk_5tawpr2nfe6985n4j6f72ic3d; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantattributevalues
    ADD CONSTRAINT uk_5tawpr2nfe6985n4j6f72ic3d UNIQUE (attributevalueid);


--
-- Name: categoryoptioncomboattributevalues uk_5umlmoegw88nokw32ya6aa7y7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncomboattributevalues
    ADD CONSTRAINT uk_5umlmoegw88nokw32ya6aa7y7 UNIQUE (attributevalueid);


--
-- Name: eventchart uk_5w429v9hdlvivan4a69x3ntx5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT uk_5w429v9hdlvivan4a69x3ntx5 UNIQUE (relativeperiodsid);


--
-- Name: categoryoptioncombo uk_60p9gh2un0pb7l9tctfd4o3b3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombo
    ADD CONSTRAINT uk_60p9gh2un0pb7l9tctfd4o3b3 UNIQUE (code);


--
-- Name: usergroupattributevalues uk_61yelmsucg67isxc2habccq57; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupattributevalues
    ADD CONSTRAINT uk_61yelmsucg67isxc2habccq57 UNIQUE (attributevalueid);


--
-- Name: externalmaplayer uk_64w4wa4oc3hkxo86hjo63cd1x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT uk_64w4wa4oc3hkxo86hjo63cd1x UNIQUE (uid);


--
-- Name: orgunitleveltranslations uk_661n81nahaudw4061s1l5m93k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitleveltranslations
    ADD CONSTRAINT uk_661n81nahaudw4061s1l5m93k UNIQUE (objecttranslationid);


--
-- Name: tablehook uk_668dyd20363ufr44a805inegm; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.tablehook
    ADD CONSTRAINT uk_668dyd20363ufr44a805inegm UNIQUE (name);


--
-- Name: eventchart uk_679r4uoqpust6h694bed8nrh9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT uk_679r4uoqpust6h694bed8nrh9 UNIQUE (uid);


--
-- Name: validationruleattributevalues uk_67u5rhhpw3jxqws0uovnpakfq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleattributevalues
    ADD CONSTRAINT uk_67u5rhhpw3jxqws0uovnpakfq UNIQUE (attributevalueid);


--
-- Name: externalmaplayerusergroupaccesses uk_6d4hr4t1x8yyflsr8qo0addv0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayerusergroupaccesses
    ADD CONSTRAINT uk_6d4hr4t1x8yyflsr8qo0addv0 UNIQUE (usergroupaccessid);


--
-- Name: dashboardtranslations uk_6dxu0gan4u81y3b6g53cyg79v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardtranslations
    ADD CONSTRAINT uk_6dxu0gan4u81y3b6g53cyg79v UNIQUE (objecttranslationid);


--
-- Name: eventchart uk_6dyim42vl218i9e9waqrvw36k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT uk_6dyim42vl218i9e9waqrvw36k UNIQUE (code);


--
-- Name: indicatorusergroupaccesses uk_6gnwbmpissx2s1manr6bwxriu; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorusergroupaccesses
    ADD CONSTRAINT uk_6gnwbmpissx2s1manr6bwxriu UNIQUE (usergroupaccessid);


--
-- Name: dataapprovalworkflowusergroupaccesses uk_6hh8abnhp5bf53rgf2r2maxgb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT uk_6hh8abnhp5bf53rgf2r2maxgb UNIQUE (usergroupaccessid);


--
-- Name: optiongroupsetusergroupaccesses uk_6ihtl75oib36uu3ga3k4ngg8p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetusergroupaccesses
    ADD CONSTRAINT uk_6ihtl75oib36uu3ga3k4ngg8p UNIQUE (usergroupaccessid);


--
-- Name: categoryoptiongroupset uk_6itpx2frqt3msln8p32rk7qta; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupset
    ADD CONSTRAINT uk_6itpx2frqt3msln8p32rk7qta UNIQUE (uid);


--
-- Name: colorsettranslations uk_6jn8xf8khu6rigqcqfqfyqds7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorsettranslations
    ADD CONSTRAINT uk_6jn8xf8khu6rigqcqfqfyqds7 UNIQUE (objecttranslationid);


--
-- Name: trackedentitytypeattribute uk_6lycqfymeu4sdi4t3cdh6ul1k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattribute
    ADD CONSTRAINT uk_6lycqfymeu4sdi4t3cdh6ul1k UNIQUE (code);


--
-- Name: optiongroup uk_6ni8qsiimdcy626hwls002flo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT uk_6ni8qsiimdcy626hwls002flo UNIQUE (name);


--
-- Name: mapview uk_6nm3ynkrtuj01bpo1uwcryq06; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT uk_6nm3ynkrtuj01bpo1uwcryq06 UNIQUE (code);


--
-- Name: indicatorattributevalues uk_6sq5y5hpb4kqf2fmas69rql3g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorattributevalues
    ADD CONSTRAINT uk_6sq5y5hpb4kqf2fmas69rql3g UNIQUE (attributevalueid);


--
-- Name: dataelementgroup uk_6x37lph70r5mh15a71pf1tj17; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT uk_6x37lph70r5mh15a71pf1tj17 UNIQUE (shortname);


--
-- Name: dataelementtranslations uk_6yl4auyn51bnkw7d6spla6f8r; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementtranslations
    ADD CONSTRAINT uk_6yl4auyn51bnkw7d6spla6f8r UNIQUE (objecttranslationid);


--
-- Name: users uk_71vrxovabe8x9tom8xwefi3e7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_71vrxovabe8x9tom8xwefi3e7 UNIQUE (code);


--
-- Name: dashboardusergroupaccesses uk_75d35u3n0i5wea6bevn7v6t3l; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardusergroupaccesses
    ADD CONSTRAINT uk_75d35u3n0i5wea6bevn7v6t3l UNIQUE (usergroupaccessid);


--
-- Name: tablehook uk_78x5lua91w1j6upu02wh8pfx9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.tablehook
    ADD CONSTRAINT uk_78x5lua91w1j6upu02wh8pfx9 UNIQUE (uid);


--
-- Name: programindicatorgroup uk_7carnwjb5dtsk6i5dn43wy9ck; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroup
    ADD CONSTRAINT uk_7carnwjb5dtsk6i5dn43wy9ck UNIQUE (name);


--
-- Name: reporttable uk_7if26yibpw5hn2gjsrn2xst0m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT uk_7if26yibpw5hn2gjsrn2xst0m UNIQUE (uid);


--
-- Name: analyticsperiodboundary uk_7jvn836q8s11gi8tcj6vu80f2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.analyticsperiodboundary
    ADD CONSTRAINT uk_7jvn836q8s11gi8tcj6vu80f2 UNIQUE (code);


--
-- Name: validationcriteriatranslations uk_7ltkihrowq1wgkwml7wbdt2c2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteriatranslations
    ADD CONSTRAINT uk_7ltkihrowq1wgkwml7wbdt2c2 UNIQUE (objecttranslationid);


--
-- Name: programrule uk_7odx4uo6s5bg55kt1fxky4a8v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrule
    ADD CONSTRAINT uk_7odx4uo6s5bg55kt1fxky4a8v UNIQUE (code);


--
-- Name: optionvaluetranslations uk_7p4qi3acjaxl4e1n5sg457ukr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvaluetranslations
    ADD CONSTRAINT uk_7p4qi3acjaxl4e1n5sg457ukr UNIQUE (objecttranslationid);


--
-- Name: legendsetuseraccesses uk_7q3ox6ciav6meerfx8p810xq4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetuseraccesses
    ADD CONSTRAINT uk_7q3ox6ciav6meerfx8p810xq4 UNIQUE (useraccessid);


--
-- Name: relationshiptype uk_7rnfvkitq6l0kr5ju2slxopfi; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptype
    ADD CONSTRAINT uk_7rnfvkitq6l0kr5ju2slxopfi UNIQUE (uid);


--
-- Name: reportuseraccesses uk_7s9ykqwrxm1yj8gck13f3vusg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportuseraccesses
    ADD CONSTRAINT uk_7s9ykqwrxm1yj8gck13f3vusg UNIQUE (useraccessid);


--
-- Name: programindicator uk_7udjng39j4ddafjn57r58v7oq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT uk_7udjng39j4ddafjn57r58v7oq UNIQUE (name);


--
-- Name: optionset uk_81gfx3yt7ngwmkk0t8qgcovhi; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionset
    ADD CONSTRAINT uk_81gfx3yt7ngwmkk0t8qgcovhi UNIQUE (uid);


--
-- Name: indicatorgrouptranslations uk_83m22cdu74a60w77dt7d5xc65; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgrouptranslations
    ADD CONSTRAINT uk_83m22cdu74a60w77dt7d5xc65 UNIQUE (objecttranslationid);


--
-- Name: maplegendset uk_842ips1xb81udqc3dw5uax7u5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendset
    ADD CONSTRAINT uk_842ips1xb81udqc3dw5uax7u5 UNIQUE (name);


--
-- Name: colorset_colors uk_84a9xamm9l60e6179ehh35pqj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset_colors
    ADD CONSTRAINT uk_84a9xamm9l60e6179ehh35pqj UNIQUE (colorid);


--
-- Name: programsection uk_84abcabq3so8ktgt726o5du9d; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection
    ADD CONSTRAINT uk_84abcabq3so8ktgt726o5du9d UNIQUE (uid);


--
-- Name: validationnotificationtemplate uk_87wso1e1xtxsl34nxey6nr922; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate
    ADD CONSTRAINT uk_87wso1e1xtxsl34nxey6nr922 UNIQUE (code);


--
-- Name: validationrulegroup uk_8alvmsgu0onl4i0a0sqb6mqx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroup
    ADD CONSTRAINT uk_8alvmsgu0onl4i0a0sqb6mqx UNIQUE (uid);


--
-- Name: relationshiptype uk_8d4xrx2gygb4aivpcwrp613hj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptype
    ADD CONSTRAINT uk_8d4xrx2gygb4aivpcwrp613hj UNIQUE (name);


--
-- Name: indicatortype uk_8dcmrupnoi7hiiom466aoa2y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortype
    ADD CONSTRAINT uk_8dcmrupnoi7hiiom466aoa2y UNIQUE (code);


--
-- Name: mapview uk_8eyremdx683wcd9owh1t5jufs; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT uk_8eyremdx683wcd9owh1t5jufs UNIQUE (relativeperiodsid);


--
-- Name: programindicatoruseraccesses uk_8tntx482dq1xv37o2nurja8el; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatoruseraccesses
    ADD CONSTRAINT uk_8tntx482dq1xv37o2nurja8el UNIQUE (useraccessid);


--
-- Name: externalfileresource uk_8v1lxgqdnnocvm9ah6clxmjf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalfileresource
    ADD CONSTRAINT uk_8v1lxgqdnnocvm9ah6clxmjf UNIQUE (code);


--
-- Name: programindicatorattributevalues uk_90celfj5neh3vkjxvyrct48a8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorattributevalues
    ADD CONSTRAINT uk_90celfj5neh3vkjxvyrct48a8 UNIQUE (attributevalueid);


--
-- Name: dataelement uk_94srnunkibylfaxt4knxfn58e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT uk_94srnunkibylfaxt4knxfn58e UNIQUE (code);


--
-- Name: constantusergroupaccesses uk_9a0eh0b7g9invjjs34nuvntkd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantusergroupaccesses
    ADD CONSTRAINT uk_9a0eh0b7g9invjjs34nuvntkd UNIQUE (usergroupaccessid);


--
-- Name: eventchartuseraccesses uk_9an2md6lmqpube8hr0u3hie8c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartuseraccesses
    ADD CONSTRAINT uk_9an2md6lmqpube8hr0u3hie8c UNIQUE (useraccessid);


--
-- Name: optionsetusergroupaccesses uk_9bk8wrffte75y236jgv1pmp81; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetusergroupaccesses
    ADD CONSTRAINT uk_9bk8wrffte75y236jgv1pmp81 UNIQUE (usergroupaccessid);


--
-- Name: maplegend uk_9csrw908a1fvfwbhjwm0jfl4e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegend
    ADD CONSTRAINT uk_9csrw908a1fvfwbhjwm0jfl4e UNIQUE (uid);


--
-- Name: categoryoptiongroupsettranslations uk_9edhf9afuedxl6qmdi1y9pin9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsettranslations
    ADD CONSTRAINT uk_9edhf9afuedxl6qmdi1y9pin9 UNIQUE (objecttranslationid);


--
-- Name: section uk_9hvlbsw019hscf35xb5behfx9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT uk_9hvlbsw019hscf35xb5behfx9 UNIQUE (code);


--
-- Name: i18nlocale uk_9j6xjgegveyc0uqs506yy2wrp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.i18nlocale
    ADD CONSTRAINT uk_9j6xjgegveyc0uqs506yy2wrp UNIQUE (locale);


--
-- Name: metadataversion uk_9k7bv5o2ut4t0unxcwfyf1ay0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataversion
    ADD CONSTRAINT uk_9k7bv5o2ut4t0unxcwfyf1ay0 UNIQUE (code);


--
-- Name: dataelementgroupsettranslations uk_9llxa96leqj70jlbjtq03frt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsettranslations
    ADD CONSTRAINT uk_9llxa96leqj70jlbjtq03frt UNIQUE (objecttranslationid);


--
-- Name: attribute uk_9mqbhximifdn1n8ru52lan3fw; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT uk_9mqbhximifdn1n8ru52lan3fw UNIQUE (uid);


--
-- Name: chart uk_9nbu5m63pd0n13liu13i3nvb5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT uk_9nbu5m63pd0n13liu13i3nvb5 UNIQUE (relativeperiodsid);


--
-- Name: dataelementuseraccesses uk_9up7rgxw54tb7oqm27geuwu5l; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementuseraccesses
    ADD CONSTRAINT uk_9up7rgxw54tb7oqm27geuwu5l UNIQUE (useraccessid);


--
-- Name: validationrule uk_9ut6k8m3216v5kjcryy7d2y9w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT uk_9ut6k8m3216v5kjcryy7d2y9w UNIQUE (name);


--
-- Name: programstageinstance uk_9ydk6ypaj0xdjoyo1d5asap3m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT uk_9ydk6ypaj0xdjoyo1d5asap3m UNIQUE (code);


--
-- Name: section uk_a50otc0l2chm0heii6scpit4k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT uk_a50otc0l2chm0heii6scpit4k UNIQUE (uid);


--
-- Name: programuseraccesses uk_a888yk2ttuq4bc23fegmew9l6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programuseraccesses
    ADD CONSTRAINT uk_a888yk2ttuq4bc23fegmew9l6 UNIQUE (useraccessid);


--
-- Name: indicatorgroupset uk_actuoxkkqulslxjpj5hagib9r; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupset
    ADD CONSTRAINT uk_actuoxkkqulslxjpj5hagib9r UNIQUE (code);


--
-- Name: trackedentityinstancefilter uk_acvg948kspicwqw3gmg4ehu8i; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstancefilter
    ADD CONSTRAINT uk_acvg948kspicwqw3gmg4ehu8i UNIQUE (code);


--
-- Name: optiongroupset uk_aee54nmg1ci2cpitnpiwa845p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT uk_aee54nmg1ci2cpitnpiwa845p UNIQUE (name);


--
-- Name: optiongroupattributevalues uk_akmuehu0mwreltpnwm1u3fhx9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupattributevalues
    ADD CONSTRAINT uk_akmuehu0mwreltpnwm1u3fhx9 UNIQUE (attributevalueid);


--
-- Name: dataelementgroup uk_aqbaj76r9qxmnylr6p8kj9g37; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT uk_aqbaj76r9qxmnylr6p8kj9g37 UNIQUE (name);


--
-- Name: reportusergroupaccesses uk_asp8ntgg2muwvqbs60qnm1vq7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportusergroupaccesses
    ADD CONSTRAINT uk_asp8ntgg2muwvqbs60qnm1vq7 UNIQUE (usergroupaccessid);


--
-- Name: optionsetuseraccesses uk_aukhdafc8vny241q4cbrs2wq6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetuseraccesses
    ADD CONSTRAINT uk_aukhdafc8vny241q4cbrs2wq6 UNIQUE (useraccessid);


--
-- Name: constant uk_aygjfui3fpgrsxbj6qj782h6f; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT uk_aygjfui3fpgrsxbj6qj782h6f UNIQUE (shortname);


--
-- Name: dataset uk_ayk5ey2r1fh1akknxtpcpyp9r; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT uk_ayk5ey2r1fh1akknxtpcpyp9r UNIQUE (uid);


--
-- Name: dataelementcategory uk_b0ii4jdfy88pffbapohsr2lor; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategory
    ADD CONSTRAINT uk_b0ii4jdfy88pffbapohsr2lor UNIQUE (name);


--
-- Name: reporttable uk_b39cpkfasrbt96274tbaedtmp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT uk_b39cpkfasrbt96274tbaedtmp UNIQUE (relativeperiodsid);


--
-- Name: programstage uk_b3oan3noe4cj9dvyi0amofndv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT uk_b3oan3noe4cj9dvyi0amofndv UNIQUE (uid);


--
-- Name: usergrouptranslations uk_b6xla21a6wx2wiqs3e6693kip; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergrouptranslations
    ADD CONSTRAINT uk_b6xla21a6wx2wiqs3e6693kip UNIQUE (objecttranslationid);


--
-- Name: users uk_badofxhbq3oi2d4u7fj8w1kt8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_badofxhbq3oi2d4u7fj8w1kt8 UNIQUE (openid);


--
-- Name: categoryoptiongroupset uk_bjs0n874pj6eoag98jmeidy9a; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupset
    ADD CONSTRAINT uk_bjs0n874pj6eoag98jmeidy9a UNIQUE (code);


--
-- Name: programindicatorgroupusergroupaccesses uk_bth82tx85qdsby613om1tsnr9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupusergroupaccesses
    ADD CONSTRAINT uk_bth82tx85qdsby613om1tsnr9 UNIQUE (usergroupaccessid);


--
-- Name: externalmaplayeruseraccesses uk_btl6l2mbri9q1u35dwai97tt0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayeruseraccesses
    ADD CONSTRAINT uk_btl6l2mbri9q1u35dwai97tt0 UNIQUE (useraccessid);


--
-- Name: maplegendset uk_bv71u83esume24hp4gsaj5p4f; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendset
    ADD CONSTRAINT uk_bv71u83esume24hp4gsaj5p4f UNIQUE (code);


--
-- Name: dataelementcategoryoptionuseraccesses uk_bwcqkilt9khfpt811w9htm1b4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionuseraccesses
    ADD CONSTRAINT uk_bwcqkilt9khfpt811w9htm1b4 UNIQUE (useraccessid);


--
-- Name: dataapprovalworkflow uk_by4pqq1ans00ffmrgqqh9ehog; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT uk_by4pqq1ans00ffmrgqqh9ehog UNIQUE (uid);


--
-- Name: organisationunitattributevalues uk_c7e1q9b728qh7iki2cvdbpfrb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunitattributevalues
    ADD CONSTRAINT uk_c7e1q9b728qh7iki2cvdbpfrb UNIQUE (attributevalueid);


--
-- Name: dashboarditem uk_c8bnosb06cchme5sig7b54uot; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT uk_c8bnosb06cchme5sig7b54uot UNIQUE (code);


--
-- Name: programmessagetranslations uk_c8f7tvamlax65vajn6px3fync; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessagetranslations
    ADD CONSTRAINT uk_c8f7tvamlax65vajn6px3fync UNIQUE (objecttranslationid);


--
-- Name: trackedentityattributeuseraccesses uk_c8uxqnygua12lrulfoquv3vd0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeuseraccesses
    ADD CONSTRAINT uk_c8uxqnygua12lrulfoquv3vd0 UNIQUE (useraccessid);


--
-- Name: color uk_cbnc5ktj6whhh690w32k8cyh8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT uk_cbnc5ktj6whhh690w32k8cyh8 UNIQUE (code);


--
-- Name: externalfileresource uk_ccwoighljmk4fy165ipnwl5n4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalfileresource
    ADD CONSTRAINT uk_ccwoighljmk4fy165ipnwl5n4 UNIQUE (uid);


--
-- Name: trackedentitytranslations uk_cehuadg72kbcl4c7uofnyvpxp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytranslations
    ADD CONSTRAINT uk_cehuadg72kbcl4c7uofnyvpxp UNIQUE (objecttranslationid);


--
-- Name: constantuseraccesses uk_cnegv6wpnnryw1xxn6mj8t6vn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantuseraccesses
    ADD CONSTRAINT uk_cnegv6wpnnryw1xxn6mj8t6vn UNIQUE (useraccessid);


--
-- Name: indicatoruseraccesses uk_cnl1kh7cridrd0qiq14vjxnn0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatoruseraccesses
    ADD CONSTRAINT uk_cnl1kh7cridrd0qiq14vjxnn0 UNIQUE (useraccessid);


--
-- Name: relationshiptypetranslations uk_cqf1g88wg90e60s9cmxgi48w4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptypetranslations
    ADD CONSTRAINT uk_cqf1g88wg90e60s9cmxgi48w4 UNIQUE (objecttranslationid);


--
-- Name: programindicatorgroupuseraccesses uk_cqq1qrt93p7ek1ux7j60y15nx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupuseraccesses
    ADD CONSTRAINT uk_cqq1qrt93p7ek1ux7j60y15nx UNIQUE (useraccessid);


--
-- Name: programtrackedentityattributegrouptranslations uk_csj1xy12uqpx5cuojxj4gg0ec; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegrouptranslations
    ADD CONSTRAINT uk_csj1xy12uqpx5cuojxj4gg0ec UNIQUE (objecttranslationid);


--
-- Name: datastatistics uk_cswvqawieb2sfq5qsy5wpqp1k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datastatistics
    ADD CONSTRAINT uk_cswvqawieb2sfq5qsy5wpqp1k UNIQUE (code);


--
-- Name: programrulevariable uk_cto4jvd9q49voite13v0egy3i; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT uk_cto4jvd9q49voite13v0egy3i UNIQUE (code);


--
-- Name: sectionattributevalues uk_cx8oyq6i72uyvbx6qtjol9t33; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionattributevalues
    ADD CONSTRAINT uk_cx8oyq6i72uyvbx6qtjol9t33 UNIQUE (attributevalueid);


--
-- Name: programinstance uk_d3lsa2h8me94ksyp53l6rpe3g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance
    ADD CONSTRAINT uk_d3lsa2h8me94ksyp53l6rpe3g UNIQUE (uid);


--
-- Name: maplegendtranslations uk_d3pc3rtqnlkttpxoonieuawoe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendtranslations
    ADD CONSTRAINT uk_d3pc3rtqnlkttpxoonieuawoe UNIQUE (objecttranslationid);


--
-- Name: metadataversion uk_d3qpxp187x8t4c1rsn64crgqu; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataversion
    ADD CONSTRAINT uk_d3qpxp187x8t4c1rsn64crgqu UNIQUE (hashcode);


--
-- Name: externalfileresource uk_d4gp8a84gn643g0r28hdnn4so; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalfileresource
    ADD CONSTRAINT uk_d4gp8a84gn643g0r28hdnn4so UNIQUE (fileresourceid);


--
-- Name: validationcriteria uk_d4l5rkqnmc6qdfa6hh11g3h74; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteria
    ADD CONSTRAINT uk_d4l5rkqnmc6qdfa6hh11g3h74 UNIQUE (name);


--
-- Name: dataelementgroupusergroupaccesses uk_dfbmp0sfgkcpxtwrfw2rejumg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupusergroupaccesses
    ADD CONSTRAINT uk_dfbmp0sfgkcpxtwrfw2rejumg UNIQUE (usergroupaccessid);


--
-- Name: dataentryform uk_dhl0qt8y7hht7krbiym1e9x3n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryform
    ADD CONSTRAINT uk_dhl0qt8y7hht7krbiym1e9x3n UNIQUE (code);


--
-- Name: orgunitgroupuseraccesses uk_dkeswollqsyfxax1eo1yu8yn3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupuseraccesses
    ADD CONSTRAINT uk_dkeswollqsyfxax1eo1yu8yn3 UNIQUE (useraccessid);


--
-- Name: datasettranslations uk_dkimb3gxbm78pgq9b9k2alntp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasettranslations
    ADD CONSTRAINT uk_dkimb3gxbm78pgq9b9k2alntp UNIQUE (objecttranslationid);


--
-- Name: categorycombo uk_dlhi39gmt2e0dun73f04w7w7u; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombo
    ADD CONSTRAINT uk_dlhi39gmt2e0dun73f04w7w7u UNIQUE (uid);


--
-- Name: programindicator uk_do17h5nk71uvc3xjry6kgevj9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT uk_do17h5nk71uvc3xjry6kgevj9 UNIQUE (code);


--
-- Name: systemsetting uk_do99wgsyk5wflbhb937u5av8m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.systemsetting
    ADD CONSTRAINT uk_do99wgsyk5wflbhb937u5av8m UNIQUE (name);


--
-- Name: dataelementusergroupaccesses uk_dq1cneyi4cgarkqaspifgmjqn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementusergroupaccesses
    ADD CONSTRAINT uk_dq1cneyi4cgarkqaspifgmjqn UNIQUE (usergroupaccessid);


--
-- Name: optiongroup uk_dt8m81o2pw5p9ttid369e92bg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT uk_dt8m81o2pw5p9ttid369e92bg UNIQUE (code);


--
-- Name: reporttranslations uk_du8kbb8cr3d31en3uhhdkp2qn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttranslations
    ADD CONSTRAINT uk_du8kbb8cr3d31en3uhhdkp2qn UNIQUE (objecttranslationid);


--
-- Name: validationcriteria uk_dvxv0mw5bonk4pb38o8rctku3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteria
    ADD CONSTRAINT uk_dvxv0mw5bonk4pb38o8rctku3 UNIQUE (uid);


--
-- Name: programrulevariable uk_e5mhmtj1h7xdfiio2panhapgg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT uk_e5mhmtj1h7xdfiio2panhapgg UNIQUE (uid);


--
-- Name: validationruleuseraccesses uk_e5my51xi9bhly2d21ra5w1ir6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleuseraccesses
    ADD CONSTRAINT uk_e5my51xi9bhly2d21ra5w1ir6 UNIQUE (useraccessid);


--
-- Name: programstage uk_e6s6o9jau6tx04m62t7ey4i81; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT uk_e6s6o9jau6tx04m62t7ey4i81 UNIQUE (code);


--
-- Name: trackedentityattributeattributevalues uk_eb7jbyiwhse2kd64y3ufee977; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeattributevalues
    ADD CONSTRAINT uk_eb7jbyiwhse2kd64y3ufee977 UNIQUE (attributevalueid);


--
-- Name: maplegendset uk_ec7ehyocpresxxhm7yjstdnwt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendset
    ADD CONSTRAINT uk_ec7ehyocpresxxhm7yjstdnwt UNIQUE (uid);


--
-- Name: constant uk_edy7cktu2fqg01r3n0fjyk1kk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT uk_edy7cktu2fqg01r3n0fjyk1kk UNIQUE (code);


--
-- Name: users uk_efqukogbk7i0poucwoy2qie74; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_efqukogbk7i0poucwoy2qie74 UNIQUE (uid);


--
-- Name: fileresource uk_eh2epuhchf9mci86ihl06i31g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.fileresource
    ADD CONSTRAINT uk_eh2epuhchf9mci86ihl06i31g UNIQUE (uid);


--
-- Name: trackedentityattribute uk_eh4c3whbwi94nhh772q6l5t7m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT uk_eh4c3whbwi94nhh772q6l5t7m UNIQUE (code);


--
-- Name: organisationunit uk_ehl4v33tq7hlkmc28vbno1b4n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT uk_ehl4v33tq7hlkmc28vbno1b4n UNIQUE (code);


--
-- Name: organisationunittranslations uk_ej46fagundmv2qkhh2hdpn6nt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunittranslations
    ADD CONSTRAINT uk_ej46fagundmv2qkhh2hdpn6nt UNIQUE (objecttranslationid);


--
-- Name: usergroup uk_ekb018cvmpvll5dgtn97leerj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT uk_ekb018cvmpvll5dgtn97leerj UNIQUE (uid);


--
-- Name: document uk_elt3kiqdmmm5fwqfxsxk9lvh0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT uk_elt3kiqdmmm5fwqfxsxk9lvh0 UNIQUE (code);


--
-- Name: keyjsonvalue uk_em6b7qxcas7dn6y506i3nd2x6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.keyjsonvalue
    ADD CONSTRAINT uk_em6b7qxcas7dn6y506i3nd2x6 UNIQUE (uid);


--
-- Name: version uk_emoyyyy114ofh6cwo6do8xsi0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT uk_emoyyyy114ofh6cwo6do8xsi0 UNIQUE (versionkey);


--
-- Name: dashboard uk_emyh4fed0f1kknqhimmrhnek8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT uk_emyh4fed0f1kknqhimmrhnek8 UNIQUE (code);


--
-- Name: optiongrouptranslations uk_en3k8g2rnmf5telm4y4ofoo5t; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongrouptranslations
    ADD CONSTRAINT uk_en3k8g2rnmf5telm4y4ofoo5t UNIQUE (objecttranslationid);


--
-- Name: predictor uk_enhquk04unrpri78inaske3jq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT uk_enhquk04unrpri78inaske3jq UNIQUE (uid);


--
-- Name: dataapprovallevelusergroupaccesses uk_eol69wovoy6rdsf83affs376e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevelusergroupaccesses
    ADD CONSTRAINT uk_eol69wovoy6rdsf83affs376e UNIQUE (usergroupaccessid);


--
-- Name: eventreport uk_eqd95mucf5pd856dqlwe6y36c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT uk_eqd95mucf5pd856dqlwe6y36c UNIQUE (code);


--
-- Name: smscommandspecialcharacters uk_etm1elt7pbwyia8e0kfnrvqo3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandspecialcharacters
    ADD CONSTRAINT uk_etm1elt7pbwyia8e0kfnrvqo3 UNIQUE (specialcharacterid);


--
-- Name: mapviewtranslations uk_evgeam7stb1pn3flp6dsdcu1n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapviewtranslations
    ADD CONSTRAINT uk_evgeam7stb1pn3flp6dsdcu1n UNIQUE (objecttranslationid);


--
-- Name: trackedentityattribute uk_evp7d8obarxt3kewepigkwahc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT uk_evp7d8obarxt3kewepigkwahc UNIQUE (name);


--
-- Name: chart uk_eyke73kujhkth5elabmkpy4ca; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT uk_eyke73kujhkth5elabmkpy4ca UNIQUE (code);


--
-- Name: programindicatorgroup uk_f7wfef3jx1yl73stqs7b45ewb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroup
    ADD CONSTRAINT uk_f7wfef3jx1yl73stqs7b45ewb UNIQUE (code);


--
-- Name: metadataversion uk_f93o7l4afmkassm3t4f2op9ps; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataversion
    ADD CONSTRAINT uk_f93o7l4afmkassm3t4f2op9ps UNIQUE (name);


--
-- Name: programruleaction uk_fbferisvig2o4f5owb5lnygf3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT uk_fbferisvig2o4f5owb5lnygf3 UNIQUE (code);


--
-- Name: eventcharttranslations uk_fead4ax5fg22afjqi0sqld54y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventcharttranslations
    ADD CONSTRAINT uk_fead4ax5fg22afjqi0sqld54y UNIQUE (objecttranslationid);


--
-- Name: userrole uk_ff1da38in40mg91rlgqhw02ff; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT uk_ff1da38in40mg91rlgqhw02ff UNIQUE (uid);


--
-- Name: dataelementcategoryoptionattributevalues uk_ficc46qh952uupa5o04svktv2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionattributevalues
    ADD CONSTRAINT uk_ficc46qh952uupa5o04svktv2 UNIQUE (attributevalueid);


--
-- Name: dataelementgroupattributevalues uk_fokuy0yq9krttmqaf95ne7ql7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupattributevalues
    ADD CONSTRAINT uk_fokuy0yq9krttmqaf95ne7ql7 UNIQUE (attributevalueid);


--
-- Name: sqlview uk_fps2ja521pudngaitlp0805du; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlview
    ADD CONSTRAINT uk_fps2ja521pudngaitlp0805du UNIQUE (uid);


--
-- Name: orgunitgroupset uk_fuentbuhbbr0ix49td9jqlfe5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT uk_fuentbuhbbr0ix49td9jqlfe5 UNIQUE (uid);


--
-- Name: program uk_fuq6kda6folarp19oggaf02vb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT uk_fuq6kda6folarp19oggaf02vb UNIQUE (code);


--
-- Name: orgunitlevel uk_fvgc7isaflcan55g51ysm9df2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitlevel
    ADD CONSTRAINT uk_fvgc7isaflcan55g51ysm9df2 UNIQUE (code);


--
-- Name: colorset uk_fwso2d10icu8j6720w82tywmq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset
    ADD CONSTRAINT uk_fwso2d10icu8j6720w82tywmq UNIQUE (code);


--
-- Name: oauth2client uk_fx3xx9xe0xpurjt6v5p7rv8da; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2client
    ADD CONSTRAINT uk_fx3xx9xe0xpurjt6v5p7rv8da UNIQUE (uid);


--
-- Name: indicatortranslations uk_fyh1cv8231vhm61keusxjw2ao; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortranslations
    ADD CONSTRAINT uk_fyh1cv8231vhm61keusxjw2ao UNIQUE (objecttranslationid);


--
-- Name: organisationunit uk_g1nrfjv5x04ap1ceohiwah380; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT uk_g1nrfjv5x04ap1ceohiwah380 UNIQUE (uid);


--
-- Name: chartuseraccesses uk_g54lkp9a8q5qp4wsfwxg4c7xc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartuseraccesses
    ADD CONSTRAINT uk_g54lkp9a8q5qp4wsfwxg4c7xc UNIQUE (useraccessid);


--
-- Name: categorycombotranslations uk_g6tmqvpobbl4krf8vew12mtbx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombotranslations
    ADD CONSTRAINT uk_g6tmqvpobbl4krf8vew12mtbx UNIQUE (objecttranslationid);


--
-- Name: validationrulegrouptranslations uk_g7h35wi1pucccmk84x4swrpan; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegrouptranslations
    ADD CONSTRAINT uk_g7h35wi1pucccmk84x4swrpan UNIQUE (objecttranslationid);


--
-- Name: dataelementgroupsetusergroupaccesses uk_g7l1v9ghhdmxbyagk6s61ym27; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT uk_g7l1v9ghhdmxbyagk6s61ym27 UNIQUE (usergroupaccessid);


--
-- Name: sqlviewattributevalues uk_gaecdwlqfpvdu516lhl8pu6mk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewattributevalues
    ADD CONSTRAINT uk_gaecdwlqfpvdu516lhl8pu6mk UNIQUE (attributevalueid);


--
-- Name: dataelementcategoryoptionusergroupaccesses uk_gdawhakuh5sgetn8agy2y8iqs; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT uk_gdawhakuh5sgetn8agy2y8iqs UNIQUE (usergroupaccessid);


--
-- Name: oauth2client uk_gdfuf3j66jxnvwwnksjxqysac; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2client
    ADD CONSTRAINT uk_gdfuf3j66jxnvwwnksjxqysac UNIQUE (code);


--
-- Name: categoryoptiongroup uk_ge3y4pf6qlne9p7rfmhlvg941; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT uk_ge3y4pf6qlne9p7rfmhlvg941 UNIQUE (code);


--
-- Name: trackedentityattribute uk_gg9gc0pyaqjuxi8mr4y93i03w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT uk_gg9gc0pyaqjuxi8mr4y93i03w UNIQUE (shortname);


--
-- Name: dataelementcategoryusergroupaccesses uk_gi1od6nead01u7wxu6h10k76j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryusergroupaccesses
    ADD CONSTRAINT uk_gi1od6nead01u7wxu6h10k76j UNIQUE (usergroupaccessid);


--
-- Name: relationshiptype uk_gio4nn8l23jikmebud3jwql43; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptype
    ADD CONSTRAINT uk_gio4nn8l23jikmebud3jwql43 UNIQUE (code);


--
-- Name: userinfo uk_gky85ptfkcumyuqhr5yvjxwsa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT uk_gky85ptfkcumyuqhr5yvjxwsa UNIQUE (code);


--
-- Name: categoryoptiongroupuseraccesses uk_go48ntpyqbmgwa6k6h7756dwv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupuseraccesses
    ADD CONSTRAINT uk_go48ntpyqbmgwa6k6h7756dwv UNIQUE (useraccessid);


--
-- Name: map uk_grp9b5jne53f806pc92sfd5s8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT uk_grp9b5jne53f806pc92sfd5s8 UNIQUE (uid);


--
-- Name: indicatortypetranslations uk_grvgb8y374npfr8m0h33madyb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortypetranslations
    ADD CONSTRAINT uk_grvgb8y374npfr8m0h33madyb UNIQUE (objecttranslationid);


--
-- Name: trackedentityattributetranslations uk_gv9f38ln4a6g59681smmlb0pe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributetranslations
    ADD CONSTRAINT uk_gv9f38ln4a6g59681smmlb0pe UNIQUE (objecttranslationid);


--
-- Name: programstageinstance uk_gy44hufdeduoma7eeh3j6abm7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT uk_gy44hufdeduoma7eeh3j6abm7 UNIQUE (uid);


--
-- Name: userroleusergroupaccesses uk_h3qgkg0gvi3c0ohs07y00c96p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleusergroupaccesses
    ADD CONSTRAINT uk_h3qgkg0gvi3c0ohs07y00c96p UNIQUE (usergroupaccessid);


--
-- Name: program uk_h4omjcs2ktifdrf2m36u886ae; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT uk_h4omjcs2ktifdrf2m36u886ae UNIQUE (uid);


--
-- Name: categorycombo uk_h97pko7n41oky8pfptkflp8l6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombo
    ADD CONSTRAINT uk_h97pko7n41oky8pfptkflp8l6 UNIQUE (name);


--
-- Name: dataelementattributevalues uk_hbpqcltj8paday3y0yystbw6p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementattributevalues
    ADD CONSTRAINT uk_hbpqcltj8paday3y0yystbw6p UNIQUE (attributevalueid);


--
-- Name: userrole uk_hebhkhm8gpwg9xsp8q4f7wlx1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT uk_hebhkhm8gpwg9xsp8q4f7wlx1 UNIQUE (code);


--
-- Name: userrole uk_hjocbvo9fla04bgj7ku32vwsn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT uk_hjocbvo9fla04bgj7ku32vwsn UNIQUE (name);


--
-- Name: attribute uk_hpwum0iq12fs4ej5d0tgy6wsn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT uk_hpwum0iq12fs4ej5d0tgy6wsn UNIQUE (name);


--
-- Name: dataapprovallevel uk_hqekpuhjg3g4k4t7xdnu10jy4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT uk_hqekpuhjg3g4k4t7xdnu10jy4 UNIQUE (orgunitlevel, categoryoptiongroupsetid);


--
-- Name: orgunitgroupset uk_hs57i9hma97ps6jpsrbb24lm9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT uk_hs57i9hma97ps6jpsrbb24lm9 UNIQUE (code);


--
-- Name: attributeusergroupaccesses uk_huqnx8f8tmew3v4c6k8r3krpa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeusergroupaccesses
    ADD CONSTRAINT uk_huqnx8f8tmew3v4c6k8r3krpa UNIQUE (usergroupaccessid);


--
-- Name: dataapprovallevel uk_i1uhc0c8jgxkhlswl9fujsicf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT uk_i1uhc0c8jgxkhlswl9fujsicf UNIQUE (uid);


--
-- Name: maplegend uk_id4stsb5slq35axmjeojnjnoa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegend
    ADD CONSTRAINT uk_id4stsb5slq35axmjeojnjnoa UNIQUE (code);


--
-- Name: programindicatorusergroupaccesses uk_iedn1e511sbiosnic2nb8n6lk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorusergroupaccesses
    ADD CONSTRAINT uk_iedn1e511sbiosnic2nb8n6lk UNIQUE (usergroupaccessid);


--
-- Name: sqlview uk_iedy6hh42wl3gr3m87ntd6so8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlview
    ADD CONSTRAINT uk_iedy6hh42wl3gr3m87ntd6so8 UNIQUE (name);


--
-- Name: jobconfiguration uk_igo4gx1d74k7m93vxnn4n77jf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.jobconfiguration
    ADD CONSTRAINT uk_igo4gx1d74k7m93vxnn4n77jf UNIQUE (code);


--
-- Name: validationrulegroupuseraccesses uk_imfu1rtsu3sh3o0rdkxv0ur6e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupuseraccesses
    ADD CONSTRAINT uk_imfu1rtsu3sh3o0rdkxv0ur6e UNIQUE (useraccessid);


--
-- Name: validationruletranslations uk_it367g8v93jni2b0i1k5gh42u; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruletranslations
    ADD CONSTRAINT uk_it367g8v93jni2b0i1k5gh42u UNIQUE (objecttranslationid);


--
-- Name: messageconversation_usermessages uk_j5pi1qwi2m228qrsxql48o61s; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_usermessages
    ADD CONSTRAINT uk_j5pi1qwi2m228qrsxql48o61s UNIQUE (usermessageid);


--
-- Name: categoryoptiongroup uk_j9oya1t1tvj8yn5h8fega4ltr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT uk_j9oya1t1tvj8yn5h8fega4ltr UNIQUE (name);


--
-- Name: dataelement uk_jc27pe1xeptws5xprct7mgxrj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT uk_jc27pe1xeptws5xprct7mgxrj UNIQUE (shortname);


--
-- Name: orgunitgroupattributevalues uk_jga8ebd6t2nkrfcapucx1wcbq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupattributevalues
    ADD CONSTRAINT uk_jga8ebd6t2nkrfcapucx1wcbq UNIQUE (attributevalueid);


--
-- Name: datasetnotificationtemplate uk_jjt6ctp2xi4d7vtv4pwkkdhh0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotificationtemplate
    ADD CONSTRAINT uk_jjt6ctp2xi4d7vtv4pwkkdhh0 UNIQUE (uid);


--
-- Name: users uk_jkg0r5akwcxtamstsq9kv4t4p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_jkg0r5akwcxtamstsq9kv4t4p UNIQUE (ldapid);


--
-- Name: categorycombouseraccesses uk_jo0xmsdymh9tk882hy994wbce; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombouseraccesses
    ADD CONSTRAINT uk_jo0xmsdymh9tk882hy994wbce UNIQUE (useraccessid);


--
-- Name: dataelementgroup uk_jo65jc3wyrxfekiu3upk80mtr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT uk_jo65jc3wyrxfekiu3upk80mtr UNIQUE (code);


--
-- Name: program_attribute_group uk_ju40npt2p0kglya4e5041b4qc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attribute_group
    ADD CONSTRAINT uk_ju40npt2p0kglya4e5041b4qc UNIQUE (uid);


--
-- Name: sqlviewuseraccesses uk_ju4gh1mla6t217iucr66lx8xp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewuseraccesses
    ADD CONSTRAINT uk_ju4gh1mla6t217iucr66lx8xp UNIQUE (useraccessid);


--
-- Name: document uk_jxodv1lvot26euasttk021jio; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT uk_jxodv1lvot26euasttk021jio UNIQUE (uid);


--
-- Name: fileresource uk_jxqj907hbrng860p6mypvl63k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.fileresource
    ADD CONSTRAINT uk_jxqj907hbrng860p6mypvl63k UNIQUE (storagekey);


--
-- Name: interpretation_comments uk_k48tayhxu52jiq782pikev9d9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation_comments
    ADD CONSTRAINT uk_k48tayhxu52jiq782pikev9d9 UNIQUE (interpretationcommentid);


--
-- Name: trackedentityattribute uk_kbqnrdakcjfooofmti30d4p8x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT uk_kbqnrdakcjfooofmti30d4p8x UNIQUE (uid);


--
-- Name: report uk_kc1wmcky1ooleovi36oqcqmqe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT uk_kc1wmcky1ooleovi36oqcqmqe UNIQUE (code);


--
-- Name: categoryoptiongroupset uk_ke8p30sy68dl7fggednkimdb6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupset
    ADD CONSTRAINT uk_ke8p30sy68dl7fggednkimdb6 UNIQUE (name);


--
-- Name: optiongroupsetuseraccesses uk_kjp8xjq10d0oknphxqmcmev7l; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetuseraccesses
    ADD CONSTRAINT uk_kjp8xjq10d0oknphxqmcmev7l UNIQUE (useraccessid);


--
-- Name: indicatorgroupsetusergroupaccesses uk_kk6o2c0eb5bex4sn1p5n7juu5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT uk_kk6o2c0eb5bex4sn1p5n7juu5 UNIQUE (usergroupaccessid);


--
-- Name: validationrulegroupusergroupaccesses uk_klp41jyfuo6kfe8akt58fk1am; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupusergroupaccesses
    ADD CONSTRAINT uk_klp41jyfuo6kfe8akt58fk1am UNIQUE (usergroupaccessid);


--
-- Name: indicator uk_kmpefoaw81v4bxpoey6y1y3xl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT uk_kmpefoaw81v4bxpoey6y1y3xl UNIQUE (code);


--
-- Name: indicatorgroup uk_kqbwxccoqctky1kdkimjya03s; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroup
    ADD CONSTRAINT uk_kqbwxccoqctky1kdkimjya03s UNIQUE (uid);


--
-- Name: eventchartusergroupaccesses uk_krfvmvcrf3agy0jlmbh7n2kvb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartusergroupaccesses
    ADD CONSTRAINT uk_krfvmvcrf3agy0jlmbh7n2kvb UNIQUE (usergroupaccessid);


--
-- Name: i18nlocale uk_krm9w69donjqsejkmfw17jbcx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.i18nlocale
    ADD CONSTRAINT uk_krm9w69donjqsejkmfw17jbcx UNIQUE (code);


--
-- Name: metadataversion uk_ktwf16f728hce9ahtpmm7w5lx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataversion
    ADD CONSTRAINT uk_ktwf16f728hce9ahtpmm7w5lx UNIQUE (uid);


--
-- Name: categoryoptiongroupusergroupaccesses uk_kw8ong945syafd2310ahwfu9l; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT uk_kw8ong945syafd2310ahwfu9l UNIQUE (usergroupaccessid);


--
-- Name: orgunitgroupsetattributevalues uk_l1cufoqirp2onveti3bpuyo92; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetattributevalues
    ADD CONSTRAINT uk_l1cufoqirp2onveti3bpuyo92 UNIQUE (attributevalueid);


--
-- Name: attributeuseraccesses uk_l78emlqkgkcw0fjtxr7qw3b2u; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeuseraccesses
    ADD CONSTRAINT uk_l78emlqkgkcw0fjtxr7qw3b2u UNIQUE (useraccessid);


--
-- Name: dataapprovalworkflowtranslations uk_la7y8af5ivhtn0atpwu9x4a92; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowtranslations
    ADD CONSTRAINT uk_la7y8af5ivhtn0atpwu9x4a92 UNIQUE (objecttranslationid);


--
-- Name: programattributevalues uk_ldbbgacwc69ab5tha0u7dhg82; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programattributevalues
    ADD CONSTRAINT uk_ldbbgacwc69ab5tha0u7dhg82 UNIQUE (attributevalueid);


--
-- Name: program_attributes uk_lgju00pi2jk7y6sl4dkhaykux; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT uk_lgju00pi2jk7y6sl4dkhaykux UNIQUE (uid);


--
-- Name: reporttabletranslations uk_lgs65dnblcvu4g58r0h4c6fnb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttabletranslations
    ADD CONSTRAINT uk_lgs65dnblcvu4g58r0h4c6fnb UNIQUE (objecttranslationid);


--
-- Name: categoryattributevalues uk_ljt4m18vy284l3hhyq2esj3kr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryattributevalues
    ADD CONSTRAINT uk_ljt4m18vy284l3hhyq2esj3kr UNIQUE (attributevalueid);


--
-- Name: externalnotificationlogentry uk_lner1ovmrqr5qrwn8gwfuhhhn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalnotificationlogentry
    ADD CONSTRAINT uk_lner1ovmrqr5qrwn8gwfuhhhn UNIQUE (uid);


--
-- Name: eventreport uk_lnnx8vmalkhkmneryv1ytjq68; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT uk_lnnx8vmalkhkmneryv1ytjq68 UNIQUE (uid);


--
-- Name: constanttranslations uk_lplte6sid32779w3o6fv26n7t; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constanttranslations
    ADD CONSTRAINT uk_lplte6sid32779w3o6fv26n7t UNIQUE (objecttranslationid);


--
-- Name: categoryoptiongroup uk_lrnagoy2wi83nwmataolh7t6d; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT uk_lrnagoy2wi83nwmataolh7t6d UNIQUE (shortname);


--
-- Name: orgunitgroup uk_lswbn93sime7vmdqqe9lks7ge; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT uk_lswbn93sime7vmdqqe9lks7ge UNIQUE (uid);


--
-- Name: orgunitlevel uk_ltwhby0s0iwayxrcdu6yefeqt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitlevel
    ADD CONSTRAINT uk_ltwhby0s0iwayxrcdu6yefeqt UNIQUE (level);


--
-- Name: dataelementgroupset uk_lu295rc1y01c7p7t76y6ajaas; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupset
    ADD CONSTRAINT uk_lu295rc1y01c7p7t76y6ajaas UNIQUE (uid);


--
-- Name: reporttable uk_lvk31hlxg4sl301nxyt1iupd6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT uk_lvk31hlxg4sl301nxyt1iupd6 UNIQUE (code);


--
-- Name: programinstancecomments uk_lwep604j10w1ey7vunqdmotx2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstancecomments
    ADD CONSTRAINT uk_lwep604j10w1ey7vunqdmotx2 UNIQUE (trackedentitycommentid);


--
-- Name: programstagesection uk_lycal9jdw3cs0wwebxciswwgr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection
    ADD CONSTRAINT uk_lycal9jdw3cs0wwebxciswwgr UNIQUE (uid);


--
-- Name: trackedentityinstancefilter uk_m5k30j5e93n1no82gye7jgf25; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstancefilter
    ADD CONSTRAINT uk_m5k30j5e93n1no82gye7jgf25 UNIQUE (uid);


--
-- Name: validationnotificationtemplate uk_mbt1vxa5exs9cbqqs5px2mopx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate
    ADD CONSTRAINT uk_mbt1vxa5exs9cbqqs5px2mopx UNIQUE (uid);


--
-- Name: externalnotificationlogentry uk_mcn0op3hsf5ajqg5k4oli4xkc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalnotificationlogentry
    ADD CONSTRAINT uk_mcn0op3hsf5ajqg5k4oli4xkc UNIQUE (key);


--
-- Name: optiongroupsettranslations uk_mihkls5oq503326b4dvvf2vas; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsettranslations
    ADD CONSTRAINT uk_mihkls5oq503326b4dvvf2vas UNIQUE (objecttranslationid);


--
-- Name: documenttranslations uk_mkmh30sqxkifqkjihsosae8rm; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documenttranslations
    ADD CONSTRAINT uk_mkmh30sqxkifqkjihsosae8rm UNIQUE (objecttranslationid);


--
-- Name: dataelementcategoryoption uk_mlop2afk26fwowa69lr9a138y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT uk_mlop2afk26fwowa69lr9a138y UNIQUE (code);


--
-- Name: dataapprovalworkflowuseraccesses uk_mn4yowauiafr72rvtkc9kql0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowuseraccesses
    ADD CONSTRAINT uk_mn4yowauiafr72rvtkc9kql0 UNIQUE (useraccessid);


--
-- Name: datasetnotificationtemplate uk_mq0y6uuq2erprg2siebo2mk1o; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotificationtemplate
    ADD CONSTRAINT uk_mq0y6uuq2erprg2siebo2mk1o UNIQUE (code);


--
-- Name: trackedentitytypeattributevalues uk_mrxaf7d00g0p3onf48h0buu49; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattributevalues
    ADD CONSTRAINT uk_mrxaf7d00g0p3onf48h0buu49 UNIQUE (attributevalueid);


--
-- Name: dataentryformtranslations uk_my7leeuqstyx0vtwqtrq4le1c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryformtranslations
    ADD CONSTRAINT uk_my7leeuqstyx0vtwqtrq4le1c UNIQUE (objecttranslationid);


--
-- Name: attributetranslations uk_mykebcm6fpe3o1wtpfgo9tudn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributetranslations
    ADD CONSTRAINT uk_mykebcm6fpe3o1wtpfgo9tudn UNIQUE (objecttranslationid);


--
-- Name: dashboard uk_myox13mr8r27oxl7ts33ntpd5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT uk_myox13mr8r27oxl7ts33ntpd5 UNIQUE (uid);


--
-- Name: dataapprovalworkflow uk_n18s4feicujvngv2ajoesdgio; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT uk_n18s4feicujvngv2ajoesdgio UNIQUE (name);


--
-- Name: indicatorgroupsettranslations uk_n22yq0eqvsg1n7gug43w66udv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsettranslations
    ADD CONSTRAINT uk_n22yq0eqvsg1n7gug43w66udv UNIQUE (objecttranslationid);


--
-- Name: legendsetusergroupaccesses uk_n3kddotvpw0biusai8obu86vn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetusergroupaccesses
    ADD CONSTRAINT uk_n3kddotvpw0biusai8obu86vn UNIQUE (usergroupaccessid);


--
-- Name: charttranslations uk_n3y61d1yoemd783r8mkntt3k1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.charttranslations
    ADD CONSTRAINT uk_n3y61d1yoemd783r8mkntt3k1 UNIQUE (objecttranslationid);


--
-- Name: indicatorgroupset uk_n4xputyk31femiaxls6lbl2rw; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupset
    ADD CONSTRAINT uk_n4xputyk31femiaxls6lbl2rw UNIQUE (uid);


--
-- Name: pushanalysis uk_n5ax669vkj63nx3rrvlushqdm; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysis
    ADD CONSTRAINT uk_n5ax669vkj63nx3rrvlushqdm UNIQUE (code);


--
-- Name: dataelementgroupsetattributevalues uk_n5pg3ur218o4bcvolueafxpf6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetattributevalues
    ADD CONSTRAINT uk_n5pg3ur218o4bcvolueafxpf6 UNIQUE (attributevalueid);


--
-- Name: indicatortype uk_n8mbmryeksa80ucyxj0vg6p9b; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortype
    ADD CONSTRAINT uk_n8mbmryeksa80ucyxj0vg6p9b UNIQUE (name);


--
-- Name: userroletranslations uk_nagn6joav6kgodhdcwirqoklf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroletranslations
    ADD CONSTRAINT uk_nagn6joav6kgodhdcwirqoklf UNIQUE (objecttranslationid);


--
-- Name: usergroupuseraccesses uk_nbkvt8dj4ocmbv8okga2nvop2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupuseraccesses
    ADD CONSTRAINT uk_nbkvt8dj4ocmbv8okga2nvop2 UNIQUE (useraccessid);


--
-- Name: oauth2client uk_ni7epmbxtn4jcax3ya324ff9w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2client
    ADD CONSTRAINT uk_ni7epmbxtn4jcax3ya324ff9w UNIQUE (cid);


--
-- Name: optiongroup uk_nipo7t010a80osh7okxswav2g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT uk_nipo7t010a80osh7okxswav2g UNIQUE (uid);


--
-- Name: dataelementgroupsetuseraccesses uk_nl4hw4ti986dje72b6csrmh3v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetuseraccesses
    ADD CONSTRAINT uk_nl4hw4ti986dje72b6csrmh3v UNIQUE (useraccessid);


--
-- Name: messageconversation_messages uk_nqdtggpr548q0tnbu919puw0p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_messages
    ADD CONSTRAINT uk_nqdtggpr548q0tnbu919puw0p UNIQUE (messageid);


--
-- Name: oauth2client uk_nwgvrevv2slj1bvc9m01p89lf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2client
    ADD CONSTRAINT uk_nwgvrevv2slj1bvc9m01p89lf UNIQUE (name);


--
-- Name: optiongroup uk_nwq3y4xqct21tdl0l77bvmpoe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT uk_nwq3y4xqct21tdl0l77bvmpoe UNIQUE (shortname);


--
-- Name: constant uk_nywvip5682tuvxrnwjomeyg6y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT uk_nywvip5682tuvxrnwjomeyg6y UNIQUE (uid);


--
-- Name: predictor uk_o0v1fdqiyte40ffm9q3nhcj4v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT uk_o0v1fdqiyte40ffm9q3nhcj4v UNIQUE (code);


--
-- Name: constant uk_o2xbcli806eba6dkdfco0o3kc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT uk_o2xbcli806eba6dkdfco0o3kc UNIQUE (name);


--
-- Name: dataset uk_oeni5ndit5g033f1s1j08bdry; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT uk_oeni5ndit5g033f1s1j08bdry UNIQUE (code);


--
-- Name: colorset uk_ofc2a89rccimogdp9ownwcuy1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset
    ADD CONSTRAINT uk_ofc2a89rccimogdp9ownwcuy1 UNIQUE (name);


--
-- Name: categoryoptiongroupsetattributevalues uk_ofiijcq7e2uy7h1ak7h0wtlg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetattributevalues
    ADD CONSTRAINT uk_ofiijcq7e2uy7h1ak7h0wtlg UNIQUE (attributevalueid);


--
-- Name: optionattributevalues uk_ofw2gg6ghv4rkqo24rm9yhpdt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionattributevalues
    ADD CONSTRAINT uk_ofw2gg6ghv4rkqo24rm9yhpdt UNIQUE (attributevalueid);


--
-- Name: sqlviewusergroupaccesses uk_og1fdqhhylbk69fxpoth4bd36; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewusergroupaccesses
    ADD CONSTRAINT uk_og1fdqhhylbk69fxpoth4bd36 UNIQUE (usergroupaccessid);


--
-- Name: eventreportusergroupaccesses uk_oith7i266qbjggmij30psueoo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportusergroupaccesses
    ADD CONSTRAINT uk_oith7i266qbjggmij30psueoo UNIQUE (usergroupaccessid);


--
-- Name: colorset uk_oj2bhkjfgcl9rcwlf579dl1d6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset
    ADD CONSTRAINT uk_oj2bhkjfgcl9rcwlf579dl1d6 UNIQUE (uid);


--
-- Name: categoryoptiongroup uk_ol8n7oq6clgxvqjedlpn85aqo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT uk_ol8n7oq6clgxvqjedlpn85aqo UNIQUE (uid);


--
-- Name: optionsettranslations uk_ootm3uj9gtw6csbv71esyrxfv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsettranslations
    ADD CONSTRAINT uk_ootm3uj9gtw6csbv71esyrxfv UNIQUE (objecttranslationid);


--
-- Name: dataelementgroupuseraccesses uk_opmqksrjv8o98p5bwfhhfapwr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupuseraccesses
    ADD CONSTRAINT uk_opmqksrjv8o98p5bwfhhfapwr UNIQUE (useraccessid);


--
-- Name: orgunitgroupsetuseraccesses uk_oqfck0kamahjps18dep2ogcw1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetuseraccesses
    ADD CONSTRAINT uk_oqfck0kamahjps18dep2ogcw1 UNIQUE (useraccessid);


--
-- Name: trackedentityinstance uk_orq3pwtro2yu9yydh046bn40j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT uk_orq3pwtro2yu9yydh046bn40j UNIQUE (code);


--
-- Name: programstagedataelement uk_os4r1umsvtmbuqm2bo25s5ej0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT uk_os4r1umsvtmbuqm2bo25s5ej0 UNIQUE (uid);


--
-- Name: datasetuseraccesses uk_oso7fghriw7yliyriqw5o9io3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetuseraccesses
    ADD CONSTRAINT uk_oso7fghriw7yliyriqw5o9io3 UNIQUE (useraccessid);


--
-- Name: programnotificationtemplate uk_ot8a05g9d4k5l67xi062xx5w6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT uk_ot8a05g9d4k5l67xi062xx5w6 UNIQUE (code);


--
-- Name: dataelementgroup uk_otvwcgv4bxjtqfj3flhrnmgf7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT uk_otvwcgv4bxjtqfj3flhrnmgf7 UNIQUE (uid);


--
-- Name: dashboarduseraccesses uk_ow5b3iks1dgs1hqimo59fgegl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarduseraccesses
    ADD CONSTRAINT uk_ow5b3iks1dgs1hqimo59fgegl UNIQUE (useraccessid);


--
-- Name: colortranslations uk_owox8geab5xje0ujlsetcaxj4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colortranslations
    ADD CONSTRAINT uk_owox8geab5xje0ujlsetcaxj4 UNIQUE (objecttranslationid);


--
-- Name: indicatortype uk_p0p3bwhgbsdemu14v23p47qne; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortype
    ADD CONSTRAINT uk_p0p3bwhgbsdemu14v23p47qne UNIQUE (uid);


--
-- Name: optionset uk_p0rvldurcmk0x3mx39lt5uvsd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionset
    ADD CONSTRAINT uk_p0rvldurcmk0x3mx39lt5uvsd UNIQUE (name);


--
-- Name: programrule uk_p7arcbl58mmcrj2didtr0ruqh; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrule
    ADD CONSTRAINT uk_p7arcbl58mmcrj2didtr0ruqh UNIQUE (uid);


--
-- Name: dataelementgroupset uk_p7egnv3sj4ugyl23mk4vga40k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupset
    ADD CONSTRAINT uk_p7egnv3sj4ugyl23mk4vga40k UNIQUE (code);


--
-- Name: dataentryform uk_p8tvo9tqrdn5tb45d0g5cko5o; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryform
    ADD CONSTRAINT uk_p8tvo9tqrdn5tb45d0g5cko5o UNIQUE (name);


--
-- Name: categorycombousergroupaccesses uk_p95o4dnytx8vxb7yugxlu2hhf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombousergroupaccesses
    ADD CONSTRAINT uk_p95o4dnytx8vxb7yugxlu2hhf UNIQUE (usergroupaccessid);


--
-- Name: mapusergroupaccesses uk_pag45qp5gr17svxsntj5tjw66; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapusergroupaccesses
    ADD CONSTRAINT uk_pag45qp5gr17svxsntj5tjw66 UNIQUE (usergroupaccessid);


--
-- Name: dataelementcategoryoption uk_pbj3u1nk9vnuof8f47utvowmv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT uk_pbj3u1nk9vnuof8f47utvowmv UNIQUE (name);


--
-- Name: datastatistics uk_ppi146eky8fodu97t1o21vkd8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datastatistics
    ADD CONSTRAINT uk_ppi146eky8fodu97t1o21vkd8 UNIQUE (uid);


--
-- Name: organisationunit uk_pw2bgc9ykjad2obefeqha28t4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT uk_pw2bgc9ykjad2obefeqha28t4 UNIQUE (path);


--
-- Name: dataelementcategory uk_pw87bi64e3ev11k7dwrmljo78; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategory
    ADD CONSTRAINT uk_pw87bi64e3ev11k7dwrmljo78 UNIQUE (code);


--
-- Name: dataentryform uk_q0obvr5rvxhlnjs367y1f0bav; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryform
    ADD CONSTRAINT uk_q0obvr5rvxhlnjs367y1f0bav UNIQUE (uid);


--
-- Name: eventreport uk_q0oyainj1lis9c8kkh5sky2ri; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT uk_q0oyainj1lis9c8kkh5sky2ri UNIQUE (relativeperiodsid);


--
-- Name: usergroup uk_q20sh82vk885ooi7fekwtboej; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT uk_q20sh82vk885ooi7fekwtboej UNIQUE (code);


--
-- Name: userattributevalues uk_q2mhld3431cikld8ocnognnl3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userattributevalues
    ADD CONSTRAINT uk_q2mhld3431cikld8ocnognnl3 UNIQUE (attributevalueid);


--
-- Name: optiongroupusergroupaccesses uk_q5kj01mnv9vystj3dax3a4vc0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupusergroupaccesses
    ADD CONSTRAINT uk_q5kj01mnv9vystj3dax3a4vc0 UNIQUE (usergroupaccessid);


--
-- Name: optiongroupset uk_q9jv2e3fy49hc1havuwnr0res; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT uk_q9jv2e3fy49hc1havuwnr0res UNIQUE (code);


--
-- Name: usergroupusergroupaccesses uk_qa5c4eva4rxafw5b7eyddp64m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupusergroupaccesses
    ADD CONSTRAINT uk_qa5c4eva4rxafw5b7eyddp64m UNIQUE (usergroupaccessid);


--
-- Name: indicatorgroupattributevalues uk_qaqvbi3rmqrmsesdwr2dkltwd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupattributevalues
    ADD CONSTRAINT uk_qaqvbi3rmqrmsesdwr2dkltwd UNIQUE (attributevalueid);


--
-- Name: programstagesectiontranslations uk_qat66cbfwvsqh51auos3ktk0p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesectiontranslations
    ADD CONSTRAINT uk_qat66cbfwvsqh51auos3ktk0p UNIQUE (objecttranslationid);


--
-- Name: interpretationusergroupaccesses uk_qba465kdmkyxal2f05g3f1f94; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationusergroupaccesses
    ADD CONSTRAINT uk_qba465kdmkyxal2f05g3f1f94 UNIQUE (usergroupaccessid);


--
-- Name: categoryoptioncombo uk_qki43s9vdndg15c9tyv718u1j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombo
    ADD CONSTRAINT uk_qki43s9vdndg15c9tyv718u1j UNIQUE (uid);


--
-- Name: i18nlocale uk_qogg9a7yy4qconomxt4j4upql; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.i18nlocale
    ADD CONSTRAINT uk_qogg9a7yy4qconomxt4j4upql UNIQUE (name);


--
-- Name: dataelementcategoryoption uk_qp9201a4m6jl53sei0huh4l6s; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT uk_qp9201a4m6jl53sei0huh4l6s UNIQUE (shortname);


--
-- Name: pushanalysis uk_qunv1hucv9wi5pt92tur929mr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysis
    ADD CONSTRAINT uk_qunv1hucv9wi5pt92tur929mr UNIQUE (uid);


--
-- Name: orgunitgroup uk_qwk9qdapql867enp5r7fa0uic; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT uk_qwk9qdapql867enp5r7fa0uic UNIQUE (name);


--
-- Name: trackedentitytypeuseraccesses uk_qxhx7vgarh0v2w1dxv211knmq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeuseraccesses
    ADD CONSTRAINT uk_qxhx7vgarh0v2w1dxv211knmq UNIQUE (useraccessid);


--
-- Name: orgunitgroupusergroupaccesses uk_r0njvkxgdxior87ay09qxvd4g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupusergroupaccesses
    ADD CONSTRAINT uk_r0njvkxgdxior87ay09qxvd4g UNIQUE (usergroupaccessid);


--
-- Name: program_attributes uk_r2f9o8i6th2w8vqdexdfo72ui; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT uk_r2f9o8i6th2w8vqdexdfo72ui UNIQUE (code);


--
-- Name: externalmaplayer uk_r3ugbbibdsyn234isip3346v4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT uk_r3ugbbibdsyn234isip3346v4 UNIQUE (code);


--
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: validationresult uk_r6ebedjcac8c49c53aa1mpa8e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationresult
    ADD CONSTRAINT uk_r6ebedjcac8c49c53aa1mpa8e UNIQUE (validationruleid, periodid, organisationunitid, attributeoptioncomboid, dayinperiod);


--
-- Name: programstageuseraccesses uk_r6o97x370i5t9lbcico61kxaf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageuseraccesses
    ADD CONSTRAINT uk_r6o97x370i5t9lbcico61kxaf UNIQUE (useraccessid);


--
-- Name: categoryoptiongrouptranslations uk_r7rsiyfyy01l2i21s4y2o6s4i; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongrouptranslations
    ADD CONSTRAINT uk_r7rsiyfyy01l2i21s4y2o6s4i UNIQUE (objecttranslationid);


--
-- Name: trackedentityinstance uk_rbr4kyuk4s0kb4jo1r77cuaq9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT uk_rbr4kyuk4s0kb4jo1r77cuaq9 UNIQUE (uid);


--
-- Name: datasetattributevalues uk_rh1jwubao1t728iys0662k7go; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetattributevalues
    ADD CONSTRAINT uk_rh1jwubao1t728iys0662k7go UNIQUE (attributevalueid);


--
-- Name: jobconfiguration uk_rqkhk3ebvk1kflf7qigbaxeyp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.jobconfiguration
    ADD CONSTRAINT uk_rqkhk3ebvk1kflf7qigbaxeyp UNIQUE (name);


--
-- Name: color uk_rrv70c7ej18sptdwj7h6ac5rv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT uk_rrv70c7ej18sptdwj7h6ac5rv UNIQUE (uid);


--
-- Name: documentusergroupaccesses uk_rtty45gvm30id8sglrlmacatq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentusergroupaccesses
    ADD CONSTRAINT uk_rtty45gvm30id8sglrlmacatq UNIQUE (usergroupaccessid);


--
-- Name: optionset uk_rvfiukug5ui7qidoiln3el3aa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionset
    ADD CONSTRAINT uk_rvfiukug5ui7qidoiln3el3aa UNIQUE (code);


--
-- Name: trackedentitytypeusergroupaccesses uk_s0mt3w36ir8v1ikcmcn1lptxt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeusergroupaccesses
    ADD CONSTRAINT uk_s0mt3w36ir8v1ikcmcn1lptxt UNIQUE (usergroupaccessid);


--
-- Name: datasetusergroupaccesses uk_sc8477b26totcch3j096m2n2y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetusergroupaccesses
    ADD CONSTRAINT uk_sc8477b26totcch3j096m2n2y UNIQUE (usergroupaccessid);


--
-- Name: jobconfiguration uk_sdng31h9qjawcikcllry8a8a5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.jobconfiguration
    ADD CONSTRAINT uk_sdng31h9qjawcikcllry8a8a5 UNIQUE (uid);


--
-- Name: eventreportuseraccesses uk_skg9d1lewqm1qjaduqb3ly1bk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportuseraccesses
    ADD CONSTRAINT uk_skg9d1lewqm1qjaduqb3ly1bk UNIQUE (useraccessid);


--
-- Name: validationcriteria uk_skin40axv0jcme3bhsbb7156i; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteria
    ADD CONSTRAINT uk_skin40axv0jcme3bhsbb7156i UNIQUE (code);


--
-- Name: dashboarditemtranslations uk_sp03w6tda9gyq1724bnm1rdfn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditemtranslations
    ADD CONSTRAINT uk_sp03w6tda9gyq1724bnm1rdfn UNIQUE (objecttranslationid);


--
-- Name: indicatorgroup uk_sspviu4m0l0lf7ef3t3cagfxd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroup
    ADD CONSTRAINT uk_sspviu4m0l0lf7ef3t3cagfxd UNIQUE (code);


--
-- Name: programindicatortranslations uk_swp8dipq45oxtu0ykp3x36frc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatortranslations
    ADD CONSTRAINT uk_swp8dipq45oxtu0ykp3x36frc UNIQUE (objecttranslationid);


--
-- Name: validationrulegroupattributevalues uk_sx94jderpd63be4saekxcbbqr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupattributevalues
    ADD CONSTRAINT uk_sx94jderpd63be4saekxcbbqr UNIQUE (attributevalueid);


--
-- Name: validationrule uk_t0dg39dopew9f6y64ucsx7194; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT uk_t0dg39dopew9f6y64ucsx7194 UNIQUE (uid);


--
-- Name: orgunitgroup uk_t0srkng3akwg3pcp5qlwcx06n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT uk_t0srkng3akwg3pcp5qlwcx06n UNIQUE (shortname);


--
-- Name: orgunitgroupset uk_t5lxvc1km3ylon5st1fuabsgl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT uk_t5lxvc1km3ylon5st1fuabsgl UNIQUE (name);


--
-- Name: programindicatorgrouptranslations uk_t8f0bvwyn7re1pl2cqiqbo5l4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgrouptranslations
    ADD CONSTRAINT uk_t8f0bvwyn7re1pl2cqiqbo5l4 UNIQUE (objecttranslationid);


--
-- Name: smscommandcodes uk_t9e1mnpydje0rsvinxq68q1i6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandcodes
    ADD CONSTRAINT uk_t9e1mnpydje0rsvinxq68q1i6 UNIQUE (codeid);


--
-- Name: indicator uk_ta80keoi67443tkvvmx8l872x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT uk_ta80keoi67443tkvvmx8l872x UNIQUE (uid);


--
-- Name: period uk_tbkbjga8h4j5u33d7hbcuk66t; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT uk_tbkbjga8h4j5u33d7hbcuk66t UNIQUE (periodtypeid, startdate, enddate);


--
-- Name: reporttableusergroupaccesses uk_tbro727eo15qmn3ghlhoyifih; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableusergroupaccesses
    ADD CONSTRAINT uk_tbro727eo15qmn3ghlhoyifih UNIQUE (usergroupaccessid);


--
-- Name: programstageusergroupaccesses uk_tcggvcb1rsd9tlnd1ub7mt0e0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageusergroupaccesses
    ADD CONSTRAINT uk_tcggvcb1rsd9tlnd1ub7mt0e0 UNIQUE (usergroupaccessid);


--
-- Name: programstageattributevalues uk_tcx1w0yoc6k0h8qnagg18eqs6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageattributevalues
    ADD CONSTRAINT uk_tcx1w0yoc6k0h8qnagg18eqs6 UNIQUE (attributevalueid);


--
-- Name: programsection uk_tglbwfy1e3ubt5x5hab46qbh6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection
    ADD CONSTRAINT uk_tglbwfy1e3ubt5x5hab46qbh6 UNIQUE (code);


--
-- Name: trackedentitytype uk_thb8irn2kmm7jay3vcogqxy3x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytype
    ADD CONSTRAINT uk_thb8irn2kmm7jay3vcogqxy3x UNIQUE (name);


--
-- Name: keyjsonvalue uk_tikknlgl0im3w68yvlb0swrgd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.keyjsonvalue
    ADD CONSTRAINT uk_tikknlgl0im3w68yvlb0swrgd UNIQUE (code);


--
-- Name: trackedentitytype uk_to3d8d23u9behgh9acdu2wjvl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytype
    ADD CONSTRAINT uk_to3d8d23u9behgh9acdu2wjvl UNIQUE (code);


--
-- Name: programtranslations uk_wlnk52s02wyg234ugfkngjf5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtranslations
    ADD CONSTRAINT uk_wlnk52s02wyg234ugfkngjf5 UNIQUE (objecttranslationid);


--
-- Name: useraccess useraccess_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.useraccess
    ADD CONSTRAINT useraccess_pkey PRIMARY KEY (useraccessid);


--
-- Name: userapps userapps_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userapps
    ADD CONSTRAINT userapps_pkey PRIMARY KEY (userinfoid, sort_order);


--
-- Name: userattributevalues userattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userattributevalues
    ADD CONSTRAINT userattributevalues_pkey PRIMARY KEY (userinfoid, attributevalueid);


--
-- Name: userdatavieworgunits userdatavieworgunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userdatavieworgunits
    ADD CONSTRAINT userdatavieworgunits_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: usergroup usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT usergroup_pkey PRIMARY KEY (usergroupid);


--
-- Name: usergroupaccess usergroupaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupaccess
    ADD CONSTRAINT usergroupaccess_pkey PRIMARY KEY (usergroupaccessid);


--
-- Name: usergroupattributevalues usergroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupattributevalues
    ADD CONSTRAINT usergroupattributevalues_pkey PRIMARY KEY (usergroupid, attributevalueid);


--
-- Name: usergroupmanaged usergroupmanaged_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupmanaged
    ADD CONSTRAINT usergroupmanaged_pkey PRIMARY KEY (managedbygroupid, managedgroupid);


--
-- Name: usergroupmembers usergroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupmembers
    ADD CONSTRAINT usergroupmembers_pkey PRIMARY KEY (usergroupid, userid);


--
-- Name: usergrouptranslations usergrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergrouptranslations
    ADD CONSTRAINT usergrouptranslations_pkey PRIMARY KEY (usergroupid, objecttranslationid);


--
-- Name: usergroupuseraccesses usergroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupuseraccesses
    ADD CONSTRAINT usergroupuseraccesses_pkey PRIMARY KEY (usergroupid, useraccessid);


--
-- Name: usergroupusergroupaccesses usergroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupusergroupaccesses
    ADD CONSTRAINT usergroupusergroupaccesses_pkey PRIMARY KEY (usergroupid, usergroupaccessid);


--
-- Name: userinfo userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (userinfoid);


--
-- Name: userkeyjsonvalue userkeyjsonvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userkeyjsonvalue
    ADD CONSTRAINT userkeyjsonvalue_pkey PRIMARY KEY (userkeyjsonvalueid);


--
-- Name: userkeyjsonvalue userkeyjsonvalue_unique_key_on_user_and_namespace; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userkeyjsonvalue
    ADD CONSTRAINT userkeyjsonvalue_unique_key_on_user_and_namespace UNIQUE (userid, namespace, userkey);


--
-- Name: usermembership usermembership_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usermembership
    ADD CONSTRAINT usermembership_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: usermessage usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT usermessage_pkey PRIMARY KEY (usermessageid);


--
-- Name: userrole userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT userrole_pkey PRIMARY KEY (userroleid);


--
-- Name: userrolemembers userrolemembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrolemembers
    ADD CONSTRAINT userrolemembers_pkey PRIMARY KEY (userid, userroleid);


--
-- Name: userroletranslations userroletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroletranslations
    ADD CONSTRAINT userroletranslations_pkey PRIMARY KEY (userroleid, objecttranslationid);


--
-- Name: userroleuseraccesses userroleuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleuseraccesses
    ADD CONSTRAINT userroleuseraccesses_pkey PRIMARY KEY (userroleid, useraccessid);


--
-- Name: userroleusergroupaccesses userroleusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleusergroupaccesses
    ADD CONSTRAINT userroleusergroupaccesses_pkey PRIMARY KEY (userroleid, usergroupaccessid);


--
-- Name: users_catdimensionconstraints users_catdimensionconstraints_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users_catdimensionconstraints
    ADD CONSTRAINT users_catdimensionconstraints_pkey PRIMARY KEY (userid, dataelementcategoryid);


--
-- Name: users_cogsdimensionconstraints users_cogsdimensionconstraints_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users_cogsdimensionconstraints
    ADD CONSTRAINT users_cogsdimensionconstraints_pkey PRIMARY KEY (userid, categoryoptiongroupsetid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: usersetting usersetting_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usersetting
    ADD CONSTRAINT usersetting_pkey PRIMARY KEY (userinfoid, name);


--
-- Name: userteisearchorgunits userteisearchorgunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userteisearchorgunits
    ADD CONSTRAINT userteisearchorgunits_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: validationcriteria validationcriteria_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteria
    ADD CONSTRAINT validationcriteria_pkey PRIMARY KEY (validationcriteriaid);


--
-- Name: validationcriteriatranslations validationcriteriatranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteriatranslations
    ADD CONSTRAINT validationcriteriatranslations_pkey PRIMARY KEY (validationcriteriaid, objecttranslationid);


--
-- Name: validationnotificationtemplate validationnotificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate
    ADD CONSTRAINT validationnotificationtemplate_pkey PRIMARY KEY (validationnotificationtemplateid);


--
-- Name: validationnotificationtemplate_recipientusergroups validationnotificationtemplate_recipientusergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate_recipientusergroups
    ADD CONSTRAINT validationnotificationtemplate_recipientusergroups_pkey PRIMARY KEY (validationnotificationtemplateid, usergroupid);


--
-- Name: validationnotificationtemplatevalidationrules validationnotificationtemplatevalidationrules_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplatevalidationrules
    ADD CONSTRAINT validationnotificationtemplatevalidationrules_pkey PRIMARY KEY (validationnotificationtemplateid, validationruleid);


--
-- Name: validationresult validationresult_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationresult
    ADD CONSTRAINT validationresult_pkey PRIMARY KEY (validationresultid);


--
-- Name: validationrule validationrule_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT validationrule_pkey PRIMARY KEY (validationruleid);


--
-- Name: validationruleattributevalues validationruleattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleattributevalues
    ADD CONSTRAINT validationruleattributevalues_pkey PRIMARY KEY (validationruleid, attributevalueid);


--
-- Name: validationrulegroup validationrulegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroup
    ADD CONSTRAINT validationrulegroup_pkey PRIMARY KEY (validationrulegroupid);


--
-- Name: validationrulegroupattributevalues validationrulegroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupattributevalues
    ADD CONSTRAINT validationrulegroupattributevalues_pkey PRIMARY KEY (validationrulegroupid, attributevalueid);


--
-- Name: validationrulegroupmembers validationrulegroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupmembers
    ADD CONSTRAINT validationrulegroupmembers_pkey PRIMARY KEY (validationgroupid, validationruleid);


--
-- Name: validationrulegrouptranslations validationrulegrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegrouptranslations
    ADD CONSTRAINT validationrulegrouptranslations_pkey PRIMARY KEY (validationrulegroupid, objecttranslationid);


--
-- Name: validationrulegroupuseraccesses validationrulegroupuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupuseraccesses
    ADD CONSTRAINT validationrulegroupuseraccesses_pkey PRIMARY KEY (validationrulegroupid, useraccessid);


--
-- Name: validationrulegroupusergroupaccesses validationrulegroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupusergroupaccesses
    ADD CONSTRAINT validationrulegroupusergroupaccesses_pkey PRIMARY KEY (validationrulegroupid, usergroupaccessid);


--
-- Name: validationruletranslations validationruletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruletranslations
    ADD CONSTRAINT validationruletranslations_pkey PRIMARY KEY (validationruleid, objecttranslationid);


--
-- Name: validationruleuseraccesses validationruleuseraccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleuseraccesses
    ADD CONSTRAINT validationruleuseraccesses_pkey PRIMARY KEY (validationruleid, useraccessid);


--
-- Name: validationruleusergroupaccesses validationruleusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleusergroupaccesses
    ADD CONSTRAINT validationruleusergroupaccesses_pkey PRIMARY KEY (validationruleid, usergroupaccessid);


--
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_pkey PRIMARY KEY (versionid);


--
-- Name: version version_versionkey_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_versionkey_key UNIQUE (versionkey);


--
-- Name: id_datavalueaudit_created; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX id_datavalueaudit_created ON public.datavalueaudit USING btree (created);


--
-- Name: in_categoryoptioncombo_name; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_categoryoptioncombo_name ON public.categoryoptioncombo USING btree (name);


--
-- Name: in_dataapprovallevel_level; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_dataapprovallevel_level ON public.dataapprovallevel USING btree (level);


--
-- Name: in_datavalue_deleted; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_datavalue_deleted ON public.datavalue USING btree (deleted);


--
-- Name: in_datavalue_lastupdated; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_datavalue_lastupdated ON public.datavalue USING btree (lastupdated);


--
-- Name: in_datavalueaudit; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_datavalueaudit ON public.datavalueaudit USING btree (dataelementid, periodid, organisationunitid, categoryoptioncomboid, attributeoptioncomboid);


--
-- Name: in_organisationunit_hierarchylevel; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_organisationunit_hierarchylevel ON public.organisationunit USING btree (hierarchylevel);


--
-- Name: in_organisationunit_path; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_organisationunit_path ON public.organisationunit USING btree (path);


--
-- Name: in_parentid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_parentid ON public.organisationunit USING btree (parentid);


--
-- Name: in_programinstance_deleted; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_programinstance_deleted ON public.programinstance USING btree (deleted);


--
-- Name: in_trackedentityattributevalue_attributeid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_trackedentityattributevalue_attributeid ON public.trackedentityattributevalue USING btree (trackedentityattributeid);


--
-- Name: in_trackedentityinstance_deleted; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_trackedentityinstance_deleted ON public.trackedentityinstance USING btree (deleted);


--
-- Name: index_programinstance; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX index_programinstance ON public.programinstance USING btree (programinstanceid);


--
-- Name: index_trackedentitydatavalue_programstageinstanceid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX index_trackedentitydatavalue_programstageinstanceid ON public.trackedentitydatavalue USING btree (programstageinstanceid);


--
-- Name: index_trackedentitydatavalueaudit_programstageinstanceid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX index_trackedentitydatavalueaudit_programstageinstanceid ON public.trackedentitydatavalueaudit USING btree (programstageinstanceid);


--
-- Name: interpretation_lastupdated; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX interpretation_lastupdated ON public.interpretation USING btree (lastupdated);


--
-- Name: maplegend_endvalue; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX maplegend_endvalue ON public.maplegend USING btree (endvalue);


--
-- Name: maplegend_startvalue; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX maplegend_startvalue ON public.maplegend USING btree (startvalue);


--
-- Name: messageconversation_lastmessage; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX messageconversation_lastmessage ON public.messageconversation USING btree (lastmessage);


--
-- Name: outbound_sms_status_index; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX outbound_sms_status_index ON public.outbound_sms USING btree (status);


--
-- Name: programstageinstance_executiondate; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX programstageinstance_executiondate ON public.programstageinstance USING btree (executiondate);


--
-- Name: programstageinstance_organisationunitid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX programstageinstance_organisationunitid ON public.programstageinstance USING btree (organisationunitid);


--
-- Name: programstageinstance_programinstanceid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX programstageinstance_programinstanceid ON public.programstageinstance USING btree (programinstanceid);


--
-- Name: sms_originator_index; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX sms_originator_index ON public.incomingsms USING btree (originator);


--
-- Name: sms_status_index; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX sms_status_index ON public.incomingsms USING btree (status);


--
-- Name: userkeyjsonvalue_user; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX userkeyjsonvalue_user ON public.userkeyjsonvalue USING btree (userid);


--
-- Name: usermessage_isread; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX usermessage_isread ON public.usermessage USING btree (isread);


--
-- Name: usermessage_userid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX usermessage_userid ON public.usermessage USING btree (userid);


--
-- Name: datasetattributevalues fk14vlc8tv4kna36p6qonceo8ma; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetattributevalues
    ADD CONSTRAINT fk14vlc8tv4kna36p6qonceo8ma FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: programstageuseraccesses fk169bwamdcwh0lg6aps61gvmlk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageuseraccesses
    ADD CONSTRAINT fk169bwamdcwh0lg6aps61gvmlk FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: externalmaplayeruseraccesses fk17dg8ly2uqt4ia9s9r2n3ujdw; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayeruseraccesses
    ADD CONSTRAINT fk17dg8ly2uqt4ia9s9r2n3ujdw FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataelementgroupusergroupaccesses fk1nlm1116kc90wbuo78notvb9v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupusergroupaccesses
    ADD CONSTRAINT fk1nlm1116kc90wbuo78notvb9v FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: indicatorlegendsets fk1ps7mt73qi3wnt6f5g6w6flga; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorlegendsets
    ADD CONSTRAINT fk1ps7mt73qi3wnt6f5g6w6flga FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: programstagesectiontranslations fk1swcppe8kkvl6xbm4q47r0gal; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesectiontranslations
    ADD CONSTRAINT fk1swcppe8kkvl6xbm4q47r0gal FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: programindicatorgroupattributevalues fk1ucfah0si2drvdg2k3j9nj2e9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupattributevalues
    ADD CONSTRAINT fk1ucfah0si2drvdg2k3j9nj2e9 FOREIGN KEY (programindicatorgroupid) REFERENCES public.programindicatorgroup(programindicatorgroupid);


--
-- Name: usergroupattributevalues fk25i3g1nx0hyjsim5cybdi73ly; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupattributevalues
    ADD CONSTRAINT fk25i3g1nx0hyjsim5cybdi73ly FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: reporttableusergroupaccesses fk25krkr877ipngidd8k4qkpb38; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableusergroupaccesses
    ADD CONSTRAINT fk25krkr877ipngidd8k4qkpb38 FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reportuseraccesses fk261naj7ctjaktanyq0hv5j9ec; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportuseraccesses
    ADD CONSTRAINT fk261naj7ctjaktanyq0hv5j9ec FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: categoryoptiongroupsetuseraccesses fk27ph3jnjpt5qvqp5xy7adfehn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetuseraccesses
    ADD CONSTRAINT fk27ph3jnjpt5qvqp5xy7adfehn FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataelementcategoryoptionuseraccesses fk2en3xn8maci4icitadrfn0paq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionuseraccesses
    ADD CONSTRAINT fk2en3xn8maci4icitadrfn0paq FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: programuseraccesses fk2hy76oam582siq2tjq2n1dyya; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programuseraccesses
    ADD CONSTRAINT fk2hy76oam582siq2tjq2n1dyya FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: constanttranslations fk2ks20e418jsxjhn02ljypa9tq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constanttranslations
    ADD CONSTRAINT fk2ks20e418jsxjhn02ljypa9tq FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: sqlviewattributevalues fk2n7d98hdtlwjacpfd8f7bnpgy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewattributevalues
    ADD CONSTRAINT fk2n7d98hdtlwjacpfd8f7bnpgy FOREIGN KEY (sqlviewid) REFERENCES public.sqlview(sqlviewid);


--
-- Name: charttranslations fk2n9ay939q2uwmieldeypms4cq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.charttranslations
    ADD CONSTRAINT fk2n9ay939q2uwmieldeypms4cq FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: usergrouptranslations fk2sd8w7egccvxbau38rraunkri; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergrouptranslations
    ADD CONSTRAINT fk2sd8w7egccvxbau38rraunkri FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: programindicatorgroupusergroupaccesses fk2tjsnauyet9p1qwk3nnbo7tm3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupusergroupaccesses
    ADD CONSTRAINT fk2tjsnauyet9p1qwk3nnbo7tm3 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: categorycombousergroupaccesses fk2vbi3ug5jo15ao7pql8ap283j; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombousergroupaccesses
    ADD CONSTRAINT fk2vbi3ug5jo15ao7pql8ap283j FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: optiongroupusergroupaccesses fk2wqhml4htbnncy911df1io95h; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupusergroupaccesses
    ADD CONSTRAINT fk2wqhml4htbnncy911df1io95h FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: categoryoptiongroupattributevalues fk2y3uap3vg76fuvmg2mit64y70; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupattributevalues
    ADD CONSTRAINT fk2y3uap3vg76fuvmg2mit64y70 FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: programmessage_phonenumbers fk3408hwfswvwfqyfngk1tf5ju8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage_phonenumbers
    ADD CONSTRAINT fk3408hwfswvwfqyfngk1tf5ju8 FOREIGN KEY (programmessagephonenumberid) REFERENCES public.programmessage(id);


--
-- Name: dataelementcategoryuseraccesses fk3b6oymmmc1kscrruinyqpdev8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryuseraccesses
    ADD CONSTRAINT fk3b6oymmmc1kscrruinyqpdev8 FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: programmessagetranslations fk3ewb5ew4m1rarec33519cwcsq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessagetranslations
    ADD CONSTRAINT fk3ewb5ew4m1rarec33519cwcsq FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataapprovalworkflowtranslations fk3isuwff5den8kdikhctgye0eo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowtranslations
    ADD CONSTRAINT fk3isuwff5den8kdikhctgye0eo FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: datasetuseraccesses fk3knplmujf5s9xim8b0ji5krt7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetuseraccesses
    ADD CONSTRAINT fk3knplmujf5s9xim8b0ji5krt7 FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: orgunitgroupuseraccesses fk3ko28qvx8nwkvmsvyijpswt6s; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupuseraccesses
    ADD CONSTRAINT fk3ko28qvx8nwkvmsvyijpswt6s FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programindicatortranslations fk3ln0aibaca9diedgu5s8mohbb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatortranslations
    ADD CONSTRAINT fk3ln0aibaca9diedgu5s8mohbb FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: trackedentityattributeattributevalues fk3s1raibq34uci95vn5fqihjbs; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeattributevalues
    ADD CONSTRAINT fk3s1raibq34uci95vn5fqihjbs FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: trackedentityattributeusergroupaccesses fk3tej1kap633bf97p6qdrd7ivi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeusergroupaccesses
    ADD CONSTRAINT fk3tej1kap633bf97p6qdrd7ivi FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: orgunitgroupattributevalues fk3x7f8b9rivyb7mrc7nf2wgn6v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupattributevalues
    ADD CONSTRAINT fk3x7f8b9rivyb7mrc7nf2wgn6v FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: optiongroupsetusergroupaccesses fk40ivchljqy3lak45vpxj1spvq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetusergroupaccesses
    ADD CONSTRAINT fk40ivchljqy3lak45vpxj1spvq FOREIGN KEY (optiongroupsetid) REFERENCES public.optiongroupset(optiongroupsetid);


--
-- Name: sqlviewattributevalues fk445gf30dsp88q10ukoktc675d; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewattributevalues
    ADD CONSTRAINT fk445gf30dsp88q10ukoktc675d FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: programnotificationtemplate_deliverychannel fk45uc7wfpi4u5gunpl127ehkn2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate_deliverychannel
    ADD CONSTRAINT fk45uc7wfpi4u5gunpl127ehkn2 FOREIGN KEY (programnotificationtemplatedeliverychannelid) REFERENCES public.programnotificationtemplate(programnotificationtemplateid);


--
-- Name: dataelementgrouptranslations fk46kfj29g8ql52esjjwvfkelas; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgrouptranslations
    ADD CONSTRAINT fk46kfj29g8ql52esjjwvfkelas FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: trackedentitytranslations fk48oqounwggpawxkgo97qgq42m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytranslations
    ADD CONSTRAINT fk48oqounwggpawxkgo97qgq42m FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: datasetsectiontranslations fk48rkjqk7sell3prjhvgb2wcu0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsectiontranslations
    ADD CONSTRAINT fk48rkjqk7sell3prjhvgb2wcu0 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categoryattributevalues fk4cwq4ysgpr0omhroce0hhw40h; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryattributevalues
    ADD CONSTRAINT fk4cwq4ysgpr0omhroce0hhw40h FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: indicatortypetranslations fk4ddpmtxupf3k972xqi2jmwcnb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortypetranslations
    ADD CONSTRAINT fk4ddpmtxupf3k972xqi2jmwcnb FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataelementtranslations fk4hgup0pvaq2lnb5wl0iqrwty1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementtranslations
    ADD CONSTRAINT fk4hgup0pvaq2lnb5wl0iqrwty1 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: indicatorattributevalues fk4j6haj9rbsdi5mg4h2g9bp5f4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorattributevalues
    ADD CONSTRAINT fk4j6haj9rbsdi5mg4h2g9bp5f4 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: programnotificationtemplate fk4uq2bl31hdu2s4e07rltemk3d; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT fk4uq2bl31hdu2s4e07rltemk3d FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: externalmaplayeruseraccesses fk53xs445txmje6ydbb5lcsg3q2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayeruseraccesses
    ADD CONSTRAINT fk53xs445txmje6ydbb5lcsg3q2 FOREIGN KEY (externalmaplayerid) REFERENCES public.externalmaplayer(externalmaplayerid);


--
-- Name: optionattributevalues fk55kladmsl0xiqpe7b3kfus2kx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionattributevalues
    ADD CONSTRAINT fk55kladmsl0xiqpe7b3kfus2kx FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: interpretationusergroupaccesses fk57fqx6vjg8e4yxdr49rh4e2cg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationusergroupaccesses
    ADD CONSTRAINT fk57fqx6vjg8e4yxdr49rh4e2cg FOREIGN KEY (interpretationid) REFERENCES public.interpretation(interpretationid);


--
-- Name: indicatorgroupuseraccesses fk58p9nvj8c68sjfsc0q27a2xit; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupuseraccesses
    ADD CONSTRAINT fk58p9nvj8c68sjfsc0q27a2xit FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataapprovallevelusergroupaccesses fk5lkioy2ni66gkhk1py1lg2ksk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevelusergroupaccesses
    ADD CONSTRAINT fk5lkioy2ni66gkhk1py1lg2ksk FOREIGN KEY (dataapprovallevelid) REFERENCES public.dataapprovallevel(dataapprovallevelid);


--
-- Name: categoryoptiongroupusergroupaccesses fk5mc47seuei76yjk4pne9xco4y; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT fk5mc47seuei76yjk4pne9xco4y FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: optiongroupsettranslations fk5s4d4l1e7unmm6gholgprl718; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsettranslations
    ADD CONSTRAINT fk5s4d4l1e7unmm6gholgprl718 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataapprovalworkflowusergroupaccesses fk5ueo0ouvw1w8ym3bl5a4gy7jb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT fk5ueo0ouvw1w8ym3bl5a4gy7jb FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: maplegendsettranslations fk5uw9e42m1bbvtvco3u05w7jtg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendsettranslations
    ADD CONSTRAINT fk5uw9e42m1bbvtvco3u05w7jtg FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: orgunitgroupuseraccesses fk670e2rtv9vmfavfqhvew7sq1m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupuseraccesses
    ADD CONSTRAINT fk670e2rtv9vmfavfqhvew7sq1m FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: trackedentitytypeattributevalues fk68hlhkbcb70p0241g1jb98iay; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattributevalues
    ADD CONSTRAINT fk68hlhkbcb70p0241g1jb98iay FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: organisationunittranslations fk6ai10kbk2id10jrjljspsrwsx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunittranslations
    ADD CONSTRAINT fk6ai10kbk2id10jrjljspsrwsx FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: orgunitgroupsetattributevalues fk6eqh97iasvtf9f786haw0fne; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetattributevalues
    ADD CONSTRAINT fk6eqh97iasvtf9f786haw0fne FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: programindicatorgroupuseraccesses fk6hw4ynygmiti256ythmeebnub; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupuseraccesses
    ADD CONSTRAINT fk6hw4ynygmiti256ythmeebnub FOREIGN KEY (programindicatorgroupid) REFERENCES public.programindicatorgroup(programindicatorgroupid);


--
-- Name: validationruleusergroupaccesses fk6irf8ungs18rk05t3whhoqsyn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleusergroupaccesses
    ADD CONSTRAINT fk6irf8ungs18rk05t3whhoqsyn FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: programindicatoruseraccesses fk6l06lsyo0l0d2clfc32fv0n98; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatoruseraccesses
    ADD CONSTRAINT fk6l06lsyo0l0d2clfc32fv0n98 FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: validationnotificationtemplatevalidationrules fk6oepnl7prbw10034c5vot1jii; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplatevalidationrules
    ADD CONSTRAINT fk6oepnl7prbw10034c5vot1jii FOREIGN KEY (validationnotificationtemplateid) REFERENCES public.validationnotificationtemplate(validationnotificationtemplateid);


--
-- Name: legendsetusergroupaccesses fk6q6o2a3x04ku7vfng6c08dl6m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetusergroupaccesses
    ADD CONSTRAINT fk6q6o2a3x04ku7vfng6c08dl6m FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: trackedentityattributeuseraccesses fk6uqjm4icdf9d4j2tjaj7qbkku; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeuseraccesses
    ADD CONSTRAINT fk6uqjm4icdf9d4j2tjaj7qbkku FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: relationshiptypetranslations fk6xa8m39mn0dpitxo4eehwikla; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptypetranslations
    ADD CONSTRAINT fk6xa8m39mn0dpitxo4eehwikla FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: mapuseraccesses fk6yw6wg9dpo1x48nh29ch85ipl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapuseraccesses
    ADD CONSTRAINT fk6yw6wg9dpo1x48nh29ch85ipl FOREIGN KEY (mapid) REFERENCES public.map(mapid);


--
-- Name: orgunitgroupsetuseraccesses fk73nohma99yprhk24ffqvbxm4p; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetuseraccesses
    ADD CONSTRAINT fk73nohma99yprhk24ffqvbxm4p FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programindicatorgroupuseraccesses fk73om9vfg9ar4dyb74g57g6uq8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupuseraccesses
    ADD CONSTRAINT fk73om9vfg9ar4dyb74g57g6uq8 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programtrackedentityattributegrouptranslations fk73s68ejvih451uf1vo0w8wny; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegrouptranslations
    ADD CONSTRAINT fk73s68ejvih451uf1vo0w8wny FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: usergroupuseraccesses fk78yso1e1xehykrg7kunk5xhdr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupuseraccesses
    ADD CONSTRAINT fk78yso1e1xehykrg7kunk5xhdr FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: indicatorgroupusergroupaccesses fk7a1b7xygd4kd7364syo7igha; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupusergroupaccesses
    ADD CONSTRAINT fk7a1b7xygd4kd7364syo7igha FOREIGN KEY (indicatorgroupid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: indicatorgroupattributevalues fk7aq28bhq2xnps53lpjrgchpoo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupattributevalues
    ADD CONSTRAINT fk7aq28bhq2xnps53lpjrgchpoo FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: dataentryformtranslations fk7f289ja52ca48pnmc2are4k2k; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryformtranslations
    ADD CONSTRAINT fk7f289ja52ca48pnmc2are4k2k FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: programindicatorattributevalues fk7foo7k55ee6dko9a0a0jtxavx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorattributevalues
    ADD CONSTRAINT fk7foo7k55ee6dko9a0a0jtxavx FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: constantattributevalues fk7gxwqyqxq8cdxbwpl7unmmi9j; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantattributevalues
    ADD CONSTRAINT fk7gxwqyqxq8cdxbwpl7unmmi9j FOREIGN KEY (constantid) REFERENCES public.constant(constantid);


--
-- Name: dataapprovalworkflowuseraccesses fk7log6kkhhxdl8wbqirtw7rfbg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowuseraccesses
    ADD CONSTRAINT fk7log6kkhhxdl8wbqirtw7rfbg FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataelementuseraccesses fk7onryyh9j4cl5xif3evbji9oo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementuseraccesses
    ADD CONSTRAINT fk7onryyh9j4cl5xif3evbji9oo FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: organisationunitattributevalues fk7utgogpv8n5r4yxm41lhd70i0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunitattributevalues
    ADD CONSTRAINT fk7utgogpv8n5r4yxm41lhd70i0 FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: validationnotificationtemplate_recipientusergroups fk804hp0os62rpdtroxhrrio76v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate_recipientusergroups
    ADD CONSTRAINT fk804hp0os62rpdtroxhrrio76v FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: programattributevalues fk8eefwcsoitkehdl4qbpslnejb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programattributevalues
    ADD CONSTRAINT fk8eefwcsoitkehdl4qbpslnejb FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: dataelementcategoryoptionuseraccesses fk8o4ix9ywdk0gexesm549n4w2e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionuseraccesses
    ADD CONSTRAINT fk8o4ix9ywdk0gexesm549n4w2e FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataelementcategoryusergroupaccesses fk8uk4v6qlon9hw0wlqsnrqj1wy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryusergroupaccesses
    ADD CONSTRAINT fk8uk4v6qlon9hw0wlqsnrqj1wy FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: optionsettranslations fk8vhnmg1g2etu7mbiqjj0f6ajg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsettranslations
    ADD CONSTRAINT fk8vhnmg1g2etu7mbiqjj0f6ajg FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataapprovalworkflowuseraccesses fk90tm9l2djy6bjuimlggl6p2x4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowuseraccesses
    ADD CONSTRAINT fk90tm9l2djy6bjuimlggl6p2x4 FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: legendsetusergroupaccesses fk99kbmh5vouduw7bf7sm6buvbm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetusergroupaccesses
    ADD CONSTRAINT fk99kbmh5vouduw7bf7sm6buvbm FOREIGN KEY (maplegendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: validationrulegroupusergroupaccesses fk9bekfhcd0225ip2lu83ub6hb8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupusergroupaccesses
    ADD CONSTRAINT fk9bekfhcd0225ip2lu83ub6hb8 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: datasetlegendsets fk9f6ich22mw6be835i07khg9ld; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetlegendsets
    ADD CONSTRAINT fk9f6ich22mw6be835i07khg9ld FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: validationrulegroupuseraccesses fk9guu2s1eedfk6du56ouxuvl6m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupuseraccesses
    ADD CONSTRAINT fk9guu2s1eedfk6du56ouxuvl6m FOREIGN KEY (validationrulegroupid) REFERENCES public.validationrulegroup(validationrulegroupid);


--
-- Name: programuseraccesses fk9h3291piptvo283t9lblgnavo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programuseraccesses
    ADD CONSTRAINT fk9h3291piptvo283t9lblgnavo FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programstageattributevalues fk9jqvlhax7y8ea3i2q1qg4m08o; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageattributevalues
    ADD CONSTRAINT fk9jqvlhax7y8ea3i2q1qg4m08o FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: userroletranslations fk9m9l857b29r9ic86qm04sjlmx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroletranslations
    ADD CONSTRAINT fk9m9l857b29r9ic86qm04sjlmx FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: programattributevalues fk9tpnab44tsrxexa47qvr6dnq2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programattributevalues
    ADD CONSTRAINT fk9tpnab44tsrxexa47qvr6dnq2 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: programnotificationtemplate fk9whlsdwfojxbp8yclqolqwm9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT fk9whlsdwfojxbp8yclqolqwm9 FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: datasettranslations fk9y8t03jswqlpw5w6v6en2lgnf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasettranslations
    ADD CONSTRAINT fk9y8t03jswqlpw5w6v6en2lgnf FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: eventchartusergroupaccesses fk9ylyd0xaehcn0gqr8d2stlr5q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartusergroupaccesses
    ADD CONSTRAINT fk9ylyd0xaehcn0gqr8d2stlr5q FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: analyticsperiodboundary fk_analyticsperiodboundary_periodtype; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.analyticsperiodboundary
    ADD CONSTRAINT fk_analyticsperiodboundary_periodtype FOREIGN KEY (offsetperiodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: analyticsperiodboundary fk_analyticsperiodboundary_programindicator; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.analyticsperiodboundary
    ADD CONSTRAINT fk_analyticsperiodboundary_programindicator FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: attribute fk_attribute_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT fk_attribute_optionsetid FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: attribute fk_attribute_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT fk_attribute_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: attributevalue fk_attributevalue_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributevalue
    ADD CONSTRAINT fk_attributevalue_attributeid FOREIGN KEY (attributeid) REFERENCES public.attribute(attributeid);


--
-- Name: trackedentityattributevalue fk_attributevalue_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributevalue
    ADD CONSTRAINT fk_attributevalue_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: trackedentityattributevalue fk_attributevalue_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributevalue
    ADD CONSTRAINT fk_attributevalue_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: trackedentityattributevalueaudit fk_attributevalueaudit_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributevalueaudit
    ADD CONSTRAINT fk_attributevalueaudit_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: trackedentityattributevalueaudit fk_attributevalueaudit_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributevalueaudit
    ADD CONSTRAINT fk_attributevalueaudit_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: categories_categoryoptions fk_categories_categoryoptions_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categories_categoryoptions
    ADD CONSTRAINT fk_categories_categoryoptions_categoryid FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: categories_categoryoptions fk_category_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categories_categoryoptions
    ADD CONSTRAINT fk_category_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: categorycombos_categories fk_categorycombo_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombos_categories
    ADD CONSTRAINT fk_categorycombo_categoryid FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: categorycombos_optioncombos fk_categorycombo_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombos_optioncombos
    ADD CONSTRAINT fk_categorycombo_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: categorycombo fk_categorycombo_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombo
    ADD CONSTRAINT fk_categorycombo_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: categorycombos_categories fk_categorycombos_categories_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombos_categories
    ADD CONSTRAINT fk_categorycombos_categories_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: categorycombos_optioncombos fk_categorycombos_optioncombos_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombos_optioncombos
    ADD CONSTRAINT fk_categorycombos_optioncombos_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: categorydimension fk_categorydimension_category; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorydimension
    ADD CONSTRAINT fk_categorydimension_category FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: categorydimension_items fk_categorydimension_items_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorydimension_items
    ADD CONSTRAINT fk_categorydimension_items_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES public.categorydimension(categorydimensionid);


--
-- Name: categorydimension_items fk_categorydimension_items_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorydimension_items
    ADD CONSTRAINT fk_categorydimension_items_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: categoryoption_organisationunits fk_categoryoption_organisationunits_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoption_organisationunits
    ADD CONSTRAINT fk_categoryoption_organisationunits_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: categoryoption_organisationunits fk_categoryoption_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoption_organisationunits
    ADD CONSTRAINT fk_categoryoption_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: categoryoptioncombos_categoryoptions fk_categoryoptioncombo_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombo_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: categoryoptioncombos_categoryoptions fk_categoryoptioncombos_categoryoptions_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombos_categoryoptions_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: categoryoptiongroup fk_categoryoptiongroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT fk_categoryoptiongroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: categoryoptiongroupmembers fk_categoryoptiongroupmembers_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupmembers
    ADD CONSTRAINT fk_categoryoptiongroupmembers_categoryoptiongroupid FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: categoryoptiongroupmembers fk_categoryoptiongroupmembers_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupmembers
    ADD CONSTRAINT fk_categoryoptiongroupmembers_categoryoptionid FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: categoryoptiongroupset fk_categoryoptiongroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupset
    ADD CONSTRAINT fk_categoryoptiongroupset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: categoryoptiongroupsetmembers fk_categoryoptiongroupsetmembers_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetmembers
    ADD CONSTRAINT fk_categoryoptiongroupsetmembers_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: categoryoptiongroupsetmembers fk_categoryoptiongroupsetmembers_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetmembers
    ADD CONSTRAINT fk_categoryoptiongroupsetmembers_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: chart_categorydimensions fk_chart_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_categorydimensions
    ADD CONSTRAINT fk_chart_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES public.categorydimension(categorydimensionid);


--
-- Name: chart_categorydimensions fk_chart_categorydimensions_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_categorydimensions
    ADD CONSTRAINT fk_chart_categorydimensions_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_categoryoptiongroupsetdimensions fk_chart_catoptiongroupsetdimensions_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_chart_catoptiongroupsetdimensions_chartid FOREIGN KEY (chart) REFERENCES public.chart(chartid);


--
-- Name: chart fk_chart_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT fk_chart_colorsetid FOREIGN KEY (colorsetid) REFERENCES public.colorset(colorsetid);


--
-- Name: chart_datadimensionitems fk_chart_datadimensionitems_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_datadimensionitems
    ADD CONSTRAINT fk_chart_datadimensionitems_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_datadimensionitems fk_chart_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_datadimensionitems
    ADD CONSTRAINT fk_chart_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES public.datadimensionitem(datadimensionitemid);


--
-- Name: chart_categoryoptiongroupsetdimensions fk_chart_dimensions_catoptiongroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_chart_dimensions_catoptiongroupsetdimensionid FOREIGN KEY (categoryoptiongroupsetdimensionid) REFERENCES public.categoryoptiongroupsetdimension(categoryoptiongroupsetdimensionid);


--
-- Name: chart_dataelementgroupsetdimensions fk_chart_dimensions_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_dataelementgroupsetdimensions
    ADD CONSTRAINT fk_chart_dimensions_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_dataelementgroupsetdimensions fk_chart_dimensions_dataelementgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_dataelementgroupsetdimensions
    ADD CONSTRAINT fk_chart_dimensions_dataelementgroupsetdimensionid FOREIGN KEY (dataelementgroupsetdimensionid) REFERENCES public.dataelementgroupsetdimension(dataelementgroupsetdimensionid);


--
-- Name: chart_orgunitgroupsetdimensions fk_chart_dimensions_ogunitgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_chart_dimensions_ogunitgroupsetdimensionid FOREIGN KEY (orgunitgroupsetdimensionid) REFERENCES public.orgunitgroupsetdimension(orgunitgroupsetdimensionid);


--
-- Name: chart_itemorgunitgroups fk_chart_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_itemorgunitgroups
    ADD CONSTRAINT fk_chart_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: chart_itemorgunitgroups fk_chart_itemorgunitunitgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_itemorgunitgroups
    ADD CONSTRAINT fk_chart_itemorgunitunitgroups_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart fk_chart_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT fk_chart_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: chart_organisationunits fk_chart_organisationunits_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_organisationunits
    ADD CONSTRAINT fk_chart_organisationunits_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_organisationunits fk_chart_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_organisationunits
    ADD CONSTRAINT fk_chart_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: chart_orgunitgroupsetdimensions fk_chart_orgunitgroupsetdimensions_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_chart_orgunitgroupsetdimensions_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_orgunitlevels fk_chart_orgunitlevels_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_orgunitlevels
    ADD CONSTRAINT fk_chart_orgunitlevels_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_periods fk_chart_periods_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_periods
    ADD CONSTRAINT fk_chart_periods_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: chart_periods fk_chart_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_periods
    ADD CONSTRAINT fk_chart_periods_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: chart fk_chart_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT fk_chart_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES public.relativeperiods(relativeperiodsid);


--
-- Name: chart fk_chart_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT fk_chart_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: colorset_colors fk_colorset_colors_colorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset_colors
    ADD CONSTRAINT fk_colorset_colors_colorid FOREIGN KEY (colorid) REFERENCES public.color(colorid);


--
-- Name: colorset_colors fk_colorset_colors_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset_colors
    ADD CONSTRAINT fk_colorset_colors_colorsetid FOREIGN KEY (colorsetid) REFERENCES public.colorset(colorsetid);


--
-- Name: completedatasetregistration fk_completedatasetregistration_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.completedatasetregistration
    ADD CONSTRAINT fk_completedatasetregistration_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: completedatasetregistration fk_completedatasetregistration_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.completedatasetregistration
    ADD CONSTRAINT fk_completedatasetregistration_organisationunitid FOREIGN KEY (sourceid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: configuration_corswhitelist fk_configuration_corswhitelist; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration_corswhitelist
    ADD CONSTRAINT fk_configuration_corswhitelist FOREIGN KEY (configurationid) REFERENCES public.configuration(configurationid);


--
-- Name: configuration fk_configuration_feedback_recipients; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_feedback_recipients FOREIGN KEY (feedbackrecipientsid) REFERENCES public.usergroup(usergroupid);


--
-- Name: configuration fk_configuration_infrastructural_dataelements; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_infrastructural_dataelements FOREIGN KEY (infrastructuraldataelementsid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: configuration fk_configuration_infrastructural_indicators; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_infrastructural_indicators FOREIGN KEY (infrastructuralindicatorsid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: configuration fk_configuration_infrastructural_periodtype; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_infrastructural_periodtype FOREIGN KEY (infrastructuralperiodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: configuration fk_configuration_offline_orgunit_level; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_offline_orgunit_level FOREIGN KEY (offlineorgunitlevelid) REFERENCES public.orgunitlevel(orgunitlevelid);


--
-- Name: configuration fk_configuration_selfregistrationorgunit; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_selfregistrationorgunit FOREIGN KEY (selfregistrationorgunit) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: configuration fk_configuration_selfregistrationrole; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT fk_configuration_selfregistrationrole FOREIGN KEY (selfregistrationrole) REFERENCES public.userrole(userroleid);


--
-- Name: constant fk_constant_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT fk_constant_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dashboard_items fk_dashboard_items_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard_items
    ADD CONSTRAINT fk_dashboard_items_dashboardid FOREIGN KEY (dashboardid) REFERENCES public.dashboard(dashboardid);


--
-- Name: dashboard_items fk_dashboard_items_dashboarditemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard_items
    ADD CONSTRAINT fk_dashboard_items_dashboarditemid FOREIGN KEY (dashboarditemid) REFERENCES public.dashboarditem(dashboarditemid);


--
-- Name: dashboard fk_dashboard_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT fk_dashboard_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dashboarditem fk_dashboarditem_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT fk_dashboarditem_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: dashboarditem fk_dashboarditem_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT fk_dashboarditem_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: dashboarditem fk_dashboarditem_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT fk_dashboarditem_eventreportid FOREIGN KEY (eventreport) REFERENCES public.eventreport(eventreportid);


--
-- Name: dashboarditem fk_dashboarditem_mapid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT fk_dashboarditem_mapid FOREIGN KEY (mapid) REFERENCES public.map(mapid);


--
-- Name: dashboarditem_reports fk_dashboarditem_reports_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_reports
    ADD CONSTRAINT fk_dashboarditem_reports_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES public.dashboarditem(dashboarditemid);


--
-- Name: dashboarditem_reports fk_dashboarditem_reports_reportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_reports
    ADD CONSTRAINT fk_dashboarditem_reports_reportid FOREIGN KEY (reportid) REFERENCES public.report(reportid);


--
-- Name: dashboarditem fk_dashboarditem_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT fk_dashboarditem_reporttableid FOREIGN KEY (reporttable) REFERENCES public.reporttable(reporttableid);


--
-- Name: dashboarditem_resources fk_dashboarditem_resources_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_resources
    ADD CONSTRAINT fk_dashboarditem_resources_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES public.dashboarditem(dashboarditemid);


--
-- Name: dashboarditem_resources fk_dashboarditem_resources_resourceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_resources
    ADD CONSTRAINT fk_dashboarditem_resources_resourceid FOREIGN KEY (resourceid) REFERENCES public.document(documentid);


--
-- Name: dashboarditem_users fk_dashboarditem_users_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_users
    ADD CONSTRAINT fk_dashboarditem_users_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES public.dashboarditem(dashboarditemid);


--
-- Name: dashboarditem_users fk_dashboarditem_users_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem_users
    ADD CONSTRAINT fk_dashboarditem_users_userinfoid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapproval fk_dataapproval_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT fk_dataapproval_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: dataapproval fk_dataapproval_creator; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT fk_dataapproval_creator FOREIGN KEY (creator) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapprovalaudit fk_dataapproval_creator; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT fk_dataapproval_creator FOREIGN KEY (creator) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapproval fk_dataapproval_dataapprovallevel; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT fk_dataapproval_dataapprovallevel FOREIGN KEY (dataapprovallevelid) REFERENCES public.dataapprovallevel(dataapprovallevelid);


--
-- Name: dataapproval fk_dataapproval_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT fk_dataapproval_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: dataapproval fk_dataapproval_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT fk_dataapproval_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: dataapproval fk_dataapproval_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapproval
    ADD CONSTRAINT fk_dataapproval_workflowid FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: dataapprovalaudit fk_dataapprovalaudit_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT fk_dataapprovalaudit_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: dataapprovalaudit fk_dataapprovalaudit_levelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT fk_dataapprovalaudit_levelid FOREIGN KEY (levelid) REFERENCES public.dataapprovallevel(dataapprovallevelid);


--
-- Name: dataapprovalaudit fk_dataapprovalaudit_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT fk_dataapprovalaudit_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: dataapprovalaudit fk_dataapprovalaudit_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT fk_dataapprovalaudit_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: dataapprovalaudit fk_dataapprovalaudit_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalaudit
    ADD CONSTRAINT fk_dataapprovalaudit_workflowid FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: dataapprovallevel fk_dataapprovallevel_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT fk_dataapprovallevel_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: dataapprovallevel fk_dataapprovallevel_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT fk_dataapprovallevel_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapprovalworkflow fk_dataapprovalworkflow_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: dataapprovalworkflow fk_dataapprovalworkflow_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: dataapprovalworkflow fk_dataapprovalworkflow_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapprovalworkflowlevels fk_dataapprovalworkflowlevels_levelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowlevels
    ADD CONSTRAINT fk_dataapprovalworkflowlevels_levelid FOREIGN KEY (dataapprovallevelid) REFERENCES public.dataapprovallevel(dataapprovallevelid);


--
-- Name: dataapprovalworkflowlevels fk_dataapprovalworkflowlevels_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowlevels
    ADD CONSTRAINT fk_dataapprovalworkflowlevels_workflowid FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: datadimensionitem fk_datadimensionitem_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: datadimensionitem fk_datadimensionitem_dataelementoperand_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementoperand_categoryoptioncomboid FOREIGN KEY (dataelementoperand_categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: datadimensionitem fk_datadimensionitem_dataelementoperand_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementoperand_dataelementid FOREIGN KEY (dataelementoperand_dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: datadimensionitem fk_datadimensionitem_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datadimensionitem fk_datadimensionitem_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_indicatorid FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: datadimensionitem fk_datadimensionitem_programattribute_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programattribute_attributeid FOREIGN KEY (programattribute_attributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: datadimensionitem fk_datadimensionitem_programattribute_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programattribute_programid FOREIGN KEY (programattribute_programid) REFERENCES public.program(programid);


--
-- Name: datadimensionitem fk_datadimensionitem_programdataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programdataelement_dataelementid FOREIGN KEY (programdataelement_dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: datadimensionitem fk_datadimensionitem_programdataelement_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programdataelement_programid FOREIGN KEY (programdataelement_programid) REFERENCES public.program(programid);


--
-- Name: datadimensionitem fk_datadimensionitem_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: dataelement fk_dataelement_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT fk_dataelement_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: dataelement fk_dataelement_commentoptionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT fk_dataelement_commentoptionsetid FOREIGN KEY (commentoptionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: smscodes fk_dataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscodes
    ADD CONSTRAINT fk_dataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataelementlegendsets fk_dataelement_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementlegendsets
    ADD CONSTRAINT fk_dataelement_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: dataelement fk_dataelement_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT fk_dataelement_optionsetid FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: dataelement fk_dataelement_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT fk_dataelement_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementaggregationlevels fk_dataelementaggregationlevels_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementaggregationlevels
    ADD CONSTRAINT fk_dataelementaggregationlevels_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataelementcategory fk_dataelementcategory_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategory
    ADD CONSTRAINT fk_dataelementcategory_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementcategoryoption fk_dataelementcategoryoption_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT fk_dataelementcategoryoption_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementgroupmembers fk_dataelementgroup_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupmembers
    ADD CONSTRAINT fk_dataelementgroup_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataelementgroup fk_dataelementgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT fk_dataelementgroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementgroupmembers fk_dataelementgroupmembers_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupmembers
    ADD CONSTRAINT fk_dataelementgroupmembers_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: dataelementgroupsetmembers fk_dataelementgroupset_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetmembers
    ADD CONSTRAINT fk_dataelementgroupset_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: dataelementgroupset fk_dataelementgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupset
    ADD CONSTRAINT fk_dataelementgroupset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementgroupsetmembers fk_dataelementgroupsetmembers_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetmembers
    ADD CONSTRAINT fk_dataelementgroupsetmembers_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES public.dataelementgroupset(dataelementgroupsetid);


--
-- Name: dataelementoperand fk_dataelementoperand_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementoperand
    ADD CONSTRAINT fk_dataelementoperand_dataelement FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataelementoperand fk_dataelementoperand_dataelementcategoryoptioncombo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementoperand
    ADD CONSTRAINT fk_dataelementoperand_dataelementcategoryoptioncombo FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: datainputperiod fk_datainputperiod_period; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datainputperiod
    ADD CONSTRAINT fk_datainputperiod_period FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: dataset fk_dataset_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_dataset_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: datasetoperands fk_dataset_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetoperands
    ADD CONSTRAINT fk_dataset_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES public.dataelementoperand(dataelementoperandid);


--
-- Name: dataset fk_dataset_dataentryform; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_dataset_dataentryform FOREIGN KEY (dataentryform) REFERENCES public.dataentryform(dataentryformid);


--
-- Name: smscommands fk_dataset_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommands
    ADD CONSTRAINT fk_dataset_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datasetindicators fk_dataset_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetindicators
    ADD CONSTRAINT fk_dataset_indicatorid FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: datasetlegendsets fk_dataset_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetlegendsets
    ADD CONSTRAINT fk_dataset_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: dataset fk_dataset_notificationrecipients; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_dataset_notificationrecipients FOREIGN KEY (notificationrecipients) REFERENCES public.usergroup(usergroupid);


--
-- Name: datasetsource fk_dataset_organisationunit; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsource
    ADD CONSTRAINT fk_dataset_organisationunit FOREIGN KEY (sourceid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: dataset fk_dataset_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_dataset_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: dataset fk_dataset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_dataset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataset fk_dataset_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_dataset_workflowid FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: completedatasetregistration fk_datasetcompleteregistration_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.completedatasetregistration
    ADD CONSTRAINT fk_datasetcompleteregistration_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: completedatasetregistration fk_datasetcompleteregistration_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.completedatasetregistration
    ADD CONSTRAINT fk_datasetcompleteregistration_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: datainputperiod fk_datasetdatainputperiods_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datainputperiod
    ADD CONSTRAINT fk_datasetdatainputperiods_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datasetelement fk_datasetelement_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetelement
    ADD CONSTRAINT fk_datasetelement_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: datasetindicators fk_datasetindicators_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetindicators
    ADD CONSTRAINT fk_datasetindicators_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datasetelement fk_datasetmembers_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetelement
    ADD CONSTRAINT fk_datasetmembers_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: datasetelement fk_datasetmembers_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetelement
    ADD CONSTRAINT fk_datasetmembers_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datasetnotificationtemplate fk_datasetnotification_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotificationtemplate
    ADD CONSTRAINT fk_datasetnotification_usergroup FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: datasetoperands fk_datasetoperands_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetoperands
    ADD CONSTRAINT fk_datasetoperands_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datasetnotification_datasets fk_datasets_datasetnotificationtemplateid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotification_datasets
    ADD CONSTRAINT fk_datasets_datasetnotificationtemplateid FOREIGN KEY (datasetnotificationtemplateid) REFERENCES public.datasetnotificationtemplate(datasetnotificationtemplateid);


--
-- Name: datasetsource fk_datasetsource_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsource
    ADD CONSTRAINT fk_datasetsource_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: datavalue fk_datavalue_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalue
    ADD CONSTRAINT fk_datavalue_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: datavalue fk_datavalue_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalue
    ADD CONSTRAINT fk_datavalue_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: datavalue fk_datavalue_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalue
    ADD CONSTRAINT fk_datavalue_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: datavalue fk_datavalue_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalue
    ADD CONSTRAINT fk_datavalue_organisationunitid FOREIGN KEY (sourceid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: datavalue fk_datavalue_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalue
    ADD CONSTRAINT fk_datavalue_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: datavalueaudit fk_datavalueaudit_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: datavalueaudit fk_datavalueaudit_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: datavalueaudit fk_datavalueaudit_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: datavalueaudit fk_datavalueaudit_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: datavalueaudit fk_datavalueaudit_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: categoryoptiongroupsetdimension fk_dimension_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetdimension
    ADD CONSTRAINT fk_dimension_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: dataelementgroupsetdimension fk_dimension_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetdimension
    ADD CONSTRAINT fk_dimension_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES public.dataelementgroupset(dataelementgroupsetid);


--
-- Name: categoryoptiongroupsetdimension_items fk_dimension_items_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetdimension_items
    ADD CONSTRAINT fk_dimension_items_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: categoryoptiongroupsetdimension_items fk_dimension_items_categoryoptiongroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetdimension_items
    ADD CONSTRAINT fk_dimension_items_categoryoptiongroupsetdimensionid FOREIGN KEY (categoryoptiongroupsetdimensionid) REFERENCES public.categoryoptiongroupsetdimension(categoryoptiongroupsetdimensionid);


--
-- Name: dataelementgroupsetdimension_items fk_dimension_items_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetdimension_items
    ADD CONSTRAINT fk_dimension_items_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: dataelementgroupsetdimension_items fk_dimension_items_dataelementgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetdimension_items
    ADD CONSTRAINT fk_dimension_items_dataelementgroupsetdimensionid FOREIGN KEY (dataelementgroupsetdimensionid) REFERENCES public.dataelementgroupsetdimension(dataelementgroupsetdimensionid);


--
-- Name: orgunitgroupsetdimension_items fk_dimension_items_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetdimension_items
    ADD CONSTRAINT fk_dimension_items_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: orgunitgroupsetdimension_items fk_dimension_items_orgunitgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetdimension_items
    ADD CONSTRAINT fk_dimension_items_orgunitgroupsetdimensionid FOREIGN KEY (orgunitgroupsetdimensionid) REFERENCES public.orgunitgroupsetdimension(orgunitgroupsetdimensionid);


--
-- Name: orgunitgroupsetdimension fk_dimension_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetdimension
    ADD CONSTRAINT fk_dimension_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: document fk_document_fileresourceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT fk_document_fileresourceid FOREIGN KEY (fileresource) REFERENCES public.fileresource(fileresourceid);


--
-- Name: document fk_document_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT fk_document_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentitydatavalue fk_entityinstancedatavalue_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydatavalue
    ADD CONSTRAINT fk_entityinstancedatavalue_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: trackedentitydatavalue fk_entityinstancedatavalue_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydatavalue
    ADD CONSTRAINT fk_entityinstancedatavalue_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES public.programstageinstance(programstageinstanceid);


--
-- Name: trackedentitydatavalueaudit fk_entityinstancedatavalueaudit_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydatavalueaudit
    ADD CONSTRAINT fk_entityinstancedatavalueaudit_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: trackedentitydatavalueaudit fk_entityinstancedatavalueaudit_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydatavalueaudit
    ADD CONSTRAINT fk_entityinstancedatavalueaudit_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES public.programstageinstance(programstageinstanceid);


--
-- Name: eventchart_attributedimensions fk_eventchart_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_attributedimensions
    ADD CONSTRAINT fk_eventchart_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES public.trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: eventchart_attributedimensions fk_eventchart_attributedimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_attributedimensions
    ADD CONSTRAINT fk_eventchart_attributedimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart fk_eventchart_attributevaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_eventchart_attributevaluedimensionid FOREIGN KEY (attributevaluedimensionid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: eventchart_categorydimensions fk_eventchart_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_categorydimensions
    ADD CONSTRAINT fk_eventchart_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES public.categorydimension(categorydimensionid);


--
-- Name: eventchart_categorydimensions fk_eventchart_categorydimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_categorydimensions
    ADD CONSTRAINT fk_eventchart_categorydimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_categoryoptiongroupsetdimensions fk_eventchart_catoptiongroupsetdimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_eventchart_catoptiongroupsetdimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_columns fk_eventchart_columns_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_columns
    ADD CONSTRAINT fk_eventchart_columns_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_dataelementdimensions fk_eventchart_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_dataelementdimensions
    ADD CONSTRAINT fk_eventchart_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES public.trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: eventchart_dataelementdimensions fk_eventchart_dataelementdimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_dataelementdimensions
    ADD CONSTRAINT fk_eventchart_dataelementdimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart fk_eventchart_dataelementvaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_eventchart_dataelementvaluedimensionid FOREIGN KEY (dataelementvaluedimensionid) REFERENCES public.dataelement(dataelementid);


--
-- Name: eventchart_categoryoptiongroupsetdimensions fk_eventchart_dimensions_catoptiongroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_eventchart_dimensions_catoptiongroupsetdimensionid FOREIGN KEY (categoryoptiongroupsetdimensionid) REFERENCES public.categoryoptiongroupsetdimension(categoryoptiongroupsetdimensionid);


--
-- Name: eventchart_orgunitgroupsetdimensions fk_eventchart_dimensions_ogunitgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_eventchart_dimensions_ogunitgroupsetdimensionid FOREIGN KEY (orgunitgroupsetdimensionid) REFERENCES public.orgunitgroupsetdimension(orgunitgroupsetdimensionid);


--
-- Name: eventchart_filters fk_eventchart_filters_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_filters
    ADD CONSTRAINT fk_eventchart_filters_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_itemorgunitgroups fk_eventchart_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_itemorgunitgroups
    ADD CONSTRAINT fk_eventchart_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: eventchart_itemorgunitgroups fk_eventchart_itemorgunitunitgroups_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_itemorgunitgroups
    ADD CONSTRAINT fk_eventchart_itemorgunitunitgroups_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_organisationunits fk_eventchart_organisationunits_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_organisationunits
    ADD CONSTRAINT fk_eventchart_organisationunits_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_organisationunits fk_eventchart_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_organisationunits
    ADD CONSTRAINT fk_eventchart_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: eventchart_orgunitgroupsetdimensions fk_eventchart_orgunitgroupsetdimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_eventchart_orgunitgroupsetdimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_orgunitlevels fk_eventchart_orgunitlevels_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_orgunitlevels
    ADD CONSTRAINT fk_eventchart_orgunitlevels_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_periods fk_eventchart_periods_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_periods
    ADD CONSTRAINT fk_eventchart_periods_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart_periods fk_eventchart_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_periods
    ADD CONSTRAINT fk_eventchart_periods_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: eventchart_programindicatordimensions fk_eventchart_prindicatordimensions_prindicatordimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_programindicatordimensions
    ADD CONSTRAINT fk_eventchart_prindicatordimensions_prindicatordimensionid FOREIGN KEY (trackedentityprogramindicatordimensionid) REFERENCES public.trackedentityprogramindicatordimension(trackedentityprogramindicatordimensionid);


--
-- Name: eventchart fk_eventchart_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_eventchart_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: eventchart_programindicatordimensions fk_eventchart_programindicatordimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_programindicatordimensions
    ADD CONSTRAINT fk_eventchart_programindicatordimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart fk_eventchart_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_eventchart_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: eventchart fk_eventchart_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_eventchart_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES public.relativeperiods(relativeperiodsid);


--
-- Name: eventchart_rows fk_eventchart_rows_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart_rows
    ADD CONSTRAINT fk_eventchart_rows_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventchart fk_eventchart_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_eventchart_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: eventreport_attributedimensions fk_eventreport_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_attributedimensions
    ADD CONSTRAINT fk_eventreport_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES public.trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: eventreport_attributedimensions fk_eventreport_attributedimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_attributedimensions
    ADD CONSTRAINT fk_eventreport_attributedimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport fk_eventreport_attributevaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_eventreport_attributevaluedimensionid FOREIGN KEY (attributevaluedimensionid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: eventreport_categorydimensions fk_eventreport_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_categorydimensions
    ADD CONSTRAINT fk_eventreport_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES public.categorydimension(categorydimensionid);


--
-- Name: eventreport_categorydimensions fk_eventreport_categorydimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_categorydimensions
    ADD CONSTRAINT fk_eventreport_categorydimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_categoryoptiongroupsetdimensions fk_eventreport_catoptiongroupsetdimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_eventreport_catoptiongroupsetdimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_columns fk_eventreport_columns_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_columns
    ADD CONSTRAINT fk_eventreport_columns_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_dataelementdimensions fk_eventreport_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_dataelementdimensions
    ADD CONSTRAINT fk_eventreport_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES public.trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: eventreport_dataelementdimensions fk_eventreport_dataelementdimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_dataelementdimensions
    ADD CONSTRAINT fk_eventreport_dataelementdimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport fk_eventreport_dataelementvaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_eventreport_dataelementvaluedimensionid FOREIGN KEY (dataelementvaluedimensionid) REFERENCES public.dataelement(dataelementid);


--
-- Name: eventreport_categoryoptiongroupsetdimensions fk_eventreport_dimensions_catoptiongroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_eventreport_dimensions_catoptiongroupsetdimensionid FOREIGN KEY (categoryoptiongroupsetdimensionid) REFERENCES public.categoryoptiongroupsetdimension(categoryoptiongroupsetdimensionid);


--
-- Name: eventreport_orgunitgroupsetdimensions fk_eventreport_dimensions_ogunitgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_eventreport_dimensions_ogunitgroupsetdimensionid FOREIGN KEY (orgunitgroupsetdimensionid) REFERENCES public.orgunitgroupsetdimension(orgunitgroupsetdimensionid);


--
-- Name: eventreport_filters fk_eventreport_filters_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_filters
    ADD CONSTRAINT fk_eventreport_filters_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_itemorgunitgroups fk_eventreport_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_itemorgunitgroups
    ADD CONSTRAINT fk_eventreport_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: eventreport_itemorgunitgroups fk_eventreport_itemorgunitunitgroups_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_itemorgunitgroups
    ADD CONSTRAINT fk_eventreport_itemorgunitunitgroups_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_organisationunits fk_eventreport_organisationunits_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_organisationunits
    ADD CONSTRAINT fk_eventreport_organisationunits_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_organisationunits fk_eventreport_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_organisationunits
    ADD CONSTRAINT fk_eventreport_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: eventreport_orgunitgroupsetdimensions fk_eventreport_orgunitgroupsetdimensions_eventreporteid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_eventreport_orgunitgroupsetdimensions_eventreporteid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_orgunitlevels fk_eventreport_orgunitlevels_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_orgunitlevels
    ADD CONSTRAINT fk_eventreport_orgunitlevels_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_periods fk_eventreport_periods_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_periods
    ADD CONSTRAINT fk_eventreport_periods_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport_periods fk_eventreport_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_periods
    ADD CONSTRAINT fk_eventreport_periods_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: eventreport_programindicatordimensions fk_eventreport_prindicatordimensions_prindicatordimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_programindicatordimensions
    ADD CONSTRAINT fk_eventreport_prindicatordimensions_prindicatordimensionid FOREIGN KEY (trackedentityprogramindicatordimensionid) REFERENCES public.trackedentityprogramindicatordimension(trackedentityprogramindicatordimensionid);


--
-- Name: eventreport fk_eventreport_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_eventreport_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: eventreport_programindicatordimensions fk_eventreport_programindicatordimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_programindicatordimensions
    ADD CONSTRAINT fk_eventreport_programindicatordimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport fk_eventreport_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_eventreport_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: eventreport fk_eventreport_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_eventreport_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES public.relativeperiods(relativeperiodsid);


--
-- Name: eventreport_rows fk_eventreport_rows_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport_rows
    ADD CONSTRAINT fk_eventreport_rows_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventreport fk_eventreport_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_eventreport_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: externalmaplayer fk_externalmaplayer_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT fk_externalmaplayer_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: externalmaplayer fk_externalmaplayer_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT fk_externalmaplayer_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: externalfileresource fk_fileresource_externalfileresource; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalfileresource
    ADD CONSTRAINT fk_fileresource_externalfileresource FOREIGN KEY (fileresourceid) REFERENCES public.fileresource(fileresourceid);


--
-- Name: fileresource fk_fileresource_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.fileresource
    ADD CONSTRAINT fk_fileresource_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: users_catdimensionconstraints fk_fk_users_catconstraints_dataelementcategoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users_catdimensionconstraints
    ADD CONSTRAINT fk_fk_users_catconstraints_dataelementcategoryid FOREIGN KEY (dataelementcategoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: users_cogsdimensionconstraints fk_fk_users_cogsconstraints_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users_cogsdimensionconstraints
    ADD CONSTRAINT fk_fk_users_cogsconstraints_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: incomingsms fk_incomingsms_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.incomingsms
    ADD CONSTRAINT fk_incomingsms_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicator fk_indicator_indicatortypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT fk_indicator_indicatortypeid FOREIGN KEY (indicatortypeid) REFERENCES public.indicatortype(indicatortypeid);


--
-- Name: indicatorlegendsets fk_indicator_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorlegendsets
    ADD CONSTRAINT fk_indicator_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: indicator fk_indicator_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT fk_indicator_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatorgroupmembers fk_indicatorgroup_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupmembers
    ADD CONSTRAINT fk_indicatorgroup_indicatorid FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: indicatorgroup fk_indicatorgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroup
    ADD CONSTRAINT fk_indicatorgroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatorgroupmembers fk_indicatorgroupmembers_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupmembers
    ADD CONSTRAINT fk_indicatorgroupmembers_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: indicatorgroupsetmembers fk_indicatorgroupset_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetmembers
    ADD CONSTRAINT fk_indicatorgroupset_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: indicatorgroupset fk_indicatorgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupset
    ADD CONSTRAINT fk_indicatorgroupset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatorgroupsetmembers fk_indicatorgroupsetmembers_indicatorgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetmembers
    ADD CONSTRAINT fk_indicatorgroupsetmembers_indicatorgroupsetid FOREIGN KEY (indicatorgroupsetid) REFERENCES public.indicatorgroupset(indicatorgroupsetid);


--
-- Name: intepretation_likedby fk_intepretation_likedby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.intepretation_likedby
    ADD CONSTRAINT fk_intepretation_likedby_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: interpretation fk_interpretation_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: interpretation_comments fk_interpretation_comments_interpretationcommentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation_comments
    ADD CONSTRAINT fk_interpretation_comments_interpretationcommentid FOREIGN KEY (interpretationcommentid) REFERENCES public.interpretationcomment(interpretationcommentid);


--
-- Name: interpretation_comments fk_interpretation_comments_interpretationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation_comments
    ADD CONSTRAINT fk_interpretation_comments_interpretationid FOREIGN KEY (interpretationid) REFERENCES public.interpretation(interpretationid);


--
-- Name: interpretation fk_interpretation_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: interpretation fk_interpretation_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: interpretation fk_interpretation_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: intepretation_likedby fk_interpretation_likedby_interpretationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.intepretation_likedby
    ADD CONSTRAINT fk_interpretation_likedby_interpretationid FOREIGN KEY (interpretationid) REFERENCES public.interpretation(interpretationid);


--
-- Name: interpretation fk_interpretation_mapid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_mapid FOREIGN KEY (mapid) REFERENCES public.map(mapid);


--
-- Name: interpretation fk_interpretation_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: interpretation fk_interpretation_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: interpretation fk_interpretation_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: interpretation fk_interpretation_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretation
    ADD CONSTRAINT fk_interpretation_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: interpretationcomment fk_interpretationcomment_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationcomment
    ADD CONSTRAINT fk_interpretationcomment_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: analyticsperiodboundary fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.analyticsperiodboundary
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: attribute fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: categorycombo fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombo
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: categoryoptioncombo fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombo
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: categoryoptiongroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: categoryoptiongroupset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: chart fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: color fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: colorset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: constant fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constant
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dashboard fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dashboarditem fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditem
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapprovallevel fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevel
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataapprovalworkflow fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflow
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelement fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelement
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementcategory fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategory
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementcategoryoption fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoption
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementgroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataelementgroupset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataentryform fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryform
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: dataset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: datasetnotificationtemplate fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotificationtemplate
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: datastatistics fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datastatistics
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: document fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: eventchart fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchart
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: eventreport fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreport
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: externalfileresource fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalfileresource
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: externalmaplayer fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayer
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: fileresource fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.fileresource
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: i18nlocale fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.i18nlocale
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicator fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatorgroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatorgroupset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatortype fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortype
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: jobconfiguration fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.jobconfiguration
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: keyjsonvalue fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.keyjsonvalue
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: map fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: maplegend fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegend
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: maplegendset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: mapview fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: metadataversion fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.metadataversion
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: oauth2client fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2client
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: optiongroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: optiongroupset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: optionset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: organisationunit fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: orgunitgroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: orgunitgroupset fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: orgunitlevel fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitlevel
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: predictor fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: program fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: program_attribute_group fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attribute_group
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: program_attributes fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programindicator fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programindicatorgroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programmessage fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programnotificationtemplate fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programrule fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrule
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programruleaction fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programrulevariable fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programsection fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programstage fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programstagedataelement fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: programstagesection fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: pushanalysis fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysis
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: relationshiptype fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptype
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: report fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: reporttable fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: section fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: sqlview fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlview
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: tablehook fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.tablehook
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentityattribute fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentityinstance fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentityinstancefilter fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstancefilter
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentitytype fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytype
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentitytypeattribute fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattribute
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: usergroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: userkeyjsonvalue fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userkeyjsonvalue
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: userrole fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: users fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationcriteria fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteria
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationnotificationtemplate fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationrule fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationrulegroup fk_lastupdateby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroup
    ADD CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo(userinfoid);


--
-- Name: maplegendset fk_legendset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendset
    ADD CONSTRAINT fk_legendset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: lockexception fk_lockexception_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.lockexception
    ADD CONSTRAINT fk_lockexception_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: lockexception fk_lockexception_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.lockexception
    ADD CONSTRAINT fk_lockexception_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: lockexception fk_lockexception_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.lockexception
    ADD CONSTRAINT fk_lockexception_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: maplegend fk_maplegend_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegend
    ADD CONSTRAINT fk_maplegend_maplegendsetid FOREIGN KEY (maplegendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: mapmapviews fk_mapmapview_mapid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapmapviews
    ADD CONSTRAINT fk_mapmapview_mapid FOREIGN KEY (mapid) REFERENCES public.map(mapid);


--
-- Name: mapmapviews fk_mapmapview_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapmapviews
    ADD CONSTRAINT fk_mapmapview_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_attributedimensions fk_mapview_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_attributedimensions
    ADD CONSTRAINT fk_mapview_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES public.trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: mapview_attributedimensions fk_mapview_attributedimensions_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_attributedimensions
    ADD CONSTRAINT fk_mapview_attributedimensions_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_columns fk_mapview_columns_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_columns
    ADD CONSTRAINT fk_mapview_columns_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_datadimensionitems fk_mapview_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_datadimensionitems
    ADD CONSTRAINT fk_mapview_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES public.datadimensionitem(datadimensionitemid);


--
-- Name: mapview_datadimensionitems fk_mapview_datadimensionitems_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_datadimensionitems
    ADD CONSTRAINT fk_mapview_datadimensionitems_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_dataelementdimensions fk_mapview_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_dataelementdimensions
    ADD CONSTRAINT fk_mapview_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES public.trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: mapview_dataelementdimensions fk_mapview_dataelementdimensions_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_dataelementdimensions
    ADD CONSTRAINT fk_mapview_dataelementdimensions_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_itemorgunitgroups fk_mapview_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_itemorgunitgroups
    ADD CONSTRAINT fk_mapview_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: mapview_itemorgunitgroups fk_mapview_itemorgunitunitgroups_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_itemorgunitgroups
    ADD CONSTRAINT fk_mapview_itemorgunitunitgroups_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview fk_mapview_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT fk_mapview_maplegendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: mapview_organisationunits fk_mapview_organisationunits_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_organisationunits
    ADD CONSTRAINT fk_mapview_organisationunits_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_organisationunits fk_mapview_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_organisationunits
    ADD CONSTRAINT fk_mapview_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: mapview fk_mapview_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT fk_mapview_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: mapview_orgunitlevels fk_mapview_orgunitlevels_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_orgunitlevels
    ADD CONSTRAINT fk_mapview_orgunitlevels_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_periods fk_mapview_periods_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_periods
    ADD CONSTRAINT fk_mapview_periods_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: mapview_periods fk_mapview_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview_periods
    ADD CONSTRAINT fk_mapview_periods_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: mapview fk_mapview_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT fk_mapview_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: mapview fk_mapview_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT fk_mapview_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: mapview fk_mapview_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapview
    ADD CONSTRAINT fk_mapview_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES public.relativeperiods(relativeperiodsid);


--
-- Name: map fk_mapview_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT fk_mapview_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: message fk_message_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT fk_message_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: messageconversation fk_messageconversation_lastsender_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation
    ADD CONSTRAINT fk_messageconversation_lastsender_userid FOREIGN KEY (lastsenderid) REFERENCES public.userinfo(userinfoid);


--
-- Name: messageconversation_messages fk_messageconversation_messages_messageconversationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_messages
    ADD CONSTRAINT fk_messageconversation_messages_messageconversationid FOREIGN KEY (messageconversationid) REFERENCES public.messageconversation(messageconversationid);


--
-- Name: messageconversation_messages fk_messageconversation_messages_messageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_messages
    ADD CONSTRAINT fk_messageconversation_messages_messageid FOREIGN KEY (messageid) REFERENCES public.message(messageid);


--
-- Name: messageconversation fk_messageconversation_user_user_assigned; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation
    ADD CONSTRAINT fk_messageconversation_user_user_assigned FOREIGN KEY (user_assigned) REFERENCES public.userinfo(userinfoid);


--
-- Name: messageconversation fk_messageconversation_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation
    ADD CONSTRAINT fk_messageconversation_user_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: messageconversation_usermessages fk_messageconversation_usermessages_messageconversationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_usermessages
    ADD CONSTRAINT fk_messageconversation_usermessages_messageconversationid FOREIGN KEY (messageconversationid) REFERENCES public.messageconversation(messageconversationid);


--
-- Name: messageconversation_usermessages fk_messageconversation_usermessages_usermessageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.messageconversation_usermessages
    ADD CONSTRAINT fk_messageconversation_usermessages_usermessageid FOREIGN KEY (usermessageid) REFERENCES public.usermessage(usermessageid);


--
-- Name: minmaxdataelement fk_minmaxdataelement_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: minmaxdataelement fk_minmaxdataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: minmaxdataelement fk_minmaxdataelement_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_organisationunitid FOREIGN KEY (sourceid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: oauth2clientgranttypes fk_oauth2clientgranttypes_oauth2clientid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2clientgranttypes
    ADD CONSTRAINT fk_oauth2clientgranttypes_oauth2clientid FOREIGN KEY (oauth2clientid) REFERENCES public.oauth2client(oauth2clientid);


--
-- Name: oauth2clientredirecturis fk_oauth2clientredirecturis_oauth2clientid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.oauth2clientredirecturis
    ADD CONSTRAINT fk_oauth2clientredirecturis_oauth2clientid FOREIGN KEY (oauth2clientid) REFERENCES public.oauth2client(oauth2clientid);


--
-- Name: attributetranslations fk_objecttranslation_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributetranslations
    ADD CONSTRAINT fk_objecttranslation_attributeid FOREIGN KEY (attributeid) REFERENCES public.attribute(attributeid);


--
-- Name: categorycombotranslations fk_objecttranslation_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombotranslations
    ADD CONSTRAINT fk_objecttranslation_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: dataelementcategorytranslations fk_objecttranslation_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategorytranslations
    ADD CONSTRAINT fk_objecttranslation_categoryid FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: categoryoptioncombotranslations fk_objecttranslation_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombotranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: categoryoptiongrouptranslations fk_objecttranslation_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongrouptranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: categoryoptiongroupsettranslations fk_objecttranslation_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: categoryoptiontranslations fk_objecttranslation_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiontranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: charttranslations fk_objecttranslation_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.charttranslations
    ADD CONSTRAINT fk_objecttranslation_chartid FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: colortranslations fk_objecttranslation_colorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colortranslations
    ADD CONSTRAINT fk_objecttranslation_colorid FOREIGN KEY (colorid) REFERENCES public.color(colorid);


--
-- Name: constanttranslations fk_objecttranslation_colorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constanttranslations
    ADD CONSTRAINT fk_objecttranslation_colorid FOREIGN KEY (colorid) REFERENCES public.constant(constantid);


--
-- Name: colorsettranslations fk_objecttranslation_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorsettranslations
    ADD CONSTRAINT fk_objecttranslation_colorsetid FOREIGN KEY (colorsetid) REFERENCES public.colorset(colorsetid);


--
-- Name: dashboardtranslations fk_objecttranslation_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardtranslations
    ADD CONSTRAINT fk_objecttranslation_dashboardid FOREIGN KEY (dashboardid) REFERENCES public.dashboard(dashboardid);


--
-- Name: dashboarditemtranslations fk_objecttranslation_dashboarditemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditemtranslations
    ADD CONSTRAINT fk_objecttranslation_dashboarditemid FOREIGN KEY (dashboarditemid) REFERENCES public.dashboarditem(dashboarditemid);


--
-- Name: dataapprovalleveltranslations fk_objecttranslation_dataapprovallevelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveltranslations
    ADD CONSTRAINT fk_objecttranslation_dataapprovallevelid FOREIGN KEY (dataapprovallevelid) REFERENCES public.dataapprovallevel(dataapprovallevelid);


--
-- Name: dataelementgrouptranslations fk_objecttranslation_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: dataelementgroupsettranslations fk_objecttranslation_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES public.dataelementgroupset(dataelementgroupsetid);


--
-- Name: dataelementtranslations fk_objecttranslation_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementtranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataentryformtranslations fk_objecttranslation_dataentryformid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataentryformtranslations
    ADD CONSTRAINT fk_objecttranslation_dataentryformid FOREIGN KEY (dataentryformid) REFERENCES public.dataentryform(dataentryformid);


--
-- Name: datasettranslations fk_objecttranslation_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasettranslations
    ADD CONSTRAINT fk_objecttranslation_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: documenttranslations fk_objecttranslation_documentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documenttranslations
    ADD CONSTRAINT fk_objecttranslation_documentid FOREIGN KEY (documentid) REFERENCES public.document(documentid);


--
-- Name: eventcharttranslations fk_objecttranslation_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventcharttranslations
    ADD CONSTRAINT fk_objecttranslation_eventchartid FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: eventreporttranslations fk_objecttranslation_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreporttranslations
    ADD CONSTRAINT fk_objecttranslation_eventreportid FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: indicatorgrouptranslations fk_objecttranslation_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: indicatorgroupsettranslations fk_objecttranslation_indicatorgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorgroupsetid FOREIGN KEY (indicatorgroupsetid) REFERENCES public.indicatorgroupset(indicatorgroupsetid);


--
-- Name: indicatortranslations fk_objecttranslation_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorid FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: indicatortypetranslations fk_objecttranslation_indicatortypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortypetranslations
    ADD CONSTRAINT fk_objecttranslation_indicatortypeid FOREIGN KEY (indicatortypeid) REFERENCES public.indicatortype(indicatortypeid);


--
-- Name: maplegendtranslations fk_objecttranslation_maplegendid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendtranslations
    ADD CONSTRAINT fk_objecttranslation_maplegendid FOREIGN KEY (maplegendid) REFERENCES public.maplegend(maplegendid);


--
-- Name: maplegendsettranslations fk_objecttranslation_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendsettranslations
    ADD CONSTRAINT fk_objecttranslation_maplegendsetid FOREIGN KEY (maplegendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: mapviewtranslations fk_objecttranslation_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapviewtranslations
    ADD CONSTRAINT fk_objecttranslation_mapviewid FOREIGN KEY (mapviewid) REFERENCES public.mapview(mapviewid);


--
-- Name: optiongrouptranslations fk_objecttranslation_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongrouptranslations
    ADD CONSTRAINT fk_objecttranslation_optiongroupid FOREIGN KEY (optiongroupid) REFERENCES public.optiongroup(optiongroupid);


--
-- Name: optiongroupsettranslations fk_objecttranslation_optiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_optiongroupsetid FOREIGN KEY (optiongroupsetid) REFERENCES public.optiongroupset(optiongroupsetid);


--
-- Name: optionsettranslations fk_objecttranslation_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsettranslations
    ADD CONSTRAINT fk_objecttranslation_optionsetid FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: optionvaluetranslations fk_objecttranslation_optionvalueid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvaluetranslations
    ADD CONSTRAINT fk_objecttranslation_optionvalueid FOREIGN KEY (optionvalueid) REFERENCES public.optionvalue(optionvalueid);


--
-- Name: organisationunittranslations fk_objecttranslation_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunittranslations
    ADD CONSTRAINT fk_objecttranslation_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: orgunitgrouptranslations fk_objecttranslation_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: orgunitgroupsettranslations fk_objecttranslation_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: orgunitleveltranslations fk_objecttranslation_orgunitlevelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitleveltranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitlevelid FOREIGN KEY (orgunitlevelid) REFERENCES public.orgunitlevel(orgunitlevelid);


--
-- Name: programtranslations fk_objecttranslation_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtranslations
    ADD CONSTRAINT fk_objecttranslation_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programindicatorgrouptranslations fk_objecttranslation_programindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_programindicatorgroupid FOREIGN KEY (programindicatorgroupid) REFERENCES public.programindicatorgroup(programindicatorgroupid);


--
-- Name: programindicatortranslations fk_objecttranslation_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatortranslations
    ADD CONSTRAINT fk_objecttranslation_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: programmessagetranslations fk_objecttranslation_programmessageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessagetranslations
    ADD CONSTRAINT fk_objecttranslation_programmessageid FOREIGN KEY (id) REFERENCES public.programmessage(id);


--
-- Name: programruletranslations fk_objecttranslation_programruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruletranslations
    ADD CONSTRAINT fk_objecttranslation_programruleid FOREIGN KEY (programruleid) REFERENCES public.programrule(programruleid);


--
-- Name: programsectiontranslations fk_objecttranslation_programsectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsectiontranslations
    ADD CONSTRAINT fk_objecttranslation_programsectionid FOREIGN KEY (programsectionid) REFERENCES public.programsection(programsectionid);


--
-- Name: programstagetranslations fk_objecttranslation_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagetranslations
    ADD CONSTRAINT fk_objecttranslation_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: programstagesectiontranslations fk_objecttranslation_programstagesectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesectiontranslations
    ADD CONSTRAINT fk_objecttranslation_programstagesectionid FOREIGN KEY (programstagesectionid) REFERENCES public.programstagesection(programstagesectionid);


--
-- Name: programtrackedentityattributegrouptranslations fk_objecttranslation_programtrackedentityattributegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegrouptranslations
    ADD CONSTRAINT fk_objecttranslation_programtrackedentityattributegroupid FOREIGN KEY (programtrackedentityattributegroupid) REFERENCES public.program_attribute_group(programtrackedentityattributegroupid);


--
-- Name: relationshiptypetranslations fk_objecttranslation_relationshiptypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationshiptypetranslations
    ADD CONSTRAINT fk_objecttranslation_relationshiptypeid FOREIGN KEY (relationshiptypeid) REFERENCES public.relationshiptype(relationshiptypeid);


--
-- Name: reporttranslations fk_objecttranslation_reportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttranslations
    ADD CONSTRAINT fk_objecttranslation_reportid FOREIGN KEY (reportid) REFERENCES public.report(reportid);


--
-- Name: reporttabletranslations fk_objecttranslation_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttabletranslations
    ADD CONSTRAINT fk_objecttranslation_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: datasetsectiontranslations fk_objecttranslation_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetsectiontranslations
    ADD CONSTRAINT fk_objecttranslation_sectionid FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);


--
-- Name: trackedentityattributetranslations fk_objecttranslation_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributetranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: trackedentitytranslations fk_objecttranslation_trackedentitytypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentitytypeid FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: usergrouptranslations fk_objecttranslation_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergrouptranslations
    ADD CONSTRAINT fk_objecttranslation_usergroupid FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: userroletranslations fk_objecttranslation_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroletranslations
    ADD CONSTRAINT fk_objecttranslation_userroleid FOREIGN KEY (userroleid) REFERENCES public.userrole(userroleid);


--
-- Name: validationcriteriatranslations fk_objecttranslation_validationcriteriaid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteriatranslations
    ADD CONSTRAINT fk_objecttranslation_validationcriteriaid FOREIGN KEY (validationcriteriaid) REFERENCES public.validationcriteria(validationcriteriaid);


--
-- Name: validationrulegrouptranslations fk_objecttranslation_validationrulegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegrouptranslations
    ADD CONSTRAINT fk_objecttranslation_validationrulegroupid FOREIGN KEY (validationrulegroupid) REFERENCES public.validationrulegroup(validationrulegroupid);


--
-- Name: validationruletranslations fk_objecttranslation_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruletranslations
    ADD CONSTRAINT fk_objecttranslation_validationruleid FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: dataapprovalworkflowtranslations fk_objecttranslation_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowtranslations
    ADD CONSTRAINT fk_objecttranslation_workflowid FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: optiongroup fk_optiongroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroup
    ADD CONSTRAINT fk_optiongroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: optiongroupmembers fk_optiongroupmembers_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupmembers
    ADD CONSTRAINT fk_optiongroupmembers_optiongroupid FOREIGN KEY (optionid) REFERENCES public.optionvalue(optionvalueid);


--
-- Name: optiongroupmembers fk_optiongroupmembers_optionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupmembers
    ADD CONSTRAINT fk_optiongroupmembers_optionid FOREIGN KEY (optiongroupid) REFERENCES public.optiongroup(optiongroupid);


--
-- Name: optiongroupset fk_optiongroupset_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT fk_optiongroupset_optionsetid FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: optiongroupset fk_optiongroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupset
    ADD CONSTRAINT fk_optiongroupset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: optiongroupsetmembers fk_optiongroupsetmembers_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetmembers
    ADD CONSTRAINT fk_optiongroupsetmembers_optiongroupid FOREIGN KEY (optiongroupid) REFERENCES public.optiongroup(optiongroupid);


--
-- Name: optiongroupsetmembers fk_optiongroupsetmembers_optiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetmembers
    ADD CONSTRAINT fk_optiongroupsetmembers_optiongroupsetid FOREIGN KEY (optiongroupsetid) REFERENCES public.optiongroupset(optiongroupsetid);


--
-- Name: optionset fk_optionset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionset
    ADD CONSTRAINT fk_optionset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: optionvalue fk_optionsetmembers_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvalue
    ADD CONSTRAINT fk_optionsetmembers_optionsetid FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: organisationunit fk_organisationunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT fk_organisationunit_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationruleorganisationunitlevels fk_organisationunitlevel_validationtuleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleorganisationunitlevels
    ADD CONSTRAINT fk_organisationunitlevel_validationtuleid FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: orgunitgroupmembers fk_orgunitgroup_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupmembers
    ADD CONSTRAINT fk_orgunitgroup_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: orgunitgroup fk_orgunitgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroup
    ADD CONSTRAINT fk_orgunitgroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: orgunitgroupmembers fk_orgunitgroupmembers_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupmembers
    ADD CONSTRAINT fk_orgunitgroupmembers_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: orgunitgroupsetmembers fk_orgunitgroupset_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetmembers
    ADD CONSTRAINT fk_orgunitgroupset_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: orgunitgroupset fk_orgunitgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupset
    ADD CONSTRAINT fk_orgunitgroupset_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: orgunitgroupsetmembers fk_orgunitgroupsetmembers_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetmembers
    ADD CONSTRAINT fk_orgunitgroupsetmembers_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: organisationunit fk_parentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunit
    ADD CONSTRAINT fk_parentid FOREIGN KEY (parentid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: period fk_period_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT fk_period_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: predictor fk_predictor_generatorexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT fk_predictor_generatorexpressionid FOREIGN KEY (generatorexpressionid) REFERENCES public.expression(expressionid);


--
-- Name: predictor fk_predictor_outputcomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT fk_predictor_outputcomboid FOREIGN KEY (generatoroutputcombo) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: predictor fk_predictor_outputdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT fk_predictor_outputdataelementid FOREIGN KEY (generatoroutput) REFERENCES public.dataelement(dataelementid);


--
-- Name: predictororgunitlevels fk_predictororgunitlevels_orgunitlevelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictororgunitlevels
    ADD CONSTRAINT fk_predictororgunitlevels_orgunitlevelid FOREIGN KEY (orgunitlevelid) REFERENCES public.orgunitlevel(orgunitlevelid);


--
-- Name: predictororgunitlevels fk_predictororgunitlevels_predictorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictororgunitlevels
    ADD CONSTRAINT fk_predictororgunitlevels_predictorid FOREIGN KEY (predictorid) REFERENCES public.predictor(predictorid);


--
-- Name: program_attributes fk_program_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT fk_program_attributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: program fk_program_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: program_criteria fk_program_criteria_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_criteria
    ADD CONSTRAINT fk_program_criteria_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: program_criteria fk_program_criteria_validationcriteriaid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_criteria
    ADD CONSTRAINT fk_program_criteria_validationcriteriaid FOREIGN KEY (validationcriteriaid) REFERENCES public.validationcriteria(validationcriteriaid);


--
-- Name: program fk_program_dataentryformid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_dataentryformid FOREIGN KEY (dataentryformid) REFERENCES public.dataentryform(dataentryformid);


--
-- Name: program fk_program_expiryperiodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_expiryperiodtypeid FOREIGN KEY (expiryperiodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: program_organisationunits fk_program_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_organisationunits
    ADD CONSTRAINT fk_program_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: program_organisationunits fk_program_organisationunits_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_organisationunits
    ADD CONSTRAINT fk_program_organisationunits_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programsection fk_program_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection
    ADD CONSTRAINT fk_program_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programstagesection fk_program_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection
    ADD CONSTRAINT fk_program_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: program fk_program_relatedprogram; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_relatedprogram FOREIGN KEY (relatedprogramid) REFERENCES public.program(programid);


--
-- Name: program fk_program_relationshipid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_relationshipid FOREIGN KEY (relationshiptypeid) REFERENCES public.relationshiptype(relationshiptypeid);


--
-- Name: program fk_program_trackedentitytypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_trackedentitytypeid FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: program fk_program_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: program fk_program_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fk_program_workflowid FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: programindicatorlegendsets fk_programindicator_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorlegendsets
    ADD CONSTRAINT fk_programindicator_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: programindicator fk_programindicator_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT fk_programindicator_program FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programindicator fk_programindicator_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicator
    ADD CONSTRAINT fk_programindicator_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: programindicatorgroupmembers fk_programindicatorgroup_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupmembers
    ADD CONSTRAINT fk_programindicatorgroup_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: programindicatorgroup fk_programindicatorgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroup
    ADD CONSTRAINT fk_programindicatorgroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: programindicatorgroupmembers fk_programindicatorgroupmembers_programindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupmembers
    ADD CONSTRAINT fk_programindicatorgroupmembers_programindicatorgroupid FOREIGN KEY (programindicatorgroupid) REFERENCES public.programindicatorgroup(programindicatorgroupid);


--
-- Name: programinstance fk_programinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance
    ADD CONSTRAINT fk_programinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: programinstance fk_programinstance_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance
    ADD CONSTRAINT fk_programinstance_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programinstance fk_programinstance_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance
    ADD CONSTRAINT fk_programinstance_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: programinstancecomments fk_programinstancecomments_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstancecomments
    ADD CONSTRAINT fk_programinstancecomments_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES public.programinstance(programinstanceid);


--
-- Name: programinstancecomments fk_programinstancecomments_trackedentitycommentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstancecomments
    ADD CONSTRAINT fk_programinstancecomments_trackedentitycommentid FOREIGN KEY (trackedentitycommentid) REFERENCES public.trackedentitycomment(trackedentitycommentid);


--
-- Name: programmessage fk_programmessage_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT fk_programmessage_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: programmessage fk_programmessage_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT fk_programmessage_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES public.programinstance(programinstanceid);


--
-- Name: programmessage fk_programmessage_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT fk_programmessage_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES public.programstageinstance(programstageinstanceid);


--
-- Name: programmessage fk_programmessage_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage
    ADD CONSTRAINT fk_programmessage_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: programrule fk_programrule_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrule
    ADD CONSTRAINT fk_programrule_program FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programrule fk_programrule_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrule
    ADD CONSTRAINT fk_programrule_programstage FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: programruleaction fk_programruleaction_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_dataelement FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: programruleaction fk_programruleaction_programindicator; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_programindicator FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: programruleaction fk_programruleaction_programnotification; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_programnotification FOREIGN KEY (programnotificationtemplateid) REFERENCES public.programnotificationtemplate(programnotificationtemplateid);


--
-- Name: programruleaction fk_programruleaction_programrule; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_programrule FOREIGN KEY (programruleid) REFERENCES public.programrule(programruleid);


--
-- Name: programruleaction fk_programruleaction_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_programstage FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: programruleaction fk_programruleaction_programstagesection; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_programstagesection FOREIGN KEY (programstagesectionid) REFERENCES public.programstagesection(programstagesectionid);


--
-- Name: programruleaction fk_programruleaction_trackedentityattribute; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruleaction
    ADD CONSTRAINT fk_programruleaction_trackedentityattribute FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: programrulevariable fk_programrulevariable_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT fk_programrulevariable_dataelement FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: programrulevariable fk_programrulevariable_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT fk_programrulevariable_program FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programrulevariable fk_programrulevariable_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT fk_programrulevariable_programstage FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: programrulevariable fk_programrulevariable_trackedentityattribute; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programrulevariable
    ADD CONSTRAINT fk_programrulevariable_trackedentityattribute FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: programsection_attributes fk_programsection_attributes_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection_attributes
    ADD CONSTRAINT fk_programsection_attributes_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: programsection_attributes fk_programsections_attributes_programsectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsection_attributes
    ADD CONSTRAINT fk_programsections_attributes_programsectionid FOREIGN KEY (programsectionid) REFERENCES public.programsection(programsectionid);


--
-- Name: programstage fk_programstage_dataentryform; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT fk_programstage_dataentryform FOREIGN KEY (dataentryformid) REFERENCES public.dataentryform(dataentryformid);


--
-- Name: programstage fk_programstage_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT fk_programstage_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: programstage fk_programstage_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT fk_programstage_program FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programstage fk_programstage_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstage
    ADD CONSTRAINT fk_programstage_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: programstagedataelement fk_programstagedataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT fk_programstagedataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: programstagedataelement fk_programstagedataelement_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagedataelement
    ADD CONSTRAINT fk_programstagedataelement_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: programstageinstance fk_programstageinstance_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT fk_programstageinstance_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: programstageinstance fk_programstageinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT fk_programstageinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: programstageinstance fk_programstageinstance_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT fk_programstageinstance_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES public.programinstance(programinstanceid);


--
-- Name: programstageinstance fk_programstageinstance_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance
    ADD CONSTRAINT fk_programstageinstance_programstageid FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: programstageinstancecomments fk_programstageinstancecomments_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstancecomments
    ADD CONSTRAINT fk_programstageinstancecomments_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES public.programstageinstance(programstageinstanceid);


--
-- Name: programstageinstancecomments fk_programstageinstancecomments_trackedentitycommentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstancecomments
    ADD CONSTRAINT fk_programstageinstancecomments_trackedentitycommentid FOREIGN KEY (trackedentitycommentid) REFERENCES public.trackedentitycomment(trackedentitycommentid);


--
-- Name: programnotificationtemplate fk_programstagenotification_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT fk_programstagenotification_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: programnotificationtemplate fk_programstagenotification_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT fk_programstagenotification_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: programnotificationtemplate fk_programstagenotification_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programnotificationtemplate
    ADD CONSTRAINT fk_programstagenotification_usergroup FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: programstagesection_dataelements fk_programstagesection_dataelements_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection_dataelements
    ADD CONSTRAINT fk_programstagesection_dataelements_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: programstagesection_dataelements fk_programstagesection_dataelements_programstagesectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection_dataelements
    ADD CONSTRAINT fk_programstagesection_dataelements_programstagesectionid FOREIGN KEY (programstagesectionid) REFERENCES public.programstagesection(programstagesectionid);


--
-- Name: programstagesection_programindicators fk_programstagesection_programindicators_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection_programindicators
    ADD CONSTRAINT fk_programstagesection_programindicators_indicatorid FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: programstagesection_programindicators fk_programstagesection_programindicators_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagesection_programindicators
    ADD CONSTRAINT fk_programstagesection_programindicators_sectionid FOREIGN KEY (programstagesectionid) REFERENCES public.programstagesection(programstagesectionid);


--
-- Name: program_attributes fk_programtrackedentityattribute_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_attributes
    ADD CONSTRAINT fk_programtrackedentityattribute_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: programtrackedentityattributegroupmembers fk_programtrackedentityattributegroupmembers_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegroupmembers
    ADD CONSTRAINT fk_programtrackedentityattributegroupmembers_attributeid FOREIGN KEY (programtrackedentityattributeid) REFERENCES public.program_attributes(programtrackedentityattributeid);


--
-- Name: programtrackedentityattributegroupmembers fk_programtrackedentityattributegroupmembers_groupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtrackedentityattributegroupmembers
    ADD CONSTRAINT fk_programtrackedentityattributegroupmembers_groupid FOREIGN KEY (programtrackedentityattributegroupid) REFERENCES public.program_attribute_group(programtrackedentityattributegroupid);


--
-- Name: pushanalysisrecipientusergroups fk_pushanalysis_recipientusergroups; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysisrecipientusergroups
    ADD CONSTRAINT fk_pushanalysis_recipientusergroups FOREIGN KEY (elt) REFERENCES public.usergroup(usergroupid);


--
-- Name: relationship fk_relationship_relationshiptypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT fk_relationship_relationshiptypeid FOREIGN KEY (relationshiptypeid) REFERENCES public.relationshiptype(relationshiptypeid);


--
-- Name: relationship fk_relationship_trackedentityinstanceida; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT fk_relationship_trackedentityinstanceida FOREIGN KEY (trackedentityinstanceaid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: relationship fk_relationship_trackedentityinstanceidb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT fk_relationship_trackedentityinstanceidb FOREIGN KEY (trackedentityinstancebid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: report fk_report_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_report_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES public.relativeperiods(relativeperiodsid);


--
-- Name: report fk_report_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_report_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: report fk_report_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_report_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: reporttable_categorydimensions fk_reporttable_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_categorydimensions
    ADD CONSTRAINT fk_reporttable_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES public.categorydimension(categorydimensionid);


--
-- Name: reporttable_categorydimensions fk_reporttable_categorydimensions_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_categorydimensions
    ADD CONSTRAINT fk_reporttable_categorydimensions_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_categoryoptiongroupsetdimensions fk_reporttable_catoptiongroupsetdimensions_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_reporttable_catoptiongroupsetdimensions_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_columns fk_reporttable_columns_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_columns
    ADD CONSTRAINT fk_reporttable_columns_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_datadimensionitems fk_reporttable_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_datadimensionitems
    ADD CONSTRAINT fk_reporttable_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES public.datadimensionitem(datadimensionitemid);


--
-- Name: reporttable_datadimensionitems fk_reporttable_datadimensionitems_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_datadimensionitems
    ADD CONSTRAINT fk_reporttable_datadimensionitems_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_dataelementgroupsetdimensions fk_reporttable_dataelememntgroupsetdimensions_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_dataelementgroupsetdimensions
    ADD CONSTRAINT fk_reporttable_dataelememntgroupsetdimensions_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_categoryoptiongroupsetdimensions fk_reporttable_dimensions_catoptiongroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_categoryoptiongroupsetdimensions
    ADD CONSTRAINT fk_reporttable_dimensions_catoptiongroupsetdimensionid FOREIGN KEY (categoryoptiongroupsetdimensionid) REFERENCES public.categoryoptiongroupsetdimension(categoryoptiongroupsetdimensionid);


--
-- Name: reporttable_dataelementgroupsetdimensions fk_reporttable_dimensions_dataelementgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_dataelementgroupsetdimensions
    ADD CONSTRAINT fk_reporttable_dimensions_dataelementgroupsetdimensionid FOREIGN KEY (dataelementgroupsetdimensionid) REFERENCES public.dataelementgroupsetdimension(dataelementgroupsetdimensionid);


--
-- Name: reporttable_orgunitgroupsetdimensions fk_reporttable_dimensions_orgunitgroupsetdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_reporttable_dimensions_orgunitgroupsetdimensionid FOREIGN KEY (orgunitgroupsetdimensionid) REFERENCES public.orgunitgroupsetdimension(orgunitgroupsetdimensionid);


--
-- Name: reporttable_filters fk_reporttable_filters_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_filters
    ADD CONSTRAINT fk_reporttable_filters_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_itemorgunitgroups fk_reporttable_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_itemorgunitgroups
    ADD CONSTRAINT fk_reporttable_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: reporttable_itemorgunitgroups fk_reporttable_itemorgunitunitgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_itemorgunitgroups
    ADD CONSTRAINT fk_reporttable_itemorgunitunitgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable fk_reporttable_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT fk_reporttable_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: reporttable_organisationunits fk_reporttable_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_organisationunits
    ADD CONSTRAINT fk_reporttable_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: reporttable_organisationunits fk_reporttable_organisationunits_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_organisationunits
    ADD CONSTRAINT fk_reporttable_organisationunits_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_orgunitgroupsetdimensions fk_reporttable_orgunitgroupsetdimensions_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_orgunitgroupsetdimensions
    ADD CONSTRAINT fk_reporttable_orgunitgroupsetdimensions_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_orgunitlevels fk_reporttable_orgunitlevels_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_orgunitlevels
    ADD CONSTRAINT fk_reporttable_orgunitlevels_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable_periods fk_reporttable_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_periods
    ADD CONSTRAINT fk_reporttable_periods_periodid FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: reporttable_periods fk_reporttable_periods_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_periods
    ADD CONSTRAINT fk_reporttable_periods_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable fk_reporttable_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT fk_reporttable_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES public.relativeperiods(relativeperiodsid);


--
-- Name: reporttable_rows fk_reporttable_rows_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable_rows
    ADD CONSTRAINT fk_reporttable_rows_reporttableid FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: reporttable fk_reporttable_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttable
    ADD CONSTRAINT fk_reporttable_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: sectiondataelements fk_section_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectiondataelements
    ADD CONSTRAINT fk_section_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: sectiongreyedfields fk_section_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectiongreyedfields
    ADD CONSTRAINT fk_section_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES public.dataelementoperand(dataelementoperandid);


--
-- Name: section fk_section_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT fk_section_datasetid FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: sectionindicators fk_section_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionindicators
    ADD CONSTRAINT fk_section_indicatorid FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: sectiondataelements fk_sectiondataelements_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectiondataelements
    ADD CONSTRAINT fk_sectiondataelements_sectionid FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);


--
-- Name: sectiongreyedfields fk_sectiongreyedfields_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectiongreyedfields
    ADD CONSTRAINT fk_sectiongreyedfields_sectionid FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);


--
-- Name: sectionindicators fk_sectionindicators_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionindicators
    ADD CONSTRAINT fk_sectionindicators_sectionid FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);


--
-- Name: smscommands fk_smscommand_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommands
    ADD CONSTRAINT fk_smscommand_program FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: smscommands fk_smscommand_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommands
    ADD CONSTRAINT fk_smscommand_programstage FOREIGN KEY (programstageid) REFERENCES public.programstage(programstageid);


--
-- Name: smscommands fk_smscommand_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommands
    ADD CONSTRAINT fk_smscommand_usergroup FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: sqlview fk_sqlview_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlview
    ADD CONSTRAINT fk_sqlview_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentityattributedimension fk_teattributedimension_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributedimension
    ADD CONSTRAINT fk_teattributedimension_attributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: trackedentityattributedimension fk_teattributedimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributedimension
    ADD CONSTRAINT fk_teattributedimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: trackedentitydataelementdimension fk_tedataelementdimension_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydataelementdimension
    ADD CONSTRAINT fk_tedataelementdimension_dataelementid FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: trackedentitydataelementdimension fk_tedataelementdimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitydataelementdimension
    ADD CONSTRAINT fk_tedataelementdimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: trackedentityprogramindicatordimension fk_teprogramindicatordimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityprogramindicatordimension
    ADD CONSTRAINT fk_teprogramindicatordimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: trackedentityprogramindicatordimension fk_teprogramindicatordimension_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityprogramindicatordimension
    ADD CONSTRAINT fk_teprogramindicatordimension_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: trackedentityattributelegendsets fk_trackedentityattribute_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributelegendsets
    ADD CONSTRAINT fk_trackedentityattribute_legendsetid FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: trackedentityattribute fk_trackedentityattribute_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_optionsetid FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: smscodes fk_trackedentityattribute_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscodes
    ADD CONSTRAINT fk_trackedentityattribute_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: trackedentityattribute fk_trackedentityattribute_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentityinstance fk_trackedentityinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: trackedentityinstance fk_trackedentityinstance_representativeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_representativeid FOREIGN KEY (representativeid) REFERENCES public.trackedentityinstance(trackedentityinstanceid);


--
-- Name: trackedentityinstance fk_trackedentityinstance_trackedentitytypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_trackedentitytypeid FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: trackedentityinstancefilter fk_trackedentityinstancefilter_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityinstancefilter
    ADD CONSTRAINT fk_trackedentityinstancefilter_programid FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: trackedentitytype fk_trackedentitytype_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytype
    ADD CONSTRAINT fk_trackedentitytype_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: trackedentitytypeattribute fk_trackedentitytypeattribute_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattribute
    ADD CONSTRAINT fk_trackedentitytypeattribute_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: trackedentitytypeattribute fk_trackedentitytypeattribute_trackedentitytypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattribute
    ADD CONSTRAINT fk_trackedentitytypeattribute_trackedentitytypeid FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: users fk_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_userid FOREIGN KEY (creatoruserid) REFERENCES public.userinfo(userinfoid);


--
-- Name: users fk_user_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_userinfoid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: useraccess fk_useraccess_user; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.useraccess
    ADD CONSTRAINT fk_useraccess_user FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: userapps fk_userapps_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userapps
    ADD CONSTRAINT fk_userapps_userinfoid FOREIGN KEY (userinfoid) REFERENCES public.userinfo(userinfoid);


--
-- Name: userdatavieworgunits fk_userdatavieworgunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userdatavieworgunits
    ADD CONSTRAINT fk_userdatavieworgunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: userdatavieworgunits fk_userdatavieworgunits_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userdatavieworgunits
    ADD CONSTRAINT fk_userdatavieworgunits_userinfoid FOREIGN KEY (userinfoid) REFERENCES public.userinfo(userinfoid);


--
-- Name: usergroup fk_usergroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT fk_usergroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: usergroupaccess fk_usergroupaccess_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupaccess
    ADD CONSTRAINT fk_usergroupaccess_usergroup FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: usergroupmanaged fk_usergroupmanaging_managedbygroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupmanaged
    ADD CONSTRAINT fk_usergroupmanaging_managedbygroupid FOREIGN KEY (managedbygroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: usergroupmanaged fk_usergroupmanaging_managedgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupmanaged
    ADD CONSTRAINT fk_usergroupmanaging_managedgroupid FOREIGN KEY (managedgroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: usergroupmembers fk_usergroupmembers_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupmembers
    ADD CONSTRAINT fk_usergroupmembers_usergroupid FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: usergroupmembers fk_usergroupmembers_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupmembers
    ADD CONSTRAINT fk_usergroupmembers_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: usermembership fk_userinfo_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usermembership
    ADD CONSTRAINT fk_userinfo_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: userkeyjsonvalue fk_userkeyjsonvalue_user; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userkeyjsonvalue
    ADD CONSTRAINT fk_userkeyjsonvalue_user FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: usermembership fk_usermembership_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usermembership
    ADD CONSTRAINT fk_usermembership_userinfoid FOREIGN KEY (userinfoid) REFERENCES public.userinfo(userinfoid);


--
-- Name: usermessage fk_usermessage_user; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT fk_usermessage_user FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: userrole fk_userrole_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT fk_userrole_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: userroleauthorities fk_userroleauthorities_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleauthorities
    ADD CONSTRAINT fk_userroleauthorities_userroleid FOREIGN KEY (userroleid) REFERENCES public.userrole(userroleid);


--
-- Name: userrolemembers fk_userrolemembers_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrolemembers
    ADD CONSTRAINT fk_userrolemembers_userid FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: userrolemembers fk_userrolemembers_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userrolemembers
    ADD CONSTRAINT fk_userrolemembers_userroleid FOREIGN KEY (userroleid) REFERENCES public.userrole(userroleid);


--
-- Name: users_catdimensionconstraints fk_users_catconstraints_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users_catdimensionconstraints
    ADD CONSTRAINT fk_users_catconstraints_userid FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: users_cogsdimensionconstraints fk_users_cogsconstraints_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.users_cogsdimensionconstraints
    ADD CONSTRAINT fk_users_cogsconstraints_userid FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: usersetting fk_usersetting_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usersetting
    ADD CONSTRAINT fk_usersetting_userinfoid FOREIGN KEY (userinfoid) REFERENCES public.userinfo(userinfoid);


--
-- Name: userteisearchorgunits fk_userteisearchorgunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userteisearchorgunits
    ADD CONSTRAINT fk_userteisearchorgunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: userteisearchorgunits fk_userteisearchorgunits_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userteisearchorgunits
    ADD CONSTRAINT fk_userteisearchorgunits_userinfoid FOREIGN KEY (userinfoid) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationnotificationtemplate_recipientusergroups fk_validationnotificationtemplate_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplate_recipientusergroups
    ADD CONSTRAINT fk_validationnotificationtemplate_usergroup FOREIGN KEY (validationnotificationtemplateid) REFERENCES public.validationnotificationtemplate(validationnotificationtemplateid);


--
-- Name: validationresult fk_validationresult_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationresult
    ADD CONSTRAINT fk_validationresult_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: validationresult fk_validationresult_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationresult
    ADD CONSTRAINT fk_validationresult_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES public.organisationunit(organisationunitid);


--
-- Name: validationresult fk_validationresult_period; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationresult
    ADD CONSTRAINT fk_validationresult_period FOREIGN KEY (periodid) REFERENCES public.period(periodid);


--
-- Name: validationresult fk_validationresult_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationresult
    ADD CONSTRAINT fk_validationresult_validationruleid FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: validationrule fk_validationrule_leftexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT fk_validationrule_leftexpressionid FOREIGN KEY (leftexpressionid) REFERENCES public.expression(expressionid);


--
-- Name: predictor fk_validationrule_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT fk_validationrule_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: validationrule fk_validationrule_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT fk_validationrule_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES public.periodtype(periodtypeid);


--
-- Name: validationrule fk_validationrule_rightexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT fk_validationrule_rightexpressionid FOREIGN KEY (rightexpressionid) REFERENCES public.expression(expressionid);


--
-- Name: predictor fk_validationrule_skiptestexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.predictor
    ADD CONSTRAINT fk_validationrule_skiptestexpressionid FOREIGN KEY (skiptestexpressionid) REFERENCES public.expression(expressionid);


--
-- Name: validationrule fk_validationrule_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrule
    ADD CONSTRAINT fk_validationrule_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationnotificationtemplatevalidationrules fk_validationrule_validationnotificationtemplateid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationnotificationtemplatevalidationrules
    ADD CONSTRAINT fk_validationrule_validationnotificationtemplateid FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: validationrulegroup fk_validationrulegroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroup
    ADD CONSTRAINT fk_validationrulegroup_userid FOREIGN KEY (userid) REFERENCES public.userinfo(userinfoid);


--
-- Name: validationrulegroupmembers fk_validationrulegroup_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupmembers
    ADD CONSTRAINT fk_validationrulegroup_validationruleid FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: validationrulegroupmembers fk_validationrulegroupmembers_validationrulegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupmembers
    ADD CONSTRAINT fk_validationrulegroupmembers_validationrulegroupid FOREIGN KEY (validationgroupid) REFERENCES public.validationrulegroup(validationrulegroupid);


--
-- Name: constantattributevalues fka4dwo79bmu0cjtqeqgclj4d42; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantattributevalues
    ADD CONSTRAINT fka4dwo79bmu0cjtqeqgclj4d42 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: dataelementgroupsetusergroupaccesses fka5vwhm9044o3r2mlf7wmkvoka; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT fka5vwhm9044o3r2mlf7wmkvoka FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: attributeuseraccesses fka8e7rdhv12fyvkl84wk5qs55q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeuseraccesses
    ADD CONSTRAINT fka8e7rdhv12fyvkl84wk5qs55q FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: trackedentityattributeuseraccesses fkaena7oeseunp4n3lpltyirxy7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeuseraccesses
    ADD CONSTRAINT fkaena7oeseunp4n3lpltyirxy7 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dashboarduseraccesses fkaew232hpstgwmojawelwlvejm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarduseraccesses
    ADD CONSTRAINT fkaew232hpstgwmojawelwlvejm FOREIGN KEY (dashboardid) REFERENCES public.dashboard(dashboardid);


--
-- Name: optiongroupsetuseraccesses fkagpfc3qen3mlu9y8w187rnw8y; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetuseraccesses
    ADD CONSTRAINT fkagpfc3qen3mlu9y8w187rnw8y FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: categoryoptiongroupusergroupaccesses fkamp4mkfqkkmhhmgjygkmtjpip; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT fkamp4mkfqkkmhhmgjygkmtjpip FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: documenttranslations fkapnobox9g47rnrrf9wtjkaevy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documenttranslations
    ADD CONSTRAINT fkapnobox9g47rnrrf9wtjkaevy FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: sqlviewuseraccesses fkat5c51eye5gfdskvvvgjeyiw7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewuseraccesses
    ADD CONSTRAINT fkat5c51eye5gfdskvvvgjeyiw7 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: categoryoptiongroupuseraccesses fkatcq92ev29vb7yoiut5vcbw0p; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupuseraccesses
    ADD CONSTRAINT fkatcq92ev29vb7yoiut5vcbw0p FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataelementcategoryusergroupaccesses fkaux0ab565allf4ria7i4yqe9o; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryusergroupaccesses
    ADD CONSTRAINT fkaux0ab565allf4ria7i4yqe9o FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: orgunitgrouptranslations fkavox4jvxrnakb535jj5vo759s; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgrouptranslations
    ADD CONSTRAINT fkavox4jvxrnakb535jj5vo759s FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataapprovalleveluseraccesses fkb2kr43ae9gkca8whshqtucs19; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveluseraccesses
    ADD CONSTRAINT fkb2kr43ae9gkca8whshqtucs19 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataapprovalleveluseraccesses fkb2m7919n599yobujaf6sbwkos; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveluseraccesses
    ADD CONSTRAINT fkb2m7919n599yobujaf6sbwkos FOREIGN KEY (dataapprovallevelid) REFERENCES public.dataapprovallevel(dataapprovallevelid);


--
-- Name: sqlviewusergroupaccesses fkb3i0kpxkt0oyh0pori98xj6f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewusergroupaccesses
    ADD CONSTRAINT fkb3i0kpxkt0oyh0pori98xj6f FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: trackedentityattributeattributevalues fkb8c0sfajb4r29mb76o4o59850; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeattributevalues
    ADD CONSTRAINT fkb8c0sfajb4r29mb76o4o59850 FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: sqlviewuseraccesses fkbarqjic704pntxy612aapkr53; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewuseraccesses
    ADD CONSTRAINT fkbarqjic704pntxy612aapkr53 FOREIGN KEY (sqlviewid) REFERENCES public.sqlview(sqlviewid);


--
-- Name: categoryoptioncombotranslations fkbcijpkvi3rcx4nupghfqtpds3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncombotranslations
    ADD CONSTRAINT fkbcijpkvi3rcx4nupghfqtpds3 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categorycombouseraccesses fkbfhtgn2aicjte21pj8qg6qqu4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombouseraccesses
    ADD CONSTRAINT fkbfhtgn2aicjte21pj8qg6qqu4 FOREIGN KEY (categorycomboid) REFERENCES public.categorycombo(categorycomboid);


--
-- Name: reporttableuseraccesses fkbgaeqkluhopo8umxl265vmun7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableuseraccesses
    ADD CONSTRAINT fkbgaeqkluhopo8umxl265vmun7 FOREIGN KEY (reporttableid) REFERENCES public.reporttable(reporttableid);


--
-- Name: programstageusergroupaccesses fkbm0pqhdj9xudinnssoxjdgq6b; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageusergroupaccesses
    ADD CONSTRAINT fkbm0pqhdj9xudinnssoxjdgq6b FOREIGN KEY (programid) REFERENCES public.programstage(programstageid);


--
-- Name: dataelementattributevalues fkbmhr9ethpu50qckrga381i6cy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementattributevalues
    ADD CONSTRAINT fkbmhr9ethpu50qckrga381i6cy FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: reporttabletranslations fkbp9e1cf4kup4bfwa53kqhmhpe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttabletranslations
    ADD CONSTRAINT fkbp9e1cf4kup4bfwa53kqhmhpe FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: documentusergroupaccesses fkbqtw7paqqiuor7kenyjjjkiwv; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentusergroupaccesses
    ADD CONSTRAINT fkbqtw7paqqiuor7kenyjjjkiwv FOREIGN KEY (documentid) REFERENCES public.document(documentid);


--
-- Name: dataelementlegendsets fkbrsplevygf9yr4hvydhix39ug; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementlegendsets
    ADD CONSTRAINT fkbrsplevygf9yr4hvydhix39ug FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataelementcategoryoptionusergroupaccesses fkbvcollq94hbv2kkjvbjhbklxi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT fkbvcollq94hbv2kkjvbjhbklxi FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: validationrulegrouptranslations fkbve6kfglt0ik8f9a3yw45hwnj; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegrouptranslations
    ADD CONSTRAINT fkbve6kfglt0ik8f9a3yw45hwnj FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: validationruleattributevalues fkbxihj807q91qcfrmwkflc2ngi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleattributevalues
    ADD CONSTRAINT fkbxihj807q91qcfrmwkflc2ngi FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: programmessage_emailaddresses fkbyaw75hj8du8w14hpuhxj762w; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage_emailaddresses
    ADD CONSTRAINT fkbyaw75hj8du8w14hpuhxj762w FOREIGN KEY (programmessageemailaddressid) REFERENCES public.programmessage(id);


--
-- Name: optiongroupuseraccesses fkc42pvyyurx18c7g8x1or92x6; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupuseraccesses
    ADD CONSTRAINT fkc42pvyyurx18c7g8x1or92x6 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dashboardtranslations fkc466epp3jve9b0lpavgxocse4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardtranslations
    ADD CONSTRAINT fkc466epp3jve9b0lpavgxocse4 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: datasetusergroupaccesses fkc5hdg6ruv7glmp88j6ohkvxgu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetusergroupaccesses
    ADD CONSTRAINT fkc5hdg6ruv7glmp88j6ohkvxgu FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: categoryoptiongroupsetusergroupaccesses fkc5w6s58ykqw8gf6h8oxinq1p1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT fkc5w6s58ykqw8gf6h8oxinq1p1 FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: categoryoptioncomboattributevalues fkc6ae9oxts83ohrx20gxjoo2o4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncomboattributevalues
    ADD CONSTRAINT fkc6ae9oxts83ohrx20gxjoo2o4 FOREIGN KEY (categoryoptioncomboid) REFERENCES public.categoryoptioncombo(categoryoptioncomboid);


--
-- Name: smscommandcodes fkc6ibwny8jp0hq6l6w0w2untt4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandcodes
    ADD CONSTRAINT fkc6ibwny8jp0hq6l6w0w2untt4 FOREIGN KEY (id) REFERENCES public.smscommands(smscommandid);


--
-- Name: categorycombouseraccesses fkc7eve8dbu1difp790efea7rs4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombouseraccesses
    ADD CONSTRAINT fkc7eve8dbu1difp790efea7rs4 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataapprovallevelusergroupaccesses fkccl4gw7l7hxrfgqa2hqnvxlkq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovallevelusergroupaccesses
    ADD CONSTRAINT fkccl4gw7l7hxrfgqa2hqnvxlkq FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: dataelementgroupsetusergroupaccesses fkcco3y9joqwitwh2mdrq2svakg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT fkcco3y9joqwitwh2mdrq2svakg FOREIGN KEY (dataelementgroupsetid) REFERENCES public.dataelementgroupset(dataelementgroupsetid);


--
-- Name: validationruletranslations fkcd7hsom4yeetyooplbn496t76; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruletranslations
    ADD CONSTRAINT fkcd7hsom4yeetyooplbn496t76 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: trackedentityattributelegendsets fkcdkajbb0rpnpwuo57i894s0dg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributelegendsets
    ADD CONSTRAINT fkcdkajbb0rpnpwuo57i894s0dg FOREIGN KEY (trackedentityattributeid) REFERENCES public.trackedentityattribute(trackedentityattributeid);


--
-- Name: smscommandspecialcharacters fkch98ncn24f71dft102f7of537; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandspecialcharacters
    ADD CONSTRAINT fkch98ncn24f71dft102f7of537 FOREIGN KEY (smscommandid) REFERENCES public.smscommands(smscommandid);


--
-- Name: orgunitleveltranslations fkci0bfpwjo9komus48g0w5vo6r; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitleveltranslations
    ADD CONSTRAINT fkci0bfpwjo9komus48g0w5vo6r FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: chartuseraccesses fkcljbikjrhndoo16muyolfar3n; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartuseraccesses
    ADD CONSTRAINT fkcljbikjrhndoo16muyolfar3n FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: dataelementcategorytranslations fkcmnb6cbqwkgn6yl4ojsfapy4t; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategorytranslations
    ADD CONSTRAINT fkcmnb6cbqwkgn6yl4ojsfapy4t FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: organisationunitattributevalues fkcoo6svgtx8pre5fabnjuyhgpf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.organisationunitattributevalues
    ADD CONSTRAINT fkcoo6svgtx8pre5fabnjuyhgpf FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: userroleuseraccesses fkctrs1ehqub6785ojlihki52eh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleuseraccesses
    ADD CONSTRAINT fkctrs1ehqub6785ojlihki52eh FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: validationruleattributevalues fkcyno963lti18e1fcsyqehub57; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleattributevalues
    ADD CONSTRAINT fkcyno963lti18e1fcsyqehub57 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: documentusergroupaccesses fkd8f9hmgonr1f04lom1pwg2td5; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentusergroupaccesses
    ADD CONSTRAINT fkd8f9hmgonr1f04lom1pwg2td5 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: trackedentitytypeusergroupaccesses fkdaq0s179v2imf215hn3b7kpdp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeusergroupaccesses
    ADD CONSTRAINT fkdaq0s179v2imf215hn3b7kpdp FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: colortranslations fkdawo044shd3vyrgeqhlbp83h; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colortranslations
    ADD CONSTRAINT fkdawo044shd3vyrgeqhlbp83h FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categorycombotranslations fkdb0p44e9kub3gakn0bn39v47e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombotranslations
    ADD CONSTRAINT fkdb0p44e9kub3gakn0bn39v47e FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: indicatorattributevalues fkdba2e0q8kva3oiigmfjujmc09; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorattributevalues
    ADD CONSTRAINT fkdba2e0q8kva3oiigmfjujmc09 FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: dataapprovalworkflowusergroupaccesses fkdc4xtxb8tk28tg8gihya0f8t3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT fkdc4xtxb8tk28tg8gihya0f8t3 FOREIGN KEY (workflowid) REFERENCES public.dataapprovalworkflow(workflowid);


--
-- Name: dataelementusergroupaccesses fkdfoid1s8be97lj4d0dq0wn2h9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementusergroupaccesses
    ADD CONSTRAINT fkdfoid1s8be97lj4d0dq0wn2h9 FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: dataelementgroupsetattributevalues fkdjw7x81vf652xov95hx212n66; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetattributevalues
    ADD CONSTRAINT fkdjw7x81vf652xov95hx212n66 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: trackedentitytypeuseraccesses fkdk6whdv75o0d1kwveyfm7fo0i; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeuseraccesses
    ADD CONSTRAINT fkdk6whdv75o0d1kwveyfm7fo0i FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programstageinstance_messageconversation fkdmc46bnsqath7p6mrsrb89eml; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance_messageconversation
    ADD CONSTRAINT fkdmc46bnsqath7p6mrsrb89eml FOREIGN KEY (messageconversationid) REFERENCES public.messageconversation(messageconversationid);


--
-- Name: mapuseraccesses fkdmiv8bdyjs0sj5bgltqmync3q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapuseraccesses
    ADD CONSTRAINT fkdmiv8bdyjs0sj5bgltqmync3q FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: reportuseraccesses fkdmqfyfhml5bjunjsvdur0trxy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportuseraccesses
    ADD CONSTRAINT fkdmqfyfhml5bjunjsvdur0trxy FOREIGN KEY (reportid) REFERENCES public.report(reportid);


--
-- Name: dataelementcategoryoptionusergroupaccesses fkdudfflo1n7r4iuyqxba1b4ovi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT fkdudfflo1n7r4iuyqxba1b4ovi FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: optionsetusergroupaccesses fkdx9fhldp5xt6quko76j4d8kk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetusergroupaccesses
    ADD CONSTRAINT fkdx9fhldp5xt6quko76j4d8kk FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: smscommandcodes fke1eymlpayuhawlo8pfuwue654; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandcodes
    ADD CONSTRAINT fke1eymlpayuhawlo8pfuwue654 FOREIGN KEY (codeid) REFERENCES public.smscodes(smscodeid);


--
-- Name: programindicatorgroupattributevalues fke2q9lkr609pqg1b0ydm0rowtm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupattributevalues
    ADD CONSTRAINT fke2q9lkr609pqg1b0ydm0rowtm FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: reporttableusergroupaccesses fke9a9ot5uw06v8xysffntqn163; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableusergroupaccesses
    ADD CONSTRAINT fke9a9ot5uw06v8xysffntqn163 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: validationrulegroupuseraccesses fked5a3idn9xy17kqh044r4khnq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupuseraccesses
    ADD CONSTRAINT fked5a3idn9xy17kqh044r4khnq FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programindicatorgroupusergroupaccesses fkehrkml89lh7kv1bmutotucsjm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgroupusergroupaccesses
    ADD CONSTRAINT fkehrkml89lh7kv1bmutotucsjm FOREIGN KEY (programindicatorgroupid) REFERENCES public.programindicatorgroup(programindicatorgroupid);


--
-- Name: datasetnotification_datasets fken6g44y648k1fembweltcao3e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotification_datasets
    ADD CONSTRAINT fken6g44y648k1fembweltcao3e FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: programindicatorgrouptranslations fker1uvlubbi174wihftcmjqwah; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorgrouptranslations
    ADD CONSTRAINT fker1uvlubbi174wihftcmjqwah FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: documentuseraccesses fkeu7sin6er3x3kuhtbqys9bbqt; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentuseraccesses
    ADD CONSTRAINT fkeu7sin6er3x3kuhtbqys9bbqt FOREIGN KEY (documentid) REFERENCES public.document(documentid);


--
-- Name: reportusergroupaccesses fkeuett3yqyqms2edpep4g1etjd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportusergroupaccesses
    ADD CONSTRAINT fkeuett3yqyqms2edpep4g1etjd FOREIGN KEY (reportid) REFERENCES public.report(reportid);


--
-- Name: externalmaplayerusergroupaccesses fkf97c7k1pwvp39tdx1ehrwywxp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayerusergroupaccesses
    ADD CONSTRAINT fkf97c7k1pwvp39tdx1ehrwywxp FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: optionsetusergroupaccesses fkfamquh0yxd74tj2thpnxll8qd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetusergroupaccesses
    ADD CONSTRAINT fkfamquh0yxd74tj2thpnxll8qd FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: interpretationuseraccesses fkfgbg6qcks2bxagux2nqwl6mam; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationuseraccesses
    ADD CONSTRAINT fkfgbg6qcks2bxagux2nqwl6mam FOREIGN KEY (interpretationid) REFERENCES public.interpretation(interpretationid);


--
-- Name: datasetusergroupaccesses fkfju7l9tdk4vuit5y3mw3pmfdp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetusergroupaccesses
    ADD CONSTRAINT fkfju7l9tdk4vuit5y3mw3pmfdp FOREIGN KEY (datasetid) REFERENCES public.dataset(datasetid);


--
-- Name: validationrulegroupattributevalues fkfruohf3cqsxqunqlbnl1i3ier; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupattributevalues
    ADD CONSTRAINT fkfruohf3cqsxqunqlbnl1i3ier FOREIGN KEY (validationrulegroupid) REFERENCES public.validationrulegroup(validationrulegroupid);


--
-- Name: dataelementgroupsetuseraccesses fkftog7iowqys99f34vxtwvhclx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetuseraccesses
    ADD CONSTRAINT fkftog7iowqys99f34vxtwvhclx FOREIGN KEY (dataelementgroupsetid) REFERENCES public.dataelementgroupset(dataelementgroupsetid);


--
-- Name: categoryoptiongroupsettranslations fkfysoq9tcj6k0g942tni0p91sn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsettranslations
    ADD CONSTRAINT fkfysoq9tcj6k0g942tni0p91sn FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: previouspasswords fkg6n5kwuhypwdvkn15ke824kpb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.previouspasswords
    ADD CONSTRAINT fkg6n5kwuhypwdvkn15ke824kpb FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: program_userroles fkgb55kdvtf92qykh2840inyhst; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.program_userroles
    ADD CONSTRAINT fkgb55kdvtf92qykh2840inyhst FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: categoryoptiontranslations fkgf3l6blh1evu8cbbfdel3dap; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiontranslations
    ADD CONSTRAINT fkgf3l6blh1evu8cbbfdel3dap FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categoryoptiongroupsetattributevalues fkgjrd8o33y63ely39hjm7afbcf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetattributevalues
    ADD CONSTRAINT fkgjrd8o33y63ely39hjm7afbcf FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: dashboarditemtranslations fkgq38c88dd0nqfrxbdlxj95gkn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarditemtranslations
    ADD CONSTRAINT fkgq38c88dd0nqfrxbdlxj95gkn FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: validationruleuseraccesses fkgscric80wkt82kyxdc4gvv030; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleuseraccesses
    ADD CONSTRAINT fkgscric80wkt82kyxdc4gvv030 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: categoryoptioncomboattributevalues fkgvdx3u8ymbvq3mfr0qih7kbgl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptioncomboattributevalues
    ADD CONSTRAINT fkgvdx3u8ymbvq3mfr0qih7kbgl FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: dataelementattributevalues fkh063grx17s8wbufgi6rmb2qj9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementattributevalues
    ADD CONSTRAINT fkh063grx17s8wbufgi6rmb2qj9 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: optionsetattributevalues fkh7rgh9ccjygftu2um7bt8o15w; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetattributevalues
    ADD CONSTRAINT fkh7rgh9ccjygftu2um7bt8o15w FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: userroleusergroupaccesses fkh8a8f65qyvb9ht8218fbqif3r; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleusergroupaccesses
    ADD CONSTRAINT fkh8a8f65qyvb9ht8218fbqif3r FOREIGN KEY (userroleid) REFERENCES public.userrole(userroleid);


--
-- Name: categorycombousergroupaccesses fkhcb8xpki59p7up71arpcj6mgo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categorycombousergroupaccesses
    ADD CONSTRAINT fkhcb8xpki59p7up71arpcj6mgo FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: optionvaluetranslations fkhdb5bwj85vxienykc71k0h6gb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionvaluetranslations
    ADD CONSTRAINT fkhdb5bwj85vxienykc71k0h6gb FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: eventreportusergroupaccesses fkhlhawnoj4iw21if6whyjhyuxx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportusergroupaccesses
    ADD CONSTRAINT fkhlhawnoj4iw21if6whyjhyuxx FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: validationruleusergroupaccesses fkhmb8frud8xu70up73bpnbfpf8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleusergroupaccesses
    ADD CONSTRAINT fkhmb8frud8xu70up73bpnbfpf8 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: dataelementgroupuseraccesses fkhqi75xl3pvjqhvg2ffkapse5b; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupuseraccesses
    ADD CONSTRAINT fkhqi75xl3pvjqhvg2ffkapse5b FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: programstageusergroupaccesses fkhrmc5b26i4fv714agdvwm2tly; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageusergroupaccesses
    ADD CONSTRAINT fkhrmc5b26i4fv714agdvwm2tly FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: attributeusergroupaccesses fkhsktcf5wolfqpbjum1h8mjlg0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeusergroupaccesses
    ADD CONSTRAINT fkhsktcf5wolfqpbjum1h8mjlg0 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: optionattributevalues fki0jsa3ibpqnmf9f6a079yvqg1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionattributevalues
    ADD CONSTRAINT fki0jsa3ibpqnmf9f6a079yvqg1 FOREIGN KEY (optionvalueid) REFERENCES public.optionvalue(optionvalueid);


--
-- Name: legendsetuseraccesses fki3c4derc037s8706gc29tn72y; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetuseraccesses
    ADD CONSTRAINT fki3c4derc037s8706gc29tn72y FOREIGN KEY (maplegendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: pushanalysis fkibpy72i2p9nfkdtqqe6my34nr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysis
    ADD CONSTRAINT fkibpy72i2p9nfkdtqqe6my34nr FOREIGN KEY (dashboard) REFERENCES public.dashboard(dashboardid);


--
-- Name: documentuseraccesses fkiev77xq3u50tnxter17midwpk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentuseraccesses
    ADD CONSTRAINT fkiev77xq3u50tnxter17midwpk FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: optiongroupattributevalues fkijpqu28mpafr0wbgu2p4qs2ys; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupattributevalues
    ADD CONSTRAINT fkijpqu28mpafr0wbgu2p4qs2ys FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: categoryoptiongroupattributevalues fkikavm35a9xngxxqnaonnmk7yw; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupattributevalues
    ADD CONSTRAINT fkikavm35a9xngxxqnaonnmk7yw FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: programindicatorattributevalues fkilna5etu4xlgyf93sguvt6e6s; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorattributevalues
    ADD CONSTRAINT fkilna5etu4xlgyf93sguvt6e6s FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: orgunitgroupsetattributevalues fkisircfmtwyf4f63ci19fi4i8l; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetattributevalues
    ADD CONSTRAINT fkisircfmtwyf4f63ci19fi4i8l FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: documentattributevalues fkj16b2115543s4odxcl034keuj; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentattributevalues
    ADD CONSTRAINT fkj16b2115543s4odxcl034keuj FOREIGN KEY (documentid) REFERENCES public.document(documentid);


--
-- Name: programinstance_messageconversation fkj3dr5vrqclcaodu7x4rm1qsbo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance_messageconversation
    ADD CONSTRAINT fkj3dr5vrqclcaodu7x4rm1qsbo FOREIGN KEY (programinstanceid) REFERENCES public.programinstance(programinstanceid);


--
-- Name: indicatoruseraccesses fkj5qrssmmg27bp6i8vb391kwin; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatoruseraccesses
    ADD CONSTRAINT fkj5qrssmmg27bp6i8vb391kwin FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: dataelementuseraccesses fkjdlf4yqax04d3krscjtucfjv0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementuseraccesses
    ADD CONSTRAINT fkjdlf4yqax04d3krscjtucfjv0 FOREIGN KEY (dataelementid) REFERENCES public.dataelement(dataelementid);


--
-- Name: indicatorgroupuseraccesses fkjl1fwmeghy7xswjxuin4bb5t9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupuseraccesses
    ADD CONSTRAINT fkjl1fwmeghy7xswjxuin4bb5t9 FOREIGN KEY (indicatorgroupid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: dataelementgroupsettranslations fkjmtfdehdm5kixd7fxidajbqpt; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsettranslations
    ADD CONSTRAINT fkjmtfdehdm5kixd7fxidajbqpt FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataelementcategoryoptionattributevalues fkjp6o40q5mb5a9fixiaqxf6dur; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionattributevalues
    ADD CONSTRAINT fkjp6o40q5mb5a9fixiaqxf6dur FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: indicatorgroupattributevalues fkjtpyr15khpfwyeljjblln3amh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupattributevalues
    ADD CONSTRAINT fkjtpyr15khpfwyeljjblln3amh FOREIGN KEY (indicatorgroupid) REFERENCES public.indicatorgroup(indicatorgroupid);


--
-- Name: optiongroupsetusergroupaccesses fkjuv8jwcqjrp9u60ca0b9secwe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetusergroupaccesses
    ADD CONSTRAINT fkjuv8jwcqjrp9u60ca0b9secwe FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: attributeuseraccesses fkjwscshsefl3u0p4e1829sgdyr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeuseraccesses
    ADD CONSTRAINT fkjwscshsefl3u0p4e1829sgdyr FOREIGN KEY (attributeid) REFERENCES public.attribute(attributeid);


--
-- Name: programinstance_messageconversation fkjy8ap861np4x3c5glxv8l8719; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programinstance_messageconversation
    ADD CONSTRAINT fkjy8ap861np4x3c5glxv8l8719 FOREIGN KEY (messageconversationid) REFERENCES public.messageconversation(messageconversationid);


--
-- Name: constantuseraccesses fkk42gcgtiru8yc79d83vqap641; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantuseraccesses
    ADD CONSTRAINT fkk42gcgtiru8yc79d83vqap641 FOREIGN KEY (constantid) REFERENCES public.constant(constantid);


--
-- Name: indicatorusergroupaccesses fkk53fwmr0vsgh3pbfw1u5i7kxd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorusergroupaccesses
    ADD CONSTRAINT fkk53fwmr0vsgh3pbfw1u5i7kxd FOREIGN KEY (indicatorid) REFERENCES public.indicator(indicatorid);


--
-- Name: datasetuseraccesses fkk6vnjbcq5ypgh3xllicm8rg53; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetuseraccesses
    ADD CONSTRAINT fkk6vnjbcq5ypgh3xllicm8rg53 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: trackedentitytypeuseraccesses fkkao3e3ujv7mb1y45j6f31su7l; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeuseraccesses
    ADD CONSTRAINT fkkao3e3ujv7mb1y45j6f31su7l FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: programindicatorlegendsets fkkbd9rqv83w4nwogj5fchtxj9y; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorlegendsets
    ADD CONSTRAINT fkkbd9rqv83w4nwogj5fchtxj9y FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: indicatorgroupsetuseraccesses fkkbjtmc65moywxl2yr4rkg91dc; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetuseraccesses
    ADD CONSTRAINT fkkbjtmc65moywxl2yr4rkg91dc FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programusergroupaccesses fkkca6l1aa5y714267lpm03f6k1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programusergroupaccesses
    ADD CONSTRAINT fkkca6l1aa5y714267lpm03f6k1 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: programindicatorusergroupaccesses fkkcioj9orjwbcwmdam6pj6d9o2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorusergroupaccesses
    ADD CONSTRAINT fkkcioj9orjwbcwmdam6pj6d9o2 FOREIGN KEY (programindicatorid) REFERENCES public.programindicator(programindicatorid);


--
-- Name: programtranslations fkkgab7upiou1pws7oempk5t367; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programtranslations
    ADD CONSTRAINT fkkgab7upiou1pws7oempk5t367 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categoryattributevalues fkkjg0yhi1ge3wteghq6f1n0m9x; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryattributevalues
    ADD CONSTRAINT fkkjg0yhi1ge3wteghq6f1n0m9x FOREIGN KEY (categoryid) REFERENCES public.dataelementcategory(categoryid);


--
-- Name: optionsetuseraccesses fkkml1la4fwlysih8lrwhkvx0du; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetuseraccesses
    ADD CONSTRAINT fkkml1la4fwlysih8lrwhkvx0du FOREIGN KEY (optionsetid) REFERENCES public.optionset(optionsetid);


--
-- Name: orgunitgroupsettranslations fkknm2jjnfl49hvsruohsfapo3r; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsettranslations
    ADD CONSTRAINT fkknm2jjnfl49hvsruohsfapo3r FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: indicatorgroupsetuseraccesses fkkrew00svu3k1mj9dopscffp55; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetuseraccesses
    ADD CONSTRAINT fkkrew00svu3k1mj9dopscffp55 FOREIGN KEY (indicatorgroupsetid) REFERENCES public.indicatorgroupset(indicatorgroupsetid);


--
-- Name: legendsetuseraccesses fkkrh34fj5dp5gvkiokhkmwlqw4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetuseraccesses
    ADD CONSTRAINT fkkrh34fj5dp5gvkiokhkmwlqw4 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: optionsetattributevalues fkkrhc4bbmf9jnaxj545a004fb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetattributevalues
    ADD CONSTRAINT fkkrhc4bbmf9jnaxj545a004fb FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: chartusergroupaccesses fkkrroom2rcrf3a83abq969085u; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartusergroupaccesses
    ADD CONSTRAINT fkkrroom2rcrf3a83abq969085u FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: programstageinstance_messageconversation fkks9i10v8xg7d22hlhmesia51l; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageinstance_messageconversation
    ADD CONSTRAINT fkks9i10v8xg7d22hlhmesia51l FOREIGN KEY (programstageinstanceid) REFERENCES public.programstageinstance(programstageinstanceid);


--
-- Name: outbound_sms_recipients fkktmkxjuo5b3v1q2jqk7lymh0p; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.outbound_sms_recipients
    ADD CONSTRAINT fkktmkxjuo5b3v1q2jqk7lymh0p FOREIGN KEY (outbound_sms_id) REFERENCES public.outbound_sms(id);


--
-- Name: programsectiontranslations fkkvxshrhiqymj6hb2k96hscvst; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programsectiontranslations
    ADD CONSTRAINT fkkvxshrhiqymj6hb2k96hscvst FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: reportusergroupaccesses fkkyhyiwi48ogtjvtvltk506eeh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reportusergroupaccesses
    ADD CONSTRAINT fkkyhyiwi48ogtjvtvltk506eeh FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: dataelementgroupsetuseraccesses fkl0m801gevx2jxc3tv4uh917wd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetuseraccesses
    ADD CONSTRAINT fkl0m801gevx2jxc3tv4uh917wd FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: orgunitgroupsetusergroupaccesses fkl0xk38e01qsghc0kkbykbbodo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT fkl0xk38e01qsghc0kkbykbbodo FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: constantusergroupaccesses fkl8cxqyb3s8c31qbaqehu71u9e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantusergroupaccesses
    ADD CONSTRAINT fkl8cxqyb3s8c31qbaqehu71u9e FOREIGN KEY (constantid) REFERENCES public.constant(constantid);


--
-- Name: dataelementgroupsetattributevalues fkl8h8ty5ii42v1ioad1ocacvqi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupsetattributevalues
    ADD CONSTRAINT fkl8h8ty5ii42v1ioad1ocacvqi FOREIGN KEY (dataelementgroupsetid) REFERENCES public.dataelementgroupset(dataelementgroupsetid);


--
-- Name: programindicatorusergroupaccesses fklcvyf20urcrk3k1grq17u5yxa; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatorusergroupaccesses
    ADD CONSTRAINT fklcvyf20urcrk3k1grq17u5yxa FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: documentattributevalues fkleuiq3mib4iq5q840n80cv993; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.documentattributevalues
    ADD CONSTRAINT fkleuiq3mib4iq5q840n80cv993 FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: dataelementusergroupaccesses fkljaoalw4iomchlahjcmijy41n; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementusergroupaccesses
    ADD CONSTRAINT fkljaoalw4iomchlahjcmijy41n FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: programmessage_deliverychannels fkljv6vp4ro5l6stx7dclnkenen; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programmessage_deliverychannels
    ADD CONSTRAINT fkljv6vp4ro5l6stx7dclnkenen FOREIGN KEY (programmessagedeliverychannelsid) REFERENCES public.programmessage(id);


--
-- Name: pushanalysisrecipientusergroups fklllvhilfsouycft98q82ph66q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.pushanalysisrecipientusergroups
    ADD CONSTRAINT fklllvhilfsouycft98q82ph66q FOREIGN KEY (usergroupid) REFERENCES public.pushanalysis(pushanalysisid);


--
-- Name: eventreportusergroupaccesses fklq73q1u6q1w6uilvg8xjvqpkq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportusergroupaccesses
    ADD CONSTRAINT fklq73q1u6q1w6uilvg8xjvqpkq FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: eventreportuseraccesses fklxmc2s4f0e2a318ab6vda0n6p; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportuseraccesses
    ADD CONSTRAINT fklxmc2s4f0e2a318ab6vda0n6p FOREIGN KEY (eventreportid) REFERENCES public.eventreport(eventreportid);


--
-- Name: eventchartuseraccesses fklxqwf9ghutdfxongiorp2jpef; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartuseraccesses
    ADD CONSTRAINT fklxqwf9ghutdfxongiorp2jpef FOREIGN KEY (eventchartid) REFERENCES public.eventchart(eventchartid);


--
-- Name: programstageattributevalues fkly81qo12mmdwo1nuxqvdvw07d; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageattributevalues
    ADD CONSTRAINT fkly81qo12mmdwo1nuxqvdvw07d FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: eventchartusergroupaccesses fkm5h5tkbbogqelay0io9qm74o0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartusergroupaccesses
    ADD CONSTRAINT fkm5h5tkbbogqelay0io9qm74o0 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: interpretationusergroupaccesses fkmfeihksbnauk0swgve0o96ewr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationusergroupaccesses
    ADD CONSTRAINT fkmfeihksbnauk0swgve0o96ewr FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: validationruleuseraccesses fkmk0h5ph7j0ep4nxjj2q5ga9r0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationruleuseraccesses
    ADD CONSTRAINT fkmk0h5ph7j0ep4nxjj2q5ga9r0 FOREIGN KEY (validationruleid) REFERENCES public.validationrule(validationruleid);


--
-- Name: externalmaplayerusergroupaccesses fkmmdfsq1s9g437k0wsshbivaht; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.externalmaplayerusergroupaccesses
    ADD CONSTRAINT fkmmdfsq1s9g437k0wsshbivaht FOREIGN KEY (externalmaplayerid) REFERENCES public.externalmaplayer(externalmaplayerid);


--
-- Name: indicatorgrouptranslations fkmrqgrjgwtns2j3w5wvp2cil0f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgrouptranslations
    ADD CONSTRAINT fkmrqgrjgwtns2j3w5wvp2cil0f FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dashboardusergroupaccesses fkmrvj9l6sv7su7wehohc9wipdu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardusergroupaccesses
    ADD CONSTRAINT fkmrvj9l6sv7su7wehohc9wipdu FOREIGN KEY (dashboardid) REFERENCES public.dashboard(dashboardid);


--
-- Name: programindicatoruseraccesses fkms3h2rvf98325h17u60hnpfdx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programindicatoruseraccesses
    ADD CONSTRAINT fkms3h2rvf98325h17u60hnpfdx FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: categoryoptiongroupsetusergroupaccesses fkmumx7i7wqjn3jh4mt4r4x1eqe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT fkmumx7i7wqjn3jh4mt4r4x1eqe FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: dashboardusergroupaccesses fkmw5yn4ptnpkve2lsvxiopdp6; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboardusergroupaccesses
    ADD CONSTRAINT fkmw5yn4ptnpkve2lsvxiopdp6 FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: userroleusergroupaccesses fkmwadbe8twmr8ordbjjlrloxnp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleusergroupaccesses
    ADD CONSTRAINT fkmwadbe8twmr8ordbjjlrloxnp FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: eventreporttranslations fkmxrvdw7rdmo0o50qjbk30lw8f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreporttranslations
    ADD CONSTRAINT fkmxrvdw7rdmo0o50qjbk30lw8f FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: reporttranslations fkn2afpli3opeouwqvtguobc7td; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttranslations
    ADD CONSTRAINT fkn2afpli3opeouwqvtguobc7td FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: orgunitgroupsetusergroupaccesses fkn5mp5cao30al69clovpwwe6mk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT fkn5mp5cao30al69clovpwwe6mk FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: usergroupusergroupaccesses fkn8cff8o99v6tnpgl2fgugjwpf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupusergroupaccesses
    ADD CONSTRAINT fkn8cff8o99v6tnpgl2fgugjwpf FOREIGN KEY (usergroupid) REFERENCES public.usergroup(usergroupid);


--
-- Name: indicatorgroupsettranslations fkndy19mcicdsxoq15p0fd7p1ew; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsettranslations
    ADD CONSTRAINT fkndy19mcicdsxoq15p0fd7p1ew FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: optiongroupusergroupaccesses fkne0hjh5lknlabbotmbpm9ynwx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupusergroupaccesses
    ADD CONSTRAINT fkne0hjh5lknlabbotmbpm9ynwx FOREIGN KEY (optiongroupid) REFERENCES public.optiongroup(optiongroupid);


--
-- Name: categoryoptiongroupsetuseraccesses fkneu0r5aaxns3msvu5r7cpvjhk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetuseraccesses
    ADD CONSTRAINT fkneu0r5aaxns3msvu5r7cpvjhk FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: indicatorgroupusergroupaccesses fknfwv4dnc90au8jvtt3ra2scbl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupusergroupaccesses
    ADD CONSTRAINT fknfwv4dnc90au8jvtt3ra2scbl FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: indicatoruseraccesses fkngn9j2oevi4k05245lqfhuyh4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatoruseraccesses
    ADD CONSTRAINT fkngn9j2oevi4k05245lqfhuyh4 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: orgunitgroupusergroupaccesses fknimjjjq6ww7vcnjbxw9qo3daa; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupusergroupaccesses
    ADD CONSTRAINT fknimjjjq6ww7vcnjbxw9qo3daa FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: trackedentityattributeusergroupaccesses fknqghxxgrlh1dyluj9fgh1x6pn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributeusergroupaccesses
    ADD CONSTRAINT fknqghxxgrlh1dyluj9fgh1x6pn FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: legendsetattributevalues fknthmdh7yci1po66i02ssldxod; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetattributevalues
    ADD CONSTRAINT fknthmdh7yci1po66i02ssldxod FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: orgunitgroupsetuseraccesses fknyh2e7xbcnv2iw3wvtk2ng8h9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupsetuseraccesses
    ADD CONSTRAINT fknyh2e7xbcnv2iw3wvtk2ng8h9 FOREIGN KEY (orgunitgroupsetid) REFERENCES public.orgunitgroupset(orgunitgroupsetid);


--
-- Name: trackedentityattributetranslations fko74ok1o1jcw9b9byfp2c995lu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentityattributetranslations
    ADD CONSTRAINT fko74ok1o1jcw9b9byfp2c995lu FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: optionsetuseraccesses fko7bqom2xom9t71509y9cxvh7f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optionsetuseraccesses
    ADD CONSTRAINT fko7bqom2xom9t71509y9cxvh7f FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: mapusergroupaccesses fko975uxx8n7sspdysehujj8e7t; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapusergroupaccesses
    ADD CONSTRAINT fko975uxx8n7sspdysehujj8e7t FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: sqlviewusergroupaccesses fkoccxpdljjjbxr1vrwfp9d25dt; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sqlviewusergroupaccesses
    ADD CONSTRAINT fkoccxpdljjjbxr1vrwfp9d25dt FOREIGN KEY (sqlviewid) REFERENCES public.sqlview(sqlviewid);


--
-- Name: mapusergroupaccesses fkokgalu75pd2e1no2x53cxe8ik; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapusergroupaccesses
    ADD CONSTRAINT fkokgalu75pd2e1no2x53cxe8ik FOREIGN KEY (mapid) REFERENCES public.map(mapid);


--
-- Name: programstagetranslations fkopw1b57inx5x5sm7r22lh0qso; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstagetranslations
    ADD CONSTRAINT fkopw1b57inx5x5sm7r22lh0qso FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: chartusergroupaccesses fkou5go53l80o7omb2dqcpp7wjh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartusergroupaccesses
    ADD CONSTRAINT fkou5go53l80o7omb2dqcpp7wjh FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: interpretationuseraccesses fkp6b2s2prdt8o77hncyiyoc3w0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.interpretationuseraccesses
    ADD CONSTRAINT fkp6b2s2prdt8o77hncyiyoc3w0 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: orgunitgroupattributevalues fkp7of94t57djd0buqsc46xs32u; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupattributevalues
    ADD CONSTRAINT fkp7of94t57djd0buqsc46xs32u FOREIGN KEY (orgunitgroupid) REFERENCES public.orgunitgroup(orgunitgroupid);


--
-- Name: programruletranslations fkp7u6oqpln4dt83wovshmrc1jo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programruletranslations
    ADD CONSTRAINT fkp7u6oqpln4dt83wovshmrc1jo FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dataelementgroupattributevalues fkp8i8mavj9jd5q2lyqag2rhi03; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupattributevalues
    ADD CONSTRAINT fkp8i8mavj9jd5q2lyqag2rhi03 FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: dataelementgroupuseraccesses fkpe7wkmr4j7aury8bwntn2jd0k; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupuseraccesses
    ADD CONSTRAINT fkpe7wkmr4j7aury8bwntn2jd0k FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: usergroupuseraccesses fkperhr810jcqprtiija9b5a4tj; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupuseraccesses
    ADD CONSTRAINT fkperhr810jcqprtiija9b5a4tj FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: datasetnotificationtemplate_deliverychannel fkpmebskggkjfjfwxw7u43twmg2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetnotificationtemplate_deliverychannel
    ADD CONSTRAINT fkpmebskggkjfjfwxw7u43twmg2 FOREIGN KEY (datasetnotificationtemplateid) REFERENCES public.datasetnotificationtemplate(datasetnotificationtemplateid);


--
-- Name: attributetranslations fkprt8bw5cw4fvcnpfe9iayng1v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributetranslations
    ADD CONSTRAINT fkprt8bw5cw4fvcnpfe9iayng1v FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categoryoptiongroupuseraccesses fkq1mwh4ffdsnhwn7v097eayid5; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupuseraccesses
    ADD CONSTRAINT fkq1mwh4ffdsnhwn7v097eayid5 FOREIGN KEY (categoryoptiongroupid) REFERENCES public.categoryoptiongroup(categoryoptiongroupid);


--
-- Name: attributeusergroupaccesses fkq35si1aa88tk4o4ygpn8my54q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.attributeusergroupaccesses
    ADD CONSTRAINT fkq35si1aa88tk4o4ygpn8my54q FOREIGN KEY (attributeid) REFERENCES public.attribute(attributeid);


--
-- Name: userattributevalues fkq6f4o8i51dngmiimuj3wctes3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userattributevalues
    ADD CONSTRAINT fkq6f4o8i51dngmiimuj3wctes3 FOREIGN KEY (userinfoid) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicatorgroupsetusergroupaccesses fkq80dj8d4slnw9lna5jrsdxxou; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT fkq80dj8d4slnw9lna5jrsdxxou FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: userroleuseraccesses fkqf598s5kghjesta6ibgiepbnp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userroleuseraccesses
    ADD CONSTRAINT fkqf598s5kghjesta6ibgiepbnp FOREIGN KEY (userroleid) REFERENCES public.userrole(userroleid);


--
-- Name: categoryoptiongrouptranslations fkqgvpllqqqfstetxiuikf4my7q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongrouptranslations
    ADD CONSTRAINT fkqgvpllqqqfstetxiuikf4my7q FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: optiongroupuseraccesses fkqit4l4bglf1xnh7jo7i3x11e7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupuseraccesses
    ADD CONSTRAINT fkqit4l4bglf1xnh7jo7i3x11e7 FOREIGN KEY (optiongroupid) REFERENCES public.optiongroup(optiongroupid);


--
-- Name: usergroupusergroupaccesses fkqky1rnn3ulqpc6j0mpjrm7elm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupusergroupaccesses
    ADD CONSTRAINT fkqky1rnn3ulqpc6j0mpjrm7elm FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: trackedentitytypeusergroupaccesses fkql75bu38n82o2bha8qt65nk2p; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeusergroupaccesses
    ADD CONSTRAINT fkql75bu38n82o2bha8qt65nk2p FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: validationcriteriatranslations fkqramkdhx87vxn8oybmygjbu1a; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationcriteriatranslations
    ADD CONSTRAINT fkqramkdhx87vxn8oybmygjbu1a FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: datasetattributevalues fkqsfp938c3hscdt0l85kakwtxr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.datasetattributevalues
    ADD CONSTRAINT fkqsfp938c3hscdt0l85kakwtxr FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: constantusergroupaccesses fkqv5w8d50v5bhcsvwahlwfslqu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantusergroupaccesses
    ADD CONSTRAINT fkqv5w8d50v5bhcsvwahlwfslqu FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: eventreportuseraccesses fkr7hn20ublmb237x85sj6imdbf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventreportuseraccesses
    ADD CONSTRAINT fkr7hn20ublmb237x85sj6imdbf FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: colorsettranslations fkrbtkonmtsb3dd6fri8jh4kcgx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.colorsettranslations
    ADD CONSTRAINT fkrbtkonmtsb3dd6fri8jh4kcgx FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: categoryoptiongroupsetattributevalues fkrhpy67336uj4qhrbgjfre0nvq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.categoryoptiongroupsetattributevalues
    ADD CONSTRAINT fkrhpy67336uj4qhrbgjfre0nvq FOREIGN KEY (categoryoptiongroupsetid) REFERENCES public.categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: eventchartuseraccesses fkrj07bbr93ggi7te3wclxftolp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventchartuseraccesses
    ADD CONSTRAINT fkrj07bbr93ggi7te3wclxftolp FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: trackedentitytypeattributevalues fkrjv6nocvx88v1l9ygtbf5p5sb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.trackedentitytypeattributevalues
    ADD CONSTRAINT fkrjv6nocvx88v1l9ygtbf5p5sb FOREIGN KEY (trackedentitytypeid) REFERENCES public.trackedentitytype(trackedentitytypeid);


--
-- Name: reporttableuseraccesses fkrk1nime7qkj74qk8bvl71nnu0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.reporttableuseraccesses
    ADD CONSTRAINT fkrk1nime7qkj74qk8bvl71nnu0 FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: chartuseraccesses fkrlanjumcue8qe8csk47invf0m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chartuseraccesses
    ADD CONSTRAINT fkrlanjumcue8qe8csk47invf0m FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: dataapprovalleveltranslations fkrq69i1s0tkmw9u0mga5eggoyx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataapprovalleveltranslations
    ADD CONSTRAINT fkrq69i1s0tkmw9u0mga5eggoyx FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: chart_filters fks04qh58fxmsf5601n9cvpdtc8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.chart_filters
    ADD CONSTRAINT fks04qh58fxmsf5601n9cvpdtc8 FOREIGN KEY (chartid) REFERENCES public.chart(chartid);


--
-- Name: indicatorusergroupaccesses fks1k3a2f1c1isq1ujtwwqwfonx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorusergroupaccesses
    ADD CONSTRAINT fks1k3a2f1c1isq1ujtwwqwfonx FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: dataelementgroupusergroupaccesses fks24flr8pd794omx6xusmkeboe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupusergroupaccesses
    ADD CONSTRAINT fks24flr8pd794omx6xusmkeboe FOREIGN KEY (dataelementgroupid) REFERENCES public.dataelementgroup(dataelementgroupid);


--
-- Name: dataelementgroupattributevalues fks2olf101iiehl4ekaw0ytbmpg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementgroupattributevalues
    ADD CONSTRAINT fks2olf101iiehl4ekaw0ytbmpg FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: userattributevalues fks2timamyiijrioyi2nd5ysxjc; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.userattributevalues
    ADD CONSTRAINT fks2timamyiijrioyi2nd5ysxjc FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: sectionattributevalues fks3en52yvnu8nfdbcbsqdealwu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionattributevalues
    ADD CONSTRAINT fks3en52yvnu8nfdbcbsqdealwu FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: sectionattributevalues fks5roynmoahk5mqu1j019ym7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.sectionattributevalues
    ADD CONSTRAINT fks5roynmoahk5mqu1j019ym7 FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);


--
-- Name: validationrulegroupusergroupaccesses fks6crbtws3n0g2os9894uyb0c4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupusergroupaccesses
    ADD CONSTRAINT fks6crbtws3n0g2os9894uyb0c4 FOREIGN KEY (validationrulegroupid) REFERENCES public.validationrulegroup(validationrulegroupid);


--
-- Name: validationrulegroupattributevalues fks829kubdxtwph3etm4nyqptnm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.validationrulegroupattributevalues
    ADD CONSTRAINT fks829kubdxtwph3etm4nyqptnm FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: eventcharttranslations fksfctbv0m7p1qyf32jisp4u031; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.eventcharttranslations
    ADD CONSTRAINT fksfctbv0m7p1qyf32jisp4u031 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: maplegendtranslations fksii4ij2x35tx3f9u7a76k78jl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.maplegendtranslations
    ADD CONSTRAINT fksii4ij2x35tx3f9u7a76k78jl FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: optiongroupattributevalues fksmifkdbg5bgp66c2yl203lqrn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupattributevalues
    ADD CONSTRAINT fksmifkdbg5bgp66c2yl203lqrn FOREIGN KEY (optiongroupid) REFERENCES public.optiongroup(optiongroupid);


--
-- Name: orgunitgroupusergroupaccesses fksn12ea6xcfweyp0bob6tssdcg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.orgunitgroupusergroupaccesses
    ADD CONSTRAINT fksn12ea6xcfweyp0bob6tssdcg FOREIGN KEY (usergroupaccessid) REFERENCES public.usergroupaccess(usergroupaccessid);


--
-- Name: dataelementcategoryuseraccesses fksr8r9m97g9uc7b2nnbfp394hb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryuseraccesses
    ADD CONSTRAINT fksr8r9m97g9uc7b2nnbfp394hb FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: programstageuseraccesses fksxqbj4uf6wwv2aqx2c9ay1ulk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programstageuseraccesses
    ADD CONSTRAINT fksxqbj4uf6wwv2aqx2c9ay1ulk FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: mapviewtranslations fkt27tftlhawo7tq1t1embuwc5e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.mapviewtranslations
    ADD CONSTRAINT fkt27tftlhawo7tq1t1embuwc5e FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: indicatorgroupsetusergroupaccesses fkt66m7wsp2phes81tx37l4sn4b; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT fkt66m7wsp2phes81tx37l4sn4b FOREIGN KEY (indicatorgroupsetid) REFERENCES public.indicatorgroupset(indicatorgroupsetid);


--
-- Name: legendsetattributevalues fkt7cgg1phqdlubtcwekr6jd785; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.legendsetattributevalues
    ADD CONSTRAINT fkt7cgg1phqdlubtcwekr6jd785 FOREIGN KEY (legendsetid) REFERENCES public.maplegendset(maplegendsetid);


--
-- Name: optiongroupsetuseraccesses fktisxi0u191gvem3n2twyvni4y; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongroupsetuseraccesses
    ADD CONSTRAINT fktisxi0u191gvem3n2twyvni4y FOREIGN KEY (optiongroupsetid) REFERENCES public.optiongroupset(optiongroupsetid);


--
-- Name: smscommandspecialcharacters fktl0s6blarqvbvjhnoa94drtb2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.smscommandspecialcharacters
    ADD CONSTRAINT fktl0s6blarqvbvjhnoa94drtb2 FOREIGN KEY (specialcharacterid) REFERENCES public.smsspecialcharacter(specialcharacterid);


--
-- Name: optiongrouptranslations fktl5384fpv5fdjv4ke8e34ul6e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.optiongrouptranslations
    ADD CONSTRAINT fktl5384fpv5fdjv4ke8e34ul6e FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: dashboarduseraccesses fktldthr3a2gqcrcngmtglr7kdr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dashboarduseraccesses
    ADD CONSTRAINT fktldthr3a2gqcrcngmtglr7kdr FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- Name: usergroupattributevalues fktlnn6e4dj457rtlgf8gaangnq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.usergroupattributevalues
    ADD CONSTRAINT fktlnn6e4dj457rtlgf8gaangnq FOREIGN KEY (attributevalueid) REFERENCES public.attributevalue(attributevalueid);


--
-- Name: dataelementcategoryoptionattributevalues fktokd1a55e5b1vetrjv1ka84av; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.dataelementcategoryoptionattributevalues
    ADD CONSTRAINT fktokd1a55e5b1vetrjv1ka84av FOREIGN KEY (categoryoptionid) REFERENCES public.dataelementcategoryoption(categoryoptionid);


--
-- Name: programusergroupaccesses fku1h7cukhyye5ejgjbs0kaye0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.programusergroupaccesses
    ADD CONSTRAINT fku1h7cukhyye5ejgjbs0kaye0 FOREIGN KEY (programid) REFERENCES public.program(programid);


--
-- Name: indicatortranslations fku37f3oirygw2xn7gqgo6rnq9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.indicatortranslations
    ADD CONSTRAINT fku37f3oirygw2xn7gqgo6rnq9 FOREIGN KEY (objecttranslationid) REFERENCES public.objecttranslation(objecttranslationid);


--
-- Name: constantuseraccesses fkv2m3q13hlwe2199m0wy2mmqv; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY public.constantuseraccesses
    ADD CONSTRAINT fkv2m3q13hlwe2199m0wy2mmqv FOREIGN KEY (useraccessid) REFERENCES public.useraccess(useraccessid);


--
-- PostgreSQL database dump complete
--

