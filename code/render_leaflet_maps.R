# Minimal public template: map rendering only.
# Supply aggregated MedStat-region/year results and an sf boundary layer locally.
# No paths, raw records, identifiers, or data-access logic are included.

library(dplyr)
library(leaflet)
library(htmlwidgets)

render_bypass_map <- function(medstat_sf, panel_dt, title, output_file) {
  map_dt <- medstat_sf %>%
    left_join(panel_dt, by = "medstat") %>%
    mutate(rate = ifelse(total_patients > 0,
                         100 * active_bypass_patients / total_patients, NA_real_))

  pal <- colorNumeric("YlOrRd", domain = map_dt$rate, na.color = "#d9d9d9")

  leaflet(map_dt) %>%
    addPolygons(
      fillColor = ~pal(rate), fillOpacity = 0.80,
      color = "white", weight = 0.6,
      popup = ~paste0(
        "<b>", medstat, "</b><br>",
        "Year: ", year, "<br>",
        "Active bypassing rate: ", sprintf("%.1f%%", rate), "<br>",
        "Patients: ", total_patients
      )
    ) %>%
    addLegend("bottomright", pal = pal, values = ~rate,
              title = paste0(title, " (%)")) %>%
    saveWidget(output_file, selfcontained = TRUE)
}
