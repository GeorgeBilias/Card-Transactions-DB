--and its clustered index
CREATE UNIQUE CLUSTERED INDEX idx_view ON materialized_view_cube(t_year,card_brand,gender);