# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.

- When comparing locations, remember that `Twin Cities` represents the Minneapolis–St. Paul metropolitan area rather than a single city.

- Listing locations are anonymized by Airbnb. Latitude and longitude may be approximately 0–450 feet (150 metres) from the listing's actual address, so do not describe coordinates as exact locations.

- `host_is_superhost` and `instant_bookable` are stored as text values. Use `'t'` for true and `'f'` for false when filtering these columns in SQL.

- When matching a city entered by the user, match it case-insensitively to the `city` column. Treat references to Minneapolis, St. Paul, or the Twin Cities as `Twin Cities`.

- When searching for a listing by `name`, use a case-insensitive search so capitalization does not affect the results.

- When calculating an average `review_scores_rating`, exclude rows where `review_scores_rating` is `NULL` so listings without a rating do not affect the calculation.