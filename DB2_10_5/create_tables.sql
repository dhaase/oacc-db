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

-- ----------------------------------------------------------------------
-- Script generated with: DeZign for Databases V7.3.4                     
-- Target DBMS:           DB2 Universal DB 9                              
-- Project file:          reacc-schema-design.dez                           
-- Project name:          REACC                                             
-- Author:                Adinath Raveendra Raj                           
-- Script type:           Database creation script                        
-- Created on:            2014-10-06 12:18                                
-- ---------------------------------------------------------------------- 


-- ---------------------------------------------------------------------- 
-- Sequences                                                              
-- ---------------------------------------------------------------------- 

CREATE SEQUENCE REACC.RAC_ResourceClassID AS BIGINT
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE
    ORDER;

CREATE SEQUENCE REACC.RAC_PermissionID AS BIGINT
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE
    order;

CREATE SEQUENCE REACC.RAC_DomainID AS BIGINT
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE
    ORDER;

CREATE SEQUENCE REACC.RAC_ResourceID AS BIGINT
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE
    CACHE 10
    ORDER;

-- ---------------------------------------------------------------------- 
-- Tables                                                                 
-- ---------------------------------------------------------------------- 

-- ---------------------------------------------------------------------- 
-- Add table "RAC_ResourceClass"                                          
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_ResourceClass (
    ResourceClassID BIGINT NOT NULL,
    ResourceClassName VARCHAR(128) NOT NULL,
    IsAuthenticatable SMALLINT NOT NULL,
    IsUnauthenticatedCreateAllowed SMALLINT NOT NULL,
    CONSTRAINT PK_RC PRIMARY KEY (ResourceClassID)
);

CREATE INDEX REACC.IX_RC_ResourceClassName ON REACC.RAC_ResourceClass (ResourceClassName);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_ResourceClassPermission"                                
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_ResourceClassPermission (
    ResourceClassID BIGINT NOT NULL,
    PermissionID BIGINT NOT NULL,
    PermissionName VARCHAR(64) NOT NULL,
    CONSTRAINT PK_RCP PRIMARY KEY (ResourceClassID, PermissionID)
);

CREATE INDEX REACC.IX_RCP_ResourceClassID ON REACC.RAC_ResourceClassPermission (ResourceClassID);

CREATE INDEX REACC.IX_RCP_ResClassID_PermName ON REACC.RAC_ResourceClassPermission (ResourceClassID,PermissionName);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Domain"                                                 
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Domain (
    DomainID BIGINT NOT NULL,
    DomainName VARCHAR(64) NOT NULL,
    ParentDomainID BIGINT,
    CONSTRAINT PK_D PRIMARY KEY (DomainID)
);

CREATE INDEX REACC.IX_D_ParentDomainID ON REACC.RAC_Domain (ParentDomainID);

CREATE INDEX REACC.IX_D_DomainName ON REACC.RAC_Domain (DomainName);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Resource"                                               
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Resource (
    ResourceID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    Password VARCHAR(128),
    DomainID BIGINT NOT NULL,
    CONSTRAINT PK_R PRIMARY KEY (ResourceID)
);

CREATE INDEX REACC.IX_R_ResourceClassID ON REACC.RAC_Resource (ResourceClassID);

CREATE INDEX REACC.IX_R_DomainID ON REACC.RAC_Resource (DomainID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_ResPerm"                                          
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_ResPerm (
    AccessorResourceID BIGINT NOT NULL,
    AccessedResourceID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    PermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrRP PRIMARY KEY (AccessorResourceID, AccessedResourceID, ResourceClassID, PermissionID)
);

CREATE INDEX REACC.IX_GrRP_AccessorResourceID ON REACC.RAC_Grant_ResPerm (AccessorResourceID);

CREATE INDEX REACC.IX_GrRP_AccessedResourceID ON REACC.RAC_Grant_ResPerm (AccessedResourceID);

CREATE INDEX REACC.IX_GrRP_GrantorResourceID ON REACC.RAC_Grant_ResPerm (GrantorResourceID);

CREATE INDEX REACC.IX_GrRP_ResourceClassID ON REACC.RAC_Grant_ResPerm (ResourceClassID,PermissionID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_ResCrPerm_PostCr"                                 
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_ResCrPerm_PostCr (
    AccessorResourceID BIGINT NOT NULL,
    AccessedDomainID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    PostCreatePermissionID BIGINT NOT NULL,
    PostCreateIsWithGrant SMALLINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrRCrPPoCr PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, PostCreatePermissionID)
);

CREATE INDEX REACC.IX_GrRCrPPoCr_ResClassID ON REACC.RAC_Grant_ResCrPerm_PostCr (ResourceClassID,PostCreatePermissionID);

CREATE INDEX REACC.IX_GrRCrPPoCr_AccessorResID ON REACC.RAC_Grant_ResCrPerm_PostCr (AccessorResourceID);

CREATE INDEX REACC.IX_GrRCrPPoCr_GrantorResID ON REACC.RAC_Grant_ResCrPerm_PostCr (GrantorResourceID);

CREATE INDEX REACC.IX_GrRCrPPoCr_AccessedDomainID ON REACC.RAC_Grant_ResCrPerm_PostCr (AccessedDomainID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_DomPerm_Sys"                                      
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_DomPerm_Sys (
    AccessorResourceID BIGINT NOT NULL,
    AccessedDomainID BIGINT NOT NULL,
    SysPermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrDPSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, SysPermissionID)
);

CREATE INDEX REACC.IX_GrDPSys_AccessorResourceID ON REACC.RAC_Grant_DomPerm_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrDPSys_GrantorResourceID ON REACC.RAC_Grant_DomPerm_Sys (GrantorResourceID);

CREATE INDEX REACC.IX_GrDPSys_AccessedDomainID ON REACC.RAC_Grant_DomPerm_Sys (AccessedDomainID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_DomCrPerm_PostCr_Sys"                             
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_DomCrPerm_PostCr_Sys (
    AccessorResourceID BIGINT NOT NULL,
    PostCreateSysPermissionID BIGINT NOT NULL,
    PostCreateIsWithGrant SMALLINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrDCrPPoCrSys PRIMARY KEY (AccessorResourceID, PostCreateSysPermissionID)
);

CREATE INDEX REACC.IX_GrDCrPPoCrSys_AccessorResID ON REACC.RAC_Grant_DomCrPerm_PostCr_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrDCrPPoCrSys_GrantorResID ON REACC.RAC_Grant_DomCrPerm_PostCr_Sys (GrantorResourceID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_ResPerm_Sys"                                      
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_ResPerm_Sys (
    AccessorResourceID BIGINT NOT NULL,
    AccessedResourceID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    SysPermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrRPSys PRIMARY KEY (AccessorResourceID, AccessedResourceID, ResourceClassID, SysPermissionID)
);

CREATE INDEX REACC.IX_GrRPSys_AccessorResourceID ON REACC.RAC_Grant_ResPerm_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrRPSys_AccessedResourceID ON REACC.RAC_Grant_ResPerm_Sys (AccessedResourceID);

CREATE INDEX REACC.IX_GrRPSys_GrantorResourceID ON REACC.RAC_Grant_ResPerm_Sys (GrantorResourceID);

CREATE INDEX REACC.IX_GrRPSys_ResourceClassID ON REACC.RAC_Grant_ResPerm_Sys (ResourceClassID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_ResCrPerm_PostCr_Sys"                             
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_ResCrPerm_PostCr_Sys (
    AccessorResourceID BIGINT NOT NULL,
    AccessedDomainID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    PostCreateSysPermissionID BIGINT NOT NULL,
    PostCreateIsWithGrant SMALLINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrRCrPPoCrSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, PostCreateSysPermissionID)
);

CREATE INDEX REACC.IX_GrRCrPPoCrSys_AccessorResID ON REACC.RAC_Grant_ResCrPerm_PostCr_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrRCrPPoCrSys_GrantorResID ON REACC.RAC_Grant_ResCrPerm_PostCr_Sys (GrantorResourceID);

CREATE INDEX REACC.IX_GrRCrPPoCrSys_ResClassID ON REACC.RAC_Grant_ResCrPerm_PostCr_Sys (ResourceClassID);

CREATE INDEX REACC.IX_GrRCrPPoCrSys_AccessedDomID ON REACC.RAC_Grant_ResCrPerm_PostCr_Sys (AccessedDomainID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_Global_ResPerm"                                   
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_Global_ResPerm (
    AccessorResourceID BIGINT NOT NULL,
    AccessedDomainID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    PermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrGbRP PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, PermissionID)
);

CREATE INDEX REACC.IX_GrGbRP_ResourceClassID ON REACC.RAC_Grant_Global_ResPerm (ResourceClassID,PermissionID);

CREATE INDEX REACC.IX_GrGbRP_AccessorResourceID ON REACC.RAC_Grant_Global_ResPerm (AccessorResourceID);

CREATE INDEX REACC.IX_GrGbRP_GrantorResourceID ON REACC.RAC_Grant_Global_ResPerm (GrantorResourceID);

CREATE INDEX REACC.IX_GrGbRP_AccessedDomainID ON REACC.RAC_Grant_Global_ResPerm (AccessedDomainID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_Global_ResPerm_Sys"                               
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_Global_ResPerm_Sys (
    AccessorResourceID BIGINT NOT NULL,
    AccessedDomainID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    SysPermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrGbRPSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, SysPermissionID)
);

CREATE INDEX REACC.IX_GrGbRPSys_AccessorResID ON REACC.RAC_Grant_Global_ResPerm_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrGbRPSys_GrantorResourceID ON REACC.RAC_Grant_Global_ResPerm_Sys (GrantorResourceID);

CREATE INDEX REACC.IX_GrGbRPSys_AccessedDomainID ON REACC.RAC_Grant_Global_ResPerm_Sys (AccessedDomainID);

CREATE INDEX REACC.IX_GrGbRPSys_ResClassID ON REACC.RAC_Grant_Global_ResPerm_Sys (ResourceClassID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_ResCrPerm_Sys"                                    
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_ResCrPerm_Sys (
    AccessorResourceID BIGINT NOT NULL,
    AccessedDomainID BIGINT NOT NULL,
    ResourceClassID BIGINT NOT NULL,
    SysPermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrRCrPSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, SysPermissionID)
);

CREATE INDEX REACC.IX_GrRCrPSys_AccessorResID ON REACC.RAC_Grant_ResCrPerm_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrRCrPSys_GrantorResID ON REACC.RAC_Grant_ResCrPerm_Sys (GrantorResourceID);

CREATE INDEX REACC.IX_GrRCrPSys_ResClassID ON REACC.RAC_Grant_ResCrPerm_Sys (ResourceClassID);

CREATE INDEX REACC.IX_GrRCrPSys_AccessedDomID ON REACC.RAC_Grant_ResCrPerm_Sys (AccessedDomainID);

-- ---------------------------------------------------------------------- 
-- Add table "RAC_Grant_DomCrPerm_Sys"                                    
-- ---------------------------------------------------------------------- 

CREATE TABLE REACC.RAC_Grant_DomCrPerm_Sys (
    AccessorResourceID BIGINT NOT NULL,
    SysPermissionID BIGINT NOT NULL,
    IsWithGrant SMALLINT NOT NULL,
    GrantorResourceID BIGINT NOT NULL,
    CONSTRAINT PK_GrDCrPSys PRIMARY KEY (AccessorResourceID, SysPermissionID)
);

CREATE INDEX REACC.IX_GrDCrPSys_AccessorResID ON REACC.RAC_Grant_DomCrPerm_Sys (AccessorResourceID);

CREATE INDEX REACC.IX_GrDCrPSys_GrantorResID ON REACC.RAC_Grant_DomCrPerm_Sys (GrantorResourceID);

-- ---------------------------------------------------------------------- 
-- Foreign key constraints                                                
-- ---------------------------------------------------------------------- 

ALTER TABLE REACC.RAC_Domain ADD CONSTRAINT D_D_ParentDomainID 
    FOREIGN KEY (ParentDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_ResourceClassPermission ADD CONSTRAINT RCP_RC_ResourceClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES REACC.RAC_ResourceClass (ResourceClassID);

ALTER TABLE REACC.RAC_Resource ADD CONSTRAINT R_RC_ResourceClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES REACC.RAC_ResourceClass (ResourceClassID);

ALTER TABLE REACC.RAC_Resource ADD CONSTRAINT R_D_DomainID 
    FOREIGN KEY (DomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_ResPerm ADD CONSTRAINT GrRP_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm ADD CONSTRAINT GrRP_R_AccessedResourceID 
    FOREIGN KEY (AccessedResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm ADD CONSTRAINT GrRP_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm ADD CONSTRAINT GrRP_RCP_ResourceClassID 
    FOREIGN KEY (ResourceClassID, PermissionID) REFERENCES REACC.RAC_ResourceClassPermission (ResourceClassID,PermissionID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_RCP_ResClassID 
    FOREIGN KEY (ResourceClassID, PostCreatePermissionID) REFERENCES REACC.RAC_ResourceClassPermission (ResourceClassID,PermissionID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_R_AccessorResID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_R_GrantorResID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_D_AccessedDomainID 
    FOREIGN KEY (AccessedDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_DomPerm_Sys ADD CONSTRAINT GrDPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_DomPerm_Sys ADD CONSTRAINT GrDPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_DomPerm_Sys ADD CONSTRAINT GrDPSys_D_AccessedDomID 
    FOREIGN KEY (AccessedDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_DomCrPerm_PostCr_Sys ADD CONSTRAINT GrDCrPPoCrSys_R_AccessorResID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_DomCrPerm_PostCr_Sys ADD CONSTRAINT GrDCrPPoCrSys_R_GrantorResID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_R_AccessedResourceID 
    FOREIGN KEY (AccessedResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_RC_ResourceClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES REACC.RAC_ResourceClass (ResourceClassID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_R_AccessorResID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_R_GrantorResID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_RC_ResClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES REACC.RAC_ResourceClass (ResourceClassID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_D_AccessedDomID 
    FOREIGN KEY (AccessedDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_RCP_ResClassID 
    FOREIGN KEY (ResourceClassID, PermissionID) REFERENCES REACC.RAC_ResourceClassPermission (ResourceClassID,PermissionID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_D_AccessedDomainID 
    FOREIGN KEY (AccessedDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_D_AccessedDomID 
    FOREIGN KEY (AccessedDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_RC_ResClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES REACC.RAC_ResourceClass (ResourceClassID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_Sys ADD CONSTRAINT GrRCrPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_Sys ADD CONSTRAINT GrRCrPSys_D_AccessedDomainID 
    FOREIGN KEY (AccessedDomainID) REFERENCES REACC.RAC_Domain (DomainID);

ALTER TABLE REACC.RAC_Grant_ResCrPerm_Sys ADD CONSTRAINT GrRCrPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_DomCrPerm_Sys ADD CONSTRAINT GrDCrPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);

ALTER TABLE REACC.RAC_Grant_DomCrPerm_Sys ADD CONSTRAINT GrDCrPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES REACC.RAC_Resource (ResourceID);
