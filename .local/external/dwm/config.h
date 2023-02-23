/* I do not know anything about licensing */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 6;        /* extra height for bar, default:2 */
static const char *fonts[]          = {"FiraCode Nerd Font:size=10", "Font Awesome 5 Free:size=10", "Font Awesome 5 Brands:size=10", "Material Icons:size=10","monospace:size=10" };
static const char dmenufont[]       = "FiraCode Nerd Font:size=14";
static const char col_gray1[]       = "#1f1f1f"; // "#32302f";
static const char col_gray2[]       = "#1d2021";
static const char col_gray3[]       = "#d4be98";
static const char col_gray4[]       = "#1d2021";
static const char col_cyan[]        = "#845746";
static const char col_selborders[]  = "#634751";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_selborders },
};

/* tagging */
static const char *tags[] = { ">_", "www", "</>", "|#|", "^_^", "|>", "*?*", "~/", "69" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class            instance        title       tags mask     isfloating   monitor */
	{ "Firefox",        NULL,           NULL,       1 << 1,       0,           -1 },
	{ "qutebrowser",    NULL,           NULL,       1 << 1,       0,           -1 },
	{ "Code - OSS",  "code - oss",      NULL,       1 << 2,       0,           -1 },
	{ "Zathura",  "org.pwmt.zathura",   NULL,       1 << 3,       0,           -1 },
	{ "obsidian",    "obsidian",        NULL,       1 << 3,       0,           -1 },
	{ "discord",     "discord",         NULL,       1 << 4,       0,           -1 },
	{ "Lutris" ,     "lutris",          NULL,       1 << 6,       0,           -1 },
	{ "st",             NULL,           NULL,       1,            0,           -1 },
	{ "mpv",            "gl",           NULL,       1 << 5,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = { /* first entry is default */
	/* symbol     arrange function */
	{ "[]=",        tile },
	{ "><>",        NULL },    /* no layout function means floating behavior */
	{ "[M]",        monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char* dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, "-l", "20", "-i", "-c", "-p", "Run",  NULL };
static const char* termcmd[]  = { "st", NULL };
static const char* htopcmd[]  = { "st", "-e", "htop", NULL };
static const char* nmtuicmd[]    = { "st", "-e", "nmtui", NULL };
static const char* rangercmd[]  = { "st", "-e", "ranger", NULL };
static const char* lutriscmd[] = { "prime-run", "lutris", NULL };
static const char* discordcmd[] = { "discord", NULL };
static const char* thunarcmd[]  = { "thunar", NULL };
static const char* clipmpv[] = {"clipmpv", NULL};
static const char* surfcmd[]  = { "surfonweb", NULL };
static const char* ncmpcppcmd[] = { "st", "-e", "ncmpcpp", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
    { MODKEY,                       XK_t,	   spawn,          {.v = termcmd } },
    { MODKEY,                       XK_t,	   view,           {.ui = 1} },
	{ MODKEY,                       XK_h,	   spawn,          {.v = htopcmd } },
	{ MODKEY,                       XK_h,	   view,           {.ui = 1} },
	{ MODKEY,                       XK_r,	   spawn,          {.v = rangercmd } },
	{ MODKEY,                       XK_r,	   view,           {.ui = 1} },
	{ MODKEY,                       XK_n,	   spawn,          {.v = nmtuicmd } },
	{ MODKEY,                       XK_n,	   view,           {.ui = 1} },
	{ MODKEY,                       XK_v,	   spawn,          {.v = clipmpv } },
	{ MODKEY,                       XK_b,	   spawn,          {.v = surfcmd } },
	{ MODKEY,                       XK_b,	   view,           {.ui = 1 << 1} },
	{ MODKEY,                       XK_l,	   spawn,          {.v = lutriscmd } },
	{ MODKEY,                       XK_l,	   view,           {.ui = 1 << 6} },
	{ MODKEY,                       XK_d,	   spawn,          {.v = discordcmd } },
	{ MODKEY,                       XK_d,	   view,           {.ui = 1 << 4} },
	{ MODKEY,                       XK_m,	   spawn,          {.v = ncmpcppcmd } },
	{ MODKEY,                       XK_f,	   spawn,          {.v = thunarcmd } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.01} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.01} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                       XK_Left,   viewtoleft,     {0} },
    { MODKEY,                       XK_Right,  viewtoright,    {0} },
    { MODKEY|ShiftMask,             XK_Left,   tagtoleft,      {0} },
    { MODKEY|ShiftMask,             XK_Right,  tagtoright,     {0} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

