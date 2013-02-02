class Attachable::Attachable < ActiveRecord::Base
  # Make it abstract
  self.abstract_class = true

  attr_accessible :is_deleted, :medium_size, :thumb_size, :attached_id, :original_size, :write_at

  attr_accessible :avatar

  belongs_to :attached, :polymorphic => true
  belongs_to :attached_by, :polymorphic => true

  validates_presence_of :avatar

  FLASH_CONTENT_TYPE = "application/x-shockwave-flash"
  THUMBNAILABLE = ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg']
  FLASH_THUMBNAILABLE = THUMBNAILABLE.clone.push(FLASH_CONTENT_TYPE)
  ATTACHABLE = ['text/plain', 'application/pdf','application/vnd.oasis.opendocument.presentation','application/zip','application/msword','application/msexcel','application/rtf','text/rtf','application/x-gzip']

  scope :desc, :order => 'id DESC'
  scope :search_by_post, lambda { |post| where("attached_id = ?", post)}

  scope :attached_for, lambda { |post| search_by_post(post).desc }

  def attached_to_by(post, user)
    attached_to(post)
    update_attribute(:attached_by, user)
  end

  def attached_by(user)
    update_attribute(:attached_by, user)
  end

  def <<(post)
    super(post)
    if self.instance_of? Image
      post.set_has_image(true)
    end
  end

  def attached_to(post)
    update_attribute(:attached, post)
    if self.instance_of? Image
      if post.respond_to? :set_has_image
        post.set_has_image(true) 
      end
    end
  end

  before_destroy :save_attached_post

  def save_attached_post
    @@post = self.attached
    logger.debug("before_destroy save_attached_post #{@@post}")
  end

  after_destroy :post_has_attached

  def post_has_attached
    logger.debug("after_destroy save_attached_post #{@@post}")
    # This indicates attached is not saved yet.
    return if @@post.nil?
    if defined?(Image.class) && self.instance_of?(Image)
      @@post.set_has_image(false) if @@post.respond_to?(:set_has_image) && @@post.image.empty?
    elsif defined?(Attachment.class) && self.instance_of?(Attachment)
      @@post.set_has_attachment(false) if @@post.respond_to?(:set_has_attachment) && @@post.attachment.empty?
    end
  end

  def to_s
    "id: #{id} a_file_name: #{avatar_file_name} a_content_type: #{avatar_content_type} a_file_size: #{avatar_file_size} attached_id: #{attached_id} attached_type: #{attached_type} original_size: #{original_size}"
  end

  def thumbnailable?
    return false unless avatar.content_type
    THUMBNAILABLE.include?(avatar.content_type)
  end

  def flash_thumbnailable?
    return false unless avatar.content_type
    FLASH_THUMBNAILABLE.include?(avatar.content_type)
  end

  def attachmentable?
    return true if thumbnailable?
    return false unless avatar.content_type
    ATTACHABLE.include?(avatar.content_type)
  end

  def proc_geo
    file = avatar.queued_for_write[:original].path
    logger.debug("proc_geo file: #{file}")
    geo = Paperclip::Geometry.from_file(file)
    logger.debug("geo: #{geo}")
    self.original_size = geo.to_s
  end

  class ThumbnailableValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if record.instance_of?(Image) || record.instance_of?(Logo)
        unless record.thumbnailable?
          record.errors.add I18n.t("upload.image"), I18n.t("upload.has_invalid_content_type")
        end
      else
        raise "Instance error: #{record}"
      end
    end
  end
end
