import os.path
config.source('./city.py');
c.zoom.default = 85;
c.content.blocking.adblock.lists = [ "https://easylist.to/easylist/easylist.txt", "https://easylist.to/easylist/easyprivacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
        ];
c.content.blocking.method = "both";
c.content.canvas_reading = True;
c.fonts.default_family = "Ubuntu Nerd Font";
c.fonts.web.family.sans_serif = "Ubuntu Nerd Font"
c.fonts.web.family.serif = "Ubuntu Nerd Font"
c.tabs.title.alignment = "center";
c.downloads.position = "bottom";
c.qt.workarounds.remove_service_workers = True;

config.load_autoconfig();

