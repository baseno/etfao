#' returns the von Karman constant
#' @export
vonKarman <- function()
{
    return(0.41)
}


#' calculate aerodynamic resistance for the reference crop, ie clipped grass, with weather station at 2 m above the ground
#' @param uz is the wind speed at height zm [m.s^-1]
#' @param zm is the height of the wind speed measurements
#' @param zh is the height of the humidity measurements
#' @export
res_aero <- function(h,uz,zh=2,zm=2)
{

    h <- 0.12 # height of reference crop, ie clipped grass
    #zm <- 2
    #zh <- 2
    #uz <- 2
    d <- h*2/3
    zom <- 0.123*h
    zoh <- 0.1*zom
    num <- log((zm-d)/zom)*log((zh-d)/zoh)
    den <- vonKarman()*uz
    ra <- num/den
    return(ra)
}

#' calculate stomatal resistance for reference crop, ie clipped grass
#' @param rl 
#' @param LAIact active (sunlit) leaf area index [m^2 (leaf area) . m^-2 (soil surface)]is the wind speed at height h [m.s^-1]
#' @param h 
#' @export
res_stom <- function(rl,LAI,h)
{
    h <- 0.12 #the crop height (only applicable to grass!)
    LAI <- 24*h # for clipped grass
    LAIact <- 0.5*LAI #active (sunlit) leaf area index [m^2 (leaf area) . m^-2 (soil surface)]is the wind speed at height h [m.s^-1]
    rl <- 100 #bulk stomatal resistance of well illuminated leaf [s.m^-1]
    rs <- rl/LAIact
    return(rs)
}


#' @importFrom micrometeo 
penmon <- function()
{

    ET <- (1/latent_heat_vap()) * slope_sat_vpressure(T) + psychr(p)*

    psychr(p)*ratio_mol_w()*latent_heat_vap()*u2/(1.01*(T+273)*)

}

#' get crop coefficients for etfao by loading table in package
#' @return K
#' @export
getCropCoefficients <- function()
{

    K <- readRDS("./cropcoeff.rds")
    return(K)
}

