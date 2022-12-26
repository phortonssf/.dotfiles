
local neoscroll = require("neoscroll")
-- https://github.com/karb94/neoscroll.nvim/issues/65
local easing = "sine"
local zz_time_ms = 100
local jump_time_ms = 200
neoscroll.setup({
  pre_hook = function(movement)
-- :autocmd CursorHold * normal! m'
    -- vim.api.nvim_command('autocmd CursorHold * normal! m')
  end,
	post_hook = function(info)
		if info ~= "center" then
			return
		end

		-- The `defer_fn` is a bit of a hack.
		-- We use it so that `neoscroll.init.scroll` will be false when we call `neoscroll.zz`
		-- As long as we don't input another neoscroll mapping in the timeout,
		-- we should be able to center the cursor.
		local defer_time_ms = 10
		vim.defer_fn(function()
			neoscroll.zz(zz_time_ms, easing)
		end, defer_time_ms)
	end,
})

local mappings = {}

mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", jump_time_ms, easing, "'center'" } }
mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", jump_time_ms, easing, "'center'" } }

require("neoscroll.config").set_mappings(mappings)

-- function! SaveJump(motion)
--   if exists('#SaveJump#CursorMoved')
--     autocmd! SaveJump
--   else
--     normal! m'
--   endif
--   let m = a:motion
--   if v:count
--     let m = v:count.m
--   endif
--   execute 'normal!' m
-- endfunction
--
-- function! SetJump()
--   augroup SaveJump
--     autocmd!
--     autocmd CursorMoved * autocmd! SaveJump
--   augroup END
-- endfunction


