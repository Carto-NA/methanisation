/* METHANISATION V1.0 */
/* Creation des droits sur l'ensemble des objets */
/* methanisation_99_droit.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

------------------------------------------------------------------------ 
-- Grant : Droits des éléments
------------------------------------------------------------------------

-- Tables : met_eco.m_eco_methanisation_na
GRANT ALL ON TABLE met_eco.m_eco_methanisation_na TO "pre-sig-usr";
GRANT ALL ON TABLE met_eco.m_eco_methanisation_na TO "pre-sig-ro";
GRANT ALL ON SEQUENCE met_eco.m_eco_methanisation_na_id_seq TO "pre-sig-ro";
