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
-- @file        find_file.lua
--

-- define module
local sandbox_lib_detect_find_file = sandbox_lib_detect_find_file or {}

-- load modules
local os        = require("base/os")
local path      = require("base/path")
local table     = require("base/table")
local raise     = require("sandbox/modules/raise")

-- find file
--
-- @param name  the file name
-- @param dirs  the file directories
--
-- @return      the file path
--
-- @code
--
-- local file = find_file("ccache", { "/usr/bin", "/usr/local/bin"})
-- local file = find_file("test.h", { "/usr/include", "/usr/local/include/**"})
--
-- @endcode
--
function sandbox_lib_detect_find_file.main(name, dirs)

    -- find file
    local result = nil
    for _, dir in ipairs(table.wrap(dirs)) do

        -- TODO
        -- dir is registry path?

        -- file exists?
        for _, file in ipairs(os.files(path.join(dir, name))) do
            result = file
            break
        end
    end

    -- ok?
    return result
end

-- return module
return sandbox_lib_detect_find_file
