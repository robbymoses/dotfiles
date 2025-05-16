static const char norm_fg[] = "#cac1ca";
static const char norm_bg[] = "#0c090a";
static const char norm_border[] = "#8d878d";

static const char sel_fg[] = "#cac1ca";
static const char sel_bg[] = "#6B536E";
static const char sel_border[] = "#cac1ca";

static const char urg_fg[] = "#cac1ca";
static const char urg_bg[] = "#614D65";
static const char urg_border[] = "#614D65";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
