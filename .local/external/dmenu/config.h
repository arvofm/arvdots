/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                 /* minimum width when centered */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"FiraCode Nerd Font:size=12",
    "Font Awesome 5 Brands:size=12",
    "Font Awesome 5 Free:size=12",
    "Material Icons:size=12",
    "monospace:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	            /*     fg         bg       */
    [SchemeNorm]= { "#eceff4", "#191919" },
    [SchemeSel] = { "#191919", "#9fc6ba" },
    [SchemeOut] = { "#eceff4", "#191919" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
static const unsigned int border_width = 1;

