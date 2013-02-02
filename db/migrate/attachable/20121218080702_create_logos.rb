class CreateLogos < CreateAttachables
  def change
    create_base_table(:logos)
  end
end