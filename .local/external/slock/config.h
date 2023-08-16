/* user and group to drop privileges to */
static const char *user  = "arvo";
static const char *group = "arvo";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#323030",     /* after initialization */
	[INPUT] =  "#72966b",   /* during input */
	[FAILED] = "#b85651",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
