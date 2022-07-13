local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap
local snr = {noremap = true, silent = true}

map('n', '<C-a>', '0', snr) -- emulate mac shortcut: move to head
map('n', '<C-e>', '$', snr) -- emulate mac shortcut: move to tail
-- map('n', '<C-f>', ':NERDTreeToggle<CR>', snr) -- nerdtree: toggle
map('n', '<C-f>', ':NvimTreeToggle<CR>', snr) -- nvim-tree: toggle
map('n', '<C-m>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', snr)
map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>', snr)
map('n', '<C-s>', '<cmd>SymbolsOutline<CR>', snr) -- show symbols outline
map('n', '<C-t><C-g>', ':1Ttoggle<CR>', snr) -- neoterm
map('n', '<C-t><C-r>', ':2Ttoggle<CR>', snr) -- neoterm
map('n', '<C-t><C-d>', ':3Ttoggle<CR>', snr) -- neoterm
map('n', '<C-t><C-t>', ':Ttoggle<CR>', snr) -- neoterm
map('t', '<C-t><C-t>', [[<C-\><C-n>:Ttoggle<CR>]], snr) -- neoterm: toggle from terminal
map('n', '<Up>', ':cp<CR>', snr) -- quickfix
map('n', '<Down>', ':cn<CR>', snr) -- quickfix

-- manage splits
map('n', 's', '', snr)
map('n', 'sj', '<C-w>j', snr)
map('n', 'sk', '<C-w>k', snr)
map('n', 'sl', '<C-w>l', snr)
map('n', 'sh', '<C-w>h', snr)
map('n', 'sJ', '<C-w>J', snr)
map('n', 'sK', '<C-w>K', snr)
map('n', 'sL', '<C-w>L', snr)
map('n', 'sH', '<C-w>H', snr)
map('n', 'sn', 'gt', snr)
map('n', 'sp', 'gT', snr)
map('n', 'sr', '<C-w>r', snr)
map('n', 's=', '<C-w>=', snr)
map('n', 'sw', '<C-w>w', snr)
map('n', 'so', '<C-w>_<C-w>|', snr)
map('n', 'sO', '<C-w>=', snr)
map('n', 'sN', ':<C-u>bn<CR>', snr)
map('n', 'sP', ':<C-u>bp<CR>', snr)
map('n', 'st', ':<C-u>tabnew<CR>', snr)
map('n', 'ss', ':<C-u>sp<CR>', snr)
map('n', 'sv', ':<C-u>vs<CR>', snr)
map('n', 'sq', ':<C-u>q<CR>', snr)
map('n', 'sQ', ':<C-u>bd<CR>', snr)
map('n', 'sb', '<cmd>Telescope buffers<CR>', snr)

map('n', 'yp', [["0p]], snr) -- paste yunk
map('n', 'yP', [["0P]], snr) -- paste yunk
map('n', 'Y', 'y$', {}) -- yank a line

map('n', '<space><space>', '<Plug>(easymotion-overwin-f)', {}) -- easymotion
map('n', '<space>d', '<cmd>TroubleToggle<CR>', snr) -- show/hide trables
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', snr)

map('n', ',g', ':Rg<Space>', { noremap = true }) -- grep
map('n', ',b', '<cmd>Telescope buffers<CR>', snr) -- Telescope: buffers
map('n', ',f', '<cmd>Telescope find_files<CR>', snr) -- Telescope: buffers
map('n', ',d', '<cmd>Telescope diagnostics<CR>', snr) -- Telescope: diagnostic
map('n', ',s', '<cmd>Telescope lsp_document_symbols<CR>', snr) -- Telescope: symbols in a file
map('n', ',S', ':Telescope lsp_workspace_symbols query=', { noremap = true }) -- Telescope: symbols in a project
map('n', ',r', '<cmd>Telescope lsp_references<CR>', snr) -- Telescope: references

local lsp_buf_mappings = function(client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', snr)
  bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', snr)
  bmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', snr)
  bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', snr)
  bmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', snr)
  bmap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', snr)
  bmap(bufnr, 'n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', snr)
  bmap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', snr)
  bmap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', snr)
end

local mappings_go = function()
  bmap(0, 'n', 'gb', '<cmd>GoBuild<CR>', snr)
  bmap(0, 'n', 'gT', '<cmd>GoTestFunc<CR>', snr)
  bmap(0, 'n', 'gt', '<cmd>GoUnitTest<CR>', snr)
  bmap(0, 'n', 'gi', '<cmd>GoInfo<CR>', snr)
  bmap(0, 'n', 'gf', '<cmdu>GoFillStruct<CR>', snr)
  bmap(0, 'n', '<C-a>', '<cmd>GoAlternate<CR>', snr)
end

return {
  lsp_buf_mappings = lsp_buf_mappings,
  mappings_go = mappings_go,
}
