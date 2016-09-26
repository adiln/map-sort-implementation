require 'spec_helper'

describe Notify do
  describe "#convert" do
    let(:hash) {
      {
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
    }

    let(:subject) { Notify.new(hash) }

    it "includes properties and payload keys" do
      expect(hash.keys).to eq([:properties, :payload])
    end

    it "includes output keys" do
      expect(subject.convert.keys).to eq([:user_id, :message, :message_type, :pop_up, :publish_at, :target, :device_ids])
    end

  end
end