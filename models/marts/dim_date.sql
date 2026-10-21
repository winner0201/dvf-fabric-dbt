{{
  config(
    materialized='table'
  )
}}

select distinct
    cast(year(date_mutation) * 10000 + month(date_mutation) * 100 + day(date_mutation) as int) as date_key,
    date_mutation                                    as date_complete,
    year(date_mutation)                              as annee,
    datepart(quarter, date_mutation)                 as trimestre,
    month(date_mutation)                             as mois,
    case month(date_mutation)
        when 1  then 'Janvier'
        when 2  then 'Février'
        when 3  then 'Mars'
        when 4  then 'Avril'
        when 5  then 'Mai'
        when 6  then 'Juin'
        when 7  then 'Juillet'
        when 8  then 'Août'
        when 9  then 'Septembre'
        when 10 then 'Octobre'
        when 11 then 'Novembre'
        when 12 then 'Décembre'
    end                                              as nom_mois
from {{ ref('stg_dvf_mutations') }}
where date_mutation is not null