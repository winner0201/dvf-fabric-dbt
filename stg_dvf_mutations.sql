select
    id_mutation,
    try_cast(date_mutation as date)                  as date_mutation,
    nature_mutation,
    try_cast(valeur_fonciere as decimal(18,2))       as valeur_fonciere,
    code_postal,
    code_commune,
    nom_commune,
    code_departement,
    id_parcelle,
    type_local,
    try_cast(surface_reelle_bati as decimal(12,2))   as surface_reelle_bati,
    try_cast(nombre_pieces_principales as int)       as nombre_pieces_principales,
    try_cast(surface_terrain as decimal(14,2))       as surface_terrain,
    try_cast(longitude as float)                     as longitude,
    try_cast(latitude as float)                      as latitude
from {{ source('bronze', 'bronze_dvf_mutations') }}
