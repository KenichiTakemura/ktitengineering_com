class CreateServices < CreateItemBases
  def change
    create_base_table(:services)
  end
end
