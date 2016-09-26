class Notify
  def initialize hsh
    @hsh = hsh
  end

  def convert
    h = {}
     properties = @hsh[:properties]
     payload = @hsh[:payload]
     payload_options = @hsh[:payload][:options]

    h[:user_id] = properties[:user_id]
    message = payload_options[:Alert_message]
     h[:message] = message + payload_options[:batch_count].to_s if payload_options[:silent]
    h[:message_type] = payload_options[:notification_type]
    h[:pop_up] = payload_options[:silent]
    h[:publish_at] = properties[:effective_date]
    h[:target] = if payload_options[:devices].split("=>")[0] == "ios"
               "apn"
             elsif payload_options[:devices].split("=>")[0] == "android"
               "gcm"
             end

    h[:device_ids] = payload_options[:devices].split("=>")[1]

    h
  end
end

h = {
        properties: {
          user_id:43,
          managing_user_id:43,
          description:"Push Notification",
          effective_date:"2015-07-20T06:28:36-05:00",
          system_date:"2015-07-20T06:28:36-05:00"
        },
        payload:{
                id: 49,
                options: {
                    devices: "ios => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
                    Alert_message: " You have following notifications ",
                    batch_count:10,
                    created_at:"2015-07-20T06:28:36-05:00",
                    id:48,
                    member_id:25,
                    notification_type: "secure_message",
                    silent:true,
                    updated_at:"2015-07-20T06:28:36-05:00"
               }
        }
}

notify = Notify.new(h)
#puts notify.convert



=begin

Atributes                   data from the input hash
====================        =============================
user_id                     user_id
message                     allert_message/allert_message + “batch_count” if silent is true/false
message_type                notification_type
pop_up                      silent
publish_at                  effective_date
target                      ‘gcm’/’apn’ if device is android/ios
device_ids                  tokens_from_the_ios_or_android_key



Sample data hash 1
=======================================
{
  "properties": {
    "user_id":43,
    "managing_user_id":43,
    "description":"Push Notification",
    "effective_date":"2015-07-20T06:28:36-05:00",
    "system_date":"2015-07-20T06:28:36-05:00"},
    "payload":{
      "id": 49,
      "options": {
        "devices": "ios => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
        "Alert_message": " You have following notifications ",
        "badge_count":10,
        "created_at":"2015-07-20T06:28:36-05:00",
        "id":48,
        "member_id":25,
        "notification_type": "secure_message",
        "silent":true,
        "updated_at":"2015-07-20T06:28:36-05:00"
      }
    }
  }
}


Sample out puts
=====================
payload 1:
  user_id: 49,
  message: "You have 10 notifications ",
  message_type: 'Reminder',
  pop_up: false,
  publish_at: '2015-07-21T06:28:36-05:00',
  target: 'ios',
  device_id: 'e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96'
=end