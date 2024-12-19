----------------------------------
-- a neat mason config
-- by arvo
----------------------------------


require("mason").setup({
    ui = {
        check_outdated_packages_on_open = true,
        border = "none",
        icons = {
            package_installed = "I ",
            package_pending = "P ",
            package_uninstalled = "U ",
        },
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    },
    pip = {
        install_args = {},
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    github = {
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
})
