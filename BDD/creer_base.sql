/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  01/05/2012 14:17:25                      */
/*==============================================================*/


drop table if exists CATEGORIE;

drop table if exists COMMANDE;

drop table if exists CONTIENT;

drop table if exists EFFECTUE_UNE_COMMANDE;

drop table if exists EST_DE_CATEGORIE;

drop table if exists PRODUIT;

drop table if exists UTILISATEUR;

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE
(
   ID_CATEGORIE         int not null,
   LIBELLE_CATEGORIE    longtext,
   primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Table : COMMANDE                                             */
/*==============================================================*/
create table COMMANDE
(
   ID_COMMANDE          int not null,
   DATE_COMMANDE        datetime,
   ETAT_COMMANDE        longtext,
   PRIX_COMMANDE        float(8,2),
   primary key (ID_COMMANDE)
);

/*==============================================================*/
/* Table : CONTIENT                                             */
/*==============================================================*/
create table CONTIENT
(
   ID_COMMANDE          int not null,
   ID_PRODUIT           int not null,
   NBR_PRODUIT_COMMANDE int,
   primary key (ID_COMMANDE, ID_PRODUIT)
);

/*==============================================================*/
/* Table : EFFECTUE_UNE_COMMANDE                                */
/*==============================================================*/
create table EFFECTUE_UNE_COMMANDE
(
   ID_UTILISATEUR       int not null,
   ID_COMMANDE          int not null,
   primary key (ID_UTILISATEUR, ID_COMMANDE)
);

/*==============================================================*/
/* Table : EST_DE_CATEGORIE                                     */
/*==============================================================*/
create table EST_DE_CATEGORIE
(
   ID_PRODUIT           int not null,
   ID_CATEGORIE         int not null,
   primary key (ID_PRODUIT, ID_CATEGORIE)
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT
(
   ID_PRODUIT           int not null,
   LIBELLE_PRODUIT      longtext,
   DESCR_PRODUIT        text,
   PRIX_PRODUIT         float(8,2),
   POIDS_PRODUIT        float,
   STOCK_PRODUIT        int,
   LIEN_IMAGE_PRODUIT   longtext,
   LIEN_PRODUIT         longtext,
   primary key (ID_PRODUIT)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   ID_UTILISATEUR       int not null,
   NOM_UTILISATEUR      longtext,
   PRENOM_UTILISATEUR   longtext,
   ADRESSE_UTILISATEUR  longtext,
   CODE_POSTAL_UTILISATEUR longtext,
   VILLE_UTILISATEUR    longtext,
   EMAIL_UTILISATEUR    longtext,
   TELEPHONE_UTILISATEUR longtext,
   MDP_UTILISATEUR      longtext,
   ADMIN_UTILISATEUR    bool,
   primary key (ID_UTILISATEUR)
);

alter table CONTIENT add constraint FK_CONTIENT foreign key (ID_COMMANDE)
      references COMMANDE (ID_COMMANDE) on delete restrict on update restrict;

alter table CONTIENT add constraint FK_CONTIENT2 foreign key (ID_PRODUIT)
      references PRODUIT (ID_PRODUIT) on delete restrict on update restrict;

alter table EFFECTUE_UNE_COMMANDE add constraint FK_EFFECTUE_UNE_COMMANDE foreign key (ID_UTILISATEUR)
      references UTILISATEUR (ID_UTILISATEUR) on delete restrict on update restrict;

alter table EFFECTUE_UNE_COMMANDE add constraint FK_EFFECTUE_UNE_COMMANDE2 foreign key (ID_COMMANDE)
      references COMMANDE (ID_COMMANDE) on delete restrict on update restrict;

alter table EST_DE_CATEGORIE add constraint FK_EST_DE_CATEGORIE foreign key (ID_PRODUIT)
      references PRODUIT (ID_PRODUIT) on delete restrict on update restrict;

alter table EST_DE_CATEGORIE add constraint FK_EST_DE_CATEGORIE2 foreign key (ID_CATEGORIE)
      references CATEGORIE (ID_CATEGORIE) on delete restrict on update restrict;

