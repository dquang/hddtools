#' Extracts links from ftp page
#'
#' @author Claudia Vitolo
#'
#' @description This function extracts all the links in a ftp page
#'
#' @param dirs is the url from which links should be extracted
#'
#' @return vector containing all the links in the page
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   # Retrieve mopex daily catalogue
#'   url <- "ftp://hydrology.nws.noaa.gov/pub/gcip/mopex/US_Data/Us_438_Daily"
#'   getContent(dirs = url)
#' }
#'

getContent <- function(dirs) {

  urls <- paste(dirs, "/", sep = "")
  fls <- strsplit(RCurl::getURL(urls, dirlistonly = TRUE), "\n")
  ok <- vapply(fls, length) > 0
  links <- unlist(mapply(paste, urls[ok], fls[ok], sep = "", SIMPLIFY = FALSE),
                  use.names = FALSE)

  return(links)

}
