# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns **Source:** Inside Airbnb (<https://insideairbnb.com/get-the-data/>), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (<https://insideairbnb.com/data-assumptions/>). **Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

------------------------------------------------------------------------

## Field Definitions

| Field | Type | Description |
|------------------------|------------------------|------------------------|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | text | Airbnb's unique identifier for the host/user. A host may have multiple listings. Stored as text even though it looks numeric. |
| `host_name` | text | Name of the host as shown on Airbnb, usually the host's first name(s). May be `NULL`. |
| `host_since` | text | Date the host/user account was created, stored as an ISO text string (`YYYY-MM-DD`). For hosts who were Airbnb guests first, this may be the date they originally registered as a guest. |
| `host_is_superhost` | text | Whether the host is an Airbnb Superhost: `t` for true or `f` for false. May be `NULL`. |
| `neighbourhood` | text | Inside Airbnb's `neighbourhood_cleansed` field: the neighbourhood assigned by geocoding the listing's latitude and longitude against neighbourhood boundaries from open or public digital shapefiles. |
| `latitude` | real | Latitude of the listing using the World Geodetic System (WGS84). Airbnb anonymizes listing locations, so the coordinate may be 0–450 feet (150 metres) from the actual address. |
| `longitude` | real | Longitude of the listing using the World Geodetic System (WGS84). Airbnb anonymizes listing locations, so the coordinate may be 0–450 feet (150 metres) from the actual address. |
| `property_type` | text | Property type selected by the host. Hotels and bed and breakfasts are described as such by their hosts in this field. More detailed than `room_type`. |
| `accommodates` | integer | Maximum number of guests the listing can accommodate. |
| `bedrooms` | real | Number of bedrooms in the listing. May be `NULL`. |
| `beds` | real | Number of beds in the listing. May be `NULL`. |
| `bathrooms_text` | text | Airbnb's text description of the number and type of bathrooms in the listing, such as `1 bath` or `1 shared bath`. May be `NULL`. |
| `minimum_nights` | integer | Minimum number of nights required for a stay. Calendar rules may have a different minimum for specific dates. |
| `availability_365` | integer | Number of days the listing is shown as available during the next 365 days, based on its Airbnb calendar. A day may be unavailable because it was booked by a guest or blocked by the host, which cannot be distinguished in the data. |
| `number_of_reviews` | integer | Total number of reviews the listing has received. |
| `number_of_reviews_ltm` | integer | Number of reviews the listing received in the last 12 months. |
| `first_review` | text | Date of the listing's first/oldest review, stored as an ISO text string (`YYYY-MM-DD`). `NULL` if the listing has no reviews. |
| `last_review` | text | Date of the listing's last/newest review, stored as an ISO text string (`YYYY-MM-DD`). `NULL` if the listing has no reviews. |
| `review_scores_rating` | real | Overall review rating for the listing. May be `NULL` for listings without a rating. |
| `reviews_per_month` | real | Average number of reviews per month over the lifetime of the listing, calculated by Inside Airbnb using the listing's review history. May be `NULL` for listings without reviews. |
| `instant_bookable` | text | Whether a guest can automatically book the listing without the host first accepting the booking request: `t` for true or `f` for false. |
| `estimated_revenue_l365d` | real | Estimated revenue in U.S. dollars for the listing over the last 365 days. Calculated using Inside Airbnb's occupancy model, so it is an estimate rather than actual revenue reported by the host. |
| `amenities_count` | integer | Number of amenities for the listing. Computed for this course by counting the number of items in each listing's original `amenities` list; this is not an original Inside Airbnb field. |
