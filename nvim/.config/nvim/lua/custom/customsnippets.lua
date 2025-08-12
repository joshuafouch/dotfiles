-- Import the necessary LuaSnip functions
local ls = require 'luasnip'
local s = ls.s -- snippet
local i = ls.i -- insert node
local t = ls.t -- text node

-- This adds the snippet to the "svelte" filetype
ls.add_snippets('svelte', {
  -- CORRECTED SNIPPET
  s({ trig = 'ts' }, {
    -- The first node is the opening tag and a newline
    t { '<script lang="ts">', '' },

    -- The second node is an indented placeholder for your cursor
    i(1),

    -- The third node is a newline and the closing tag
    t { '', '</script>' },
  }),
})
