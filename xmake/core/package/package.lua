--!The Make-like Build Utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2017, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        package.lua
--

-- define module
local package   = package or {}

-- load modules
local os        = require("base/os")
local path      = require("base/path")
local table     = require("base/table")
local config    = require("project/config")
local global    = require("project/global")

-- get the local or global package directory
function package.directory(is_global)

    -- get directory
    if is_global then
        return path.join(global.directory(), "packages")
    else
        return path.join(config.directory(), "packages")
    end
end

-- return module
return package