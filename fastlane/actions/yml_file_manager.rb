module Fastlane
  module Actions
    class YmlFileManagerAction < Action
      require 'yaml'
      
      def self.run(params)
        UI.user_error!("The yml file path value not found, the file path is required") unless params[:path]
        file_path = params[:path]
        # if data have value, is write opreation else read operation
        enable_write_to_file = params[:data].empty? ? false : true

        UI.message("Whether write: #{enable_write_to_file}")
        unless enable_write_to_file
          UI.user_error!("The yml file path value invalid") unless File.exist?(file_path)
          read_target_config_file(file_path)
        else
          write_data = params[:data]
          write_target_config_file(file_path, write_data)
          write_data
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "YML_FILE_PATH",
                                       description: "The target file path", # a short description of this parameter
                                       optional: false,
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :data,
                                       env_name: "YML_NEW_CONTENT",
                                       description: "the content to write to yml file",
                                       is_string: false,
                                       optional: true,
                                       default_value: {})
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["JunJie Pang"]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
      
      # Tools method
      def self.read_target_config_file(file_path)
        begin
          YAML.load_file(file_path)
        rescue => e
          UI.user_error!("Open file: #{file_path} failed, please check it")
        end
      end

      def self.write_target_config_file(file_path, data)
        begin
          unless File.exist?(file_path) and File.file?(file_path)
            dir = File.dirname(file_path)
            FileUtils.mkdir_p(dir) unless File.directory?(dir)
            File.open(file_path, 'w').close
          end

          File.open(file_path, 'w') do |f|
            f.write data.to_yaml
          end
        rescue => e
          UI.user_error!("Write data to #{file_path} failed, reason: #{e.message}")
        end
      end
    end
  end
end
