return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release

  config = function()
    -- Esto es necesario para que VimTeX se cargue correctamente. La opción "indent" es opcional.
    -- Nota: ¡La mayoría de los administradores de plugins lo harán automáticamente!
    vim.cmd("filetype plugin indent on")

    -- Esto habilita las características relacionadas con la sintaxis en Vim y Neovim. Sin esto, algunas
    -- funciones de VimTeX no funcionarán (consulta ':help vimtex-requirements' para más información).
    -- Nota: ¡La mayoría de los administradores de plugins lo harán automáticamente!
    vim.cmd("syntax enable")

    -- Opciones del visor: puedes configurar el visor especificando un método de visor incorporado:
    vim.g.vimtex_view_method = "zathura"

    -- O con una interfaz genérica:
    --vim.g.vimtex_view_general_viewer = 'okular'
    --vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

    -- VimTeX usa latexmk como el compilador predeterminado. Si lo usas, lo cual se recomienda,
    -- probablemente no necesitarás configurar nada. Si deseas otro backend de compilador,
    -- puedes cambiarlo de la siguiente forma. La lista de backends soportados y una explicación
    -- adicional se proporcionan en la documentación, consulta ':help vimtex-compiler'.
    vim.g.vimtex_compiler_method = "latexmk"

    -- La mayoría de los mapeos de VimTeX dependen de "localleader" y esto puede cambiarse con la
    -- siguiente línea. El valor predeterminado suele ser el símbolo "\".
    --vim.g.maplocalleader = ","

    -- Desactivar los errores de vimtex-errors
    vim.g.vimtex_quickfix_mode = 0


    --Desactivar que me esconda funciones dentro del codigo
    vim.g.vimtex_syntax_conceal_disable = 1
  end,
}
