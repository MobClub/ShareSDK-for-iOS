module Fastlane
  module Actions
    module SharedValues
      MOB_TAG_VALUE ||= :MOB_TAG_VALUE
    end

    class MobAddTagToGitAction < Action
      def self.run(params)
        UI.user_error!("No value found for 'tag' or 'username' or 'key_path', the value both of them is required") unless params[:username] and params[:key_path] and params[:tag]
        git_user_name = params[:username]
        git_key_path = params[:key_path]
        git_tag_value = params[:tag]
        git_source_path = params[:path]
        git_branch = params[:branch]
        UI.user_error!("Git key not exist") unless File.exist?(git_key_path)
        # All cmds collection
        cmds = []
      
        cmds << "cd #{git_source_path}" unless git_source_path.empty?
        # Config user info
        cmds << "git config --local user.name #{git_user_name}"
        cmds << "git config --local user.email #{git_user_name}@mob.com"
        cmds << "eval $(ssh-agent)"
        cmds << "ssh-add #{git_key_path}"
        # Add and commit
        cmds << "git add -A" if params[:push]
        cmds << "git commit -m '#{git_tag_value} update'" if params[:push]
        # remove tag
        cmds << "git tag -d #{git_tag_value}" if tag_exist(git_tag_value, git_source_path, false)
        cmds << "git push origin :#{git_tag_value}" if tag_exist(git_tag_value, git_source_path, true)
        # add tag
        cmds << "git tag #{git_tag_value}"
        cmds << "git push --tags"
        cmds << "git push origin HEAD:#{git_branch}" if params[:push]
        
        cmds << "ssh-agent -k"

        UI.message("Opeartion done, have added tag")
        Action.sh(cmds.join('&&')) 

        Actions.lane_context[SharedValues::MOB_TAG_VALUE] = git_tag_value
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Be used to add tag to git"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "Add tag to git"
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :username,
                                       env_name: "MOB_GIT_USERNAME", # The name of git user
                                       description: "The name of git user", # a short description of this parameter
                                       optional: false,
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :key_path,
                                       env_name: "MOB_GIT_KEY_PATH",
                                       description: "The rsa key to git",
                                       is_string: true, # true: verifies the input is a string, false: every kind of value
                                       optional: false), # the default value if the user didn't provide one
          FastlaneCore::ConfigItem.new(key: :tag,
                                       env_name: "GIT_TAG",
                                       description: "The tag value",
                                       optional:false,
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :branch,
                                       env_name: "GIT_BRANCH",
                                       description: "The target branch",
                                       optional:true,
                                       is_string: true,
                                       default_value: 'master'),
          FastlaneCore::ConfigItem.new(key: :path,
                                      env_name: "SOURCE_PATH",
                                      description: "Source path, if need to change workspace",
                                      optional:true,
                                      is_string: true,
                                      default_value: ""),
          FastlaneCore::ConfigItem.new(key: :push,
                                      env_name: "ENABLE_PUSH",
                                      description: "Whether push changes to remote",
                                      optional:true,
                                      is_string: false,
                                      default_value: false)
          ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['MOB_TAG_VALUE', 'The version to tag']
        ]
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

      def self.tag_exist(tag, path = "", remote = false, remote_name = "origin")
        commands = []

        commands << "cd #{path}" unless path.empty?
        tag_ref = "refs/tags/#{tag.shellescape}"
        if remote
          commands << "git ls-remote -q --exit-code #{remote_name.shellescape} #{tag_ref}"
        else
          commands << "git rev-parse -q --verify #{tag_ref}"
        end

        exists = true
        Actions.sh(
          commands.join('&&'),
          log: FastlaneCore::Globals.verbose?,
          error_callback: ->(result) { exists = false }
        )
        exists
      end
    end
  end
end
