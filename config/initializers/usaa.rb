if Rails.env == "production"
  # set credentials from ENV hash
  USAA_CREDENTIALS = { :USAA_ACCOUNT => ENV['USAA_ACCOUNT'], :USAA_NUM => ENV['USAA_NUM'], :USAA_PIN => "USAA_PIN"}
else
  # get credentials from YML file
  USAA_CREDENTIALS = YAML.load_file(Rails.root.join("config/usaa_creds.yml"))
end