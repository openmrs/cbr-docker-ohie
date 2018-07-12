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
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userinfo (userinfoid, uid, code, lastupdated, created, surname, firstname, email, phonenumber, jobtitle, introduction, gender, birthday, nationality, employer, education, interests, languages, lastcheckedinterpretations) FROM stdin;
58	M5zQapPyTZI	admin	2018-07-02 14:02:55.626	2018-07-02 13:42:57.751	admin	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-07-02 13:55:07.354
\.


--
-- Data for Name: categorycombo; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorycombo (categorycomboid, uid, code, created, lastupdated, lastupdatedby, name, datadimensiontype, skiptotal, userid, publicaccess) FROM stdin;
19	bjDvmb4bfuf	default	2018-06-29 20:56:06.586	2018-06-29 20:56:06.602	\N	default	DISAGGREGATION	f	\N	--------
\.


--
-- Data for Name: periodtype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.periodtype (periodtypeid, name) FROM stdin;
1	Daily
2	Weekly
3	WeeklyWednesday
4	WeeklyThursday
5	WeeklySaturday
6	WeeklySunday
7	BiWeekly
8	Monthly
9	BiMonthly
10	Quarterly
11	SixMonthly
12	SixMonthlyApril
13	Yearly
14	FinancialApril
15	FinancialJuly
16	FinancialOct
\.


--
-- Data for Name: dataapprovalworkflow; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalworkflow (workflowid, uid, code, created, lastupdated, lastupdatedby, name, periodtypeid, categorycomboid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataentryform; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataentryform (dataentryformid, uid, code, created, lastupdated, lastupdatedby, name, style, htmlcode, format) FROM stdin;
\.


--
-- Data for Name: relationshiptype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.relationshiptype (relationshiptypeid, uid, code, created, lastupdated, lastupdatedby, name, a_is_to_b, b_is_to_a) FROM stdin;
\.


--
-- Data for Name: trackedentitytype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitytype (trackedentitytypeid, uid, code, created, lastupdated, lastupdatedby, name, description, formname, style, minattributesrequiredtosearch, maxteicounttoreturn, userid, publicaccess) FROM stdin;
63	fiRccILzA18	\N	2018-07-02 13:48:40.332	2018-07-02 15:08:01.862	58	Patient	\N	\N	\N	1	0	58	rw------
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.program (programid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, formname, version, enrollmentdatelabel, incidentdatelabel, type, displayincidentdate, onlyenrollonce, skipoffline, displayfrontpagelist, usefirststageduringregistration, capturecoordinates, expirydays, completeeventsexpirydays, minattributesrequiredtosearch, maxteicounttoreturn, style, expiryperiodtypeid, ignoreoverdueevents, selectenrollmentdatesinfuture, selectincidentdatesinfuture, relationshiptext, relationshiptypeid, relationshipfroma, relatedprogramid, categorycomboid, trackedentitytypeid, dataentryformid, workflowid, userid, publicaccess) FROM stdin;
66	llkudzlGDK0	HIV_PR	2018-07-02 13:49:43.109	2018-07-05 16:46:27.077	58	HIV surveillance Program	HIV program	\N	\N	12	\N	\N	WITH_REGISTRATION	t	f	f	t	f	f	0	0	1	0	\N	\N	f	f	f	\N	\N	f	\N	19	63	\N	\N	58	rw------
\.


--
-- Data for Name: programindicator; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicator (programindicatorid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, formname, style, programid, expression, filter, aggregationtype, decimals, aggregateexportcategoryoptioncombo, aggregateexportattributeoptioncombo, displayinform, analyticstype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: analyticsperiodboundary; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.analyticsperiodboundary (analyticsperiodboundaryid, uid, code, created, lastupdated, lastupdatedby, boundarytarget, analyticsperiodboundarytype, offsetperiods, offsetperiodtypeid, programindicatorid) FROM stdin;
\.


--
-- Data for Name: optionset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionset (optionsetid, uid, code, created, lastupdated, lastupdatedby, name, valuetype, version, userid, publicaccess) FROM stdin;
86	cuyJiLGQrob	GENDER	2018-07-02 14:54:14.057	2018-07-02 14:55:27.566	58	Gender	TEXT	1	58	rw------
\.


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.attribute (attributeid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, valuetype, mandatory, isunique, dataelementattribute, dataelementgroupattribute, indicatorattribute, indicatorgroupattribute, datasetattribute, organisationunitattribute, organisationunitgroupattribute, organisationunitgroupsetattribute, userattribute, usergroupattribute, programattribute, programstageattribute, trackedentitytypeattribute, trackedentityattributeattribute, categoryoptionattribute, categoryoptiongroupattribute, documentattribute, optionattribute, optionsetattribute, constantattribute, legendsetattribute, programindicatorattribute, sqlviewattribute, sectionattribute, categoryoptioncomboattribute, categoryoptiongroupsetattribute, dataelementgroupsetattribute, validationruleattribute, validationrulegroupattribute, categoryattribute, sortorder, optionsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: objecttranslation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.objecttranslation (objecttranslationid, locale, property, value) FROM stdin;
\.


--
-- Data for Name: attributetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.attributetranslations (attributeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: useraccess; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.useraccess (useraccessid, access, userid) FROM stdin;
\.


--
-- Data for Name: attributeuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.attributeuseraccesses (attributeid, useraccessid) FROM stdin;
\.


--
-- Data for Name: usergroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroup (usergroupid, uid, code, created, lastupdated, lastupdatedby, name, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: usergroupaccess; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroupaccess (usergroupaccessid, access, usergroupid) FROM stdin;
\.


--
-- Data for Name: attributeusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.attributeusergroupaccesses (attributeid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: attributevalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.attributevalue (attributevalueid, created, lastupdated, value, attributeid) FROM stdin;
\.


--
-- Data for Name: dataelementcategory; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategory (categoryid, uid, code, created, lastupdated, lastupdatedby, name, datadimensiontype, datadimension, userid, publicaccess) FROM stdin;
18	GLevLNI9wkl	default	2018-06-29 20:56:06.581	2018-07-05 16:20:31.724	\N	default	DISAGGREGATION	f	\N	--------
\.


--
-- Data for Name: dataelementcategoryoption; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategoryoption (categoryoptionid, uid, code, created, lastupdated, lastupdatedby, name, shortname, startdate, enddate, style, userid, publicaccess) FROM stdin;
17	xYerKDKCefk	default	2018-06-29 20:56:06.546	2018-06-29 20:56:06.606	\N	default	default	\N	\N	\N	\N	--------
\.


--
-- Data for Name: categories_categoryoptions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categories_categoryoptions (categoryid, sort_order, categoryoptionid) FROM stdin;
18	1	17
\.


--
-- Data for Name: categoryattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryattributevalues (categoryid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categorycombos_categories; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorycombos_categories (categoryid, sort_order, categorycomboid) FROM stdin;
18	1	19
\.


--
-- Data for Name: categoryoptioncombo; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptioncombo (categoryoptioncomboid, uid, code, created, lastupdated, lastupdatedby, name, ignoreapproval) FROM stdin;
20	HllvX50cXC0	default	2018-06-29 20:56:06.592	2018-06-29 20:56:06.592	\N	default	f
\.


--
-- Data for Name: categorycombos_optioncombos; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorycombos_optioncombos (categoryoptioncomboid, categorycomboid) FROM stdin;
20	19
\.


--
-- Data for Name: categorycombotranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorycombotranslations (categorycomboid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categorycombouseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorycombouseraccesses (categorycomboid, useraccessid) FROM stdin;
\.


--
-- Data for Name: categorycombousergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorycombousergroupaccesses (categorycomboid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categorydimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorydimension (categorydimensionid, categoryid) FROM stdin;
\.


--
-- Data for Name: categorydimension_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categorydimension_items (categorydimensionid, sort_order, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: organisationunit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.organisationunit (organisationunitid, uid, code, created, lastupdated, lastupdatedby, name, shortname, parentid, path, hierarchylevel, description, openingdate, closeddate, comment, featuretype, coordinates, url, contactperson, address, email, phonenumber, userid) FROM stdin;
68	dA5jazHCi4Y	DEMO	2018-07-02 13:53:14.001	2018-07-02 14:35:42.531	58	Demo Location	Demo	\N	/dA5jazHCi4Y	1	\N	2018-07-01	\N	\N	NONE	\N	\N	\N	\N	\N	\N	58
\.


--
-- Data for Name: categoryoption_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoption_organisationunits (organisationunitid, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoptioncomboattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptioncomboattributevalues (categoryoptioncomboid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptioncombos_categoryoptions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptioncombos_categoryoptions (categoryoptionid, categoryoptioncomboid) FROM stdin;
17	20
\.


--
-- Data for Name: categoryoptioncombotranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptioncombotranslations (categoryoptioncomboid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroup (categoryoptiongroupid, uid, code, created, lastupdated, lastupdatedby, name, shortname, datadimensiontype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupattributevalues (categoryoptiongroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupmembers (categoryoptiongroupid, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupset (categoryoptiongroupsetid, uid, code, created, lastupdated, lastupdatedby, name, description, datadimension, datadimensiontype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsetattributevalues (categoryoptiongroupsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetdimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsetdimension (categoryoptiongroupsetdimensionid, categoryoptiongroupsetid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetdimension_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsetdimension_items (categoryoptiongroupsetdimensionid, sort_order, categoryoptiongroupid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsetmembers (categoryoptiongroupsetid, sort_order, categoryoptiongroupid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsettranslations (categoryoptiongroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsetuseraccesses (categoryoptiongroupsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupsetusergroupaccesses (categoryoptiongroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongrouptranslations (categoryoptiongroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupuseraccesses (categoryoptiongroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiongroupusergroupaccesses (categoryoptiongroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.categoryoptiontranslations (categoryoptionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: colorset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.colorset (colorsetid, uid, code, created, lastupdated, lastupdatedby, name) FROM stdin;
\.


--
-- Data for Name: maplegendset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.maplegendset (maplegendsetid, uid, code, created, lastupdated, lastupdatedby, name, symbolizer, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: relativeperiods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.relativeperiods (relativeperiodsid, thisday, yesterday, last3days, last7days, last14days, thismonth, lastmonth, thisbimonth, lastbimonth, thisquarter, lastquarter, thissixmonth, lastsixmonth, weeksthisyear, monthsthisyear, bimonthsthisyear, quartersthisyear, thisyear, monthslastyear, quarterslastyear, lastyear, last5years, last12months, last6months, last3months, last6bimonths, last4quarters, last2sixmonths, thisfinancialyear, lastfinancialyear, last5financialyears, thisweek, lastweek, thisbiweek, lastbiweek, last4weeks, last4biweeks, last12weeks, last52weeks) FROM stdin;
\.


--
-- Data for Name: chart; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart (chartid, uid, code, created, lastupdated, lastupdatedby, name, description, domainaxislabel, rangeaxislabel, type, series, category, hidelegend, nospacebetweencolumns, regressiontype, title, subtitle, hidetitle, hidesubtitle, targetlinevalue, targetlinelabel, baselinevalue, baselinelabel, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, aggregationtype, completedonly, showdata, hideemptyrowitems, percentstackedvalues, cumulativevalues, rangeaxismaxvalue, rangeaxisminvalue, rangeaxissteps, rangeaxisdecimals, legendsetid, legenddisplaystrategy, colorsetid, sortorder, externalaccess, userid, publicaccess, favorites) FROM stdin;
\.


--
-- Data for Name: chart_categorydimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_categorydimensions (chartid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: chart_categoryoptiongroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_categoryoptiongroupsetdimensions (chart, sort_order, categoryoptiongroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: dataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelement (dataelementid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, formname, style, valuetype, domaintype, aggregationtype, categorycomboid, url, zeroissignificant, optionsetid, commentoptionsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataset (datasetid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, formname, style, periodtypeid, categorycomboid, dataentryform, mobile, version, expirydays, timelydays, notifycompletinguser, workflowid, openfutureperiods, fieldcombinationrequired, validcompleteonly, novaluerequirescomment, skipoffline, dataelementdecoration, renderastabs, renderhorizontally, compulsoryfieldscompleteonly, userid, publicaccess, notificationrecipients) FROM stdin;
\.


--
-- Data for Name: indicatortype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatortype (indicatortypeid, uid, code, created, lastupdated, lastupdatedby, name, indicatorfactor, indicatornumber) FROM stdin;
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicator (indicatorid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, formname, annualized, decimals, indicatortypeid, numerator, numeratordescription, denominator, denominatordescription, url, style, aggregateexportcategoryoptioncombo, aggregateexportattributeoptioncombo, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: trackedentityattribute; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattribute (trackedentityattributeid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, formname, valuetype, aggregationtype, optionsetid, inherit, expression, displayonvisitschedule, sortorderinvisitschedule, displayinlistnoprogram, sortorderinlistnoprogram, confidential, uniquefield, generated, pattern, textpattern, style, orgunitscope, programscope, userid, publicaccess) FROM stdin;
61	f8qGHzwL6q7	FN	2018-07-02 13:45:46.819	2018-07-02 13:45:46.819	58	First name	FN	\N	\N	TEXT	NONE	\N	f	\N	f	\N	f	\N	f	f	f		\N	\N	f	f	58	rw------
85	C196Ox4Ayeh	GENDER	2018-07-02 14:53:16.73	2018-07-02 14:56:03.747	58	Gender	Gender	\N	\N	TEXT	NONE	86	f	\N	f	\N	f	\N	f	f	f		\N	\N	f	f	58	rw------
89	wBZ2kF1LdXe	DOB	2018-07-02 14:58:19.765	2018-07-02 14:58:35.97	58	Birth date	DOB	\N	\N	DATE	NONE	\N	f	\N	f	\N	f	\N	f	f	f		\N	\N	f	f	58	rw------
93	aLotiN5zPc6	D_HIV_D	2018-07-02 15:02:26.743	2018-07-02 15:02:26.743	58	Date of HIV diagnosis	Diagnosis date	\N	\N	DATE	NONE	\N	f	\N	f	\N	f	\N	f	f	f		\N	\N	f	f	58	rw------
90	T4hs1vXmjFC	GID	2018-07-02 14:59:51.18	2018-07-02 15:02:55.984	58	Global ID	GID	\N	\N	TEXT	NONE	\N	f	\N	f	\N	f	\N	f	t	f		\N	\N	f	f	58	rw------
62	LGS3rs7LAYp	LN	2018-07-02 13:46:22.947	2018-07-05 16:25:03.525	58	Last name	LN	\N	\N	TEXT	NONE	\N	f	\N	f	\N	f	\N	f	f	f		\N	\N	f	f	58	rw------
108	BFeNShBIsuB	MN	2018-07-05 16:25:46.78	2018-07-05 16:25:46.78	58	Middle name	MN	\N	\N	TEXT	NONE	\N	f	\N	f	\N	f	\N	f	f	f		\N	\N	f	f	58	rw------
\.


--
-- Data for Name: datadimensionitem; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datadimensionitem (datadimensionitemid, indicatorid, dataelementid, dataelementoperand_dataelementid, dataelementoperand_categoryoptioncomboid, datasetid, metric, programindicatorid, programdataelement_programid, programdataelement_dataelementid, programattribute_programid, programattribute_attributeid) FROM stdin;
\.


--
-- Data for Name: chart_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_datadimensionitems (chartid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupset (dataelementgroupsetid, uid, code, created, lastupdated, lastupdatedby, name, description, compulsory, datadimension, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetdimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsetdimension (dataelementgroupsetdimensionid, dataelementgroupsetid) FROM stdin;
\.


--
-- Data for Name: chart_dataelementgroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_dataelementgroupsetdimensions (chartid, sort_order, dataelementgroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: chart_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_filters (chartid, sort_order, filter) FROM stdin;
\.


--
-- Data for Name: orgunitgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroup (orgunitgroupid, uid, code, created, lastupdated, lastupdatedby, name, shortname, symbol, color, coordinates, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: chart_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_itemorgunitgroups (chartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: chart_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_organisationunits (chartid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupset (orgunitgroupsetid, uid, code, created, lastupdated, lastupdatedby, name, description, compulsory, includesubhierarchyinanalytics, datadimension, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetdimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsetdimension (orgunitgroupsetdimensionid, orgunitgroupsetid) FROM stdin;
\.


--
-- Data for Name: chart_orgunitgroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_orgunitgroupsetdimensions (chartid, sort_order, orgunitgroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: chart_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_orgunitlevels (chartid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: period; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.period (periodid, periodtypeid, startdate, enddate) FROM stdin;
\.


--
-- Data for Name: chart_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chart_periods (chartid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: charttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.charttranslations (chartid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: chartuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chartuseraccesses (chartid, useraccessid) FROM stdin;
\.


--
-- Data for Name: chartusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.chartusergroupaccesses (chartid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.color (colorid, uid, code, created, lastupdated, lastupdatedby, color) FROM stdin;
\.


--
-- Data for Name: colorset_colors; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.colorset_colors (colorsetid, sort_order, colorid) FROM stdin;
\.


--
-- Data for Name: colorsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.colorsettranslations (colorsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: colortranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.colortranslations (colorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: completedatasetregistration; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.completedatasetregistration (datasetid, periodid, sourceid, attributeoptioncomboid, date, storedby) FROM stdin;
\.


--
-- Data for Name: dataelementgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroup (dataelementgroupid, uid, code, created, lastupdated, lastupdatedby, name, shortname, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroup (indicatorgroupid, uid, code, created, lastupdated, lastupdatedby, name, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: orgunitlevel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitlevel (orgunitlevelid, uid, code, created, lastupdated, lastupdatedby, name, level, offlinelevels) FROM stdin;
\.


--
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userrole (userroleid, uid, code, created, lastupdated, lastupdatedby, name, description, userid, publicaccess) FROM stdin;
59	yrB6vc5Ip3r	Superuser	2018-07-02 13:42:57.784	2018-07-02 13:42:57.785	\N	Superuser	Superuser	\N	--------
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.configuration (configurationid, systemid, feedbackrecipientsid, offlineorgunitlevelid, infrastructuralindicatorsid, infrastructuraldataelementsid, infrastructuralperiodtypeid, selfregistrationrole, selfregistrationorgunit) FROM stdin;
21	6c308ad5-9c79-4a76-a086-d240020ea03e	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: configuration_corswhitelist; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.configuration_corswhitelist (configurationid, corswhitelist) FROM stdin;
\.


--
-- Data for Name: constant; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.constant (constantid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, value, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: constantattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.constantattributevalues (constantid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: constanttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.constanttranslations (colorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: constantuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.constantuseraccesses (constantid, useraccessid) FROM stdin;
\.


--
-- Data for Name: constantusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.constantusergroupaccesses (constantid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboard (dashboardid, uid, code, created, lastupdated, lastupdatedby, name, description, userid, externalaccess, publicaccess, favorites) FROM stdin;
\.


--
-- Data for Name: programstage; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstage (programstageid, uid, code, created, lastupdated, lastupdatedby, name, description, formname, mindaysfromstart, programid, repeatable, dataentryformid, standardinterval, executiondatelabel, duedatelabel, autogenerateevent, validcompleteonly, displaygenerateeventbox, capturecoordinates, generatedbyenrollmentdate, blockentryform, remindcompleted, allowgeneratenextvisit, openafterenrollment, reportdatetouse, pregenerateuid, style, hideduedate, sort_order, periodtypeid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: eventchart; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart (eventchartid, uid, code, created, lastupdated, lastupdatedby, name, description, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, programid, programstageid, startdate, enddate, dataelementvaluedimensionid, attributevaluedimensionid, aggregationtype, completedonly, title, subtitle, hidetitle, hidesubtitle, type, showdata, hideemptyrowitems, hidenadata, programstatus, eventstatus, percentstackedvalues, cumulativevalues, rangeaxismaxvalue, rangeaxisminvalue, rangeaxissteps, rangeaxisdecimals, outputtype, collapsedatadimensions, domainaxislabel, rangeaxislabel, hidelegend, nospacebetweencolumns, regressiontype, targetlinevalue, targetlinelabel, baselinevalue, baselinelabel, sortorder, externalaccess, userid, publicaccess, favorites) FROM stdin;
\.


--
-- Data for Name: eventreport; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport (eventreportid, uid, code, created, lastupdated, lastupdatedby, name, description, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, programid, programstageid, startdate, enddate, dataelementvaluedimensionid, attributevaluedimensionid, aggregationtype, completedonly, title, subtitle, hidetitle, hidesubtitle, datatype, rowtotals, coltotals, rowsubtotals, colsubtotals, hideemptyrows, hidenadata, showhierarchy, outputtype, collapsedatadimensions, showdimensionlabels, digitgroupseparator, displaydensity, fontsize, programstatus, eventstatus, sortorder, toplimit, externalaccess, userid, publicaccess, favorites) FROM stdin;
\.


--
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.map (mapid, uid, code, created, lastupdated, lastupdatedby, name, description, longitude, latitude, zoom, basemap, title, externalaccess, userid, publicaccess, favorites) FROM stdin;
\.


--
-- Data for Name: reporttable; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable (reporttableid, uid, code, created, lastupdated, lastupdatedby, name, description, measurecriteria, regression, cumulative, relativeperiodsid, paramreportingmonth, paramgrandparentorganisationunit, paramparentorganisationunit, paramorganisationunit, sortorder, toplimit, rowtotals, coltotals, rowsubtotals, colsubtotals, hideemptyrows, hideemptycolumns, aggregationtype, completedonly, title, subtitle, hidetitle, hidesubtitle, digitgroupseparator, displaydensity, fontsize, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, legendsetid, legenddisplaystyle, legenddisplaystrategy, numbertype, showhierarchy, showdimensionlabels, skiprounding, externalaccess, userid, publicaccess, favorites) FROM stdin;
\.


--
-- Data for Name: dashboarditem; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboarditem (dashboarditemid, uid, code, created, lastupdated, lastupdatedby, chartid, eventchartid, mapid, reporttable, eventreport, textcontent, messages, appkey, shape, x, y, height, width) FROM stdin;
\.


--
-- Data for Name: dashboard_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboard_items (dashboardid, sort_order, dashboarditemid) FROM stdin;
\.


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.report (reportid, uid, code, created, lastupdated, lastupdatedby, name, type, designcontent, reporttableid, relativeperiodsid, paramreportingmonth, paramorganisationunit, cachestrategy, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dashboarditem_reports; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboarditem_reports (dashboarditemid, sort_order, reportid) FROM stdin;
\.


--
-- Data for Name: fileresource; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.fileresource (fileresourceid, uid, code, created, lastupdated, lastupdatedby, name, contenttype, contentlength, contentmd5, storagekey, isassigned, storagestatus, domain, userid) FROM stdin;
\.


--
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.document (documentid, uid, code, created, lastupdated, lastupdatedby, name, url, fileresource, external, contenttype, attachment, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dashboarditem_resources; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboarditem_resources (dashboarditemid, sort_order, resourceid) FROM stdin;
\.


--
-- Data for Name: dashboarditem_users; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboarditem_users (dashboarditemid, sort_order, userid) FROM stdin;
\.


--
-- Data for Name: dashboarditemtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboarditemtranslations (dashboarditemid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dashboardtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboardtranslations (dashboardid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dashboarduseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboarduseraccesses (dashboardid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dashboardusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dashboardusergroupaccesses (dashboardid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataapprovallevel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovallevel (dataapprovallevelid, uid, code, created, lastupdated, lastupdatedby, name, level, orgunitlevel, categoryoptiongroupsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataapproval; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapproval (dataapprovalid, dataapprovallevelid, workflowid, periodid, organisationunitid, attributeoptioncomboid, accepted, created, creator) FROM stdin;
\.


--
-- Data for Name: dataapprovalaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalaudit (dataapprovalauditid, levelid, workflowid, periodid, organisationunitid, attributeoptioncomboid, action, created, creator) FROM stdin;
\.


--
-- Data for Name: dataapprovalleveltranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalleveltranslations (dataapprovallevelid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataapprovalleveluseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalleveluseraccesses (dataapprovallevelid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataapprovallevelusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovallevelusergroupaccesses (dataapprovallevelid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalworkflowlevels (workflowid, dataapprovallevelid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalworkflowtranslations (workflowid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalworkflowuseraccesses (workflowid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataapprovalworkflowusergroupaccesses (workflowid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementaggregationlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementaggregationlevels (dataelementid, sort_order, aggregationlevel) FROM stdin;
\.


--
-- Data for Name: dataelementattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementattributevalues (dataelementid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryoptionattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategoryoptionattributevalues (categoryoptionid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryoptionuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategoryoptionuseraccesses (categoryoptionid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryoptionusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategoryoptionusergroupaccesses (categoryoptionid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementcategorytranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategorytranslations (categoryid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategoryuseraccesses (categoryid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementcategoryusergroupaccesses (categoryid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupattributevalues (dataelementgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupmembers (dataelementgroupid, dataelementid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsetattributevalues (dataelementgroupsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetdimension_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsetdimension_items (dataelementgroupsetdimensionid, sort_order, dataelementgroupid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsetmembers (dataelementgroupsetid, sort_order, dataelementgroupid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsettranslations (dataelementgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsetuseraccesses (dataelementgroupsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupsetusergroupaccesses (dataelementgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgrouptranslations (dataelementgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupuseraccesses (dataelementgroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementgroupusergroupaccesses (dataelementgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementlegendsets; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementlegendsets (dataelementid, sort_order, legendsetid) FROM stdin;
\.


--
-- Data for Name: dataelementoperand; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementoperand (dataelementoperandid, dataelementid, categoryoptioncomboid) FROM stdin;
\.


--
-- Data for Name: dataelementtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementtranslations (dataelementid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementuseraccesses (dataelementid, useraccessid) FROM stdin;
\.


--
-- Data for Name: dataelementusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataelementusergroupaccesses (dataelementid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataentryformtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.dataentryformtranslations (dataentryformid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datainputperiod; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datainputperiod (datainputperiodid, periodid, openingdate, closingdate, datasetid) FROM stdin;
\.


--
-- Data for Name: datasetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetattributevalues (datasetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: datasetelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetelement (datasetelementid, datasetid, dataelementid, categorycomboid) FROM stdin;
\.


--
-- Data for Name: datasetindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetindicators (datasetid, indicatorid) FROM stdin;
\.


--
-- Data for Name: datasetlegendsets; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetlegendsets (datasetid, sort_order, legendsetid) FROM stdin;
\.


--
-- Data for Name: datasetnotificationtemplate; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetnotificationtemplate (datasetnotificationtemplateid, uid, code, created, lastupdated, lastupdatedby, name, subjecttemplate, messagetemplate, relativescheduleddays, sendstrategy, usergroupid, datasetnotificationtrigger, notificationrecipienttype) FROM stdin;
\.


--
-- Data for Name: datasetnotification_datasets; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetnotification_datasets (datasetnotificationtemplateid, datasetid) FROM stdin;
\.


--
-- Data for Name: datasetnotificationtemplate_deliverychannel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetnotificationtemplate_deliverychannel (datasetnotificationtemplateid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: datasetoperands; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetoperands (datasetid, dataelementoperandid) FROM stdin;
\.


--
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.section (sectionid, uid, code, created, lastupdated, lastupdatedby, name, description, datasetid, sortorder, showrowtotals, showcolumntotals) FROM stdin;
\.


--
-- Data for Name: datasetsectiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetsectiontranslations (sectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datasetsource; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetsource (datasetid, sourceid) FROM stdin;
\.


--
-- Data for Name: datasettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasettranslations (datasetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datasetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetuseraccesses (datasetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: datasetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datasetusergroupaccesses (datasetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: datastatistics; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datastatistics (statisticsid, uid, code, created, lastupdated, lastupdatedby, chartviews, mapviews, reporttableviews, eventreportviews, eventchartviews, dashboardviews, datasetreportviews, active_users, totalviews, charts, maps, reporttables, eventreports, eventcharts, dashboards, indicators, datavalues, users) FROM stdin;
\.


--
-- Data for Name: datastatisticsevent; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datastatisticsevent (eventid, eventtype, "timestamp", username, favoriteuid) FROM stdin;
\.


--
-- Data for Name: datavalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datavalue (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid, value, storedby, created, lastupdated, comment, followup, deleted) FROM stdin;
\.


--
-- Data for Name: datavalueaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.datavalueaudit (datavalueauditid, dataelementid, periodid, organisationunitid, categoryoptioncomboid, attributeoptioncomboid, value, created, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: deletedobject; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.deletedobject (deletedobjectid, klass, uid, code, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: documentattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.documentattributevalues (documentid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: documenttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.documenttranslations (documentid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: documentuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.documentuseraccesses (documentid, useraccessid) FROM stdin;
\.


--
-- Data for Name: documentusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.documentusergroupaccesses (documentid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributedimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributedimension (trackedentityattributedimensionid, trackedentityattributeid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: eventchart_attributedimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_attributedimensions (eventchartid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_categorydimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_categorydimensions (eventchartid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_categoryoptiongroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_categoryoptiongroupsetdimensions (eventchartid, sort_order, categoryoptiongroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_columns (eventchartid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: trackedentitydataelementdimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitydataelementdimension (trackedentitydataelementdimensionid, dataelementid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: eventchart_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_dataelementdimensions (eventchartid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_filters (eventchartid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventchart_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_itemorgunitgroups (eventchartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventchart_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_organisationunits (eventchartid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: eventchart_orgunitgroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_orgunitgroupsetdimensions (eventchartid, sort_order, orgunitgroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_orgunitlevels (eventchartid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: eventchart_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_periods (eventchartid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: trackedentityprogramindicatordimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityprogramindicatordimension (trackedentityprogramindicatordimensionid, programindicatorid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: eventchart_programindicatordimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_programindicatordimensions (eventchartid, sort_order, trackedentityprogramindicatordimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_rows; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchart_rows (eventchartid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventcharttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventcharttranslations (eventchartid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: eventchartuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchartuseraccesses (eventchartid, useraccessid) FROM stdin;
\.


--
-- Data for Name: eventchartusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventchartusergroupaccesses (eventchartid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: eventreport_attributedimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_attributedimensions (eventreportid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_categorydimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_categorydimensions (eventreportid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_categoryoptiongroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_categoryoptiongroupsetdimensions (eventreportid, sort_order, categoryoptiongroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_columns (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreport_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_dataelementdimensions (eventreportid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_filters (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreport_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_itemorgunitgroups (eventreportid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventreport_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_organisationunits (eventreportid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: eventreport_orgunitgroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_orgunitgroupsetdimensions (eventreportid, sort_order, orgunitgroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_orgunitlevels (eventreportid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: eventreport_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_periods (eventreportid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: eventreport_programindicatordimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_programindicatordimensions (eventreportid, sort_order, trackedentityprogramindicatordimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_rows; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreport_rows (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreporttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreporttranslations (eventreportid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: eventreportuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreportuseraccesses (eventreportid, useraccessid) FROM stdin;
\.


--
-- Data for Name: eventreportusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.eventreportusergroupaccesses (eventreportid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: expression; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.expression (expressionid, description, expression, slidingwindow, missingvaluestrategy) FROM stdin;
\.


--
-- Data for Name: externalfileresource; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.externalfileresource (externalfileresourceid, uid, code, created, lastupdated, lastupdatedby, accesstoken, expires, fileresourceid) FROM stdin;
\.


--
-- Data for Name: externalmaplayer; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.externalmaplayer (externalmaplayerid, uid, code, created, lastupdated, lastupdatedby, name, attribution, url, legendseturl, maplayerposition, layers, imageformat, mapservice, legendsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: externalmaplayeruseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.externalmaplayeruseraccesses (externalmaplayerid, useraccessid) FROM stdin;
\.


--
-- Data for Name: externalmaplayerusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.externalmaplayerusergroupaccesses (externalmaplayerid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: externalnotificationlogentry; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.externalnotificationlogentry (externalnotificationlogentryid, uid, created, lastupdated, lastsentat, retries, key, templateuid, allowmultiple, triggerby) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: dhis
--

SELECT pg_catalog.setval('public.hibernate_sequence', 129, true);


--
-- Data for Name: i18nlocale; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.i18nlocale (i18nlocaleid, uid, code, created, lastupdated, lastupdatedby, name, locale) FROM stdin;
22	Yx4fX4F0XFE	\N	2018-06-29 20:56:15.738	2018-06-29 20:56:15.739	\N	Afrikaans	af
23	nYPRqjY8LLm	\N	2018-06-29 20:56:15.741	2018-06-29 20:56:15.741	\N	Arabic	ar
24	Rb3Bbi3uqnU	\N	2018-06-29 20:56:15.744	2018-06-29 20:56:15.744	\N	Bislama	bi
25	md1A9qN8Z5a	\N	2018-06-29 20:56:15.745	2018-06-29 20:56:15.745	\N	Amharic	am
26	MvgzMuekrqG	\N	2018-06-29 20:56:15.747	2018-06-29 20:56:15.747	\N	German	de
27	mabVMxJvxsb	\N	2018-06-29 20:56:15.748	2018-06-29 20:56:15.748	\N	Dzongkha	dz
28	aGFF5qu3xKc	\N	2018-06-29 20:56:15.75	2018-06-29 20:56:15.75	\N	English	en
29	PkrSaMfQHY7	\N	2018-06-29 20:56:15.752	2018-06-29 20:56:15.752	\N	Spanish	es
30	aDvYx7dINYe	\N	2018-06-29 20:56:15.753	2018-06-29 20:56:15.753	\N	Persian	fa
31	UWDaNdu8rnt	\N	2018-06-29 20:56:15.755	2018-06-29 20:56:15.755	\N	French	fr
32	KilYrHGq8MT	\N	2018-06-29 20:56:15.76	2018-06-29 20:56:15.76	\N	Gujarati	gu
33	GZEvNcBYuFA	\N	2018-06-29 20:56:15.762	2018-06-29 20:56:15.762	\N	Hindi	hi
34	aw3xHNdHpbQ	\N	2018-06-29 20:56:15.764	2018-06-29 20:56:15.764	\N	Indonesian	in
35	CGjoBgMWtN1	\N	2018-06-29 20:56:15.767	2018-06-29 20:56:15.767	\N	Italian	it
36	Ch9vz5vjdJt	\N	2018-06-29 20:56:15.768	2018-06-29 20:56:15.768	\N	Khmer	km
37	HAXwTzQZlKd	\N	2018-06-29 20:56:15.77	2018-06-29 20:56:15.77	\N	Lao	lo
38	fZTzfLVpqf7	\N	2018-06-29 20:56:15.772	2018-06-29 20:56:15.772	\N	Burmese	my
39	ZLYLpXmZjss	\N	2018-06-29 20:56:15.773	2018-06-29 20:56:15.773	\N	Nepali	ne
40	T2a4WQjbeDL	\N	2018-06-29 20:56:15.775	2018-06-29 20:56:15.775	\N	Dutch	nl
41	hTWnLlrKwqD	\N	2018-06-29 20:56:15.778	2018-06-29 20:56:15.778	\N	Norwegian	no
42	dny65J5HFt9	\N	2018-06-29 20:56:15.781	2018-06-29 20:56:15.781	\N	Pushto	ps
43	MmBxP5ROFbV	\N	2018-06-29 20:56:15.782	2018-06-29 20:56:15.782	\N	Portuguese	pt
44	fHRCRpVWImY	\N	2018-06-29 20:56:15.783	2018-06-29 20:56:15.783	\N	Russian	ru
45	jM6QDM5RtTs	\N	2018-06-29 20:56:15.785	2018-06-29 20:56:15.785	\N	Kinyarwanda	rw
46	Vfo2AvdzFcb	\N	2018-06-29 20:56:15.786	2018-06-29 20:56:15.786	\N	Swahili	sw
47	vMCDA7oxp5O	\N	2018-06-29 20:56:15.787	2018-06-29 20:56:15.787	\N	Tajik	tg
48	pNDM7d3dmwI	\N	2018-06-29 20:56:15.789	2018-06-29 20:56:15.789	\N	Vietnamese	vi
49	jlStIUOvwL3	\N	2018-06-29 20:56:15.794	2018-06-29 20:56:15.794	\N	Chinese	zh
\.


--
-- Data for Name: incomingsms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.incomingsms (id, originator, encoding, sentdate, receiveddate, text, gatewayid, status, parsed, statusmessage, userid) FROM stdin;
\.


--
-- Data for Name: indicatorattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorattributevalues (indicatorid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupattributevalues (indicatorgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupmembers (indicatorgroupid, indicatorid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupset (indicatorgroupsetid, uid, code, created, lastupdated, lastupdatedby, name, description, compulsory, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupsetmembers (indicatorgroupid, indicatorgroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupsettranslations (indicatorgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupsetuseraccesses (indicatorgroupsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupsetusergroupaccesses (indicatorgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: indicatorgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgrouptranslations (indicatorgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupuseraccesses (indicatorgroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorgroupusergroupaccesses (indicatorgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: indicatorlegendsets; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorlegendsets (indicatorid, sort_order, legendsetid) FROM stdin;
\.


--
-- Data for Name: indicatortranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatortranslations (indicatorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatortypetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatortypetranslations (indicatortypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatoruseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatoruseraccesses (indicatorid, useraccessid) FROM stdin;
\.


--
-- Data for Name: indicatorusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.indicatorusergroupaccesses (indicatorid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: interpretation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.interpretation (interpretationid, uid, lastupdated, reporttableid, chartid, mapid, eventreportid, eventchartid, datasetid, periodid, organisationunitid, interpretationtext, created, likes, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: intepretation_likedby; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.intepretation_likedby (interpretationid, userid) FROM stdin;
\.


--
-- Data for Name: interpretationcomment; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.interpretationcomment (interpretationcommentid, uid, lastupdated, commenttext, userid, created) FROM stdin;
\.


--
-- Data for Name: interpretation_comments; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.interpretation_comments (interpretationid, sort_order, interpretationcommentid) FROM stdin;
\.


--
-- Data for Name: interpretationuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.interpretationuseraccesses (interpretationid, useraccessid) FROM stdin;
\.


--
-- Data for Name: interpretationusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.interpretationusergroupaccesses (interpretationid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: jobconfiguration; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.jobconfiguration (jobconfigurationid, uid, code, created, lastupdated, lastupdatedby, name, cronexpression, jobtype, jobstatus, lastexecutedstatus, lastexecuted, lastruntimeexecution, nextexecutiontime, continuousexecution, enabled, jobparameters) FROM stdin;
55	AgcyU40A34b	\N	2018-06-29 20:56:15.914	2018-07-05 16:20:41.215	\N	Remove expired reserved values	0 0 * ? * *	\\xaced00057e7200206f72672e686973702e646869732e7363686564756c696e672e4a6f625479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001e52454d4f56455f455850495245445f52455345525645445f56414c554553	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400095343484544554c4544	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d00000000000000001200007870740009434f4d504c45544544	2018-07-02 16:00:00.022	00:00:00.017	2018-07-05 17:00:00	f	t	\N
50	AJy0NFWzpsg	\N	2018-06-29 20:56:15.844	2018-07-05 16:20:41.239	\N	File resource clean up	0 0 2 ? * *	\\xaced00057e7200206f72672e686973702e646869732e7363686564756c696e672e4a6f625479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001546494c455f5245534f555243455f434c45414e5550	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400095343484544554c4544	\N	\N	\N	2018-07-06 02:00:00	f	t	\N
51	VzQuM48wsrY	\N	2018-06-29 20:56:15.878	2018-07-05 16:20:41.249	\N	Data statistics	0 0 2 ? * *	\\xaced00057e7200206f72672e686973702e646869732e7363686564756c696e672e4a6f625479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000f444154415f53544154495354494353	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400095343484544554c4544	\N	\N	\N	2018-07-06 02:00:00	f	t	\N
52	K4IH1MugfAJ	\N	2018-06-29 20:56:15.884	2018-07-05 16:20:41.263	\N	Validation result notification	0 0 7 ? * *	\\xaced00057e7200206f72672e686973702e646869732e7363686564756c696e672e4a6f625479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001f56414c49444154494f4e5f524553554c54535f4e4f54494649434154494f4e	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400095343484544554c4544	\N	\N	\N	2018-07-06 07:00:00	f	t	\N
53	VvfquY4MC20	\N	2018-06-29 20:56:15.892	2018-07-05 16:20:41.281	\N	Credentials expiry alert	0 0 2 ? * *	\\xaced00057e7200206f72672e686973702e646869732e7363686564756c696e672e4a6f625479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001843524544454e5449414c535f4558504952595f414c455254	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400095343484544554c4544	\N	\N	\N	2018-07-06 02:00:00	f	t	\N
54	cpJMitrPuWZ	\N	2018-06-29 20:56:15.901	2018-07-05 16:20:41.293	\N	Dataset notification	0 0 2 ? * *	\\xaced00057e7200206f72672e686973702e646869732e7363686564756c696e672e4a6f625479706500000000000000001200007872000e6a6176612e6c616e672e456e756d00000000000000001200007870740015444154415f5345545f4e4f54494649434154494f4e	\\xaced00057e7200226f72672e686973702e646869732e7363686564756c696e672e4a6f6253746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400095343484544554c4544	\N	\N	\N	2018-07-06 02:00:00	f	t	\N
\.


--
-- Data for Name: keyjsonvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.keyjsonvalue (keyjsonvalueid, uid, code, created, lastupdated, lastupdatedby, namespace, namespacekey, value, encrypted_value, encrypted) FROM stdin;
\.


--
-- Data for Name: legendsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.legendsetattributevalues (legendsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: legendsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.legendsetuseraccesses (maplegendsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: legendsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.legendsetusergroupaccesses (maplegendsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: lockexception; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.lockexception (lockexceptionid, organisationunitid, periodid, datasetid) FROM stdin;
\.


--
-- Data for Name: maplegend; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.maplegend (maplegendid, uid, code, created, lastupdated, lastupdatedby, name, startvalue, endvalue, color, image, maplegendsetid) FROM stdin;
\.


--
-- Data for Name: maplegendsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.maplegendsettranslations (maplegendsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: maplegendtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.maplegendtranslations (maplegendid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: mapview; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview (mapviewid, uid, code, created, lastupdated, lastupdatedby, description, layer, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, aggregationtype, programid, programstageid, startdate, enddate, method, classes, colorlow, colorhigh, colorscale, legendsetid, radiuslow, radiushigh, opacity, orgunitgroupsetid, arearadius, hidden, labels, labelfontsize, labelfontweight, labelfontstyle, labelfontcolor, eventclustering, eventcoordinatefield, eventpointcolor, eventpointradius, config, styledataitem) FROM stdin;
\.


--
-- Data for Name: mapmapviews; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapmapviews (mapid, sort_order, mapviewid) FROM stdin;
\.


--
-- Data for Name: mapuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapuseraccesses (mapid, useraccessid) FROM stdin;
\.


--
-- Data for Name: mapusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapusergroupaccesses (mapid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: mapview_attributedimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_attributedimensions (mapviewid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: mapview_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_columns (mapviewid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: mapview_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_datadimensionitems (mapviewid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: mapview_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_dataelementdimensions (mapviewid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: mapview_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_itemorgunitgroups (mapviewid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: mapview_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_organisationunits (mapviewid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: mapview_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_orgunitlevels (mapviewid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: mapview_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapview_periods (mapviewid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: mapviewtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.mapviewtranslations (mapviewid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.message (messageid, uid, created, lastupdated, messagetext, internal, metadata, userid) FROM stdin;
57	wi49hcy22p5	2018-07-02 13:41:52.581	2018-07-02 13:41:52.581	Scheduler startup\n\nSystem title: DHIS 2\nBase URL: null\nTime: 2018-07-02T13:41:52.560Z\nMessage: Scheduler started with one or more unexecuted jobs:\nJob [AgcyU40A34b, Remove expired reserved values] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-06-29 22:00:00.0\n\n\nCause: 	f	\N	\N
107	LHnRNCb3ORN	2018-07-05 16:20:41.333	2018-07-05 16:20:41.333	Scheduler startup\n\nSystem title: DHIS 2\nBase URL: null\nTime: 2018-07-05T16:20:41.311Z\nMessage: Scheduler started with one or more unexecuted jobs:\nJob [AgcyU40A34b, Remove expired reserved values] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-07-02 17:00:00.0\nJob [AJy0NFWzpsg, File resource clean up] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-07-03 02:00:00.0\nJob [VzQuM48wsrY, Data statistics] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-07-03 02:00:00.0\nJob [K4IH1MugfAJ, Validation result notification] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-07-03 07:00:00.0\nJob [VvfquY4MC20, Credentials expiry alert] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-07-03 02:00:00.0\nJob [cpJMitrPuWZ, Dataset notification] has status failed or was scheduled in server downtime. Actual execution time was supposed to be: 2018-07-03 02:00:00.0\n\n\nCause: 	f	\N	\N
\.


--
-- Data for Name: messageconversation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.messageconversation (messageconversationid, uid, messagecount, created, lastupdated, subject, messagetype, priority, status, user_assigned, lastsenderid, lastmessage, userid) FROM stdin;
56	wCeBbYOLYnf	1	2018-07-02 13:41:52.592	2018-07-02 13:41:52.592	Scheduler startup	SYSTEM	NONE	NONE	\N	\N	2018-07-02 13:41:52.58	\N
106	UHEy8OQK8aH	1	2018-07-05 16:20:41.351	2018-07-05 16:20:41.351	Scheduler startup	SYSTEM	NONE	NONE	\N	\N	2018-07-05 16:20:41.333	\N
\.


--
-- Data for Name: messageconversation_messages; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.messageconversation_messages (messageconversationid, sort_order, messageid) FROM stdin;
56	1	57
106	1	107
\.


--
-- Data for Name: usermessage; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usermessage (usermessageid, usermessagekey, userid, isread, isfollowup) FROM stdin;
\.


--
-- Data for Name: messageconversation_usermessages; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.messageconversation_usermessages (messageconversationid, usermessageid) FROM stdin;
\.


--
-- Data for Name: metadataaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.metadataaudit (metadataauditid, created_at, created_by, klass, uid, code, type, value) FROM stdin;
\.


--
-- Data for Name: metadataversion; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.metadataversion (versionid, uid, code, created, lastupdated, lastupdatedby, name, versiontype, importdate, hashcode) FROM stdin;
\.


--
-- Data for Name: minmaxdataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.minmaxdataelement (minmaxdataelementid, sourceid, dataelementid, categoryoptioncomboid, minimumvalue, maximumvalue, generatedvalue) FROM stdin;
\.


--
-- Data for Name: oauth2client; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.oauth2client (oauth2clientid, uid, code, created, lastupdated, lastupdatedby, name, cid, secret) FROM stdin;
\.


--
-- Data for Name: oauth2clientgranttypes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.oauth2clientgranttypes (oauth2clientid, sort_order, granttype) FROM stdin;
\.


--
-- Data for Name: oauth2clientredirecturis; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.oauth2clientredirecturis (oauth2clientid, sort_order, redirecturi) FROM stdin;
\.


--
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
\.


--
-- Data for Name: oauth_code; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.oauth_code (code, authentication) FROM stdin;
\.


--
-- Data for Name: oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.oauth_refresh_token (token_id, token, authentication) FROM stdin;
\.


--
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionvalue (optionvalueid, uid, code, name, created, lastupdated, sort_order, description, formname, style, optionsetid) FROM stdin;
87	Zl3lYMo3Yem	M	Male	2018-07-02 14:55:17.33	2018-07-02 14:55:17.343	1	\N	\N	\N	86
88	JBFSgJOsNph	F	Female	2018-07-02 14:55:27.457	2018-07-02 14:55:27.469	2	\N	\N	\N	86
\.


--
-- Data for Name: optionattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionattributevalues (optionvalueid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optiongroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroup (optiongroupid, uid, code, created, lastupdated, lastupdatedby, name, shortname, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optiongroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupattributevalues (optiongroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optiongroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupmembers (optiongroupid, optionid) FROM stdin;
\.


--
-- Data for Name: optiongroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupset (optiongroupsetid, uid, code, created, lastupdated, lastupdatedby, name, description, datadimension, optionsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optiongroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupsetmembers (optiongroupsetid, sort_order, optiongroupid) FROM stdin;
\.


--
-- Data for Name: optiongroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupsettranslations (optiongroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optiongroupsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupsetuseraccesses (optiongroupsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: optiongroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupsetusergroupaccesses (optiongroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optiongrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongrouptranslations (optiongroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optiongroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupuseraccesses (optiongroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: optiongroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optiongroupusergroupaccesses (optiongroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optionsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionsetattributevalues (optionsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optionsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionsettranslations (optionsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optionsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionsetuseraccesses (optionsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: optionsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionsetusergroupaccesses (optionsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optionvaluetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.optionvaluetranslations (optionvalueid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: organisationunitattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.organisationunitattributevalues (organisationunitid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: organisationunittranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.organisationunittranslations (organisationunitid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupattributevalues (orgunitgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupmembers (organisationunitid, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsetattributevalues (orgunitgroupsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetdimension_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsetdimension_items (orgunitgroupsetdimensionid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsetmembers (orgunitgroupsetid, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsettranslations (orgunitgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsetuseraccesses (orgunitgroupsetid, useraccessid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupsetusergroupaccesses (orgunitgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: orgunitgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgrouptranslations (orgunitgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupuseraccesses (orgunitgroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitgroupusergroupaccesses (orgunitgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: orgunitleveltranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.orgunitleveltranslations (orgunitlevelid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: outbound_sms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.outbound_sms (id, date, message, status, sender) FROM stdin;
\.


--
-- Data for Name: outbound_sms_recipients; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.outbound_sms_recipients (outbound_sms_id, elt) FROM stdin;
\.


--
-- Data for Name: predictor; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.predictor (predictorid, uid, code, created, lastupdated, lastupdatedby, name, description, generatorexpressionid, generatoroutput, generatoroutputcombo, skiptestexpressionid, periodtypeid, sequentialsamplecount, annualsamplecount, sequentialskipcount) FROM stdin;
\.


--
-- Data for Name: predictororgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.predictororgunitlevels (predictorid, orgunitlevelid) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.users (userid, uid, code, created, lastupdated, lastupdatedby, creatoruserid, username, password, externalauth, openid, ldapid, passwordlastupdated, lastlogin, restoretoken, restorecode, restoreexpiry, selfregistered, invitation, disabled) FROM stdin;
58	KvMx6c1eoYo	admin	2018-07-02 13:42:57.823	2018-07-05 16:24:20.476	\N	58	admin	$2a$10$kFelHlkI8tmrRglFfdI62.yNnX4fuv2FAJrTRqjRK1v163YPqpz.G	f	\N	\N	2018-07-02 13:42:57.826	2018-07-05 16:24:20.475	\N	\N	\N	f	f	f
\.


--
-- Data for Name: previouspasswords; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.previouspasswords (userid, list_index, previouspassword) FROM stdin;
58	0	$2a$10$IISNSOaJxN08jvVQitko.uIQ73.RObwhsFpQ/u33TakSkYeriN/2q
\.


--
-- Data for Name: program_attribute_group; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.program_attribute_group (programtrackedentityattributegroupid, uid, code, created, lastupdated, lastupdatedby, name, shortname, description, uniqunessype) FROM stdin;
\.


--
-- Data for Name: program_attributes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.program_attributes (programtrackedentityattributeid, uid, code, created, lastupdated, lastupdatedby, programid, trackedentityattributeid, displayinlist, mandatory, sort_order, allowfuturedate, renderoptionsasradio, rendertype, searchable) FROM stdin;
123	yYbKOTCQYu8	\N	2018-07-02 14:06:00.586	2018-07-05 16:46:27.089	\N	66	61	t	f	1	f	f	\N	t
124	zfhWc8KAZXq	\N	2018-07-02 14:06:00.586	2018-07-05 16:46:27.09	\N	66	62	t	f	2	f	f	\N	t
125	wBdnvmu5798	\N	2018-07-05 16:45:43.342	2018-07-05 16:46:27.091	\N	66	108	f	f	3	\N	f	\N	f
126	p7L9rQeavAp	\N	2018-07-02 15:09:19.898	2018-07-05 16:46:27.091	\N	66	90	f	f	4	f	f	\N	f
127	hW9XPwfLixV	\N	2018-07-02 15:09:19.898	2018-07-05 16:46:27.092	\N	66	85	t	f	5	f	f	\N	f
128	I23E68EQ7mo	\N	2018-07-02 15:09:19.898	2018-07-05 16:46:27.092	\N	66	89	t	f	6	f	f	\N	f
129	Uf6kkNxVkUv	\N	2018-07-02 15:09:19.898	2018-07-05 16:46:27.092	\N	66	93	t	f	7	f	f	\N	f
\.


--
-- Data for Name: validationcriteria; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationcriteria (validationcriteriaid, uid, code, created, lastupdated, lastupdatedby, name, description, property, operator, value) FROM stdin;
\.


--
-- Data for Name: program_criteria; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.program_criteria (programid, validationcriteriaid) FROM stdin;
\.


--
-- Data for Name: program_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.program_organisationunits (organisationunitid, programid) FROM stdin;
68	66
\.


--
-- Data for Name: program_userroles; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.program_userroles (programid, userroleid) FROM stdin;
\.


--
-- Data for Name: programattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programattributevalues (programid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programexpression; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programexpression (programexpressionid, description, expression) FROM stdin;
\.


--
-- Data for Name: programindicatorattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorattributevalues (programindicatorid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorgroup (programindicatorgroupid, uid, code, created, lastupdated, lastupdatedby, name, description, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorgroupattributevalues (programindicatorgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorgroupmembers (programindicatorgroupid, programindicatorid) FROM stdin;
\.


--
-- Data for Name: programindicatorgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorgrouptranslations (programindicatorgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorgroupuseraccesses (programindicatorgroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorgroupusergroupaccesses (programindicatorgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programindicatorlegendsets; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorlegendsets (programindicatorid, sort_order, legendsetid) FROM stdin;
\.


--
-- Data for Name: programindicatortranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatortranslations (programindicatorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programindicatoruseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatoruseraccesses (programindicatorid, useraccessid) FROM stdin;
\.


--
-- Data for Name: programindicatorusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programindicatorusergroupaccesses (programindicatorid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: trackedentityinstance; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityinstance (trackedentityinstanceid, uid, code, created, lastupdated, lastupdatedby, createdatclient, lastupdatedatclient, inactive, deleted, featuretype, coordinates, representativeid, organisationunitid, trackedentitytypeid) FROM stdin;
\.


--
-- Data for Name: programinstance; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programinstance (programinstanceid, uid, created, lastupdated, createdatclient, lastupdatedatclient, incidentdate, enrollmentdate, enddate, followup, completedby, longitude, latitude, deleted, storedby, status, trackedentityinstanceid, programid, organisationunitid) FROM stdin;
\.


--
-- Data for Name: programinstance_messageconversation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programinstance_messageconversation (programinstanceid, sort_order, messageconversationid) FROM stdin;
\.


--
-- Data for Name: trackedentitycomment; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitycomment (trackedentitycommentid, commenttext, createddate, creator) FROM stdin;
\.


--
-- Data for Name: programinstancecomments; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programinstancecomments (programinstanceid, sort_order, trackedentitycommentid) FROM stdin;
\.


--
-- Data for Name: programstageinstance; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstageinstance (programstageinstanceid, uid, code, created, lastupdated, createdatclient, lastupdatedatclient, programinstanceid, programstageid, attributeoptioncomboid, deleted, storedby, duedate, executiondate, organisationunitid, status, longitude, latitude, completedby, completeddate) FROM stdin;
\.


--
-- Data for Name: programmessage; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programmessage (id, uid, code, created, lastupdated, lastupdatedby, text, subject, processeddate, messagestatus, trackedentityinstanceid, organisationunitid, programinstanceid, programstageinstanceid) FROM stdin;
\.


--
-- Data for Name: programmessage_deliverychannels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programmessage_deliverychannels (programmessagedeliverychannelsid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: programmessage_emailaddresses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programmessage_emailaddresses (programmessageemailaddressid, email) FROM stdin;
\.


--
-- Data for Name: programmessage_phonenumbers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programmessage_phonenumbers (programmessagephonenumberid, phonenumber) FROM stdin;
\.


--
-- Data for Name: programmessagetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programmessagetranslations (id, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programnotificationtemplate; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programnotificationtemplate (programnotificationtemplateid, uid, code, created, lastupdated, lastupdatedby, name, relativescheduleddays, usergroupid, trackedentityattributeid, dataelementid, subjecttemplate, messagetemplate, notificationtrigger, notificationrecipienttype, programstageid, programid) FROM stdin;
\.


--
-- Data for Name: programnotificationtemplate_deliverychannel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programnotificationtemplate_deliverychannel (programnotificationtemplatedeliverychannelid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: programrule; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programrule (programruleid, uid, code, created, lastupdated, lastupdatedby, name, description, programid, programstageid, rulecondition, priority) FROM stdin;
\.


--
-- Data for Name: programstagesection; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstagesection (programstagesectionid, uid, code, created, lastupdated, lastupdatedby, name, description, formname, style, rendertype, programstageid, sortorder) FROM stdin;
\.


--
-- Data for Name: programruleaction; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programruleaction (programruleactionid, uid, code, created, lastupdated, lastupdatedby, programruleid, actiontype, dataelementid, trackedentityattributeid, programindicatorid, programstagesectionid, programstageid, programnotificationtemplateid, location, content, data) FROM stdin;
\.


--
-- Data for Name: programruletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programruletranslations (programruleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programrulevariable; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programrulevariable (programrulevariableid, uid, code, created, lastupdated, lastupdatedby, name, programid, sourcetype, trackedentityattributeid, dataelementid, usecodeforoptionset, programstageid) FROM stdin;
\.


--
-- Data for Name: programsection; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programsection (programsectionid, uid, code, created, lastupdated, lastupdatedby, name, description, formname, style, rendertype, programid, sortorder) FROM stdin;
\.


--
-- Data for Name: programsection_attributes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programsection_attributes (programsectionid, sort_order, trackedentityattributeid) FROM stdin;
\.


--
-- Data for Name: programsectiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programsectiontranslations (programsectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programstageattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstageattributevalues (programstageid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programstagedataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstagedataelement (programstagedataelementid, uid, code, created, lastupdated, lastupdatedby, programstageid, dataelementid, compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, renderoptionsasradio, rendertype) FROM stdin;
\.


--
-- Data for Name: programstageinstance_messageconversation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstageinstance_messageconversation (programstageinstanceid, sort_order, messageconversationid) FROM stdin;
\.


--
-- Data for Name: programstageinstancecomments; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstageinstancecomments (programstageinstanceid, sort_order, trackedentitycommentid) FROM stdin;
\.


--
-- Data for Name: programstagesection_dataelements; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstagesection_dataelements (programstagesectionid, sort_order, dataelementid) FROM stdin;
\.


--
-- Data for Name: programstagesection_programindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstagesection_programindicators (programstagesectionid, sort_order, programindicatorid) FROM stdin;
\.


--
-- Data for Name: programstagesectiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstagesectiontranslations (programstagesectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programstagetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstagetranslations (programstageid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programstageuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstageuseraccesses (programstageid, useraccessid) FROM stdin;
\.


--
-- Data for Name: programstageusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programstageusergroupaccesses (programid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programtrackedentityattributegroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programtrackedentityattributegroupmembers (programtrackedentityattributegroupid, programtrackedentityattributeid) FROM stdin;
\.


--
-- Data for Name: programtrackedentityattributegrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programtrackedentityattributegrouptranslations (programtrackedentityattributegroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programtranslations (programid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programuseraccesses (programid, useraccessid) FROM stdin;
\.


--
-- Data for Name: programusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.programusergroupaccesses (programid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: pushanalysis; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.pushanalysis (pushanalysisid, uid, code, created, lastupdated, lastupdatedby, name, title, message, enabled, schedulingdayoffrequency, schedulingfrequency, dashboard) FROM stdin;
\.


--
-- Data for Name: pushanalysisrecipientusergroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.pushanalysisrecipientusergroups (usergroupid, elt) FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.relationship (relationshipid, formname, description, style, trackedentityinstanceaid, relationshiptypeid, trackedentityinstancebid) FROM stdin;
\.


--
-- Data for Name: relationshiptypetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.relationshiptypetranslations (relationshiptypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reporttable_categorydimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_categorydimensions (reporttableid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: reporttable_categoryoptiongroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_categoryoptiongroupsetdimensions (reporttableid, sort_order, categoryoptiongroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: reporttable_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_columns (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttable_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_datadimensionitems (reporttableid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: reporttable_dataelementgroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_dataelementgroupsetdimensions (reporttableid, sort_order, dataelementgroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: reporttable_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_filters (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttable_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_itemorgunitgroups (reporttableid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_organisationunits (reporttableid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: reporttable_orgunitgroupsetdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_orgunitgroupsetdimensions (reporttableid, sort_order, orgunitgroupsetdimensionid) FROM stdin;
\.


--
-- Data for Name: reporttable_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_orgunitlevels (reporttableid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: reporttable_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_periods (reporttableid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: reporttable_rows; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttable_rows (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttabletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttabletranslations (reporttableid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reporttableuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttableuseraccesses (reporttableid, useraccessid) FROM stdin;
\.


--
-- Data for Name: reporttableusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttableusergroupaccesses (reporttableid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: reporttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reporttranslations (reportid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reportuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reportuseraccesses (reportid, useraccessid) FROM stdin;
\.


--
-- Data for Name: reportusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reportusergroupaccesses (reportid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: reservedvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.reservedvalue (reservedvalueid, expirydate, created, ownerobject, owneruid, key, value) FROM stdin;
\.


--
-- Data for Name: sectionattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sectionattributevalues (sectionid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: sectiondataelements; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sectiondataelements (sectionid, sort_order, dataelementid) FROM stdin;
\.


--
-- Data for Name: sectiongreyedfields; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sectiongreyedfields (sectionid, dataelementoperandid) FROM stdin;
\.


--
-- Data for Name: sectionindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sectionindicators (sectionid, sort_order, indicatorid) FROM stdin;
\.


--
-- Data for Name: sequentialnumbercounter; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sequentialnumbercounter (id, owneruid, key, counter) FROM stdin;
\.


--
-- Data for Name: smscodes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.smscodes (smscodeid, code, formula, compulsory, dataelementid, trackedentityattributeid, optionid) FROM stdin;
\.


--
-- Data for Name: smscommands; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.smscommands (smscommandid, uid, created, lastupdated, name, parsertype, separatorkey, codeseparator, defaultmessage, receivedmessage, wrongformatmessage, nousermessage, morethanoneorgunitmessage, successmessage, currentperiodusedforreporting, completenessmethod, datasetid, usergroupid, programid, programstageid) FROM stdin;
\.


--
-- Data for Name: smscommandcodes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.smscommandcodes (id, codeid) FROM stdin;
\.


--
-- Data for Name: smsspecialcharacter; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.smsspecialcharacter (specialcharacterid, name, value) FROM stdin;
\.


--
-- Data for Name: smscommandspecialcharacters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.smscommandspecialcharacters (smscommandid, specialcharacterid) FROM stdin;
\.


--
-- Data for Name: sqlview; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sqlview (sqlviewid, uid, code, created, lastupdated, lastupdatedby, name, description, sqlquery, type, cachestrategy, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: sqlviewattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sqlviewattributevalues (sqlviewid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: sqlviewuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sqlviewuseraccesses (sqlviewid, useraccessid) FROM stdin;
\.


--
-- Data for Name: sqlviewusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.sqlviewusergroupaccesses (sqlviewid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: systemsetting; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.systemsetting (systemsettingid, name, value) FROM stdin;
\.


--
-- Data for Name: tablehook; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.tablehook (analyticstablehookid, uid, code, created, lastupdated, lastupdatedby, name, analyticstablephase, resourcetabletype, analyticstabletype, sql) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributeattributevalues (trackedentityattributeid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributelegendsets; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributelegendsets (trackedentityattributeid, sort_order, legendsetid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributetranslations (trackedentityattributeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributeuseraccesses (trackedentityattributeid, useraccessid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributeusergroupaccesses (trackedentityattributeid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributevalue (trackedentityinstanceid, trackedentityattributeid, created, lastupdated, value, encryptedvalue, storedby) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalueaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityattributevalueaudit (trackedentityattributevalueauditid, trackedentityinstanceid, trackedentityattributeid, value, encryptedvalue, created, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: trackedentitydatavalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitydatavalue (programstageinstanceid, dataelementid, value, created, lastupdated, providedelsewhere, storedby) FROM stdin;
\.


--
-- Data for Name: trackedentitydatavalueaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitydatavalueaudit (trackedentitydatavalueauditid, programstageinstanceid, dataelementid, value, created, providedelsewhere, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: trackedentityinstancefilter; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentityinstancefilter (trackedentityinstancefilterid, uid, code, created, lastupdated, lastupdatedby, name, description, sortorder, style, programid, enrollmentstatus, followup, enrollmentcreatedperiod, eventfilters) FROM stdin;
\.


--
-- Data for Name: trackedentitytranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitytranslations (trackedentitytypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: trackedentitytypeattribute; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitytypeattribute (trackedentitytypeattributeid, uid, code, created, lastupdated, lastupdatedby, trackedentitytypeid, trackedentityattributeid, displayinlist, mandatory, searchable, sort_order) FROM stdin;
94	p1ymixQVHvd	\N	2018-07-02 15:08:01.806	2018-07-02 15:08:01.863	\N	63	90	f	\N	f	1
95	uPNHc6wCAsW	\N	2018-07-02 15:08:01.806	2018-07-02 15:08:01.863	\N	63	62	f	\N	t	2
96	rwauDhrKbus	\N	2018-07-02 15:08:01.806	2018-07-02 15:08:01.864	\N	63	61	f	\N	t	3
97	YqUvaSBCXhR	\N	2018-07-02 15:08:01.806	2018-07-02 15:08:01.864	\N	63	85	f	\N	f	4
98	Upyw80BLiTg	\N	2018-07-02 15:08:01.806	2018-07-02 15:08:01.864	\N	63	89	f	\N	f	5
99	ovdjXlgXuM3	\N	2018-07-02 15:08:01.806	2018-07-02 15:08:01.864	\N	63	93	f	\N	f	6
\.


--
-- Data for Name: trackedentitytypeattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitytypeattributevalues (trackedentitytypeid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: trackedentitytypeuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitytypeuseraccesses (trackedentitytypeid, useraccessid) FROM stdin;
\.


--
-- Data for Name: trackedentitytypeusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.trackedentitytypeusergroupaccesses (trackedentitytypeid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: userapps; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userapps (userinfoid, sort_order, app) FROM stdin;
\.


--
-- Data for Name: userattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userattributevalues (userinfoid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: userdatavieworgunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userdatavieworgunits (userinfoid, organisationunitid) FROM stdin;
\.


--
-- Data for Name: usergroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroupattributevalues (usergroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: usergroupmanaged; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroupmanaged (managedbygroupid, managedgroupid) FROM stdin;
\.


--
-- Data for Name: usergroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroupmembers (userid, usergroupid) FROM stdin;
\.


--
-- Data for Name: usergrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergrouptranslations (usergroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: usergroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroupuseraccesses (usergroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: usergroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usergroupusergroupaccesses (usergroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: userkeyjsonvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userkeyjsonvalue (userkeyjsonvalueid, uid, code, created, lastupdated, lastupdatedby, userid, namespace, userkey, value, encrypted_value, encrypted) FROM stdin;
60	p6mPAQLnqVG	\N	2018-07-02 13:43:24.666	2018-07-02 13:43:24.667	58	58	dashboard	controlBarRows	1	\N	f
\.


--
-- Data for Name: usermembership; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usermembership (userinfoid, organisationunitid) FROM stdin;
58	68
\.


--
-- Data for Name: userroleauthorities; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userroleauthorities (userroleid, authority) FROM stdin;
59	F_TRACKED_ENTITY_INSTANCE_SEARCH_IN_ALL_ORGUNITS
59	ALL
59	F_USERGROUP_MANAGING_RELATIONSHIPS_ADD
59	F_LEGEND_DELETE
59	F_TRACKED_ENTITY_INSTANCE_DELETE
59	F_USER_GROUPS_READ_ONLY_ADD_MEMBERS
59	F_ORGANISATIONUNIT_MOVE
59	F_PREDICTOR_RUN
59	F_TRACKED_ENTITY_INSTANCE_SEARCH
59	F_PROGRAM_ENROLLMENT
59	F_REPLICATE_USER
59	F_SEND_EMAIL
59	F_LEGEND_ADD
59	F_INSERT_CUSTOM_JS_CSS
59	F_ENROLLMENT_CASCADE_DELETE
59	F_METADATA_IMPORT
59	F_VIEW_SETTINGS
59	F_VIEW_EVENT_ANALYTICS
59	F_VIEW_UNAPPROVED_DATA
59	F_USERGROUP_MANAGING_RELATIONSHIPS_VIEW
59	F_METADATA_EXPORT
59	F_PROGRAM_UNENROLLMENT
59	F_TEI_CASCADE_DELETE
59	F_APPROVE_DATA
59	F_ACCEPT_DATA_LOWER_LEVELS
59	F_TRACKED_ENTITY_INSTANCE_ADD
59	F_TRACKED_ENTITY_DATAVALUE_ADD
59	F_PROGRAM_DASHBOARD_CONFIG_ADMIN
59	F_TRACKED_ENTITY_DATAVALUE_READ
59	F_PROGRAM_ENROLLMENT_READ
59	F_APPROVE_DATA_LOWER_LEVELS
59	F_TRACKED_ENTITY_DATAVALUE_DELETE
59	F_UNCOMPLETE_EVENT
\.


--
-- Data for Name: userrolemembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userrolemembers (userid, userroleid) FROM stdin;
58	59
\.


--
-- Data for Name: userroletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userroletranslations (userroleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: userroleuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userroleuseraccesses (userroleid, useraccessid) FROM stdin;
\.


--
-- Data for Name: userroleusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userroleusergroupaccesses (userroleid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: users_catdimensionconstraints; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.users_catdimensionconstraints (userid, dataelementcategoryid) FROM stdin;
\.


--
-- Data for Name: users_cogsdimensionconstraints; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.users_cogsdimensionconstraints (userid, categoryoptiongroupsetid) FROM stdin;
\.


--
-- Data for Name: usersetting; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.usersetting (userinfoid, name, value) FROM stdin;
58	keyUiLocale	\\xaced0005737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e7472797400124c6a6176612f6c616e672f537472696e673b4c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff74000071007e0003740002656e71007e000371007e000378
58	keyDbLocale	\N
\.


--
-- Data for Name: userteisearchorgunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.userteisearchorgunits (userinfoid, organisationunitid) FROM stdin;
\.


--
-- Data for Name: validationcriteriatranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationcriteriatranslations (validationcriteriaid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationnotificationtemplate; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationnotificationtemplate (validationnotificationtemplateid, uid, code, created, lastupdated, lastupdatedby, name, subjecttemplate, messagetemplate, notifyusersinhierarchyonly, sendstrategy) FROM stdin;
\.


--
-- Data for Name: validationnotificationtemplate_recipientusergroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationnotificationtemplate_recipientusergroups (validationnotificationtemplateid, usergroupid) FROM stdin;
\.


--
-- Data for Name: validationrule; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrule (validationruleid, uid, code, created, lastupdated, lastupdatedby, name, description, instruction, importance, operator, leftexpressionid, rightexpressionid, skipformvalidation, periodtypeid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: validationnotificationtemplatevalidationrules; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationnotificationtemplatevalidationrules (validationnotificationtemplateid, validationruleid) FROM stdin;
\.


--
-- Data for Name: validationresult; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationresult (validationresultid, created, leftsidevalue, rightsidevalue, validationruleid, periodid, organisationunitid, attributeoptioncomboid, dayinperiod, notificationsent) FROM stdin;
\.


--
-- Data for Name: validationruleattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationruleattributevalues (validationruleid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: validationrulegroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrulegroup (validationrulegroupid, uid, code, created, lastupdated, lastupdatedby, name, description, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: validationrulegroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrulegroupattributevalues (validationrulegroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrulegroupmembers (validationgroupid, validationruleid) FROM stdin;
\.


--
-- Data for Name: validationrulegrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrulegrouptranslations (validationrulegroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrulegroupuseraccesses (validationrulegroupid, useraccessid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationrulegroupusergroupaccesses (validationrulegroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: validationruleorganisationunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationruleorganisationunitlevels (validationruleid, organisationunitlevel) FROM stdin;
\.


--
-- Data for Name: validationruletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationruletranslations (validationruleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationruleuseraccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationruleuseraccesses (validationruleid, useraccessid) FROM stdin;
\.


--
-- Data for Name: validationruleusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.validationruleusergroupaccesses (validationruleid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY public.version (versionid, versionkey, versionvalue) FROM stdin;
67	organisationUnit	0d7b8c79-9d22-470b-b1ed-f088720a9499
\.


--
-- PostgreSQL database dump complete
--

