module Lita
  module Handlers
    class GitlabCi < Handler

      def self.default_config(config)
        config.rooms = %w(#general)
      end

      http.post '/lita/gitlab-ci', :webhook

      def webhook(request, response)
        data = parse_json(request.body)

        # Build Information
        project_name = data["project_name"]
        build_status = data["build_status"]
        build_date = Time.parse(data["build_started_at"]) # UTC Time
        branch = data["ref"]

        message_body = "#{project_name} (#{branch}) build on #{build_date} and #{build_status}."

        rooms = Lita.config.handlers.gitlab_ci.rooms
        rooms.each do |room|
          target = Source.new(room: room)
          robot.send_message(target, message_body)
        end

        response.body << message_body
      end
      private

      def parse_json(json_data)
        MultiJson.load(json_data)
      rescue MultiJson::LoadError => e
        Lita.logger.error("Could not parse JSON data from Gitlab CI: #{e.message}")
        return
      end
    end

    Lita.register_handler(GitlabCi)
  end
end
