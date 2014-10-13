--------------------------------------------------------
-- Copyright 2009-2014, Acciente LLC
--
-- Acciente LLC licenses this file to you under the
-- Apache License, Version 2.0 (the "License"); you
-- may not use this file except in compliance with the
-- License. You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in
-- writing, software distributed under the License is
-- distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
-- OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing
-- permissions and limitations under the License.
--------------------------------------------------------

/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.3.4                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          reacc-schema-design.dez                         */
/* Project name:          REACC                                           */
/* Author:                Adinath Raveendra Raj                           */
/* Script type:           Database drop script                            */
/* Created on:            2014-10-06 13:45                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE [REACC].[RAC_Domain] DROP CONSTRAINT [D_D_ParentDomainID]
GO


ALTER TABLE [REACC].[RAC_ResourceClassPermission] DROP CONSTRAINT [RCP_RC_ResourceClassID]
GO


ALTER TABLE [REACC].[RAC_Resource] DROP CONSTRAINT [R_RC_ResourceClassID]
GO


ALTER TABLE [REACC].[RAC_Resource] DROP CONSTRAINT [R_D_DomainID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm] DROP CONSTRAINT [GrRP_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm] DROP CONSTRAINT [GrRP_R_AccessedResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm] DROP CONSTRAINT [GrRP_R_GrantorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm] DROP CONSTRAINT [GrRP_RCP_ResourceClassID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr] DROP CONSTRAINT [GrRCrPPoCr_RCP_ResClassID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr] DROP CONSTRAINT [GrRCrPPoCr_R_AccessorResID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr] DROP CONSTRAINT [GrRCrPPoCr_R_GrantorResID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr] DROP CONSTRAINT [GrRCrPPoCr_D_AccessedDomainID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomPerm_Sys] DROP CONSTRAINT [GrDPSys_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomPerm_Sys] DROP CONSTRAINT [GrDPSys_R_GrantorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomPerm_Sys] DROP CONSTRAINT [GrDPSys_D_AccessedDomID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomCrPerm_PostCr_Sys] DROP CONSTRAINT [GrDCrPPoCrSys_R_AccessorResID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomCrPerm_PostCr_Sys] DROP CONSTRAINT [GrDCrPPoCrSys_R_GrantorResID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm_Sys] DROP CONSTRAINT [GrRPSys_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm_Sys] DROP CONSTRAINT [GrRPSys_R_AccessedResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm_Sys] DROP CONSTRAINT [GrRPSys_R_GrantorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResPerm_Sys] DROP CONSTRAINT [GrRPSys_RC_ResourceClassID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr_Sys] DROP CONSTRAINT [GrRCrPPoCrSys_R_AccessorResID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr_Sys] DROP CONSTRAINT [GrRCrPPoCrSys_R_GrantorResID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr_Sys] DROP CONSTRAINT [GrRCrPPoCrSys_RC_ResClassID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr_Sys] DROP CONSTRAINT [GrRCrPPoCrSys_D_AccessedDomID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm] DROP CONSTRAINT [GrGbRP_RCP_ResClassID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm] DROP CONSTRAINT [GrGbRP_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm] DROP CONSTRAINT [GrGbRP_R_GrantorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm] DROP CONSTRAINT [GrGbRP_D_AccessedDomainID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm_Sys] DROP CONSTRAINT [GrGbRPSys_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm_Sys] DROP CONSTRAINT [GrGbRPSys_R_GrantorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm_Sys] DROP CONSTRAINT [GrGbRPSys_D_AccessedDomID]
GO


ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm_Sys] DROP CONSTRAINT [GrGbRPSys_RC_ResClassID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_Sys] DROP CONSTRAINT [GrRCrPSys_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_Sys] DROP CONSTRAINT [GrRCrPSys_D_AccessedDomainID]
GO


ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_Sys] DROP CONSTRAINT [GrRCrPSys_R_GrantorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomCrPerm_Sys] DROP CONSTRAINT [GrDCrPSys_R_AccessorResourceID]
GO


ALTER TABLE [REACC].[RAC_Grant_DomCrPerm_Sys] DROP CONSTRAINT [GrDCrPSys_R_GrantorResourceID]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_DomCrPerm_Sys"                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_DomCrPerm_Sys] DROP CONSTRAINT [PK_GrDCrPSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_DomCrPerm_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_ResCrPerm_Sys"                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_Sys] DROP CONSTRAINT [PK_GrRCrPSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_ResCrPerm_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_Global_ResPerm_Sys"                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm_Sys] DROP CONSTRAINT [PK_GrGbRPSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_Global_ResPerm_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_Global_ResPerm"                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_Global_ResPerm] DROP CONSTRAINT [PK_GrGbRP]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_Global_ResPerm]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_ResCrPerm_PostCr_Sys"                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr_Sys] DROP CONSTRAINT [PK_GrRCrPPoCrSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_ResPerm_Sys"                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_ResPerm_Sys] DROP CONSTRAINT [PK_GrRPSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_ResPerm_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_DomCrPerm_PostCr_Sys"                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_DomCrPerm_PostCr_Sys] DROP CONSTRAINT [PK_GrDCrPPoCrSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_DomCrPerm_PostCr_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_DomPerm_Sys"                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_DomPerm_Sys] DROP CONSTRAINT [PK_GrDPSys]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_DomPerm_Sys]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_ResCrPerm_PostCr"                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr] DROP CONSTRAINT [PK_GrRCrPPoCr]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_ResCrPerm_PostCr]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Grant_ResPerm"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Grant_ResPerm] DROP CONSTRAINT [PK_GrRP]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Grant_ResPerm]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Resource"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Resource] DROP CONSTRAINT [PK_R]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Resource]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_Domain"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_Domain] DROP CONSTRAINT [PK_D]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_Domain]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_ResourceClassPermission"                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_ResourceClassPermission] DROP CONSTRAINT [PK_RCP]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_ResourceClassPermission]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RAC_ResourceClass"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [REACC].[RAC_ResourceClass] DROP CONSTRAINT [PK_RC]
GO


/* Drop table */

DROP TABLE [REACC].[RAC_ResourceClass]
GO


/* ---------------------------------------------------------------------- */
/* Drop sequences                                                         */
/* ---------------------------------------------------------------------- */

DROP SEQUENCE [REACC].[RAC_ResourceClassID]
GO


DROP SEQUENCE [REACC].[RAC_PermissionID]
GO


DROP SEQUENCE [REACC].[RAC_DomainID]
GO


DROP SEQUENCE [REACC].[RAC_ResourceID]
GO

