# {{{
# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# }}}

# IMPORTS

import os
import subprocess
#from libqtile import bar, layout, qtile, widget, hook
from libqtile import bar, layout, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.layout.max import Max
from libqtile.layout.xmonad import MonadTall
from libqtile.backend.wayland.inputs import InputConfig
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
# pyright: reportMissingImports=false
from colorschemes import colors         # I will uninstall all my LSPs


# FUNCTIONS

@lazy.window.function
def window_to_prev_group(window):
    index = window.qtile.groups.index(window.group)
    index = (index - 1) % len(window.qtile.groups)
    window.cmd_togroup(window.qtile.groups[index].name)

@lazy.window.function
def window_to_next_group(window):
    index = window.qtile.groups.index(window.group)
    index = (index + 1) % len(window.qtile.groups)
    window.cmd_togroup(window.qtile.groups[index].name)

def setColorScheme(colorscheme) -> dict[str, str]:
    if isinstance(colorscheme[0], list):
        __colors: dict[str, str] = {
            "bg":           colorscheme[0][0],
            "bg_dark":      colorscheme[0][1],
            "fg":           colorscheme[1][0],
            "fg_dark":      colorscheme[1][1],
            "grey":         colorscheme[2][0],
            "grey_dark":    colorscheme[2][1],
            "red":          colorscheme[3][0],
            "red_dark":     colorscheme[3][1],
            "green":        colorscheme[4][0],
            "green_dark":   colorscheme[4][1],
            "yellow":       colorscheme[5][0],
            "yellow_dark":  colorscheme[5][1],
            "blue":         colorscheme[6][0],
            "blue_dark":    colorscheme[6][1],
            "purple":       colorscheme[7][0],
            "purple_dark":  colorscheme[7][1],
            "teal":         colorscheme[8][0],
            "teal_dark":    colorscheme[8][1],
        }
    elif isinstance(colorscheme[0], str):
        __colors: dict[str, str] = {
            "bg":           colorscheme[0],
            "fg":           colorscheme[1],
            "grey":         colorscheme[2],
            "red":          colorscheme[3],
            "green":        colorscheme[4],
            "yellow":       colorscheme[5],
            "blue":         colorscheme[6],
            "purple":       colorscheme[7],
            "teal":         colorscheme[8],
            "bg_dark":      colorscheme[0],
            "fg_dark":      colorscheme[1],
            "grey_dark":    colorscheme[2],
            "red_dark":     colorscheme[3],
            "green_dark":   colorscheme[4],
            "yellow_dark":  colorscheme[5],
            "blue_dark":    colorscheme[6],
            "purple_dark":  colorscheme[7],
            "teal_dark":    colorscheme[8],
        }
    else:
        raise ValueError("Invalid colorscheme format. Expected list of lists or list of strings.")

    return __colors


# VARIABLES
myTerm               = "urxvt"
myMenu               = 'dmenu_run -i -c -l 30 -p "Run" -cw 300'
myScreenLockTool     = "slock"
if qtile.core.name == "wayland":
    myTerm           = "foot"
    myScreenLockTool = "swaylock"
    myMenu           = 'bemenu-run -i -w -c -l 30 --fixed-height -p "Run" -B 1 -R 10 -H 20 -W 0.5'
mod                  = "mod4"
wallpaper            = "~/pics/wps/fallen_leaves.jpg"
wallpaper_mode       = "fill"
myFont               = "Source Code Pro"
myBrowser            = "qutebrowser"
myVolControl         = "pavucontrol"
myFileManager        = "thunar"
myCustomScripts      = {
    "toggle-power":"wlogout",                   "play-clip":"clipmpv",
    "open-in-mpv":"pastetompv",                 "browse-web":"qutebrowser",
    "run-flatpak":"runflatpak",                 "kill-flatpak":"killflatpak",
    "volume-inc":"volume -inc 5",               "volume-dec":"volume -dec 5",
    "volume-toggle":"volume -toggle",           "mic-toggle":"volume -mictoggle",
    "brightness-inc":"brightnessctl set 5%+",   "brightness-dec":"brightnessctl set 5%-",
    "screenshot":'grim -g "$(slurp -d)" - | wl-copy -t image/png && dunstify -a "grim" -u low -r 9927 "Screenshot taken"'
}
_colors: dict[str, str] = setColorScheme(colors["Gruvbox"])     # one of the lists in colorschemes.py


# KEYS

keys = [
    # WM Essentials
    ## Window and Layout
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "j", lazy.layout.next(), desc="Move window focus to next window"),
    Key([mod], "k", lazy.layout.previous(), desc="Move window focus to previous window"),
    Key([mod], "Return", lazy.layout.swap_main(), desc="Master focused window"),
    Key([mod], "Right", lazy.screen.next_group(), desc="Move to the group on the right"),
    Key([mod], "Left", lazy.screen.prev_group(), desc="Move to the group on the left"),
    Key([mod], "Tab", lazy.screen.toggle_group()),
    Key([mod, "shift"], "v", lazy.window.toggle_floating(), desc="Put the focused window to/from floating mode"),
    Key([mod, "mod1"], "Return", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod, "mod1"], "Down", lazy.window.toggle_minimize(), desc="Toggle fullscreen on the focused window"),
    Key([mod, "mod1"], "Up", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Left", window_to_prev_group),
    Key([mod, "shift"], "Right", window_to_next_group),

    ## Multimedia
    Key([], "XF86MonBrightnessUp", lazy.spawn(myCustomScripts["brightness-inc"])),
    Key([], "XF86MonBrightnessDown", lazy.spawn(myCustomScripts["brightness-dec"])),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(myCustomScripts["volume-inc"])),
    Key([], "XF86AudioLowerVolume", lazy.spawn(myCustomScripts["volume-dec"])),
    Key([], "XF86AudioMute", lazy.spawn(myCustomScripts["volume-toggle"])),
    Key([], "XF86AudioMicMute", lazy.spawn(myCustomScripts["mic-toggle"])),
    Key([], "XF86AudioPrev", lazy.spawn("mpc prev")),
    Key([], "XF86AudioNext", lazy.spawn("mpc next")),
    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle")),
    Key([], "XF86AudioStop", lazy.spawn("mpc stop")),
    Key([], "Print", lazy.spawn(myCustomScripts["screenshot"])),

    ## Apps
    Key([mod], "t", lazy.spawn(myTerm), desc="Launch terminal"),
    Key([mod], "r", lazy.spawn(myTerm + " --title=ranger -e ranger"), desc="Launch ranger"),
    Key([mod], "h", lazy.spawn(myTerm + " --title=htop -e htop"), desc="Launch htop"),
    Key([mod], "m", lazy.spawn(myTerm + " --title=ncmpcpp -e ncmpcpp"), desc="Launch ncmpcpp"),
    Key([mod], "n", lazy.spawn(myTerm + " --title=nmtui -e nmtui"), desc="Launch nmtui"),
    Key([mod], "f", lazy.spawn(myFileManager), desc="Launch file manager"),
    Key([mod], "l", lazy.spawn(myScreenLockTool), desc="Launch screenlock tool"),
    Key([mod], "p", lazy.spawn(myMenu), desc="Launch app menu"),

    ## Scripts (works if PATH is configured to include $HOME/.scripts/)
    Key([mod], "x", lazy.spawn(myCustomScripts["toggle-power"])),
    Key([mod], "v", lazy.spawn(myCustomScripts["play-clip"])),
    Key([mod], "z", lazy.spawn(myCustomScripts["open-in-mpv"])),
    Key([mod], "b", lazy.spawn(myCustomScripts["browse-web"])),
    Key([mod], "o", lazy.spawn(myCustomScripts["run-flatpak"])),
    Key([mod, "shift"], "o", lazy.spawn(myCustomScripts["kill-flatpak"])),


    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )



# GROUPS

groups: list[Group] = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_labels = [">_", "www", "{*}", "|#|", "^_^", "|>", "md", "*?*", "69"]

for i in range(len(group_names)):
    matches = []
    match i:
        case 1:
            matches = [Match(wm_class=myBrowser), Match(wm_class="Firefox"), Match(wm_class="qutebrowser"), Match(wm_class="chromium")]
        case 2:
            matches = [Match(title="*NVIM"), Match(wm_class='emacs')]
        case 3:
            matches = [Match(wm_class="org.pwmt.zathura"), Match(wm_class="libreoffice")]
        case 4:
            matches = [Match(wm_class="discord"), Match(title="ZapZap")]
        case 5:
            matches = [Match(wm_class="mpv"), Match(title="ncmpcpp"), Match(wm_class="FreeTube")]
        case 6:
            matches = [Match(wm_class="obsidian")]
        case 7:
            matches = [Match(wm_class="steam")]
        case 8:
            matches = [Match(title="htop"), Match(title="nmtui")]

    groups.append(
        Group(
            name=group_names[i],
            matches=matches,
            label=group_labels[i]
        ))

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )


# LAYOUTS

layout_theme = {
    "align": MonadTall._left,
    "border_focus": _colors["blue"],
    "border_normal": _colors["grey_dark"],
    "border_width": 1,
    "margin": 5,
    "max-ratio": 0.6,
    "min-ratio": 0.45,
    "ratio": 0.55,
    "new_client_position": "top",
}

layouts = [
    MonadTall(**layout_theme),
    Max(),
]


# WIDGETS & SCREENS

widget_defaults = dict(
    font=myFont,
    fontsize=12,
    padding=2,
)
extension_defaults = widget_defaults.copy()

widget_list = [
    widget.Spacer(
        length=5
    ),
    widget.GroupBox(
        font = myFont,
        active = _colors["fg"],
        inactive = _colors["grey"],
        block_highlight_text_color="#FFFFFF",
        highlight_color=[_colors["bg_dark"], _colors["bg"]],
        this_current_screen_border=_colors["purple"],
        this_screen_border=_colors["fg_dark"],
        urgent_border=_colors["red"],
        urgent_text=_colors["red_dark"],
        highlight_method="line",
        disable_drag=True,
        hide_unused=False,
        margin=4,
        toggle=False,
        use_mouse_wheel=False
    ),
    widget.Spacer(
        length=10
    ),
    widget.CurrentLayoutIcon(
        scale=0.62,
        padding=5,
        foreground=_colors["fg"],
    ),
    widget.WindowName(
        foreground=_colors["fg"],
        font = myFont,
        padding=5,
    ),
    widget.Volume(
        font = myFont,
        foreground=_colors["red"],
        padding=5,
        unmute_format="  Vol: {volume}%",
        mute_format="  M",
        volume_app="pamixer",
        volume_up_command="pamixer -i 1 --allow-boost",
        volume_down_command="pamixer -d 1 --allow-boost",
        mute_command="pamixer -t",
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myVolControl)},
        decorations = [
            BorderDecoration(
                colour = _colors["red"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.Spacer(
        length=10
    ),
    widget.Backlight(
        font = myFont,
        foreground=_colors["yellow"],
        padding=5,
        fmt="  Lit: {}",
        change_command="brightnessctl set {0}%",
        backlight_name="intel_backlight",
        step=5,
        decorations = [
            BorderDecoration(
                colour = _colors["yellow"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.Spacer(
        length=10
    ),
    widget.Battery(
        font = myFont,
        foreground=_colors["green"],
        low_background=_colors["red_dark"],   # update all colors
        low_foreground=_colors["bg_dark"],
        padding=5,
        fmt="  Bat: {}",
        format="{char} {percent:2.0%}",
        update_interval=10,
        decorations = [
            BorderDecoration(
                colour = _colors["green"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.Spacer(
        length=10
    ),
    widget.GenPollCommand(
        font = myFont,
        foreground=_colors["teal"],
        padding=5,
        shell=True,
        cmd='nmcli device show wlp7s0 | awk \'NR == 6 {print $2}\'',
        fmt="  Net: {}",
        update_interval=5,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e nmtui')},
        decorations = [
            BorderDecoration(
                colour = _colors["teal"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.Spacer(
        length=10
    ),
    widget.CPU(
        font = myFont,
        foreground=_colors["blue"],
        padding=5,
        fmt="  Cpu: {}",
        format="{load_percent}%",
        update_interval=3,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
        decorations = [
            BorderDecoration(
                colour = _colors["blue"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.Spacer(
        length=10
    ),
    widget.Memory(
        font = myFont,
        foreground=_colors["purple"],
        padding=5,
        format="{MemUsed: .0f}{mm}",
        fmt="  Mem:{}",
        update_interval=3,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
        decorations = [
            BorderDecoration(
                colour = _colors["purple"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.Spacer(
        length=10
    ),
    widget.Clock(
        font = myFont,
        foreground=_colors["fg"],
        padding=5,
        fmt="  {}",
        format="%d.%m.%y - %r",
        decorations = [
            BorderDecoration(
                colour = _colors["fg"],
                border_width = [0, 0, 2, 0],
            )
        ],
    ),
    widget.TextBox(
        text = "  ",
        font = myFont,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn( myCustomScripts["toggle-power"] )}
    ),
    widget.Spacer(
        length=5
    ),
]

screens = [
    Screen(
        wallpaper=wallpaper,
        wallpaper_mode=wallpaper_mode,
        top=bar.Bar(widget_list, 28,
            background=_colors["bg_dark"],
            border_width = 0,
            border_color = _colors["bg"],
            margin = 0,
            opacity = 1
            )
    ),
]


# GLOBAL SETTINGS

auto_minimize = False
auto_fullscreen = True
bring_front_click = "floating_only"
cursor_warp = False
floats_kept_above = True
focus_on_window_activation = "smart"
follow_mouse_focus = True
reconfigure_screens = True
wl_input_rules = {
    "type:touchpad": InputConfig(dwt=True, tap=True),
    "type:keyboard": InputConfig(kb_layout="us", kb_repeat_delay=250, kb_repeat_rate=30, kb_options="ctrl:nocaps")
}
wl_xcursor_theme = None
wl_xcursor_size = 24
wmname = "LG3D"


# HOOKS
## Switch to group when a window is added, also disable floating and fullscreen
@hook.subscribe.group_window_add
def group_window_add(group, window):
    window.disable_floating()
    window.disable_fullscreen()
    group.cmd_toscreen()

@hook.subscribe.startup_once
def run_on_startup():
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([script])
