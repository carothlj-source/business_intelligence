library(shiny)
library(bslib)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),
  greeting = "Ask me about the airbnb postings.",
  extra_instructions = "data/extra_instructions.md",
  data_description = "data/data_description.md"
)

ui = page_sidebar(
  title = "Midwest Airbnb Chat",
    theme = bs_theme(
      primary = "#000080",
      secondary = "#950606",
      base_font = font_collection("Times New Roman")),
    sidebar = qc$sidebar(width = 350),
      card(card_header(textOutput("title")),
           DT::DTOutput("table")),
        accordion(open = FALSE,
                accordion_panel("About", "Explore Airbnb listings from Chicago, Columbus, and the Twin Cities. Ask about prices, ratings, hosts, availability, amenities, and more!"))
)

server = function(input, output, session) {
  vals = qc$server()
  output$title = renderText(
    vals$title() %||% "All Airbnb Listings" )
  output$table = DT::renderDT(
    vals$df(),
    options = list(pageLength = 10))
  output$sql = renderText(
    vals$sql() %||% "SELECT * FROM listings"
  )
}

shinyApp(ui, server)


