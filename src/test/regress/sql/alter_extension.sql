CREATE EXTENSION IF NOT EXISTS gp_inject_fault;

CREATE AGGREGATE example_agg(int4) (
    SFUNC = int4larger,
    STYPE = int4
);

ALTER EXTENSION gp_inject_fault ADD AGGREGATE example_agg(int4);
ALTER EXTENSION gp_inject_fault DROP AGGREGATE example_agg(int4);

-- Test creating an extension that already exists. Nothing too exciting about
-- it, but let's keep up the test coverage.
CREATE EXTENSION gp_inject_fault;
