
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

qc$app_obj()