require "./crystal-docs/*"
require "commander"
require "colorize"

module Crystal::Docs

  cli = Commander::Command.new do |cmd|
    cmd.use = "crystal-docs"
    cmd.long = "A tool for publishing Crystal Shard documentation."

    cmd.commands.add do |cmd|
      cmd.use = "version"
      cmd.short = "Display crystal-docs version."
      cmd.long = cmd.short

      cmd.run do |opts, args|
        puts "Version: #{VERSION}"
      end
    end

    cmd.commands.add do |cmd|
      cmd.flags.add do |flag|
        flag.name = "generate"
        flag.short = "-g"
        flag.long = "--generate"
        flag.default = false
        flag.description = "Generate the documentation."
      end

      cmd.flags.add do |flag|
        flag.name = "username"
        flag.short = "-u"
        flag.long = "--username"
        flag.default = ""
        flag.description = "Specify a particular username."
      end

      cmd.use = "publish"
      cmd.short = "Publish Shard documentation."
      cmd.long = cmd.short

      cmd.run do |opts, args|
        if opts.bool["generate"]
          puts "Generating docs..."
          system("crystal docs")
        end

        git_config = GitConfig.new

        if opts.string["username"].size > 0
          username = opts.string["username"]
        else
          username = git_config.owner
        end

        puts "Publishing docs for #{git_config.project.colorize.underline} as #{username.colorize.underline}"

        if args.size > 0
          Rsync.copy(username, git_config.project, args.first)
        else
          Rsync.copy(username, git_config.project)
        end
      end
    end
  end

  Commander.run(cli, ARGV)
end
