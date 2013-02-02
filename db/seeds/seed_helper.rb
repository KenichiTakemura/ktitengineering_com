
def _attach(dirname, object, target)
  Dir["#{Rails.root}/app/data/#{dirname}/*"].each do |filename|
    # skip profile name
    next if File.directory?(filename)
    puts "Importing #{filename}"
    obj = object.new(:avatar => File.new(filename))
    obj.attached_to(target)
  end
end