class Logo < Attachable::Attachable

  has_attached_file :avatar,
  :styles => lambda { |a|
   if a.instance.thumbnailable?
     { :medium => "200x180>", :thumb => "120x100>" }
   else 
     { }
   end
   },
   :url  => "/system/data/:class/:attachment/:id_partition/:style/:basename.:extension",
   :path => ":rails_root/public/system/data/:class/:attachment/:id_partition/:style/:filename"
   
  def to_s
    super.to_s
  end

  MAX_IMAGE_SIZE = 500.kilobytes

  # https://github.com/thoughtbot/paperclip
  validates_attachment_size :avatar, :less_than => MAX_IMAGE_SIZE
  validates :avatar_content_type, :thumbnailable => true
  validates_presence_of :original_size, :message => I18n.t('upload.failed_to_upload')

  #Paperclip callbacks
  after_post_process :proc_geo

  def thumb_image
    self.avatar.url(:thumb)
  end
  
  def medium_image
    self.avatar.url(:medium)
  end
  
  def original_image
    self.avatar.url(:original)
  end
  
  def original_path
    self.avatar.path(:original)
  end
  
  def filename
    avatar_file_name
  end
  
  def filesize
    avatar_file_size
  end

end