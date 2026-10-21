{{
  config(
    materialized='table'
  )
}}

--création de tables temporaire vente--

with ventes as (
    select *
    from {{ ref('stg_dvf_mutations') }}
    where nature_mutation = 'Vente'
      and type_local in ('Maison', 'Appartement')
      and date_mutation is not null
      and valeur_fonciere > 0
      and surface_reelle_bati > 0
),

mutations_mono_local as (
    select id_mutation
    from ventes
    group by id_mutation
    having count(*) = 1
)
-- selections des colonnes pour la table des faits---
select
    v.id_mutation,
    cast(year(v.date_mutation) * 10000 + month(v.date_mutation) * 100 + day(v.date_mutation) as int) as date_key,
    v.code_commune                                                   as commune_key,
    v.type_local,
    v.valeur_fonciere,
    v.surface_reelle_bati,
    v.nombre_pieces_principales,
    v.surface_terrain,
    cast(v.valeur_fonciere / v.surface_reelle_bati as decimal(18,2)) as prix_m2
from ventes v
inner join mutations_mono_local m
    on v.id_mutation = m.id_mutation