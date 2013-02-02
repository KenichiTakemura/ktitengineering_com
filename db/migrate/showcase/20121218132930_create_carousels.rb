class CreateCarousels < CreateItemBases
  def change
    create_base_table(:carousels)
  end
end
