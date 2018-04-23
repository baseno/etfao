#' returns the von Karman constant
#' @export
vonKarman <- function()
{
    return(0.41)
}


#' calculate aerodynamic resistance for the reference crop, ie clipped grass, with weather station at 2 m above the ground
#' @param h is the height of the reference crop, ie clipped grass
#' @param uz is the wind speed at height zm [m.s^-1]
#' @param zm is the height of the wind speed measurements
#' @param zh is the height of the humidity measurements
#' @export
res_aero <- function(uz,h=0.12,zh=2,zm=2)
{

    d <- h*2/3
    zom <- 0.123*h
    zoh <- 0.1*zom
    num <- log((zm-d)/zom)*log((zh-d)/zoh)
    den <- vonKarman()*uz
    ra <- num/den
    return(ra)
}

#' calculate stomatal resistance for reference crop, ie clipped grass
#' @param rl bulk stomatal resistance of well illuminated leaf [s.m^-1]
#' @param LAIact active (sunlit) leaf area index [m^2 (leaf area) . m^-2 (soil surface)]is the wind speed at height h [m.s^-1]
#' @param h
#' @export
res_stom <- function(h=0.12,rl=100)
{
    LAI <- 24*h # for clipped grass
    LAIact <- 0.5*LAI #active (sunlit) leaf area index [m^2 (leaf area) . m^-2 (soil surface)]is the wind speed at height h [m.s^-1]
    rs <- rl/LAIact
    return(rs)
}

#' calculates the FAO reference evapotranspiration from Allen et al, FAO crop water requirements (1998)
#' @param u2 mean daily wind speed at 2 m height
#' @param Tmax maximum daily temperature
#' @param Tmin minimum daily temperature
#' @importFrom micrometeo latent_heat_vap slope_sat_vpressure psychr ratio_mol_w spec_gas_const
penmon_day <- function(u2,Tmax,Tmin)
{
    T = (Tmax+Tmin)/2
    es0 = (sat_vpressure(Tmax)+sat_vpressure(Tmin))/2
    ea0 = (rh2vpressure(RHmax,Tmin) +rh2vpressure(RHmin,Tmax))/2
    vpd = es0-ea0 #kPa

    num1 = (1/latent_heat_vap()) * slope_sat_vpressure(T) * (Rn - G)
    num2 = vpd * 86400*psychr(p)*ratio_mol_w()/(1.01*(T+273)*spec_gas_const()*res_aero(u2)) # 86400 are the seconds in a day. converts into daily ET

    den = slope_sat_vpressure(T) + psychr(p)*(1+res_stom()/res_aero(u2))

    ET = (num1+num2)/den
    return(ET)
}

# #' get crop coefficients for etfao by loading table in package
# #' @return K
# #' @export
# getCropCoefficients <- function()
# {
#
#     K <- readRDS("./cropcoeff.rds")
#     return(K)
# }
