require 'json'

module Perican
  module Resource
    class Base
      def metadata
        opts = {
          :description => description,
          :originator  => originator,
          :recipients  => recipients
        }
        Perican::Metadata.new(self, uid, date, summary, opts)
      end

      def to_json
        JSON.generate({:content_type => self.class::TYPE,
                       :resource => {:uid => uid,
                                     :date => date,
                                     :summary => summary,
                                     :description => description,
                                     :originator => originator,
                                     :recipients => recipients
                                    }
                      })
      end
    end

    dir = File.dirname(__FILE__) + "/resource"

    autoload :Mail,             "#{dir}/mail.rb"
    autoload :Evernote,         "#{dir}/evernote.rb"
    autoload :Slack,            "#{dir}/slack.rb"
    autoload :Toggl,            "#{dir}/toggl.rb"
  end
end
