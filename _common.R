# Commonly run R code BEFORE all chapters

# Format code chunks
knitr::opts_chunk$set(
  comment = "#>",
  class.source = "customCodeChunk",
  collapse = TRUE,
  cache = TRUE,
  fig.align = "center"
)

# Truncate output, specified as 'out.lines = n'
# save the built-in output hook
hook_output <- knitr::knit_hooks$get("output")

# set a new output hook to truncate text output
knitr::knit_hooks$set(output = function(x, options) {
  if (!is.null(n <- options$out.lines)) {
    x <- xfun::split_lines(x)
    if (length(x) > n) {
      # truncate the output
      x <- c(head(x, n), "....\n")
    }
    x <- paste(x, collapse = "\n")
  }
  hook_output(x, options)
})