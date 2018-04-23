
#' get reanalysis data from NCEP
#' @param poly an sf polygon object that defines the required region in lat long
#' @param lubri a lubridate object or a list of two objects defining the time domain or the query
#' @importFrom lubridate year
#' @importFrom RCurl getURL
#' @export
get_reanalysis_t <- function(poly,lubri)
{

  y=year(lubri$y)
  y=unique(y)

  for(yeari in y)
  {
    tpath=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface_gauss/air.2m.gauss.',yeari,'.nc')
    rhpath=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface/rhum.sig995.',yeari,'.nc')
    vpath=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface/vwnd.sig995.',yeari,'.nc')
    upath=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface/uwnd.sig995.',yeari,'.nc')
    gpath=ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis.dailyavgs/surface_gauss/gflux.sfc.gauss.2006.nc
    rnpath=ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis.dailyavgs/surface_gauss/dswrf.sfc.gauss.1996.nc

    T=getURL(tpath)
  }
}


#' get reanalysis data from NCEP
#' @param poly an sf polygon object that defines the required region in lat long
#' @param lubri a lubridate object or a list of two objects defining the time domain or the query
#' @importFrom lubridate year
#' @importFrom RCurl getURL
#' @import ncdf4
#' @export
get_reanalysis_t <- function(poly,lubri)
{
  y=year(lubri$y)
  y=unique(y)

  for(yeari in y)
  {
    path=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface_gauss/air.2m.gauss.',yeari,'.nc')

    if(!file.exists(paste0('air.2m.gauss.',yeari,'.nc')))
    {
      T=getURL(path)
    }

  }

}


#' get reanalysis data from NCEP
#' @param poly an sf polygon object that defines the required region in lat long
#' @param lubri a lubridate object or a list of two objects defining the time domain or the query
#' @importFrom lubridate year
#' @importFrom RCurl getURL
#' @export
get_reanalysis_rh <- function(poly,lubri)
{

  y=year(lubri$y)
  y=unique(y)

  for(yeari in y)
  {
    path=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface/rhum.sig995.',yeari,'.nc')
    RH=getURL(path)
  }
}


#' get reanalysis data from NCEP
#' @param poly an sf polygon object that defines the required region in lat long
#' @param lubri a lubridate object or a list of two objects defining the time domain or the query
#' @importFrom lubridate year
#' @importFrom RCurl getURL
#' @export
get_reanalysis_w <- function(poly,lubri)
{

  y=year(lubri$y)
  y=unique(y)

  for(yeari in y)
  {
    vpath=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface/vwnd.sig995.',yeari,'.nc')
    upath=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis/surface/uwnd.sig995.',yeari,'.nc')

    V=getURL(vpath)
    U=getURL(upath)

  }
}


#' get reanalysis data from NCEP
#' @param poly an sf polygon object that defines the required region in lat long
#' @param lubri a lubridate object or a list of two objects defining the time domain or the query
#' @importFrom lubridate year
#' @importFrom RCurl getURL
#' @export
get_reanalysis_g <- function(poly,lubri)
{

  y=year(lubri$y)
  y=unique(y)

  for(yeari in y)
  {
    path=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis.dailyavgs/surface_gauss/gflux.sfc.gauss.',yeari,'.nc')

    G=getURL(path)
  }
}


#' get reanalysis data from NCEP
#' @param poly an sf polygon object that defines the required region in lat long
#' @param lubri a lubridate object or a list of two objects defining the time domain or the query
#' @importFrom lubridate year
#' @importFrom RCurl getURL
#' @export
get_reanalysis_rn <- function(poly,lubri)
{

  y=year(lubri$y)
  y=unique(y)

  for(yeari in y)
  {
    path=paste0('ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis.dailyavgs/surface_gauss/dswrf.sfc.gauss.',yeari,'.nc')
    Rn=getURL(path)
  }
}
