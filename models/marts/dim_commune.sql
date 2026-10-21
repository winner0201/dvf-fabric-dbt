{{
  config(
    materialized='table'
  )
}}


select
    code_commune                  as commune_key,
    max(nom_commune)              as nom_commune,
    max(code_departement)         as code_departement
from {{ ref('stg_dvf_mutations') }}
where code_commune is not null
group by code_commune