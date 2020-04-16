/* METHANISATION V1.0 */
/* Creation de la structure des données (schéma, tables, séquences, triggers,...) */
/* methanisation_10_structure.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

------------------------------------------------------------------------ 
-- Schéma : Création du schéma
------------------------------------------------------------------------

-- Schema: met_eco
CREATE SCHEMA IF NOT EXISTS met_eco;

COMMENT ON SCHEMA met_eco IS 'Schéma pour les données métiers sur l''économie';


------------------------------------------------------------------------ 
-- Tables : Création des tables
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Table: met_eco.m_eco_methanisation_na_geo

-- DROP TABLE met_eco.m_eco_methanisation_na_geo;
CREATE TABLE met_eco.m_eco_methanisation_na_geo
(
	id serial NOT NULL,
	proj_num integer,
	proj_nom character varying(255),
	proj_methanaqtion boolean,
	caract_portage_code character varying(9),
	caract_portage character varying(150),
	caract_type_code character varying(9),
	caract_type character varying(150),
	caract_maturite_code character varying(9),
	caract_maturite character varying(50) DEFAULT 'Non défini',
	caract_procede_code character varying(150),
	caract_procede character varying(150) DEFAULT 'Non défini',
	caract_constructeur character varying(150),
	loc_numdep character varying(2),
	loc_numcom character varying(5),
	loc_nomcom character varying(150),
	loc_code_postal character varying(5),
	gis_tonnage integer,
	gis_majoritaire character varying(255),
	gis_part_effluent_elevage numeric(5,2),
	nrj_primaire_produite character varying(254),
	nrj_mode_valorisation character varying(150) DEFAULT 'Non renseigné',
	nrj_biomethane_produit integer,
	nrj_cog_puissance_elec integer,
	nrj_cog_elec_injectee integer,
	nrj_cog_therm_valorisee integer,
	nrj_injec_debit_bio_injectee integer,
	nrj_injec_valorisee_injection integer,
	date_clefs_premier_contrat character varying(150),
	date_clefs_debut_construction date,
	date_clefs_debut_exploitation date,
	div_commentaires text,
	date_maj date,
	geom_valide  boolean DEFAULT false,
	geom geometry(Point,2154),
    CONSTRAINT m_eco_methanisation_na_geo_pkey PRIMARY KEY (id),
    CONSTRAINT m_eco_methanisation_na_geo_uniq UNIQUE (proj_num)
);

--
COMMENT ON TABLE met_eco.m_eco_methanisation_na_geo IS 'Localisation des projets sur la méthanisation en Nouvelle-Aquitaine';

--
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.id IS 'Identifiant';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_num IS 'Projet : Numéro';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_nom IS 'Projet : Nom du porteur ou société porteuse';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_methanaqtion IS 'Projet : Plan MéthaN-Action';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_portage_code IS 'Caractérisitique : Code portage';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_portage IS 'Caractérisitique : Portage';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_type_code IS 'Caractérisitique : Code type';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_type IS 'Caractérisitique : Type de projet';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_maturite_code IS 'Caractérisitique : Code maturité';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_maturite IS 'Caractérisitique : Maturité';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_procede_code IS 'Caractéristique : Code procédé';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_procede IS 'Caractéristique : Procédé';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.caract_constructeur IS 'Caractéristique : Constructeur';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.loc_numdep IS 'Localisation : Numéro département du projet';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.loc_numcom IS 'Localisation : Code INSEE de la commune';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.loc_nomcom IS 'Localisation : Nom de la commune';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.loc_code_postal IS 'Localisation : Code postal de la commune';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.gis_tonnage IS 'Gisement : Tonnage';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.gis_majoritaire IS 'Gisement : Majoritaire';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.gis_part_effluent_elevage IS 'Gisement : Part effluent d''élévage';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_primaire_produite IS 'Energie : Primaire produite';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_mode_valorisation IS 'Energie : Mode valorisation';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_biomethane_produit IS 'Energie : Biométhane produit';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_puissance_elec IS 'Energie : Cogénération/Chaleur - Puissance électrique';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_elec_injectee IS 'Energie : Cogénération/Chaleur - Electrique injectée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_therm_valorisee IS 'Energie : Cogénération/Chaleur - Thermique valorisée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_injec_debit_bio_injectee IS 'Energie : Injection - Débit biométhane injecté';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_injec_valorisee_injection IS 'Energie : Injection - Energie valorisée en injection';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_clefs_premier_contrat IS 'Dates clefs : Début de la construction';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_clefs_debut_exploitation IS 'Dates clefs : Début de l''exploitation';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.div_commentaires IS 'Divers : Commentaires';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.geom_valide IS 'Géométrie validée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.geom IS 'Géométrie point';


------------------------------------------------------------------------ 
-- Vues : Création des vues
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Vue : Nombre d'unités par EPCI

CREATE OR REPLACE VIEW met_eco.m_eco_methanisation_na_count_epci_view AS
SELECT count(*), t2.code_epci from met_eco.m_eco_methanisation_na t1
	INNER JOIN ref_adminexpress.r_admexp_vm_commune_na t2
	ON t1.loc_numcom = t2.insee_com group by t2.code_epci order by code_epci ASC;

------------------------------------------------------------------------
-- Vue : Nombre d'unités par département
CREATE OR REPLACE VIEW met_eco.m_eco_methanisation_na_count_dept_view AS
SELECT count(*), loc_numdep from met_eco.m_eco_methanisation_na t1 group by loc_numdep order by loc_numdep ASC;


