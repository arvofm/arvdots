# Refer to qute://help/settings.html

## Session Behavior
c.auto_save.interval = 30000
c.auto_save.session = True
c.changelog_after_upgrade = 'never'
c.confirm_quit = ['downloads']   # Show a confirmation if downloads are running

## Content
c.content.autoplay = False
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt','https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt', 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/quick-fixes.txt', 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt', 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt']
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = 'both'
c.content.canvas_reading = True
c.content.cookies.accept = 'no-unknown-3rdparty'
c.content.cookies.store = True          # So sad I cant make exceptions
c.content.blocking.whitelist = []
c.content.geolocation = False
c.content.headers.do_not_track = True
c.content.media.audio_capture = False
c.content.media.audio_video_capture = False
c.content.media.video_capture = False
c.content.notifications.enabled = False
c.content.proxy = 'none'
c.content.webgl = True
c.content.xss_auditing = True

## Completion
c.completion.cmd_history_max_items = 0
c.completion.web_history.max_items = 0
c.completion.open_categories = ['searchengines', 'bookmarks']   # I wont be using use quickmarks / c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']
c.completion.scrollbar.width = 8
c.completion.shrink = False

## Downloads
c.downloads.position = 'bottom'
c.downloads.remove_finished = 10000

## Fonts
c.fonts.default_family = "Ubuntu Nerd Font";
c.fonts.web.family.sans_serif = "Ubuntu Nerd Font"
c.fonts.web.family.serif = "Ubuntu Nerd Font"

## Input
c.input.insert_mode.auto_load = True

## Colors
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.preferred_color_scheme = 'dark'


## Misc
c.messages.timeout = 5000
c.qt.chromium.low_end_device_mode = 'never'
c.qt.workarounds.remove_service_workers = True
c.scrolling.smooth = False
c.tabs.title.alignment = 'center'
c.window.hide_decoration = True
c.zoom.default = '90%'

## Aliases
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save', 'dm':'config-cycle colors.webpage.darkmode.enabled'}

## Theme
config.source('./city.py')

# c.url.start_pages = ['https://start.duckduckgo.com']
# c.url.default_page = 'https://start.duckduckgo.com/'
# c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

config.load_autoconfig(False)

