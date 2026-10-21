# dvf-fabric-dbt

Projet Analytics Engineering de bout en bout : ingestion DVF dans un Lakehouse Microsoft Fabric,
transformations dbt (dbt job Fabric) vers un Warehouse, versioning GitHub.

## Architecture (Médaillon)

- **Bronze** : Lakehouse `Bronze_immo`, table `bronze_dvf_mutations` (données brutes, ingérées par notebook).
- **Silver** : Warehouse `Silver_gold_immo`, schéma `silver` (modèles `staging`).
- **Gold** : Warehouse `Silver_gold_immo`, schéma `gold` (schéma en étoile : faits et dimensions).

## Structure

- `models/staging` : nettoyage et typage des sources.
- `models/marts` : dimensions et faits (à venir).
- `macros/generate_schema_name.sql` : écrit dans les schémas `silver` / `gold` tels quels.
