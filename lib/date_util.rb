  module DateUtil
  def self.date_format(date)
    if date.present?
      date_l = date.utc? ? date.localtime : date
      date_l.strftime("%Y-%m-%d")
    end
  end

  def self.date_format_md(date)
    if date.present?
      date_l = date.utc? ? date.localtime : date
      date_l.localtime.strftime("%m-%d")
    end
  end
  
  def self.date_format_ymdhm(date)
    if date.present?
      date_l = date.utc? ? date.localtime : date
      date_l.strftime("%Y-%m-%d %H:%M")
    end
  end

  def self.date_format_ymdhms(date)
    if date.present?
      date_l = date.utc? ? date.localtime : date
      date_l.strftime("%Y-%m-%d %H:%M.%S")
    end
  end

  def self.today
    current_time.strftime("%Y-%m-%d")
  end
  
  def self.write_at
    current_time.to_i
  end

  # Time must be got from this method
  def self.current_time
    #Time.now.localtime
    Time.now
  end

  def self.this_month
    current_time.strftime("%Y-%m")
  end
  
  def self.last_month(month=nil)
    return (current_time - 1.month).strftime("%Y-%m") if !month.present?
    month << "-01"
    (Time.parse(month) - 1.month).strftime("%Y-%m")
  end

  def self.days_ago(x)
    (current_time - x.days)
  end
end

