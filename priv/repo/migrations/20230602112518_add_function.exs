defmodule TestingSqlFunctions.Repo.Migrations.AddFunction do
  use Ecto.Migration

  def up do
    execute("""
      CREATE OR REPLACE FUNCTION try_convert_to_decimal (v_input text)
        RETURNS DECIMAL
        AS $$
      DECLARE
        v_dec_value DECIMAL DEFAULT NULL;
      BEGIN
        BEGIN
          v_dec_value := v_input::decimal;
        EXCEPTION
        WHEN OTHERS THEN
          RETURN NULL;
        END;
        RETURN v_dec_value;
      END;
      $$
      LANGUAGE plpgsql;
    """)
  end

  def down do
    execute("DROP FUNCTION IF EXISTS try_convert_to_decimal (text)")
  end
end
