const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c090a", /* black   */
  [1] = "#614D65", /* red     */
  [2] = "#6B536E", /* green   */
  [3] = "#85647A", /* yellow  */
  [4] = "#775187", /* blue    */
  [5] = "#8D6F92", /* magenta */
  [6] = "#A252B0", /* cyan    */
  [7] = "#cac1ca", /* white   */

  /* 8 bright colors */
  [8]  = "#8d878d",  /* black   */
  [9]  = "#614D65",  /* red     */
  [10] = "#6B536E", /* green   */
  [11] = "#85647A", /* yellow  */
  [12] = "#775187", /* blue    */
  [13] = "#8D6F92", /* magenta */
  [14] = "#A252B0", /* cyan    */
  [15] = "#cac1ca", /* white   */

  /* special colors */
  [256] = "#0c090a", /* background */
  [257] = "#cac1ca", /* foreground */
  [258] = "#cac1ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
