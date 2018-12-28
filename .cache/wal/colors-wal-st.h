const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#241d35", /* black   */
  [1] = "#5990E8", /* red     */
  [2] = "#619FE6", /* green   */
  [3] = "#67B1F0", /* yellow  */
  [4] = "#8E89B7", /* blue    */
  [5] = "#A6A0D1", /* magenta */
  [6] = "#C7B8C1", /* cyan    */
  [7] = "#ccdfeb", /* white   */

  /* 8 bright colors */
  [8]  = "#8e9ca4",  /* black   */
  [9]  = "#5990E8",  /* red     */
  [10] = "#619FE6", /* green   */
  [11] = "#67B1F0", /* yellow  */
  [12] = "#8E89B7", /* blue    */
  [13] = "#A6A0D1", /* magenta */
  [14] = "#C7B8C1", /* cyan    */
  [15] = "#ccdfeb", /* white   */

  /* special colors */
  [256] = "#241d35", /* background */
  [257] = "#ccdfeb", /* foreground */
  [258] = "#ccdfeb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
