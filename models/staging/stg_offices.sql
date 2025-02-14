{{config(materialized = 'table',schema=env_var('DBT_STAGING_SCHEMA','STAGING_DEV'))}}
 
select
office as officeid,
officeaddress as address,
OfficePostalCode as PostalCode,
OfficeCity as City,
OfficeStateProvince as StateProvince,
OfficePhone as Phone,
OfficeFax as Fax,
OfficeCountry as Country
from
{{source('raw_qwt', 'raw_offices')}}