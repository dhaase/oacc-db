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

-- create reacc user:
CREATE USER reaccuser
  IDENTIFIED BY reaccpwd
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  PROFILE default
  QUOTA UNLIMITED ON users;

GRANT CREATE SESSION TO reaccuser;

-- grant sequence privileges:
GRANT SELECT ON REACC.RAC_ResourceClassID TO reaccuser;
GRANT SELECT ON REACC.RAC_PermissionID TO reaccuser;
GRANT SELECT ON REACC.RAC_DomainID TO reaccuser;
GRANT SELECT ON REACC.RAC_ResourceID TO reaccuser;

-- grant table privileges:
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_ResourceClass TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_ResourceClassPermission TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Domain TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Resource TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_DomPerm_Sys TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_DomCrPerm_Sys TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_DomCrPerm_PostCr_Sys TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_ResCrPerm_Sys TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_ResCrPerm_PostCr TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_ResCrPerm_PostCr_Sys TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_ResPerm TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_ResPerm_Sys TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_Global_ResPerm TO reaccuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON REACC.RAC_Grant_Global_ResPerm_Sys TO reaccuser;
