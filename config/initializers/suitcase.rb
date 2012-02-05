SUITCASE_CONFIG = YAML.load_file("#{Rails.root}/config/suitcase_config.yml")[Rails.env]


Suitcase::Configuration.hotel_api_key =SUITCASE_CONFIG['ean_hotel_ck']    
Suitcase::Configuration.cache = Hash.new # set the caching mechanism (see below)
