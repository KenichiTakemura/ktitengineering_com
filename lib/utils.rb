
  module Utils
    def self.new_orderd_hash
      ActiveSupport::OrderedHash.new
    end

    def self.unique_token
      rand(36**8).to_s(36)
    end

    def self.random_index(a, b)
      return 0 if a.size >= b
      while true
        v = rand(b)
        return v if !a.include?(v)
      end
    end

    def self.hash(ccc)
      OpenSSL::Digest::SHA1.new(ccc).to_s
    end

    def self.decrypt_data(data)
      require 'encryptor'
      key = 'ozflyer_rocks2013!'
      Base64.decode64(data.tr('-_','+/')).decrypt(:key => key)
    rescue
      false
      end

    def self.encrypt_data(data)
      require 'encryptor'
      key = 'ozflyer_rocks2013!'
      Base64.encode64(Encryptor.encrypt(data, :key => key)).tr('+/','-_')
    rescue
      false
      end

    def self.copy_right_year
      current_time.strftime("%Y")
    end

    def self.greeting
      hour = DateUtil.current_time.hour
      case hour
      when (0..4)
        return I18n.t("greeting.night")
      when (5..10)
        return I18n.t("greeting.morning")
      when (11..16)
        return I18n.t("greeting.arvo")
      when (17..23)
        return I18n.t("greeting.evening")
      end
    end
  end

