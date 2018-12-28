static const char norm_fg[] = "#ccdfeb";
static const char norm_bg[] = "#241d35";
static const char norm_border[] = "#8e9ca4";

static const char sel_fg[] = "#ccdfeb";
static const char sel_bg[] = "#619FE6";
static const char sel_border[] = "#ccdfeb";

static const char urg_fg[] = "#ccdfeb";
static const char urg_bg[] = "#5990E8";
static const char urg_border[] = "#5990E8";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
