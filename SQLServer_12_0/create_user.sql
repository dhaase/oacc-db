-- -----------------------------------------------------
-- Copyright 2009-2017, Acciente LLC
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
-- -----------------------------------------------------

-- create oacc user:
CREATE LOGIN oaccuser WITH PASSWORD = 'oaccpwd';

USE oaccdb;

CREATE USER oaccuser FOR LOGIN oaccuser;

-- if using a dedicated database - grant database privileges:
GRANT CONNECT TO oaccuser;

-- grant schema privileges:
GRANT SELECT, INSERT, UPDATE, DELETE  ON SCHEMA :: OACC TO oaccuser;
GO 
