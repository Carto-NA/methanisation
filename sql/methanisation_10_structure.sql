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
	proj_date_mise_service date,
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
	nrj_cog_taux_therm_valorisee integer,
	nrj_injec_debit_bio_injectee float8,
	nrj_injec_valorisee_injection integer,
	date_clefs_premier_contrat character varying(150),
	date_clefs_debut_construction date,
	date_clefs_debut_exploitation date,
	div_commentaires text,
	annee_donnees character varying(4),
	date_import date,
	date_maj date,
	x_wgs84 double precision,
    	y_wgs84 double precision,
	geom_valide  boolean DEFAULT false,
	geom geometry(Point,2154),
    CONSTRAINT m_eco_methanisation_na_geo_pkey PRIMARY KEY (id),
    CONSTRAINT m_eco_methanisation_na_geo_uniq UNIQUE (proj_num, annee_donnees)
);

--
COMMENT ON TABLE met_eco.m_eco_methanisation_na_geo IS 'Localisation des projets sur la méthanisation en Nouvelle-Aquitaine';

--
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.id IS 'Identifiant';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_num IS 'Projet : Numéro';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_nom IS 'Projet : Nom du porteur ou société porteuse';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_methanaqtion IS 'Projet "MéthaN-Action"';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.proj_methanaqtion IS 'Projet : Date de mise en service';
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
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.gis_tonnage IS 'Gisement total (tonnes)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.gis_majoritaire IS 'Gisement : Majoritaire';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.gis_part_effluent_elevage IS 'Part d’effluents élevage (%)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_primaire_produite IS 'Energie : Primaire produite';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_mode_valorisation IS 'Energie : Mode valorisation';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_biomethane_produit IS 'Biogaz produit (Nm3/an)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_puissance_elec IS 'Puissance électrique (kWe)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_elec_injectee IS 'Energie électrique injectée (MWh)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_therm_produite IS 'Energie : Cogénération/Chaleur - Thermique produite';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_therm_valorisee IS 'Energie thermique valorisée (MWh)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_cog_taux_therm_valorisee IS 'Energie : Cogénération/Chaleur - Taux Thermique valorisée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_injec_debit_bio_injectee IS 'Débit biométhane injecté (Nm3/h)';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.nrj_injec_valorisee_injection IS 'Energie valorisée en injection (MWh PCI/an) ';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_clefs_premier_contrat IS 'Dates clefs : Début de la construction';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_clefs_debut_exploitation IS 'Dates clefs : Début de l''exploitation';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.div_commentaires IS 'Divers : Commentaires';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.annee_donnees IS 'Année de la données pour l''historisation';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_import IS 'Date d''import de la donnée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_maj IS 'Date de mise à jour de la donnée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.x_wgs84 IS 'Coordonnée X en WGS8';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.y_wgs84 IS 'Coordonnée Y en WGS84';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.geom_valide IS 'Géométrie validée';
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.geom IS 'Géométrie point';

-- Suppression de champ
ALTER TABLE met_eco.m_eco_methanisation_na_geo DROP COLUMN nrj_cog_therm_produite;

-- Création de champ
ALTER TABLE met_eco.m_eco_methanisation_na_geo ADD emergence_cmem boolean NULL DEFAULT false;

-- Modification champ
ALTER TABLE met_eco.m_eco_methanisation_na_geo RENAME COLUMN date_clefs_debut_exploitation TO date_realisation_etude_op;
COMMENT ON COLUMN met_eco.m_eco_methanisation_na_geo.date_realisation_etude_op IS 'Dates : réalisation étude opportunité';

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


------------------------------------------------------------------------ 
-- Fonction : Création des fonctions et déclencheurs
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Function : Champs calculés
CREATE or REPLACE FUNCTION met_eco.fct_m_eco_methanisation_na_geo_update() RETURNS TRIGGER AS $trg_m_eco_methanisation_na_geo_update_row$
BEGIN
--
		IF (NEW.annee_donnees is NULL) THEN
			-- Attribution du numéro de projet
			NEW.proj_num := (SELECT MAX(proj_num)+1 FROM met_eco.m_eco_methanisation_na_geo WHERE annee_donnees = cast(date_part('year', CURRENT_DATE) as varchar));
		END IF;
		
		-- Calcul de l'énergie électrique injectée
		NEW.nrj_cog_elec_injectee := (COALESCE(NEW.nrj_cog_puissance_elec,0)*8000/1000);
	
		-- Calcul de l'énergie thermique produite
		NEW.nrj_cog_therm_produite := (COALESCE(NEW.nrj_cog_puissance_elec,0)*8000/1000);

		-- Calcul de l'Energie valorisée en injection
		NEW.nrj_injec_valorisee_injection := ROUND((((COALESCE(NEW.nrj_injec_debit_bio_injectee,0) * 8760) * 10.7)/1000),2);

		-- Taux d'énergie thermique valorisée
		NEW.nrj_cog_taux_therm_valorisee := CASE WHEN new.nrj_cog_therm_produite IS NULL OR new.nrj_cog_therm_produite = 0 THEN null ELSE new.nrj_cog_therm_valorisee / new.nrj_cog_therm_produite END;
	
		-- Création des coordonnées géographique en WGS84
		new.x_wgs84 := (select ST_X(ST_Transform(new.geom,4326)));
		new.Y_wgs84 := (select ST_Y(ST_Transform(new.geom,4326)));
	
		-- Localisation
		new.loc_numdep := (select numdep from geo.z_commune_na where ST_Intersects(new.geom, geom));
		new.loc_numcom := (select numcom from geo.z_commune_na where ST_Intersects(new.geom, geom));
		new.loc_nomcom := (select nomcom from geo.z_commune_na where ST_Intersects(new.geom, geom));
		new.loc_code_postal := (SELECT code_postal FROM met_gen.m_gen_codeinsee_code_postaux WHERE archive = false and numcom = new.loc_numcom);

		--
		IF (TG_OP = 'INSERT') THEN
			new.date_import := now();
			new.annee_donnees := cast(date_part('year', CURRENT_DATE) as varchar);
		END IF;
							 
		IF (TG_OP = 'UPDATE') THEN
			new.date_maj := now();
		END IF;

	-- le résultat est ignoré car il s'agit d'un trigger AFTER
    RETURN NEW; 
END;
$trg_m_eco_methanisation_na_geo_update_row$ language plpgsql volatile cost 100;

-- Trigger
DROP TRIGGER IF EXISTS trg_m_eco_methanisation_na_geo_update_row ON met_eco.m_eco_methanisation_na_geo;
CREATE TRIGGER trg_m_eco_methanisation_na_geo_update_row
BEFORE INSERT OR UPDATE ON met_eco.m_eco_methanisation_na_geo
FOR EACH ROW
  EXECUTE PROCEDURE met_eco.fct_m_eco_methanisation_na_geo_update();


											   
-----------------------------------------------------------------------------------
-- Historisation des données, à faire début janvier
INSERT INTO met_eco.m_eco_methanisation_na_geo (
	proj_num, proj_nom, proj_methanaqtion, caract_portage_code, caract_portage, caract_type_code, caract_type, 
	caract_maturite_code, caract_maturite, caract_procede_code, caract_procede, caract_constructeur, 
	loc_numdep, loc_numcom, loc_nomcom, loc_code_postal, gis_tonnage, gis_majoritaire, gis_part_effluent_elevage, 
	nrj_primaire_produite, nrj_mode_valorisation, nrj_biomethane_produit, nrj_cog_puissance_elec, nrj_cog_elec_injectee, 
	nrj_cog_therm_valorisee, nrj_injec_debit_bio_injectee, nrj_injec_valorisee_injection, date_clefs_premier_contrat, 
	date_clefs_debut_construction, date_clefs_debut_exploitation, div_commentaires, geom_valide, geom, 
	nrj_cog_taux_therm_valorisee, nrj_cog_therm_produite, x_wgs84, y_wgs84, annee_donnees, date_import, date_maj
)
select 
	proj_num, proj_nom, proj_methanaqtion, caract_portage_code, caract_portage, caract_type_code, caract_type, 
	caract_maturite_code, caract_maturite, caract_procede_code, caract_procede, caract_constructeur, 
	loc_numdep, loc_numcom, loc_nomcom, loc_code_postal, gis_tonnage, gis_majoritaire, gis_part_effluent_elevage, 
	nrj_primaire_produite, nrj_mode_valorisation, nrj_biomethane_produit, nrj_cog_puissance_elec, nrj_cog_elec_injectee, 
	nrj_cog_therm_valorisee, nrj_injec_debit_bio_injectee, nrj_injec_valorisee_injection, date_clefs_premier_contrat, 
	date_clefs_debut_construction, date_clefs_debut_exploitation, div_commentaires, geom_valide, geom, 
	nrj_cog_taux_therm_valorisee, nrj_cog_therm_produite, x_wgs84, y_wgs84, cast(date_part('year', CURRENT_DATE) as varchar), now(), null
from met_eco.m_eco_methanisation_na_geo where annee_donnees = cast(date_part('year', CURRENT_DATE)-1 as varchar);
											   
