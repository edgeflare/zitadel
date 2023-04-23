INSERT INTO projections.current_states (
    projection_name
    , instance_id
    , event_date
    , sequence
    , last_updated
) VALUES (
    $1
    , $2
    , $3
    , $4
    , statement_timestamp()
) ON CONFLICT (
    projection_name
    , instance_id
) DO UPDATE SET
    event_date = $3
    , sequence = $4
    , last_updated = statement_timestamp()
;